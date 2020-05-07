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

    #region Telemetry
    $data = [System.Collections.Generic.Dictionary[[String], [String]]]::new()
    $data.Add("Resource", $MyInvocation.MyCommand.ModuleName)
    $data.Add("Method", $MyInvocation.MyCommand)
    Add-M365DSCTelemetryEvent -Data $data
    #endregion

    Write-Verbose -Message "Connecting to the Microsoft Graph"
    $ConnectionMode = New-M365DSCConnection -Platform 'MicrosoftGraph' -InboundParameters $PSBoundParameters

    Write-Verbose -Message "Getting configuration of Azure AD Conditional Access Policy {$DisplayName}"
    $Policy = Get-MgConditionalAccessPolicy -Filter "DisplayName eq '$DisplayName'"

    if ($null -eq $Policy)
    {
        Write-Verbose -Message "Azure AD Conditional Access Policy {$DisplayName} was not found."
        $currentValues = $PSBoundParameters
        $currentValues.Ensure = "Absent"
        return $currentValues
    }
    else
    {
        Write-Verbose "Found existing Azure AD Conditional Access Policy {$DisplayName}"

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

        # Make sure we capitalize the first letter to be consistent with other resources.
        $stateValue = $Policy.State
        if ($stateValue -eq 'enabled')
        {
            $stateValue = 'Enabled'
        }
        else
        {
            $stateValue = 'Disabled'
        }
        $result = @{
            DisplayName                 = $DisplayName
            Description                 = $Policy.Description
            State                       = $stateValue
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

    Write-Verbose -Message "Setting configuration of Azure AD Conditional Access Policy {$DisplayName}"
    #region Telemetry
    $data = [System.Collections.Generic.Dictionary[[String], [String]]]::new()
    $data.Add("Resource", $MyInvocation.MyCommand.ModuleName)
    $data.Add("Method", $MyInvocation.MyCommand)
    Add-M365DSCTelemetryEvent -Data $data
    #endregion

    $currentPolicy = Get-TargetResource @PSBoundParameters

    # Policy should exist but it doesn't
    if ($Ensure -eq "Present" -and $currentPolicy.Ensure -eq "Absent")
    {
        Write-Verbose -Message "Policy {$DisplayName} doesn't exist but should. Creating it."
        $CreationParams = $PSBoundParameters
        $CreationParams.Remove("Ensure")
        $CreationParams.Remove("ApplicationId")
        $CreationParams.Remove("TenantId")
        $CreationParams.Remove("CertificateThumbprint")
        $CreationParams.State = $CreationParams.State.ToLower()
        New-MgConditionalAccessNamedLocation @CreationParams
    }
    elseif ($Ensure -eq 'Present' -and $currentPolicy.Ensure -eq 'Present')
    {
        Write-Verbose -Message "Policy {$DisplayName} already exists but needs to be updated. Updating it."
        $UpdateParams = $PSBoundParameters
        $UpdateParams.Remove("Ensure")
        $UpdateParams.Remove("ApplicationId")
        $UpdateParams.Remove("TenantId")
        $UpdateParams.Remove("CertificateThumbprint")
        $UpdateParams.State = $UpdateParams.State.ToLower()
        Update-MgConditionalAccessPolicy -ConditionalAccessPolicyId $currentPolicy.Id -BodyParameter @UpdateParams
    }
    elseif ($Ensure -eq 'Absent' -and $currentPolicy.Ensure -eq 'Present')
    {
        # Due to a lack of a Remove-MgConditionalAccessPolicy cmdlet, we can only disable the rule for now;
        Write-Verbose -Message "Policy {$DisplayName} exists but shouldn't. Disabling it."
        Update-MgConditionalAccessPolicy -ConditionalAccessPolicyId $currentPolicy.Id -BodyParameter @{State = 'disabled'}
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

    Write-Verbose -Message "Testing configuration of Azure AD Conditional Policy {$DisplayName}"

    $CurrentValues = Get-TargetResource @PSBoundParameters

    Write-Verbose -Message "Target Values: $(Convert-M365DscHashtableToString -Hashtable $PSBoundParameters)"

    $ValuesToCheck = $PSBoundParameters
    $ValuesToCheck.Remove('ApplicationId') | Out-Null
    $ValuesToCheck.Remove('TenantId') | Out-Null
    $ValuesToCheck.Remove('CertificateThumbprint') | Out-Null

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
    #region Telemetry
    $data = [System.Collections.Generic.Dictionary[[String], [String]]]::new()
    $data.Add("Resource", $MyInvocation.MyCommand.ModuleName)
    $data.Add("Method", $MyInvocation.MyCommand)
    Add-M365DSCTelemetryEvent -Data $data
    #endregion

    $ConnectionMode = New-M365DSCConnection -Platform 'MicrosoftGraph' -InboundParameters $PSBoundParameters
    $content = ''
    [array] $policies = Get-MgConditionalAccessPolicy
    $i = 1
    foreach ($policy in $policies)
    {
        Write-Information -MessageData "    [$i/$($policies.Length)] $($policy.DisplayName)"
        $params = @{
            ApplicationId         = $ApplicationId
            TenantId              = $TenantId
            CertificateThumbprint = $CertificateThumbprint
            DisplayName           = $policy.DisplayName
        }

        $result = Get-TargetResource @params

        $content += "        AADConditionalAccessPolicy " + (New-GUID).ToString() + "`r`n"
        $content += "        {`r`n"
        $currentDSCBlock = Get-DSCBlock -Params $result -ModulePath $PSScriptRoot
        $content += $currentDSCBlock
        $content += "        }`r`n"
        $i++
    }

    return $content
}

Export-ModuleMember -Function *-TargetResource
