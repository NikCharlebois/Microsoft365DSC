function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $DisplayName,

        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [ValidateSet('encryptAuditAndPrompt', 'encryptAndAuditOnly')]
        [System.String]
        $EnforcementLevel,

        [Parameter()]
        [System.String]
        $EnterpriseDomain,

        [Parameter()]
        [System.Boolean]
        $ProtectionUnderLockConfigRequired,

        [Parameter()]
        [System.Boolean]
        $RevokeOnUnenrollDisabled,

        [Parameter()]
        [System.Boolean]
        $AzureRightsManagementServicesAllowed,

        [Parameter()]
        [System.Boolean]
        $IconsVisible,

        [Parameter()]
        [System.Boolean]
        $EnterpriseIPRangesAreAuthoritative,

        [Parameter()]
        [System.Boolean]
        $EnterpriseProxyServersAreAuthoritative,

        [Parameter()]
        [System.Boolean]
        $IndexingEncryptedStoresOrItemsBlocked,

        [Parameter()]
        [System.Boolean]
        $IsAssigned,

        [Parameter()]
        [System.Boolean]
        $RevokeOnMdmHandoffDisabled,

        [Parameter()]
        [System.String]
        $MdmEnrollmentUrl,

        [Parameter()]
        [System.Boolean]
        $WindowsHelloForBusinessBlocked,

        [Parameter()]
        [System.Uint32]
        $PinMinimumLength,

        [Parameter()]
        [ValidateSet('allow', 'notAllow', 'requireAtLeastOne')]
        [System.String]
        $PinUpperCaseLetters,

        [Parameter()]
        [ValidateSet('allow', 'notAllow', 'requireAtLeastOne')]
        [System.String]
        $PinLowercaseLetters,

        [Parameter()]
        [ValidateSet('allow', 'notAllow', 'requireAtLeastOne')]
        [System.String]
        $PinSpecialCharacters,

        [Parameter()]
        [System.Uint32]
        $PinExpirationDays = 0,

        [Parameter()]
        [System.Uint32]
        $NumberOfPastPinsRemembered = 0,

        [Parameter()]
        [System.Uint32]
        $PasswordMaximumAttemptCount = 0,

        [Parameter()]
        [System.Uint32]
        $MinutesOfInactivityBeforeDeviceLock = 0,

        [Parameter()]
        [System.Uint32]
        $DaysWithoutContactBeforeUnenroll = 90,

        [Parameter()]
        [System.String[]]
        $EnterpriseProtectedDomainNames,

        [Parameter()]
        [System.String[]]
        $ProtectedApps,

        [Parameter()]
        [System.String[]]
        $ExemptApps,

        [Parameter()]
        [System.String[]]
        $EnterpriseNetworkDomainNames,

        [Parameter()]
        [System.String[]]
        $EnterpriseProxiedDomains,

        [Parameter()]
        [System.String[]]
        $EnterpriseIPRanges,

        [Parameter()]
        [System.String[]]
        $EnterpriseProxyServers,

        [Parameter()]
        [System.String[]]
        $EnterpriseInternalProxyServers,

        [Parameter()]
        [System.String[]]
        $NeutralDomainResources,

        [Parameter()]
        [System.String[]]
        $SmbAutoEncryptedFileExtensions,

        [Parameter(Mandatory = $true)]
        [ValidateSet("Absent", "Present")]
        [System.String]
        $Ensure = "Present",

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $GlobalAdminAccount
    )

    #region Telemetry
    $ResourceName = $MyInvocation.MyCommand.ModuleName.Replace("MSFT_", "")
    $data = [System.Collections.Generic.Dictionary[[String], [String]]]::new()
    $data.Add('Resource', $ResourceName)
    $data.Add('Method', $MyInvocation.MyCommand)
    $data.Add('Principal', $GlobalAdminAccount.UserName)
    Add-M365DSCTelemetryEvent -Data $data
    #endregion

    Write-Verbose -Message "Checking for the Intune App Protection Policy for WIndows{$DisplayName}"
    $ConnectionMode = New-M365DSCConnection -Platform 'Intune' `
        -InboundParameters $PSBoundParameters

    $nullResult = $PSBoundParameters
    $nullResult.Ensure = 'Absent'
    try
    {
        $protectionPolicy = Get-IntuneAppProtectionPolicy -Filter "displayName eq '$DisplayName'" `
            -ErrorAction Stop

        if ($null -eq $protectionPolicy)
        {
            Write-Verbose -Message "No App Protection Policy for Windows with displayName {$DisplayName} was found"
            return $nullResult
        }

        Write-Verbose -Message "Found App Protection Policy for Windows with displayName {$DisplayName}"
        return @{
            DisplayName                            = $protectionPolicy.displayName
            Description                            = $protectionPolicy.description
            EnforcementLevel                       = $protectionPolicy.enforcementLevel
            EnterpriseDomain                       = $protectionPolicy.EnterpriseDomain
            ProtectionUnderLockConfigRequired      = $protectionPolicy.protectionUnderLockConfigRequired
            RevokeOnUnenrollDisabled               = $protectionPolicy.revokeOnUnenrollDisabled
            AzureRightsManagementServicesAllowed   = $protectionPolicy.azureRightsManagementServicesAllowed
            IconsVisible                           = $protectionPolicy.IconsVisible
            EnterpriseIPRangesAreAuthoritative     = $protectionPolicy.enterpriseIPRangesAreAuthoritative
            EnterpriseProxyServersAreAuthoritative = $protectionPolicy.enterpriseProxyServersAreAuthoritative
            IndexingEncryptedStoresOrItemsBlocked  = $protectionPolicy.indexingEncryptedStoresOrItemsBlocked
            IsAssigned                             = $protectionPolicy.isAssigned
            RevokeOnMdmHandoffDisabled             = $protectionPolicy.revokeOnMdmHandoffDisabled
            MdmEnrollmentUrl                       = $protectionPolicy.mdmEnrollmentUrl
            WindowsHelloForBusinessBlocked         = $protectionPolicy.windowsHelloForBusinessBlocked
            PinMinimumLength                       = $protectionPolicy.pinMinimumLength
            PinUpperCaseLetters                    = $protectionPolicy.pinUpperCaseLetters
            PinLowercaseLetters                    = $protectionPolicy.pinLowercaseLetters
            PinSpecialCharacters                   = $protectionPolicy.pinSpecialCharacters
            PinExpirationDays                      = $protectionPolicy.pinExpirationDays
            NumberOfPastPinsRemembered             = $protectionPolicy.numberOfPastPinsRemembered
            PasswordMaximumAttemptCount            = $protectionPolicy.passwordMaximumAttemptCount
            MinutesOfInactivityBeforeDeviceLock    = $protectionPolicy.minutesOfInactivityBeforeDeviceLock
            DaysWithoutContactBeforeUnenroll       = $protectionPolicy.daysWithoutContactBeforeUnenroll
            EnterpriseProtectedDomainNames         = $protectionPolicy.enterpriseProtectedDomainNames
            ProtectedApps                          = $protectionPolicy.protectedApps
            ExemptApps                             = $protectionPolicy.exemptApps
            EnterpriseNetworkDomainNames           = $protectionPolicy.enterpriseNetworkDomainNames
            EnterpriseProxiedDomains               = $protectionPolicy.enterpriseProxiedDomains
            EnterpriseIPRanges                     = $protectionPolicy.enterpriseIPRanges
            EnterpriseProxyServers                 = $protectionPolicy.enterpriseProxyServers
            EnterpriseInternalProxyServers         = $protectionPolicy.enterpriseInternalProxyServers
            NeutralDomainResources                 = $protectionPolicy.neutralDomainResources
            SmbAutoEncryptedFileExtensions         = $protectionPolicy.smbAutoEncryptedFileExtensions
            Ensure                                 = "Present"
            GlobalAdminAccount                     = $GlobalAdminAccount
        }
    }
    catch
    {
        try
        {
            Write-Verbose -Message $_
            $tenantIdValue = $GlobalAdminAccount.UserName.Split('@')[1]
            Add-M365DSCEvent -Message $_ -EntryType 'Error' `
                -EventID 1 -Source $($MyInvocation.MyCommand.Source) `
                -TenantId $tenantIdValue
        }
        catch
        {
            Write-Verbose -Message $_
        }
        return $nullResult
    }
}

