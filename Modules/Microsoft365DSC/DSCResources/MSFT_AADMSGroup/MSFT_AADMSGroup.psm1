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
        $Id,

        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [System.String[]]
        $GroupTypes,

        [Parameter()]
        [System.String]
        $MembershipRule,

        [Parameter()]
        [System.String[]]
        $Members,

        [Parameter()]
        [System.String[]]
        $Owners,

        [Parameter()]
        [ValidateSet('On', 'Paused')]
        [System.String]
        $MembershipRuleProcessingState,

        [Parameter()]
        [System.Boolean]
        $SecurityEnabled,

        [Parameter()]
        [System.Boolean]
        $MailEnabled,

        [Parameter()]
        [System.Boolean]
        $IsAssignableToRole,

        [Parameter()]
        [System.String]
        $MailNickname,

        [Parameter()]
        [ValidateSet('Public', 'Private', 'HiddenMembership')]
        [System.String]
        $Visibility,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present',

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $GlobalAdminAccount,

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

    Write-Verbose -Message "Getting configuration of AzureAD Group"
    #region Telemetry
    $ResourceName = $MyInvocation.MyCommand.ModuleName.Replace("MSFT_", "")
    $data = [System.Collections.Generic.Dictionary[[String], [String]]]::new()
    $data.Add("Resource", $ResourceName)
    $data.Add("Method", $MyInvocation.MyCommand)
    $data.Add("Principal", $GlobalAdminAccount.UserName)
    $data.Add("TenantId", $TenantId)
    Add-M365DSCTelemetryEvent -Data $data
    #endregion

    $ConnectionMode = New-M365DSCConnection -Platform 'AzureAD' -InboundParameters $PSBoundParameters
    $nullReturn = $PSBoundParameters
    $nullReturn.Ensure = "Absent"
    try
    {
        if ($PSBoundParameters.ContainsKey("Id"))
        {
            Write-Verbose -Message "GroupID was specified"
            try
            {
                $Group = Get-AzureADMSGroup -Id $Id -ErrorAction Stop
            }
            catch
            {
                $Group = Get-AzureADMSGroup -Filter "DisplayName eq '$DisplayName'" -ErrorAction Stop
                if ($Group.Length -gt 1)
                {
                    throw "Duplicate AzureAD Groups named $DisplayName exist in tenant"
                }
            }
        }
        else
        {
            Write-Verbose -Message "Id was NOT specified"
            ## Can retreive multiple AAD Groups since displayname is not unique
            $Group = Get-AzureADMSGroup -Filter "DisplayName eq '$DisplayName'" -ErrorAction Stop
            if ($Group.Length -gt 1)
            {
                throw "Duplicate AzureAD Groups named $DisplayName exist in tenant"
            }
        }

        if ($null -eq $Group)
        {
            return $nullReturn
        }
        else
        {
            Write-Verbose -Message "Found existing AzureAD Group"

            # List members by UPN
            $groupMembers = Get-AzureADGroupMember -ObjectId $Group.Id
            $membersValues = @()
            foreach ($member in $groupMembers)
            {
                $membersValues += $member.UserPrincipalName
            }

            # List owners by UPN
            $groupOwners = Get-AzureADGroupOwner -ObjectId $Group.Id
            $ownersValues = @()
            foreach ($owner in $groupOwners)
            {
                $ownersValues += $owner.UserPrincipalName
            }

            $result = @{
                DisplayName                   = $Group.DisplayName
                Id                            = $Group.Id
                Description                   = $Group.Description
                GroupTypes                    = [System.String[]]$Group.GroupTypes
                MembershipRule                = $Group.MembershipRule
                Members                       = $membersValues
                Owners                        = $ownersValues
                MembershipRuleProcessingState = $Group.MembershipRuleProcessingState
                SecurityEnabled               = $Group.SecurityEnabled
                MailEnabled                   = $Group.MailEnabled
                IsAssignableToRole            = $Group.IsAssignableToRole
                MailNickname                  = $Group.MailNickname
                Visibility                    = $Group.Visibility
                Ensure                        = "Present"
                GlobalAdminAccount            = $GlobalAdminAccount
                ApplicationId                 = $ApplicationId
                TenantId                      = $TenantId
                CertificateThumbprint         = $CertificateThumbprint
            }
            Write-Verbose -Message "Get-TargetResource Result: `n $(Convert-M365DscHashtableToString -Hashtable $result)"
            return $result
        }
    }
    catch
    {
        try
        {
            Write-Verbose -Message $_
            $tenantIdValue = ""
            if (-not [System.String]::IsNullOrEmpty($TenantId))
            {
                $tenantIdValue = $TenantId
            }
            elseif ($null -ne $GlobalAdminAccount)
            {
                $tenantIdValue = $GlobalAdminAccount.UserName.Split('@')[1]
            }
            Add-M365DSCEvent -Message $_ -EntryType 'Error' `
                -EventID 1 -Source $($MyInvocation.MyCommand.Source) `
                -TenantId $tenantIdValue
        }
        catch
        {
            Write-Verbose -Message $_
        }
        return $nullReturn
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
        $Id,

        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [System.String[]]
        $GroupTypes,

        [Parameter()]
        [System.String]
        $MembershipRule,

        [Parameter()]
        [System.String[]]
        $Members,

        [Parameter()]
        [System.String[]]
        $Owners,

        [Parameter()]
        [ValidateSet('On', 'Paused')]
        [System.String]
        $MembershipRuleProcessingState,

        [Parameter()]
        [System.Boolean]
        $SecurityEnabled,

        [Parameter()]
        [System.Boolean]
        $MailEnabled,

        [Parameter()]
        [System.Boolean]
        $IsAssignableToRole,

        [Parameter()]
        [System.String]
        $MailNickname,

        [Parameter()]
        [ValidateSet('Public', 'Private', 'HiddenMembership')]
        [System.String]
        $Visibility,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present',

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $GlobalAdminAccount,

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

    Write-Verbose -Message "Setting configuration of Azure AD Groups"
    #region Telemetry
    $ResourceName = $MyInvocation.MyCommand.ModuleName.Replace("MSFT_", "")
    $data = [System.Collections.Generic.Dictionary[[String], [String]]]::new()
    $data.Add("Resource", $ResourceName)
    $data.Add("Method", $MyInvocation.MyCommand)
    $data.Add("Principal", $GlobalAdminAccount.UserName)
    $data.Add("TenantId", $TenantId)
    Add-M365DSCTelemetryEvent -Data $data
    #endregion

    $currentGroup = Get-TargetResource @PSBoundParameters
    $AllMembers = $Members
    $AllOwners = $Owners
    $currentParameters = $PSBoundParameters
    $currentParameters.Remove("ApplicationId") | Out-Null
    $currentParameters.Remove("TenantId") | Out-Null
    $currentParameters.Remove("CertificateThumbprint") | Out-Null
    $currentParameters.Remove("GlobalAdminAccount") | Out-Null
    $currentParameters.Remove("Ensure") | Out-Null
    $currentParameters.Remove("Members") | Out-Null
    $currentParameters.Remove("Owners") | Out-Null

    if ($Ensure -eq 'Present' -and $GroupTypes.Contains("Unified") -and $MailEnabled -eq $false)
    {
        Write-Verbose -Message "Cannot set mailenabled to false if GroupTypes is set to Unified when creating group."
        throw "Cannot set mailenabled to false if GroupTypes is set to Unified when creating a group."
    }

    if ($Ensure -eq 'Present' -and $currentGroup.Ensure -eq 'Present')
    {
        try
        {
            if ($true -eq $currentParameters.ContainsKey("IsAssignableToRole"))
            {
                Write-Verbose -Message "Cannot set IsAssignableToRole once group is created."
                $currentParameters.Remove("IsAssignableToRole") | Out-Null
            }
            if ($false -eq $currentParameters.ContainsKey("Id"))
            {
                Set-AzureADMSGroup @currentParameters -Id $currentGroup.Id
            }
            else
            {
                Set-AzureADMSGroup @currentParameters
            }
        }
        catch
        {
            New-M365DSCLogEntry -Error $_ -Message "Couldn't set group $DisplayName" -Source $MyInvocation.MyCommand.ModuleName
        }
    }
    elseif ($Ensure -eq 'Present' -and $currentGroup.Ensure -eq 'Absent')
    {
        $currentParameters.Remove("Id")
        try
        {
            $group = New-AzureADMSGroup @currentParameters
            Write-Verbose -Message "Created new group with Id {$($group.Id)}"

            # Make sure the group is fully created before attempting to assign members and owners
            $createdGroup = $null
            $i = 1
            while ($null -eq $createdGroup -and $i -lt 20)
            {
                Start-Sleep -Seconds 1
                try
                {
                    $createdGroup = Get-AzureADGroup -ObjectId $group.Id -ErrorAction Stop
                }
                catch
                {
                    Write-Verbose -Message "Group not ready. Waited for {$i seconds}"
                    $i++
                }
            }

            foreach ($member in $AllMembers)
            {
                $userObject = Get-AzureADUser -ObjectId $member
                Write-Verbose -Message "Adding Member {$member}"
                Add-AzureADGroupMember -ObjectId $group.Id -RefObjectId $userObject.ObjectId
            }
            foreach ($owner in $AllOwners)
            {
                Write-Verbose -Message "Adding Owner {$owner}"
                $userObject = Get-AzureADUser -ObjectId $owner
                Add-AzureADGroupOwner -ObjectId $group.Id -RefObjectId $userObject.ObjectId
            }
        }
        catch
        {
            Write-Verbose -Message $_
            New-M365DSCLogEntry -Error $_ -Message "Couldn't create group $DisplayName" -Source $MyInvocation.MyCommand.ModuleName
        }
    }
    elseif ($Ensure -eq 'Absent' -and $currentGroup.Ensure -eq 'Present')
    {
        try
        {
            Remove-AzureADMSGroup -Id $currentGroup.ID
        }
        catch
        {
            New-M365DSCLogEntry -Error $_ -Message "Couldn't delete group $DisplayName" -Source $MyInvocation.MyCommand.ModuleName
        }
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
        $Id,

        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [System.String[]]
        $GroupTypes,

        [Parameter()]
        [System.String]
        $MembershipRule,

        [Parameter()]
        [System.String[]]
        $Members,

        [Parameter()]
        [System.String[]]
        $Owners,

        [Parameter()]
        [ValidateSet('On', 'Paused')]
        [System.String]
        $MembershipRuleProcessingState,

        [Parameter()]
        [System.Boolean]
        $SecurityEnabled,

        [Parameter()]
        [System.Boolean]
        $MailEnabled,

        [Parameter()]
        [System.Boolean]
        $IsAssignableToRole,

        [Parameter()]
        [System.String]
        $MailNickname,

        [Parameter()]
        [ValidateSet('Public', 'Private', 'HiddenMembership')]
        [System.String]
        $Visibility,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present',

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $GlobalAdminAccount,

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
    $ResourceName = $MyInvocation.MyCommand.ModuleName.Replace("MSFT_", "")
    $data = [System.Collections.Generic.Dictionary[[String], [String]]]::new()
    $data.Add("Resource", $ResourceName)
    $data.Add("Method", $MyInvocation.MyCommand)
    $data.Add("Principal", $GlobalAdminAccount.UserName)
    $data.Add("TenantId", $TenantId)
    Add-M365DSCTelemetryEvent -Data $data
    #endregion

    Write-Verbose -Message "Testing configuration of AzureAD Groups"

    $CurrentValues = Get-TargetResource @PSBoundParameters

    Write-Verbose -Message "Target Values: $(Convert-M365DscHashtableToString -Hashtable $PSBoundParameters)"

    $ValuesToCheck = $PSBoundParameters
    $ValuesToCheck.Remove('GlobalAdminAccount') | Out-Null
    $ValuesToCheck.Remove('Id') | Out-Null

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
        [Parameter()]
        [System.Management.Automation.PSCredential]
        $GlobalAdminAccount,

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
    $ResourceName = $MyInvocation.MyCommand.ModuleName.Replace("MSFT_", "")
    $data = [System.Collections.Generic.Dictionary[[String], [String]]]::new()
    $data.Add("Resource", $ResourceName)
    $data.Add("Method", $MyInvocation.MyCommand)
    $data.Add("Principal", $GlobalAdminAccount.UserName)
    $data.Add("TenantId", $TenantId)
    Add-M365DSCTelemetryEvent -Data $data
    #endregion

    $ConnectionMode = New-M365DSCConnection -Platform 'AzureAD' -InboundParameters $PSBoundParameters
    try
    {
        [array] $groups = Get-AzureADMSGroup -All:$true -ErrorAction Stop
        $i = 1
        $dscContent = ''
        Write-Host "`r`n" -NoNewline
        foreach ($group in $groups)
        {
            Write-Host "    |---[$i/$($groups.Count)] $($group.DisplayName)" -NoNewline
            $Params = @{
                GlobalAdminAccount    = $GlobalAdminAccount
                DisplayName           = $group.DisplayName
                Id                    = $group.Id
                ApplicationId         = $ApplicationId
                TenantId              = $TenantId
                CertificateThumbprint = $CertificateThumbprint
            }
            $Results = Get-TargetResource @Params
            $Results = Update-M365DSCExportAuthenticationResults -ConnectionMode $ConnectionMode `
                -Results $Results
            $dscContent += Get-M365DSCExportContentForResource -ResourceName $ResourceName `
                -ConnectionMode $ConnectionMode `
                -ModulePath $PSScriptRoot `
                -Results $Results `
                -GlobalAdminAccount $GlobalAdminAccount
            Write-Host $Global:M365DSCEmojiGreenCheckMark
            $i++
        }
        return $dscContent
    }
    catch
    {
        try
        {
            Write-Verbose -Message $_
            $tenantIdValue = ""
            if (-not [System.String]::IsNullOrEmpty($TenantId))
            {
                $tenantIdValue = $TenantId
            }
            elseif ($null -ne $GlobalAdminAccount)
            {
                $tenantIdValue = $GlobalAdminAccount.UserName.Split('@')[1]
            }
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
