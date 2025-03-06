[CmdletBinding()]
param(
)
$M365DSCTestFolder = Join-Path -Path $PSScriptRoot `
                        -ChildPath '..\..\Unit' `
                        -Resolve
$CmdletModule = (Join-Path -Path $M365DSCTestFolder `
            -ChildPath '\Stubs\Microsoft365.psm1' `
            -Resolve)
$GenericStubPath = (Join-Path -Path $M365DSCTestFolder `
    -ChildPath '\Stubs\Generic.psm1' `
    -Resolve)
Import-Module -Name (Join-Path -Path $M365DSCTestFolder `
        -ChildPath '\UnitTestHelper.psm1' `
        -Resolve)

$CurrentScriptPath = $PSCommandPath.Split('\')
$CurrentScriptName = $CurrentScriptPath[$CurrentScriptPath.Length -1]
$ResourceName      = $CurrentScriptName.Split('.')[1]
$Global:DscHelper = New-M365DscUnitTestHelper -StubModule $CmdletModule `
    -DscResource $ResourceName -GenericStubModule $GenericStubPath

Describe -Name $Global:DscHelper.DescribeHeader -Fixture {
    InModuleScope -ModuleName $Global:DscHelper.ModuleName -ScriptBlock {
        Invoke-Command -ScriptBlock $Global:DscHelper.InitializeScript -NoNewScope
        BeforeAll {

            $secpasswd = ConvertTo-SecureString (New-Guid | Out-String) -AsPlainText -Force
            $Credential = New-Object System.Management.Automation.PSCredential ('tenantadmin@mydomain.com', $secpasswd)

            Mock -CommandName Confirm-M365DSCDependencies -MockWith {
            }

            Mock -CommandName New-M365DSCConnection -MockWith {
                return "Credentials"
            }

            Mock -CommandName Get-MgUser -MockWith {
                return @{
                    userPrincipalName = 'john.smith@contoso.com'
                    id                = '12345-12345-12345-12345-12345'
                }
            }

            # Mock Write-Host to hide output during the tests
            Mock -CommandName Write-Host -MockWith {
            }
            $Script:exportedInstance =$null
            $Script:ExportMode = $false
        }
        # Test contexts
        Context -Name "The instance exists and values are already in the desired state" -Fixture {
            BeforeAll {
                
                $testParams = @{
                    RoleName   = "Corporate Communicator"
                    Members    = @('john.smith@contoso.com')
                    Credential = $Credential
                }
                $call = 1
                Mock -CommandName Invoke-MgGraphRequest -MockWith {
                    if ($call -eq 1)
                    {
                        $call++
                        return @{value=@(
                            @{
                                displayName = "Corporate Communicator"
                                id          = '12345'
                            }
                        )}
                    }
                    else
                    {
                        return @{value=@(
                            @{
                                id = '12345-12345-12345-12345-12345'
                            }
                        )}
                    }
                }
            }

            It 'Should return true from the Test method' {
                Test-TargetResource @testParams | Should -Be $true
            }
        }

        Context -Name "The instance exists and values are NOT in the desired state" -Fixture {
            BeforeAll {
                
                $testParams = @{
                    RoleName   = "Corporate Communicator"
                    Members    = @('john.smith@contoso.com')
                    Credential = $Credential
                }
                $Global:call = 1
                Mock -CommandName Invoke-MgGraphRequest -MockWith {
                    if ($Global:call -eq 1)
                    {
                        $Global:call++
                        return @{value=@(
                            @{
                                displayName = "Corporate Communicator"
                                id          = '12345'
                            }
                        )}
                    }
                    else
                    {
                        return @{value=@(
                            @{
                                id = '12345-12345-12345-12345-12345'
                            },
                            @{
                                id = '222-222-222-222' # Drift
                            }
                        )}
                    }
                }
            }

            It 'Should return false from the Test method' {
                Test-TargetResource @testParams | Should -Be $false
            }

            It 'Should call the Set method' {
                Set-TargetResource @testParams
                Should -Invoke -CommandName Invoke-MgGraphRequest -Exactly 4
            }
        }

        Context -Name 'ReverseDSC Tests' -Fixture {
            BeforeAll {
                
                $testParams = @{
                    Credential = $Credential
                }
                $call = 1
                Mock -CommandName Invoke-MgGraphRequest -MockWith {
                    if ($call -eq 1)
                    {
                        $call++
                        return @{value=@(
                            @{
                                displayName = "Corporate Communicator"
                                id          = '12345'
                            }
                        )}
                    }
                    else
                    {
                        return @{value=@(
                            @{
                                id = '12345-12345-12345-12345-12345'
                            },
                            @{
                                id = '222-222-222-222' # Drift
                            }
                        )}
                    }
                }
            }
            It 'Should Reverse Engineer resource from the Export method' {
                $result = Export-TargetResource @testParams
                $result | Should -Not -BeNullOrEmpty
            }
        }
    }
}

Invoke-Command -ScriptBlock $Global:DscHelper.CleanupScript -NoNewScope