function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $DisplayName,

        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [ValidateSet('encryptAuditAndPrompt', 'encryptAndAuditOnly')]
        [System.String]
        $EnforcementLevel,

        [Parameter()]
        [System.String]
        $EnterpriseDomain,

        [Parameter()]
        [System.Boolean]
        $ProtectionUnderLockConfigRequired,

        [Parameter()]
        [System.Boolean]
        $RevokeOnUnenrollDisabled,

        [Parameter()]
        [System.Boolean]
        $AzureRightsManagementServicesAllowed,

        [Parameter()]
        [System.Boolean]
        $IconsVisible,

        [Parameter()]
        [System.Boolean]
        $EnterpriseIPRangesAreAuthoritative,

        [Parameter()]
        [System.Boolean]
        $EnterpriseProxyServersAreAuthoritative,

        [Parameter()]
        [System.Boolean]
        $IndexingEncryptedStoresOrItemsBlocked,

        [Parameter()]
        [System.Boolean]
        $IsAssigned,

        [Parameter()]
        [System.Boolean]
        $RevokeOnMdmHandoffDisabled,

        [Parameter()]
        [System.String]
        $MdmEnrollmentUrl,

        [Parameter()]
        [System.Boolean]
        $WindowsHelloForBusinessBlocked,

        [Parameter()]
        [System.Uint32]
        $PinMinimumLength,

        [Parameter()]
        [ValidateSet('allow', 'notAllow', 'requireAtLeastOne')]
        [System.String]
        $PinUpperCaseLetters,

        [Parameter()]
        [ValidateSet('allow', 'notAllow', 'requireAtLeastOne')]
        [System.String]
        $PinLowercaseLetters,

        [Parameter()]
        [ValidateSet('allow', 'notAllow', 'requireAtLeastOne')]
        [System.String]
        $PinSpecialCharacters,

        [Parameter()]
        [System.Uint32]
        $PinExpirationDays = 0,

        [Parameter()]
        [System.Uint32]
        $NumberOfPastPinsRemembered = 0,

        [Parameter()]
        [System.Uint32]
        $PasswordMaximumAttemptCount = 0,

        [Parameter()]
        [System.Uint32]
        $MinutesOfInactivityBeforeDeviceLock = 0,

        [Parameter()]
        [System.Uint32]
        $DaysWithoutContactBeforeUnenroll = 90,

        [Parameter()]
        [System.String[]]
        $EnterpriseProtectedDomainNames,

        [Parameter()]
        [System.String[]]
        $ProtectedApps,

        [Parameter()]
        [System.String[]]
        $ExemptApps,

        [Parameter()]
        [System.String[]]
        $EnterpriseNetworkDomainNames,

        [Parameter()]
        [System.String[]]
        $EnterpriseProxiedDomains,

        [Parameter()]
        [System.String[]]
        $EnterpriseIPRanges,

        [Parameter()]
        [System.String[]]
        $EnterpriseProxyServers,

        [Parameter()]
        [System.String[]]
        $EnterpriseInternalProxyServers,

        [Parameter()]
        [System.String[]]
        $NeutralDomainResources,

        [Parameter()]
        [System.String[]]
        $SmbAutoEncryptedFileExtensions,

        [Parameter(Mandatory = $true)]
        [ValidateSet("Absent", "Present")]
        [System.String]
        $Ensure = "Present",

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
    Write-Verbose -Message "Intune App Protection Policy for Windows {$DisplayName}"

    $ConnectionMode = New-M365DSCConnection -Platform 'Intune' `
        -InboundParameters $PSBoundParameters

    $currentconfigPolicy = Get-TargetResource @PSBoundParameters

    if ($Ensure -eq 'Present' -and $currentconfigPolicy.Ensure -eq 'Absent')
    {
        $NewParams = $PSBoundParameters
        $NewParams.Remove("GlobalAdminAccount") | Out-Null
        $NewParams.Remove("Ensure") | Out-Null
        $NewParams.Add("ODataType", "#microsoft.graph.windowsInformationProtectionPolicy")
        Write-Verbose -Message "Creating new Intune App Protection Policy for Windows{$DisplayName} with values $(Convert-M365DscHashtableToString -Hashtable $NewParams)"
        New-IntuneAppProtectionPolicy @NewParams
    }
    elseif ($Ensure -eq 'Present' -and $currentconfigPolicy.Ensure -eq 'Present')
    {
        $UpdateParams = $PSBoundParameters
        $UpdateParams.Remove("GlobalAdminAccount") | Out-Null
        $UpdateParams.Remove("Ensure") | Out-Null
        $protectionPolicy = Get-IntuneAppProtectionPolicy -Filter "displayName eq '$DisplayName'" `
            -ErrorAction Stop
        $UpdateParams.Add("managedAppPolicyId", $protectionPolicy.id)

        Write-Verbose -Message "Updating Intune App Protection Policy {$DisplayName} with values $(Convert-M365DscHashtableToString -Hashtable $UpdateParams)"
        Update-IntuneAppProtectionPolicy @UpdateParams
    }
    elseif ($Ensure -eq 'Absent' -and $currentconfigPolicy.Ensure -eq 'Present')
    {
        Write-Verbose -Message "Removing Intune App Configuration Policy for Windows {$DisplayName}"
        $protectionPolicy = Get-IntuneAppProtectionPolicy -Filter "displayName eq '$DisplayName'" `
            -ErrorAction Stop
        Remove-IntuneAppProtectionPolicy -managedAppPolicyId $protectionPolicy.id
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
        $DisplayName,

        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [ValidateSet('encryptAuditAndPrompt', 'encryptAndAuditOnly')]
        [System.String]
        $EnforcementLevel,

        [Parameter()]
        [System.String]
        $EnterpriseDomain,

        [Parameter()]
        [System.Boolean]
        $ProtectionUnderLockConfigRequired,

        [Parameter()]
        [System.Boolean]
        $RevokeOnUnenrollDisabled,

        [Parameter()]
        [System.Boolean]
        $AzureRightsManagementServicesAllowed,

        [Parameter()]
        [System.Boolean]
        $IconsVisible,

        [Parameter()]
        [System.Boolean]
        $EnterpriseIPRangesAreAuthoritative,

        [Parameter()]
        [System.Boolean]
        $EnterpriseProxyServersAreAuthoritative,

        [Parameter()]
        [System.Boolean]
        $IndexingEncryptedStoresOrItemsBlocked,

        [Parameter()]
        [System.Boolean]
        $IsAssigned,

        [Parameter()]
        [System.Boolean]
        $RevokeOnMdmHandoffDisabled,

        [Parameter()]
        [System.String]
        $MdmEnrollmentUrl,

        [Parameter()]
        [System.Boolean]
        $WindowsHelloForBusinessBlocked,

        [Parameter()]
        [System.Uint32]
        $PinMinimumLength,

        [Parameter()]
        [ValidateSet('allow', 'notAllow', 'requireAtLeastOne')]
        [System.String]
        $PinUpperCaseLetters,

        [Parameter()]
        [ValidateSet('allow', 'notAllow', 'requireAtLeastOne')]
        [System.String]
        $PinLowercaseLetters,

        [Parameter()]
        [ValidateSet('allow', 'notAllow', 'requireAtLeastOne')]
        [System.String]
        $PinSpecialCharacters,

        [Parameter()]
        [System.Uint32]
        $PinExpirationDays = 0,

        [Parameter()]
        [System.Uint32]
        $NumberOfPastPinsRemembered = 0,

        [Parameter()]
        [System.Uint32]
        $PasswordMaximumAttemptCount = 0,

        [Parameter()]
        [System.Uint32]
        $MinutesOfInactivityBeforeDeviceLock = 0,

        [Parameter()]
        [System.Uint32]
        $DaysWithoutContactBeforeUnenroll = 90,

        [Parameter()]
        [System.String[]]
        $EnterpriseProtectedDomainNames,

        [Parameter()]
        [System.String[]]
        $ProtectedApps,

        [Parameter()]
        [System.String[]]
        $ExemptApps,

        [Parameter()]
        [System.String[]]
        $EnterpriseNetworkDomainNames,

        [Parameter()]
        [System.String[]]
        $EnterpriseProxiedDomains,

        [Parameter()]
        [System.String[]]
        $EnterpriseIPRanges,

        [Parameter()]
        [System.String[]]
        $EnterpriseProxyServers,

        [Parameter()]
        [System.String[]]
        $EnterpriseInternalProxyServers,

        [Parameter()]
        [System.String[]]
        $NeutralDomainResources,

        [Parameter()]
        [System.String[]]
        $SmbAutoEncryptedFileExtensions,

        [Parameter(Mandatory = $true)]
        [ValidateSet("Absent", "Present")]
        [System.String]
        $Ensure = "Present",

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
    $data.Add("TenantId", $TenantId)
    Add-M365DSCTelemetryEvent -Data $data
    #endregion
    Write-Verbose -Message "Testing configuration of Intune App Protection Policy for Windows {$DisplayName}"

    $CurrentValues = Get-TargetResource @PSBoundParameters

    Write-Verbose -Message "Current Values: $(Convert-M365DscHashtableToString -Hashtable $CurrentValues)"
    Write-Verbose -Message "Target Values: $(Convert-M365DscHashtableToString -Hashtable $PSBoundParameters)"

    $ValuesToCheck = $PSBoundParameters
    $ValuesToCheck.Remove('GlobalAdminAccount') | Out-Null

    $TestResult = Test-M365DSCParameterState -CurrentValues $CurrentValues `
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

    $ConnectionMode = New-M365DSCConnection -Platform 'Intune' `
        -InboundParameters $PSBoundParameters

    try
    {
        [array]$protectionPolicies = Get-IntuneAppProtectionPolicy -ErrorAction Stop
        $i = 1
        $content = ''
        Write-Host "`r`n" -NoNewline
        foreach ($protectionPolicy in $protectionPolicies)
        {
            Write-Host "    |---[$i/$($protectionPolicies.Count)] $($protectionPolicy.displayName)" -NoNewline
            $params = @{
                DisplayName        = $protectionPolicy.displayName
                Ensure             = 'Present'
                GlobalAdminAccount = $GlobalAdminAccount
            }
            $result = Get-TargetResource @params
            $result.GlobalAdminAccount = Resolve-Credentials -UserName "globaladmin"
            $content += "        IntuneAppProtectionPolicyWindows " + (New-Guid).ToString() + "`r`n"
            $content += "        {`r`n"
            $currentDSCBlock = Get-DSCBlock -Params $result -ModulePath $PSScriptRoot
            $content += Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "GlobalAdminAccount"
            $content += "        }`r`n"
            $i++
            Write-Host $Global:M365DSCEmojiGreenCheckMark
        }
        return $content
    }
    catch
    {
        Write-Host $Global:M365DSCEmojiGreenCheckMark
        try
        {
            Write-Verbose -Message $_
            $tenantIdValue = $GlobalAdminAccount.UserName.Split('@')[1]
            Add-M365DSCEvent -Message $_ -EntryType 'Error' `
                -EventID 1 -Source $($MyInvocation.MyCommand.Source) `
                -TenantId $tenantIdValue
        }
        catch
        {
            Write-Verbose -Message $_
        }
        return ""
    }
}

Export-ModuleMember -Function *-TargetResource
