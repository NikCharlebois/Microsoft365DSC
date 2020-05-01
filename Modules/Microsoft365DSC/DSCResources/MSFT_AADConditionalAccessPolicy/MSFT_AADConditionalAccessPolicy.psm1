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
        [ValidateSet('Enabled')]
        [System.String]
        $State,

        [Parameter()]
        [System.String[]]
        $ExcludedLocations,

        [Parameter()]
        [System.String[]]
        $IncludedLocations,

        [Parameter()]
        [System.String[]]
        $ExcludedGroups,

        [Parameter()]
        [System.String[]]
        $ExcludedRoles,

        [Parameter()]
        [System.String[]]
        $ExcludedUsers,

        [Parameter()]
        [System.String[]]
        $IncludedGroups,

        [Parameter()]
        [System.String[]]
        $IncludedRoles,

        [Parameter()]
        [System.String[]]
        $IncludedUsers,

        [Parameter()]
        [System.String[]]
        $ExcludedPlatforms,

        [Parameter()]
        [System.String[]]
        $IncludedPlatforms,

        [Parameter()]
        [System.String[]]
        $ExcludedApplications,

        [Parameter()]
        [System.String[]]
        $IncludedApplications,

        [Parameter()]
        [ValidateSet('RegisterSecurityInfo')]
        [System.String[]]
        $IncludedUserActions,

        [Parameter()]
        [System.String[]]
        $GrantControlBuiltInControls,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present',

        [Parameter()]
        [System.String]
        $ApplicationId,

        [Parameter()]
        [System.String]
        $TenantId,

        [Parameter()]
        [System.String]
        $CertificateThumbprint
    )

    Write-Verbose -Message "Getting configuration of AzureAD Groups Naming Policy"
    #region Telemetry
    $data = [System.Collections.Generic.Dictionary[[String], [String]]]::new()
    $data.Add("Resource", $MyInvocation.MyCommand.ModuleName)
    $data.Add("Method", $MyInvocation.MyCommand)
    Add-M365DSCTelemetryEvent -Data $data
    #endregion

    $ConnectionMode = New-M365DSCConnection -Platform 'MicrosoftGraph' -InboundParameters $PSBoundParameters

    $Policy = Get-MgConditionalAccessPolicy -Filter "DisplayName eq '$DisplayName'"

    if ($null -eq $Policy)
    {
        $currentValues = $PSBoundParameters
        $currentValues.Ensure = "Absent"
        return $currentValues
    }
    else
    {
        Write-Verbose "Found existing AzureAD Conditional Access Policy {$DisplayName}"

        #region ExcludedRegions
        $ExcludedLocationsValues = @()
        foreach ($location in $Policy.LocationExcludeLocations)
        {
            if ($location -ne '00000000-0000-0000-0000-000000000000')
            {
                $CurrentName = Get-MgConditionalAccessNamedLocation -NamedLocationId $location
                $ExcludedLocations += $CurrentName
            }
            else
            {
                $ExcludedLocationsValues += "MFA Trusted IPs"
            }
        }
        #endregion

        #region IncludedRegions
        $IncludedLocationsValues = @()
        foreach ($location in $Policy.LocationIncludeLocations)
        {
            if ($location -ne '00000000-0000-0000-0000-000000000000')
            {
                $CurrentName = Get-MgConditionalAccessNamedLocation -NamedLocationId $location
                $IncludedLocationsValues += $CurrentName.DisplayName
            }
            else
            {
                $IncludedLocationsValues += "MFA Trusted IPs"
            }
        }
        #endregion

        #region ExcludedGroups
        $ExcludedGroupsValues = @()
        foreach ($group in $Policy.UserExcludeGroups)
        {
            $CurrentName = Get-MgGroup -GroupId $group
            $ExcludedGroupsValues += $CurrentName.DisplayName
        }
        #endregion

        #region IncludedGroups
        $IncludedGroupsValues = @()
        foreach ($group in $Policy.UserIncludeGroups)
        {
            $CurrentName = Get-MgGroup -GroupId $group
            $IncludedGroupsValues += $CurrentName.DisplayName
        }
        #endregion

        #region ExcludedUsers
        $ExcludedUsersValues = @()
        foreach ($user in $Policy.UserExcludeUsers)
        {
            if ($user -ne 'All')
            {
                $CurrentName = Get-MgUser -UserId $user
                $ExcludedUsersValues += $CurrentName.UserPrincipalName
            }
            else
            {
                $ExcludedUsersValues += "All"
            }
        }
        #endregion

        #region IncludedUsers
        $IncludedUsersValues = @()
        foreach ($user in $Policy.UserIncludeUsers)
        {
            if ($user -ne 'All')
            {
                $CurrentName = Get-MgUser -UserId $user
                $IncludedUsersValues += $CurrentName.UserPrincipalName
            }
            else
            {
                $IncludedUsersValues += "All"
            }
        }
        #endregion

        #region ExcludedRoles
        $ExcludedRolesValues = @()
        foreach ($role in $Policy.UserExcludeRoles)
        {
            $CurrentName = Get-MgDirectoryRoleTemplate -DirectoryRoleTemplateId $role
            $ExcludedRolesValues += $CurrentName.UserPrincipalName
        }
        #endregion

        #region IncludedRoles
        $IncludedRolesValues = @()
        foreach ($role in $Policy.UserIncludeRoles)
        {
            $CurrentName = Get-MgDirectoryRoleTemplate -DirectoryRoleTemplateId $role
            $IncludedRolesValues += $CurrentName.DisplayName
        }
        #endregion

        #region ExcludedPlatforms
        $ExcludedPlatformsValues = @()
        foreach ($platform in $Policy.PlatformExcludePlatforms)
        {
            $ExcludedPlatformsValues += $platform
        }
        #endregion

        #region IncludedPlatforms
        $IncludedPlatformsValues = @()
        foreach ($platform in $Policy.PlatformIncludePlatforms)
        {
            $IncludedPlatformsValues += $platform
        }
        #endregion

        #region ExcludedApplications
        $ExcludedApplicationsValues = @()
        foreach ($application in $Policy.ApplicationExcludeApplications)
        {
            if ($application -ne 'All')
            {
                $ExcludedApplicationsValues += $application
            }
            else
            {
                $ExcludedApplicationsValues += 'All'
            }
        }
        #endregion

        #region IncludedApplications
        $IncludedApplicationValues = @()
        foreach ($application in $Policy.ApplicationIncludeApplications)
        {
            if ($application -ne 'All')
            {
                $IncludedApplicationsValues += $application
            }
            else
            {
                $IncludedApplicationsValues += 'All'
            }
        }
        #endregion

        #region IncludedUserActions
        $IncludedUserActionsValues = @()
        foreach ($action in $Policy.ApplicationIncludeUserActions)
        {
            if ($action -eq 'urn:user:registersecurityinfo')
            {
                $IncludedUserActionsValues += "RegisterSecurityInfo"
            }
        }
        #endregion

        #region GrantControlBuiltInControls
        $GrantControlBuiltInControlsValues = @()
        foreach ($action in $Policy.GrantControlBuiltInControls)
        {
            $GrantControlBuiltInControlsValues += $action
        }
        #endregion

        $result = @{
            DisplayName                 = $DisplayName
            Description                 = $Policy.Description
            State                       = $Policy.State
            ExcludedLocations           = $ExcludedLocationsValues
            IncludedLocations           = $IncludedLocationsValues
            ExcludedGroups              = $ExcludedGroups
            ExcludedRoles               = $ExcludedRoles
            ExcludedUsers               = $ExcludedUsers
            IncludedGroups              = $IncludedGroups
            IncludedRoles               = $IncludedRoles
            IncludedUsers               = $IncludedUsers
            ExcludedPlatforms           = $ExcludedPlatformsValues
            IncludedPlatforms           = $IncludedPlatformsValues
            ExcludedApplications        = $ExcludedApplicationsValues
            IncludedApplications        = $IncludedApplicationsValues
            IncludedUserActions         = $IncludedUserActionsValues
            GrantControlBuiltInControls = $GrantControlBuiltInControlsValues
            Ensure                      = 'Present'
            ApplicationId               = $ApplicationId
            TenantId                    = $TenantId
            CertificateThumbprint       = $CertificateThumbprint
        }

        Write-Verbose -Message "Get-TargetResource Result: `n $(Convert-M365DscHashtableToString -Hashtable $result)"
        return $result
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
        [ValidateSet('Enabled')]
        [System.String]
        $State,

        [Parameter()]
        [System.String[]]
        $ExcludedLocations,

        [Parameter()]
        [System.String[]]
        $IncludedLocations,

        [Parameter()]
        [System.String[]]
        $ExcludedGroups,

        [Parameter()]
        [System.String[]]
        $ExcludedRoles,

        [Parameter()]
        [System.String[]]
        $ExcludedUsers,

        [Parameter()]
        [System.String[]]
        $IncludedGroups,

        [Parameter()]
        [System.String[]]
        $IncludedRoles,

        [Parameter()]
        [System.String[]]
        $IncludedUsers,

        [Parameter()]
        [System.String[]]
        $ExcludedPlatforms,

        [Parameter()]
        [System.String[]]
        $IncludedPlatforms,

        [Parameter()]
        [System.String[]]
        $ExcludedApplications,

        [Parameter()]
        [System.String[]]
        $IncludedApplications,

        [Parameter()]
        [ValidateSet('RegisterSecurityInfo')]
        [System.String[]]
        $IncludedUserActions,

        [Parameter()]
        [System.String[]]
        $GrantControlBuiltInControls,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present',

        [Parameter()]
        [System.String]
        $ApplicationId,

        [Parameter()]
        [System.String]
        $TenantId,

        [Parameter()]
        [System.String]
        $CertificateThumbprint
    )

    Write-Verbose -Message "Setting configuration of Azure AD Groups Naming Policy"
    #region Telemetry
    $data = [System.Collections.Generic.Dictionary[[String], [String]]]::new()
    $data.Add("Resource", $MyInvocation.MyCommand.ModuleName)
    $data.Add("Method", $MyInvocation.MyCommand)
    Add-M365DSCTelemetryEvent -Data $data
    #endregion

    $currentPolicy = Get-TargetResource @PSBoundParameters

    # Policy should exist but it doesn't
    $needToUpdate = $false
    if ($Ensure -eq "Present" -and $currentPolicy.Ensure -eq "Absent")
    {
        $ds = (Get-AzureADDirectorySettingTemplate -id 62375ab9-6b52-47ed-826b-58e47e0e304b).CreateDirectorySetting()
        New-AzureADDirectorySetting -DirectorySetting $ds
        $needToUpdate = $true
    }

    $Policy = Get-AzureADDirectorySetting | Where-Object -FilterScript {$_.DisplayName -eq "Group.Unified"}

    if (($Ensure -eq 'Present' -and $currentPolicy.Ensure -eq 'Present') -or $needToUpdate)
    {
        $Policy["PrefixSuffixNamingRequirement"] = $PrefixSuffixNamingRequirement

        [string]$blockedWordsValue = $null

        $blockedWordsValue = $CustomBlockedWordsList -join ","
        $Policy["CustomBlockedWordsList"] = $blockedWordsValue

        Set-AzureADDirectorySetting -Id $Policy.id -DirectorySetting $Policy
    }
    elseif ($Ensure -eq 'Absent' -and $currentPolicy.Ensure -eq 'Present')
    {
        $Policy = Get-AzureADDirectorySetting | Where-Object -FilterScript {$_.DisplayName -eq "Group.Unified"}
        Remove-AzureADDirectorySetting -Id $policy.Id
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
        [ValidateSet('Enabled')]
        [System.String]
        $State,

        [Parameter()]
        [System.String[]]
        $ExcludedLocations,

        [Parameter()]
        [System.String[]]
        $IncludedLocations,

        [Parameter()]
        [System.String[]]
        $ExcludedGroups,

        [Parameter()]
        [System.String[]]
        $ExcludedRoles,

        [Parameter()]
        [System.String[]]
        $ExcludedUsers,

        [Parameter()]
        [System.String[]]
        $IncludedGroups,

        [Parameter()]
        [System.String[]]
        $IncludedRoles,

        [Parameter()]
        [System.String[]]
        $IncludedUsers,

        [Parameter()]
        [System.String[]]
        $ExcludedPlatforms,

        [Parameter()]
        [System.String[]]
        $IncludedPlatforms,

        [Parameter()]
        [System.String[]]
        $ExcludedApplications,

        [Parameter()]
        [System.String[]]
        $IncludedApplications,

        [Parameter()]
        [ValidateSet('RegisterSecurityInfo')]
        [System.String[]]
        $IncludedUserActions,

        [Parameter()]
        [System.String[]]
        $GrantControlBuiltInControls,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present',

        [Parameter()]
        [System.String]
        $ApplicationId,

        [Parameter()]
        [System.String]
        $TenantId,

        [Parameter()]
        [System.String]
        $CertificateThumbprint
    )

    Write-Verbose -Message "Testing configuration of AzureAD Groups Naming Policy"

    $CurrentValues = Get-TargetResource @PSBoundParameters

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
        [Parameter()]
        [System.String]
        $ApplicationId,

        [Parameter()]
        [System.String]
        $TenantId,

        [Parameter()]
        [System.String]
        $CertificateThumbprint
    )
    $InformationPreference = 'Continue'
    $VerbosePreference = 'Continue'
    #region Telemetry
    $data = [System.Collections.Generic.Dictionary[[String], [String]]]::new()
    $data.Add("Resource", $MyInvocation.MyCommand.ModuleName)
    $data.Add("Method", $MyInvocation.MyCommand)
    Add-M365DSCTelemetryEvent -Data $data
    #endregion


    $content = ''
    $ConnectionMode = New-M365DSCConnection -Platform 'MicrosoftGraph' -InboundParameters $PSBoundParameters
    $policies = Get-MgConditionalAccessPolicy

    foreach ($policy in $policies)
    {
        $params = @{
            ApplicationId         = $ApplicationId
            TenantId              = $TenantId
            CertificateThumbprint = $CertificateThumbprint
            DisplayName           = $DisplayName
        }

        $result = Get-TargetResource @params

        $content += "        AADConditionalAccessPolicy " + (New-GUID).ToString() + "`r`n"
        $content += "        {`r`n"
        $currentDSCBlock = Get-DSCBlock -Params $result -ModulePath $PSScriptRoot
        $content += $currentDSCBlock
        $content += "        }`r`n"
    }

    return $content
}

Export-ModuleMember -Function *-TargetResource
