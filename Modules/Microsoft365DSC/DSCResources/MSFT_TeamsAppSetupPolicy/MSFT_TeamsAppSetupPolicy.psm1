function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Identity,

        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [System.String[]]
        $AppPresetList,

        [Parameter()]
        [System.String[]]
        $PinnedAppBarApps,

        [Parameter()]
        [System.Boolean]
        $AllowSideLoading,

        [Parameter()]
        [System.Boolean]
        $AllowUserPinning,

        [Parameter()]
        [ValidateSet("Present", "Absent")]
        [System.String]
        $Ensure = "Present",

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $GlobalAdminAccount
    )

    Write-Verbose -Message "Getting the Teams App Setup Policy {$Identity}"

    #region Telemetry
    $ResourceName = $MyInvocation.MyCommand.ModuleName.Replace("MSFT_", "")
    $data = [System.Collections.Generic.Dictionary[[String], [String]]]::new()
    $data.Add("Resource", $ResourceName)
    $data.Add("Method", $MyInvocation.MyCommand)
    $data.Add("Principal", $GlobalAdminAccount.UserName)
    Add-M365DSCTelemetryEvent -Data $data
    #endregion

    $ConnectionMode = New-M365DSCConnection -Platform 'SkypeForBusiness' `
        -InboundParameters $PSBoundParameters

    $policy = Get-CsTeamsAppSetupPolicy -Identity $Identity `
        -ErrorAction 'SilentlyContinue'

    if ($null -eq $policy)
    {
        Write-Verbose -Message "Could not find Teams App Setup Policy {$Identity}"
        return @{
            Identity           = $Identity
            Ensure             = 'Absent'
            GlobalAdminAccount = $GlobalAdminAccount
        }
    }
    Write-Verbose -Message "Found Teams App Setup Policy {$Identity}"
    $result = @{
        Identity           = $Identity
        Description        = $policy.Description
        AppPresetList      = [String[]]$policy.AppPresetList
        PinnedAppBarApps   = [String[]]$policy.PinnedAppBarApps
        AllowSideLoading   = $policy.AllowSideLoading
        AllowUserPinning   = $policy.AllowUserPinning
        Ensure             = "Present"
        GlobalAdminAccount = $GlobalAdminAccount
    }

    return $result
}

