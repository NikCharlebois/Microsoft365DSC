[CmdletBinding()]
param(
)
$M365DSCTestFolder = Join-Path -Path $PSScriptRoot `
                        -ChildPath "..\..\Unit" `
                        -Resolve
$CmdletModule = (Join-Path -Path $M365DSCTestFolder `
            -ChildPath "\Stubs\Microsoft365.psm1" `
            -Resolve)
$GenericStubPath = (Join-Path -Path $M365DSCTestFolder `
    -ChildPath "\Stubs\Generic.psm1" `
    -Resolve)
Import-Module -Name (Join-Path -Path $M365DSCTestFolder `
        -ChildPath "\UnitTestHelper.psm1" `
        -Resolve)

$Global:DscHelper = New-M365DscUnitTestHelper -StubModule $CmdletModule `
    -DscResource "EXOCASMailboxPlan" -GenericStubModule $GenericStubPath
Describe -Name $Global:DscHelper.DescribeHeader -Fixture {
    InModuleScope -ModuleName $Global:DscHelper.ModuleName -ScriptBlock {
        Invoke-Command -ScriptBlock $Global:DscHelper.InitializeScript -NoNewScope

        BeforeAll {
            $secpasswd = ConvertTo-SecureString "test@password1" -AsPlainText -Force
            $GlobalAdminAccount = New-Object System.Management.Automation.PSCredential ("tenantadmin", $secpasswd)

            Mock -CommandName Update-M365DSCExportAuthenticationResults -MockWith {
                return @{}
            }

            Mock -CommandName Get-M365DSCExportContentForResource -MockWith {

            }

            Mock -CommandName New-M365DSCConnection -MockWith {
                return "Credential"
            }

            Mock -CommandName Set-CASMailboxPlan -MockWith {

            }
        }

        # Test contexts
        Context -Name "CASMailboxPlan update not required." -Fixture {
            BeforeAll {
                $testParams = @{
                    Ensure             = 'Present'
                    Identity           = 'ExchangeOnlineEnterprise-6f6c267b-f8db-4020-b441-f7bd966a0ca0'
                    GlobalAdminAccount = $GlobalAdminAccount
                    ActiveSyncEnabled  = $true
                    ImapEnabled        = $true
                    OwaMailboxPolicy   = 'OwaMailboxPolicy-Default'
                    PopEnabled         = $true
                }

                Mock -CommandName Get-CASMailboxPlan -MockWith {
                    return @{
                        Ensure             = 'Present'
                        Identity           = 'ExchangeOnlineEnterprise-6f6c267b-f8db-4020-b441-f7bd966a0ca0'
                        GlobalAdminAccount = $GlobalAdminAccount
                        ActiveSyncEnabled  = $true
                        ImapEnabled        = $true
                        OwaMailboxPolicy   = 'OwaMailboxPolicy-Default'
                        PopEnabled         = $true
                    }
                }
            }

            It 'Should return true from the Test method' {
                Test-TargetResource @testParams | Should -Be $true
            }

            It "Should return Present from the Get method" {
                (Get-TargetResource @testParams).Ensure | Should -Be "Present"
            }

            It "Should not update anything in the Set Method" {
                Set-TargetResource @testParams
            }
        }

        Context -Name "CASMailboxPlan update needed." -Fixture {
            BeforeAll {
                $testParams = @{
                    Ensure             = 'Present'
                    Identity           = 'ExchangeOnlineEnterprise-6f6c267b-f8db-4020-b441-f7bd966a0ca0'
                    GlobalAdminAccount = $GlobalAdminAccount
                    ActiveSyncEnabled  = $true
                    ImapEnabled        = $true
                    OwaMailboxPolicy   = 'OwaMailboxPolicy-Default'
                    PopEnabled         = $true
                }
                Mock -CommandName Get-CASMailboxPlan -MockWith {
                    return @{
                        Ensure             = 'Present'
                        Identity           = 'ExchangeOnlineEnterprise-6f6c267b-f8db-4020-b441-f7bd966a0ca0'
                        GlobalAdminAccount = $GlobalAdminAccount
                        ActiveSyncEnabled  = $false
                        ImapEnabled        = $false
                        OwaMailboxPolicy   = 'OwaMailboxPolicy-Default'
                        PopEnabled         = $false
                    }
                }
            }

            It 'Should return false from the Test method' {
                Test-TargetResource @testParams | Should -Be $false
            }

            It "Should call the Set method" {
                Set-TargetResource @testParams
            }
        }

        Context -Name 'ReverseDSC Tests' -Fixture {
            BeforeAll {
                $testParams = @{
                    GlobalAdminAccount = $GlobalAdminAccount
                }

                Mock -CommandName Get-CASMailboxPlan -MockWith {
                    return @{
                        Identity           = 'ExchangeOnlineEnterprise-6f6c267b-f8db-4020-b441-f7bd966a0ca0'
                        ActiveSyncEnabled  = $true
                        ImapEnabled        = $true
                        OwaMailboxPolicy   = 'OwaMailboxPolicy-Default'
                        PopEnabled         = $true
                    }
                }
            }

            It 'Should Reverse Engineer resource from the Export method' {
                Export-TargetResource @testParams
            }
        }
    }
}

Invoke-Command -ScriptBlock $Global:DscHelper.CleanupScript -NoNewScope