function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Identity,

        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [System.String[]]
        $AppPresetList,

        [Parameter()]
        [System.String[]]
        $PinnedAppBarApps,

        [Parameter()]
        [System.Boolean]
        $AllowSideLoading,

        [Parameter()]
        [System.Boolean]
        $AllowUserPinning,

        [Parameter()]
        [ValidateSet("Present", "Absent")]
        [System.String]
        $Ensure = "Present",

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $GlobalAdminAccount
    )
    Write-Verbose -Message "Setting Teams App Setup Policy {$Identity}"

    #region Telemetry
    $ResourceName = $MyInvocation.MyCommand.ModuleName.Replace("MSFT_", "")
    $data = [System.Collections.Generic.Dictionary[[String], [String]]]::new()
    $data.Add("Resource", $ResourceName)
    $data.Add("Method", $MyInvocation.MyCommand)
    $data.Add("Principal", $GlobalAdminAccount.UserName)
    Add-M365DSCTelemetryEvent -Data $data
    #endregion

    $ConnectionMode = New-M365DSCConnection -Platform 'SkypeForBusiness' `
        -InboundParameters $PSBoundParameters

    $CurrentValues = Get-TargetResource @PSBoundParameters

    $SetParameters = $PSBoundParameters
    $SetParameters.Remove("Ensure") | Out-Null
    $SetParameters.Remove("GlobalAdminAccount") | Out-Null

    if ($Ensure -eq 'Present' -and $CurrentValues.Ensure -eq 'Absent')
    {
        Write-Verbose -Message "Creating a new Teams Emergency Calling Policy {$Identity}"
        New-CsTeamsEmergencyCallingPolicy @SetParameters
    }
    elseif ($Ensure -eq 'Present' -and $CurrentValues.Ensure -eq 'Present')
    {
        # If we get here, it's because the Test-TargetResource detected a drift, therefore we always call
        # into the Set-CsTeamsEmergencyCallingPolicy cmdlet.
        Write-Verbose -Message "Updating settings for Teams Emergency Calling Policy {$Identity}"
        Set-CsTeamsEmergencyCallingPolicy @SetParameters
    }
    elseif ($Ensure -eq 'Absent' -and $CurrentValues.Ensure -eq 'Present')
    {
        Write-Verbose -Message "Removing existing Teams Emergency Calling Policy {$Identity}"
        Remove-CsTeamsEmergencyCallingPolicy -Identity $Identity -Confirm:$false
    }
}

function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Identity,

        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [System.String[]]
        $AppPresetList,

        [Parameter()]
        [System.String[]]
        $PinnedAppBarApps,

        [Parameter()]
        [System.Boolean]
        $AllowSideLoading,

        [Parameter()]
        [System.Boolean]
        $AllowUserPinning,

        [Parameter()]
        [ValidateSet("Present", "Absent")]
        [System.String]
        $Ensure = "Present",

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $GlobalAdminAccount
    )

    Write-Verbose -Message "Testing configuration of Team App Setup Policy {$Identity}"

    $CurrentValues = Get-TargetResource @PSBoundParameters

    Write-Verbose -Message "Current Values: $(Convert-M365DscHashtableToString -Hashtable $CurrentValues)"
    Write-Verbose -Message "Target Values: $(Convert-M365DscHashtableToString -Hashtable $PSBoundParameters)"

    $ValuesToCheck = $PSBoundParameters
    $ValuesToCheck.Remove('GlobalAdminAccount') | Out-Null

    $TestResult = Test-Microsoft365DSCParameterState -CurrentValues $CurrentValues `
        -Source $($MyInvocation.MyCommand.Source) `
        -DesiredValues $PSBoundParameters `
        -ValuesToCheck $ValuesToCheck.Keys

    Write-Verbose -Message "Test-TargetResource returned $TestResult"

    return $TestResult
}

function Export-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.String])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $GlobalAdminAccount
    )
    #region Telemetry
    $ResourceName = $MyInvocation.MyCommand.ModuleName.Replace("MSFT_", "")
    $data = [System.Collections.Generic.Dictionary[[String], [String]]]::new()
    $data.Add("Resource", $ResourceName)
    $data.Add("Method", $MyInvocation.MyCommand)
    $data.Add("Principal", $GlobalAdminAccount.UserName)
    Add-M365DSCTelemetryEvent -Data $data
    #endregion

    $ConnectionMode = New-M365DSCConnection -Platform 'SkypeForBusiness' `
        -InboundParameters $PSBoundParameters

    $i = 1
    [array]$policies = Get-CsTeamsAppSetupPolicy
    $dscContent = ''
    if ($policies.Length -gt 0)
    {
        Write-Host "`r`n" -NoNewLine
    }
    else
    {
        Write-Host $Global:M365DSCEmojiGreenCheckMark
    }

    foreach ($policy in $policies)
    {
        Write-Host "    |---[$i/$($policies.Count)] $($policy.Identity)" -NoNewLine
        $params = @{
            Identity           = $policy.Identity
            GlobalAdminAccount = $GlobalAdminAccount
        }
        $Results = Get-TargetResource @params
        $Results.Identity = $Results.Identity.Replace("Tag:", "")
        $Results = Update-M365DSCExportAuthenticationResults -ConnectionMode $ConnectionMode `
                        -Results $Results
        $dscContent += Get-M365DSCExportContentForResource -ResourceName $ResourceName `
                        -ConnectionMode $ConnectionMode `
                        -ModulePath $PSScriptRoot `
                        -Results $Results `
                        -GlobalAdminAccount $GlobalAdminAccount
        $i++
        Write-Host $Global:M365DSCEmojiGreenCheckMark
    }
    return $dscContent
}

Export-ModuleMember -Function *-TargetResource
