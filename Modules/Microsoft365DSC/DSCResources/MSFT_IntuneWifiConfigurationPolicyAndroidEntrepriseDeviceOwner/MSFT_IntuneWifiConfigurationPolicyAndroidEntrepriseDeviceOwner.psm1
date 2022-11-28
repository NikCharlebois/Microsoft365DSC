function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        #region resource generator code
        [Parameter()]
        [System.String]
        $Id,

        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $DeviceManagementApplicabilityRuleDeviceMode,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $DeviceManagementApplicabilityRuleOsEdition,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $DeviceManagementApplicabilityRuleOsVersion,

        [Parameter()]
        [System.String]
        $DisplayName,

        [Parameter()]
        [System.String[]]
        $RoleScopeTagIds,

        [Parameter()]
        [System.Boolean]
        $SupportsScopeTags,

        [Parameter()]
        [System.Boolean]
        $ConnectAutomatically,

        [Parameter()]
        [System.Boolean]
        $ConnectWhenNetworkNameIsHidden,

        [Parameter()]
        [System.String]
        $NetworkName,

        [Parameter()]
        [System.String]
        $Ssid,

        [Parameter()]
        [ValidateSet('open','wpaEnterprise','wpa2Enterprise')]
        [System.String]
        $WiFiSecurityType,

        [Parameter()]
        [ValidateSet('certificate','usernameAndPassword','derivedCredential')]
        [System.String]
        $AuthenticationMethod,

        [Parameter()]
        [ValidateSet('eapTls','eapTtls','peap')]
        [System.String]
        $EapType,

        [Parameter()]
        [ValidateSet('unencryptedPassword','challengeHandshakeAuthenticationProtocol','microsoftChap','microsoftChapVersionTwo')]
        [System.String]
        $InnerAuthenticationProtocolForEapTtls,

        [Parameter()]
        [ValidateSet('none','microsoftChapVersionTwo')]
        [System.String]
        $InnerAuthenticationProtocolForPeap,

        [Parameter()]
        [System.String]
        $OuterIdentityPrivacyTemporaryValue,

        [Parameter()]
        [System.String]
        $ProxyAutomaticConfigurationUrl,

        [Parameter()]
        [ValidateSet('none','manual','automatic')]
        [System.String]
        $ProxySettings,

        [Parameter()]
        [System.String[]]
        $TrustedServerCertificateNames,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $DeviceSettingStateSummaries,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $DeviceStatuses,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $GroupAssignments,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $UserStatuses,


        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $Assignments,

        #endregion 

        [Parameter(Mandatory = $true)]
        [System.String]
        [ValidateSet('Absent', 'Present')]
        $Ensure = $true,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $Credential,

        [Parameter()]
        [System.String]
        $ApplicationId,

        [Parameter()]
        [System.String]
        $TenantId,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $ApplicationSecret,

        [Parameter()]
        [System.String]
        $CertificateThumbprint,

        [Parameter()]
        [Switch]
        $ManagedIdentity
    )

    try
    {
        $ConnectionMode = New-M365DSCConnection -Workload 'MicrosoftGraph' `
            -InboundParameters $PSBoundParameters `
            -ProfileName 'beta'

        Select-MgProfile 'beta'
    }
    catch
    {
        Write-Verbose -Message ($_)
    }

    #Ensure the proper dependencies are installed in the current environment.
    Confirm-M365DSCDependencies

    #region Telemetry
    $ResourceName = $MyInvocation.MyCommand.ModuleName.Replace('MSFT_', '')
    $CommandName = $MyInvocation.MyCommand
    $data = Format-M365DSCTelemetryParameters -ResourceName $ResourceName `
        -CommandName $CommandName `
        -Parameters $PSBoundParameters
    Add-M365DSCTelemetryEvent -Data $data
    #endregion

    $nullResult = $PSBoundParameters
    $nullResult.Ensure = 'Absent'
    try
    {
        $getValue = $null
        
        #region resource generator code
        $getValue = $null
        if ($id)
        {
            Write-Verbose -Message "Getting instance by {DeviceConfigurationId} = {$id}"
            $getValue = Get-MgDeviceManagementDeviceConfiguration -DeviceConfigurationId $id -ErrorAction SilentlyContinue
        }
        if ($null -eq $getValue)
        {
            if ($id)
            {
                Write-Verbose -Message "Nothing with id {$id} was found"
            }
            Write-Verbose -Message "Getting instance by {DisplayName} = {$DisplayName}"
            $getValue = Get-MgDeviceManagementDeviceConfiguration -Filter "DisplayName eq '$DisplayName'" -ErrorAction SilentlyContinue
            if ($null -ne $getValue)
            {
                Write-Verbose -Message "Found instance with DisplayName = {$DisplayName}"
            }
        }
        else
        {
            Write-Verbose -Message "Found instance with id = {$id}"
        }
        #endregion
        
        if ($null -eq $getValue)
        {
            Write-Verbose -Message "No instances were found with either id or DisplayName"
            return $nullResult
        }

        $results = @{
            #region resource generator code
            Id = $getValue.Id
            Description = $getValue.Description
            DisplayName = $getValue.DisplayName
            RoleScopeTagIds = $getValue.RoleScopeTagIds
            SupportsScopeTags = $getValue.AdditionalProperties.supportsScopeTags
            ConnectAutomatically = $getValue.AdditionalProperties.connectAutomatically
            ConnectWhenNetworkNameIsHidden = $getValue.AdditionalProperties.connectWhenNetworkNameIsHidden
            NetworkName = $getValue.AdditionalProperties.networkName
            Ssid = $getValue.AdditionalProperties.ssid
            WiFiSecurityType = $getValue.AdditionalProperties.wiFiSecurityType
            AuthenticationMethod = $getValue.AdditionalProperties.authenticationMethod
            EapType = $getValue.AdditionalProperties.eapType
            InnerAuthenticationProtocolForEapTtls = $getValue.AdditionalProperties.innerAuthenticationProtocolForEapTtls
            InnerAuthenticationProtocolForPeap = $getValue.AdditionalProperties.innerAuthenticationProtocolForPeap
            OuterIdentityPrivacyTemporaryValue = $getValue.AdditionalProperties.outerIdentityPrivacyTemporaryValue
            ProxyAutomaticConfigurationUrl = $getValue.AdditionalProperties.proxyAutomaticConfigurationUrl
            ProxySettings = $getValue.AdditionalProperties.proxySettings
            TrustedServerCertificateNames = $getValue.AdditionalProperties.trustedServerCertificateNames

            
            Ensure                = 'Present'
            Credential            = $Credential
            ApplicationId         = $ApplicationId
            TenantId              = $TenantId
            ApplicationSecret     = $ApplicationSecret
            CertificateThumbprint = $CertificateThumbprint
            Managedidentity       = $ManagedIdentity.IsPresent
        }
        if ($getValue.DeviceManagementApplicabilityRuleDeviceMode)
        {
            $results.Add("DeviceManagementApplicabilityRuleDeviceMode", (Get-M365DSCDRGComplexTypeToHashtable -ComplexObject $getValue.DeviceManagementApplicabilityRuleDeviceMode))
        }
        if ($getValue.DeviceManagementApplicabilityRuleOsEdition)
        {
            $results.Add("DeviceManagementApplicabilityRuleOsEdition", (Get-M365DSCDRGComplexTypeToHashtable -ComplexObject $getValue.DeviceManagementApplicabilityRuleOsEdition))
        }
        if ($getValue.DeviceManagementApplicabilityRuleOsVersion)
        {
            $results.Add("DeviceManagementApplicabilityRuleOsVersion", (Get-M365DSCDRGComplexTypeToHashtable -ComplexObject $getValue.DeviceManagementApplicabilityRuleOsVersion))
        }
        if ($getValue.additionalProperties.deviceSettingStateSummaries)
        {
            $results.Add("DeviceSettingStateSummaries", $getValue.additionalProperties.deviceSettingStateSummaries)
        }
        if ($getValue.additionalProperties.deviceStatuses)
        {
            $results.Add("DeviceStatuses", $getValue.additionalProperties.deviceStatuses)
        }
        if ($getValue.additionalProperties.groupAssignments)
        {
            $results.Add("GroupAssignments", $getValue.additionalProperties.groupAssignments)
        }
        if ($getValue.additionalProperties.userStatuses)
        {
            $results.Add("UserStatuses", $getValue.additionalProperties.userStatuses)
        }

        $assignmentsValues = Get-MgDeviceManagementDeviceConfigurationAssignment -DeviceConfigurationId $getValue.Id
        $assignmentResult = @()
        foreach ($assignmentEntry in $AssignmentsValues)
        {
            $groupName = $null
            $groupIdValue = $assignmentEntry.Id.Split('_')[1]
            if ($groupIdValue -eq 'acacacac-9df4-4c7d-9d50-4ef0226f57a9')
            {
                $groupName = 'AllUsers'
            }
            elseif ($groupIdValue -eq 'adadadad-808e-44e2-905a-0b7873a8a531')
            {
                $groupName = 'AllDevices'
            }
            else
            {
                $groupInstance = Get-MgGroup -GroupId $groupIdValue
                if ($groupInstance)
                {
                    $groupName = $groupInstance.DisplayName
                }
            }
            $assignmentValue = @{
                dataType                                   = $assignmentEntry.Target.AdditionalProperties.'@odata.type'
                groupId                                    = $assignmentEntry.Target.AdditionalProperties.groupId
            }
            if ($assignmentEntry.Target.DeviceAndAppManagementAssignmentFilterType)
            {
                $assignmentValue.Add('deviceAndAppManagementAssignmentFilterType', $assignmentEntry.Target.DeviceAndAppManagementAssignmentFilterType.ToString())
            }
            if ($assignmentEntry.Target.DeviceAndAppManagementAssignmentFilterId)
            {
                $assignmentValue.Add('deviceAndAppManagementAssignmentFilterId', $assignmentEntry.Target.DeviceAndAppManagementAssignmentFilterId)
            }
            if ($groupName)
            {
                $assignmentValue.Add('GroupName', $groupName)
            }
            $assignmentResult += $assignmentValue
        }
        $results.Add('Assignments', $assignmentResult)

        return [System.Collections.Hashtable] $results
    }
    catch
    {
        try
        {
            Write-Verbose -Message $_
            $tenantIdValue = ''
            if (-not [System.String]::IsNullOrEmpty($TenantId))
            {
                $tenantIdValue = $TenantId
            }
            elseif ($null -ne $Credential)
            {
                $tenantIdValue = $Credential.UserName.Split('@')[1]
            }
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
        
        #region resource generator code
        [Parameter()]
        [System.String]
        $Id,

        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $DeviceManagementApplicabilityRuleDeviceMode,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $DeviceManagementApplicabilityRuleOsEdition,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $DeviceManagementApplicabilityRuleOsVersion,

        [Parameter()]
        [System.String]
        $DisplayName,

        [Parameter()]
        [System.String[]]
        $RoleScopeTagIds,

        [Parameter()]
        [System.Boolean]
        $SupportsScopeTags,

        [Parameter()]
        [System.Boolean]
        $ConnectAutomatically,

        [Parameter()]
        [System.Boolean]
        $ConnectWhenNetworkNameIsHidden,

        [Parameter()]
        [System.String]
        $NetworkName,

        [Parameter()]
        [System.String]
        $Ssid,

        [Parameter()]
        [ValidateSet('open','wpaEnterprise','wpa2Enterprise')]
        [System.String]
        $WiFiSecurityType,

        [Parameter()]
        [ValidateSet('certificate','usernameAndPassword','derivedCredential')]
        [System.String]
        $AuthenticationMethod,

        [Parameter()]
        [ValidateSet('eapTls','eapTtls','peap')]
        [System.String]
        $EapType,

        [Parameter()]
        [ValidateSet('unencryptedPassword','challengeHandshakeAuthenticationProtocol','microsoftChap','microsoftChapVersionTwo')]
        [System.String]
        $InnerAuthenticationProtocolForEapTtls,

        [Parameter()]
        [ValidateSet('none','microsoftChapVersionTwo')]
        [System.String]
        $InnerAuthenticationProtocolForPeap,

        [Parameter()]
        [System.String]
        $OuterIdentityPrivacyTemporaryValue,

        [Parameter()]
        [System.String]
        $ProxyAutomaticConfigurationUrl,

        [Parameter()]
        [ValidateSet('none','manual','automatic')]
        [System.String]
        $ProxySettings,

        [Parameter()]
        [System.String[]]
        $TrustedServerCertificateNames,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $DeviceSettingStateSummaries,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $DeviceStatuses,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $GroupAssignments,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $UserStatuses,


        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $Assignments,

        #endregion 

        [Parameter(Mandatory = $true)]
        [System.String]
        [ValidateSet('Absent', 'Present')]
        $Ensure = $true,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $Credential,

        [Parameter()]
        [System.String]
        $ApplicationId,

        [Parameter()]
        [System.String]
        $TenantId,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $ApplicationSecret,

        [Parameter()]
        [System.String]
        $CertificateThumbprint,

        [Parameter()]
        [Switch]
        $ManagedIdentity
    )

    try
    {
        $ConnectionMode = New-M365DSCConnection -Workload 'MicrosoftGraph' `
            -InboundParameters $PSBoundParameters `
            -ProfileName 'beta'

        Select-MgProfile 'beta' -ErrorAction Stop
    }
    catch
    {
        Write-Verbose -Message $_
    }

    #Ensure the proper dependencies are installed in the current environment.
    Confirm-M365DSCDependencies

    #region Telemetry
    $ResourceName = $MyInvocation.MyCommand.ModuleName.Replace('MSFT_', '')
    $CommandName = $MyInvocation.MyCommand
    $data = Format-M365DSCTelemetryParameters -ResourceName $ResourceName `
        -CommandName $CommandName `
        -Parameters $PSBoundParameters
    Add-M365DSCTelemetryEvent -Data $data
    #endregion

    $currentInstance = Get-TargetResource @PSBoundParameters

    $PSBoundParameters.Remove('Ensure') | Out-Null
    $PSBoundParameters.Remove('Credential') | Out-Null
    $PSBoundParameters.Remove('ApplicationId') | Out-Null
    $PSBoundParameters.Remove('ApplicationSecret') | Out-Null
    $PSBoundParameters.Remove('TenantId') | Out-Null
    $PSBoundParameters.Remove('CertificateThumbprint') | Out-Null
    $PSBoundParameters.Remove('ManagedIdentity') | Out-Null

    if ($Ensure -eq 'Present' -and $currentInstance.Ensure -eq 'Absent')
    {
        Write-Verbose -Message "Creating {$DisplayName}"
        $PSBoundParameters.Remove("Assignments") | Out-Null

        $CreateParameters = ([Hashtable]$PSBoundParameters).clone()
        $CreateParameters = Rename-M365DSCCimInstanceODataParameter -Properties $CreateParameters

        <#$AdditionalProperties = Get-M365DSCAdditionalProperties -Properties ($CreateParameters)
        foreach ($key in $AdditionalProperties.keys)
        {
            if ($key -ne '@odata.type')
            {
                $keyName = $key.substring(0, 1).ToUpper() + $key.substring(1, $key.length - 1)
                $CreateParameters.remove($keyName)
            }
        }#>

        $CreateParameters.Remove('Id') | Out-Null
        $CreateParameters.Remove('Verbose') | Out-Null

        <#foreach ($key in ($CreateParameters.clone()).Keys)
        {
            if ($CreateParameters[$key].getType().Fullname -like '*CimInstance*')
            {
                $CreateParameters[$key] = Convert-M365DSCDRGComplexTypeToHashtable -ComplexObject $CreateParameters[$key]
            }
        }#>

        $keys=(([Hashtable]$CreateParameters).clone()).Keys
        foreach($key in $keys)
        {
            $keyName=$key.substring(0,1).toLower()+$key.substring(1,$key.length-1)
            $keyValue= $CreateParameters.$key
            if($null -ne $CreateParameters.$key -and $CreateParameters.$key.getType().Name -like "*cimInstance*")
            {
                $keyValue= Convert-M365DSCDRGComplexTypeToHashtable -ComplexObject $CreateParameters.$key
            }
            $CreateParameters.remove($key)
            $CreateParameters.add($keyName,$keyValue)
        }
        $CreateParameters.add('@odata.type','#microsoft.graph.androidWorkProfileEnterpriseWiFiConfiguration')

        <#if ($AdditionalProperties)
        {
            $CreateParameters.add('AdditionalProperties', $AdditionalProperties)
        }#>
        
        #region resource generator code
        $currentInstance = New-MgDeviceManagementDeviceConfiguration -BodyParameter $CreateParameters
        $assignmentsHash = @()
        foreach($assignment in $Assignments)
        {
            $currentHash = Get-M365DSCDRGComplexTypeToHashtable -ComplexObject $assignment
            if ($currentHash.groupId)
            {
                $groupInstance = Get-MgGroup -GroupId $currentHash.groupId -ErrorAction 'SilentlyContinue'
                if (-not $groupInstance -and $currentHash.groupName)
                {
                    $groupInstance = Get-MgGroup -Filter "DisplayName eq '$($currentHash.groupName)'"
                    if ($groupInstance) 
                    {
                        $currentHash.groupId = $groupInstance.Id
                        $currentHash.Remove('GroupName') | Out-Null
                    }
                }
            }
            $assignmentsHash += $currentHash
        }

        if($currentInstance.id)
        {
            Write-Verbose -Message "Updating Assignments with:`r`n$($assignmentsHash | Out-String)"
            $retries = 10
            $entryUpdated = $false
            do
            {
                try
                {
                    Update-DeviceConfigurationPolicyAssignment -DeviceConfigurationPolicyId $currentInstance.id `
                        -Targets $assignmentsHash `
                        -Repository deviceConfigurations `
                        -ErrorAction Stop
                    $entryUpdated = $true
                }
                catch
                {
                    Write-Verbose -Message "Failed updating the assignments for {$($currentInstance.id)}. Retrying in 5 second."
                    $retries--
                    Start-Sleep 5
                }
            } while ($retries -gt 0 -and -not $entryUpdated)
            if ($entryUpdated)
            {
                Write-Verbose -Message "Assignments for {$($currentInstance.id)} were successfully updated."
            }
        }

        #endregion
        
    }
    elseif ($Ensure -eq 'Present' -and $currentInstance.Ensure -eq 'Present')
    {
        Write-Verbose -Message "Updating {$DisplayName}"
        $PSBoundParameters.Remove("Assignments") | Out-Null

        $UpdateParameters = ([Hashtable]$PSBoundParameters).clone()
        $UpdateParameters = Rename-M365DSCCimInstanceODataParameter -Properties $UpdateParameters

        <#$AdditionalProperties = Get-M365DSCAdditionalProperties -Properties ($UpdateParameters)
        foreach ($key in $AdditionalProperties.keys)
        {
            if ($key -ne '@odata.type')
            {
                $keyName = $key.substring(0, 1).ToUpper() + $key.substring(1, $key.length - 1)
                $UpdateParameters.remove($keyName)
            }
        }#>

        $UpdateParameters.Remove('Id') | Out-Null
        $UpdateParameters.Remove('Verbose') | Out-Null

        <#foreach ($key in ($UpdateParameters.clone()).Keys)
        {
            if ($UpdateParameters[$key].getType().Fullname -like '*CimInstance*')
            {
                $UpdateParameters[$key] = Convert-M365DSCDRGComplexTypeToHashtable -ComplexObject $UpdateParameters[$key]
            }
        }#>

        $keys=(([Hashtable]$UpdateParameters).clone()).Keys
        foreach($key in $keys)
        {
            $keyName=$key.substring(0,1).toLower()+$key.substring(1,$key.length-1)
            $keyValue= $UpdateParameters.$key
            if($null -ne $UpdateParameters.$key -and $UpdateParameters.$key.getType().Name -like "*cimInstance*")
            {
                $keyValue= Convert-M365DSCDRGComplexTypeToHashtable -ComplexObject $UpdateParameters.$key
            }
            $UpdateParameters.remove($key)
            $UpdateParameters.add($keyName,$keyValue)
        }
        $UpdateParameters.add('@odata.type','#microsoft.graph.androidWorkProfileEnterpriseWiFiConfiguration')

        <#if ($AdditionalProperties)
        {
            $UpdateParameters.add('AdditionalProperties', $AdditionalProperties)
        }#>
        [Array]$keys = $UpdateParameters.Keys.ToLower()
        if ($keys.Contains('priority'))
        {
            Write-Verbose -Message "Update parameters contain 'Priority'"
            $PriorityValue = $UpdateParameters.priority
            $UpdateParameters.Remove('priority') | Out-Null
        }

        
        #region resource generator code
        Write-Verbose -Message "Updating {$($currentInstance.Id)} with`r`n$($UpdateParameters | Out-String)"
        Update-MgDeviceManagementDeviceConfiguration -BodyParameter $UpdateParameters `
            -DeviceConfigurationId $currentInstance.Id
        $assignmentsHash = @()
        foreach($assignment in $Assignments)
        {
            $currentHash = Get-M365DSCDRGComplexTypeToHashtable -ComplexObject $assignment
            if ($currentHash.groupId)
            {
                $groupInstance = Get-MgGroup -GroupId $currentHash.groupId -ErrorAction 'SilentlyContinue'
                if (-not $groupInstance -and $currentHash.groupName)
                {
                    $groupInstance = Get-MgGroup -Filter "DisplayName eq '$($currentHash.groupName)'"
                    if ($groupInstance) 
                    {
                        $currentHash.groupId = $groupInstance.Id
                        $currentHash.Remove('GroupName') | Out-Null
                    }
                }
            }
            $assignmentsHash += $currentHash
        }

        if($currentInstance.id)
        {
            Write-Verbose -Message "Updating Assignments with:`r`n$($assignmentsHash | Out-String)"
            $retries = 10
            $entryUpdated = $false
            do
            {
                try
                {
                    Update-DeviceConfigurationPolicyAssignment -DeviceConfigurationPolicyId $currentInstance.id `
                        -Targets $assignmentsHash `
                        -Repository deviceConfigurations `
                        -ErrorAction Stop
                    $entryUpdated = $true
                }
                catch
                {
                    Write-Verbose -Message "Failed updating the assignments for {$($currentInstance.id)}. Retrying in 5 second."
                    $retries--
                    Start-Sleep 5
                }
            } while ($retries -gt 0 -and -not $entryUpdated)
            if ($entryUpdated)
            {
                Write-Verbose -Message "Assignments for {$($currentInstance.id)} were successfully updated."
            }
        }

        #endregion
        
        #Set-MgDeviceManagementDeviceConfigurationPriority -DeviceConfigurationId $currentInstance.Id `
            #-Priority $PriorityValue

    }
    elseif ($Ensure -eq 'Absent' -and $currentInstance.Ensure -eq 'Present')
    {
        Write-Verbose -Message "Removing {$DisplayName}"

        
        #region resource generator code
        #endregion
        

        
        #region resource generator code
        Remove-MgDeviceManagementDeviceConfiguration -DeviceConfigurationId $currentInstance.Id
        #endregion
        
    }
}

function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        
        #region resource generator code
        [Parameter()]
        [System.String]
        $Id,

        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $DeviceManagementApplicabilityRuleDeviceMode,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $DeviceManagementApplicabilityRuleOsEdition,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $DeviceManagementApplicabilityRuleOsVersion,

        [Parameter()]
        [System.String]
        $DisplayName,

        [Parameter()]
        [System.String[]]
        $RoleScopeTagIds,

        [Parameter()]
        [System.Boolean]
        $SupportsScopeTags,

        [Parameter()]
        [System.Boolean]
        $ConnectAutomatically,

        [Parameter()]
        [System.Boolean]
        $ConnectWhenNetworkNameIsHidden,

        [Parameter()]
        [System.String]
        $NetworkName,

        [Parameter()]
        [System.String]
        $Ssid,

        [Parameter()]
        [ValidateSet('open','wpaEnterprise','wpa2Enterprise')]
        [System.String]
        $WiFiSecurityType,

        [Parameter()]
        [ValidateSet('certificate','usernameAndPassword','derivedCredential')]
        [System.String]
        $AuthenticationMethod,

        [Parameter()]
        [ValidateSet('eapTls','eapTtls','peap')]
        [System.String]
        $EapType,

        [Parameter()]
        [ValidateSet('unencryptedPassword','challengeHandshakeAuthenticationProtocol','microsoftChap','microsoftChapVersionTwo')]
        [System.String]
        $InnerAuthenticationProtocolForEapTtls,

        [Parameter()]
        [ValidateSet('none','microsoftChapVersionTwo')]
        [System.String]
        $InnerAuthenticationProtocolForPeap,

        [Parameter()]
        [System.String]
        $OuterIdentityPrivacyTemporaryValue,

        [Parameter()]
        [System.String]
        $ProxyAutomaticConfigurationUrl,

        [Parameter()]
        [ValidateSet('none','manual','automatic')]
        [System.String]
        $ProxySettings,

        [Parameter()]
        [System.String[]]
        $TrustedServerCertificateNames,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $DeviceSettingStateSummaries,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $DeviceStatuses,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $GroupAssignments,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $UserStatuses,


        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $Assignments,

        #endregion 

        [Parameter(Mandatory = $true)]
        [System.String]
        [ValidateSet('Absent', 'Present')]
        $Ensure = $true,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $Credential,

        [Parameter()]
        [System.String]
        $ApplicationId,

        [Parameter()]
        [System.String]
        $TenantId,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $ApplicationSecret,

        [Parameter()]
        [System.String]
        $CertificateThumbprint,

        [Parameter()]
        [Switch]
        $ManagedIdentity
    )

    #Ensure the proper dependencies are installed in the current environment.
    Confirm-M365DSCDependencies

    #region Telemetry
    $ResourceName = $MyInvocation.MyCommand.ModuleName.Replace('MSFT_', '')
    $CommandName = $MyInvocation.MyCommand
    $data = Format-M365DSCTelemetryParameters -ResourceName $ResourceName `
        -CommandName $CommandName `
        -Parameters $PSBoundParameters
    Add-M365DSCTelemetryEvent -Data $data
    #endregion

    if ($id)
    {
        Write-Verbose -Message "Testing configuration of {$id}"
    }
    elseif ($DisplayName)
    {
        Write-Verbose -Message "Testing configuration of {$DisplayName}"
    }

    $CurrentValues = Get-TargetResource @PSBoundParameters
    $ValuesToCheck = ([Hashtable]$PSBoundParameters).clone()

    if ($CurrentValues.Ensure -eq "Absent")
    {
        Write-Verbose -Message "Test-TargetResource returned $false"
        return $false
    }
    $testResult = $true

    #Compare Cim instances
    foreach ($key in $PSBoundParameters.Keys)
    {
        $source = $PSBoundParameters.$key
        $target = $CurrentValues.$key
        if ($source.getType().Name -like "*CimInstance*")
        {
            $source = Get-M365DSCDRGComplexTypeToHashtable -ComplexObject $source

            $testResult = Compare-M365DSCComplexObject `
                -Source ($source) `
                -Target ($target)

            if (-Not $testResult)
            {
                $testResult = $false
                break;
            }

            $ValuesToCheck.Remove($key) | Out-Null
        }
    }

    Write-Verbose -Message "Current Values: $(Convert-M365DscHashtableToString -Hashtable $CurrentValues)"
    Write-Verbose -Message "Target Values: $(Convert-M365DscHashtableToString -Hashtable $ValuesToCheck)"

    #Convert any DateTime to String
    foreach ($key in $ValuesToCheck.Keys)
    {
        if (($null -ne $CurrentValues[$key]) `
                -and ($CurrentValues[$key].getType().Name -eq 'DateTime'))
        {
            $CurrentValues[$key] = $CurrentValues[$key].toString()
        }
    }

    # Do not compare Ids since these could be different across tenants when cloning configurations.
    if ($ValuesToCheck.Contains("Id"))
    {
        $ValuesToCheck.Remove("Id") | Out-Null
    }

    if ($testResult)
    {
        $testResult = Test-M365DSCParameterState -CurrentValues $CurrentValues `
            -Source $($MyInvocation.MyCommand.Source) `
            -DesiredValues $PSBoundParameters `
            -ValuesToCheck $ValuesToCheck.Keys
    }

    Write-Verbose -Message "Test-TargetResource returned $testResult"

    return $testResult
}

function Export-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.String])]
    param
    (
        [Parameter()]
        [System.Management.Automation.PSCredential]
        $Credential,

        [Parameter()]
        [System.String]
        $ApplicationId,

        [Parameter()]
        [System.String]
        $TenantId,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $ApplicationSecret,

        [Parameter()]
        [System.String]
        $CertificateThumbprint,

        [Parameter()]
        [Switch]
        $ManagedIdentity
    )

    $ConnectionMode = New-M365DSCConnection -Workload 'MicrosoftGraph' `
        -InboundParameters $PSBoundParameters `
        -ProfileName 'beta'
    Select-MgProfile 'beta' -ErrorAction Stop

    #Ensure the proper dependencies are installed in the current environment.
    Confirm-M365DSCDependencies

    #region Telemetry
    $ResourceName = $MyInvocation.MyCommand.ModuleName.Replace('MSFT_', '')
    $CommandName = $MyInvocation.MyCommand
    $data = Format-M365DSCTelemetryParameters -ResourceName $ResourceName `
        -CommandName $CommandName `
        -Parameters $PSBoundParameters
    Add-M365DSCTelemetryEvent -Data $data
    #endregion

    try
    {
        #region resource generator code
        [array]$getValue = Get-MgDeviceManagementDeviceConfiguration `
            -ErrorAction Stop | Where-Object `
            -FilterScript { `
                $_.AdditionalProperties.'@odata.type' -eq '#microsoft.graph.androidWorkProfileEnterpriseWiFiConfiguration'  `
            }
        if (-not $getValue)
        {
            [array]$getValue = Get-MgDeviceManagementDeviceConfiguration 
                -ErrorAction Stop
        }
        #endregion

        $i = 1
        $dscContent = ''
        if ($getValue.Length -eq 0)
        {
            Write-Host $Global:M365DSCEmojiGreenCheckMark
        }
        else
        {
            Write-Host "`r`n" -NoNewline
        }
        foreach ($config in $getValue)
        {
            $displayedKey=$config.id
            if(-not [String]::IsNullOrEmpty($config.displayName))
            {
                $displayedKey=$config.displayName
            }
            Write-Host "    |---[$i/$($getValue.Count)] $displayedKey" -NoNewline
            $params = @{
                id                    = $config.id
                Ensure                = 'Present'
                Credential            = $Credential
                ApplicationId         = $ApplicationId
                TenantId              = $TenantId
                ApplicationSecret     = $ApplicationSecret
                CertificateThumbprint = $CertificateThumbprint
                Managedidentity       = $ManagedIdentity.IsPresent
            }

            $Results = Get-TargetResource @Params
            $Results = Update-M365DSCExportAuthenticationResults -ConnectionMode $ConnectionMode `
                -Results $Results

            if ($Results.DeviceManagementApplicabilityRuleDeviceMode)
            {
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString -ComplexObject $Results.DeviceManagementApplicabilityRuleDeviceMode -CIMInstanceName IntuneWifiConfigurationPolicyAndroidEntrepriseDeviceOwnerdevicemanagementapplicabilityruledevicemode
                if ($complexTypeStringResult)
                {
                    $Results.DeviceManagementApplicabilityRuleDeviceMode = $complexTypeStringResult
                }
                else
                {
                    $Results.Remove('DeviceManagementApplicabilityRuleDeviceMode') | Out-Null
                }
            }
            if ($Results.DeviceManagementApplicabilityRuleOsEdition)
            {
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString -ComplexObject $Results.DeviceManagementApplicabilityRuleOsEdition -CIMInstanceName IntuneWifiConfigurationPolicyAndroidEntrepriseDeviceOwnerdevicemanagementapplicabilityruleosedition
                if ($complexTypeStringResult)
                {
                    $Results.DeviceManagementApplicabilityRuleOsEdition = $complexTypeStringResult
                }
                else
                {
                    $Results.Remove('DeviceManagementApplicabilityRuleOsEdition') | Out-Null
                }
            }
            if ($Results.DeviceManagementApplicabilityRuleOsVersion)
            {
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString -ComplexObject $Results.DeviceManagementApplicabilityRuleOsVersion -CIMInstanceName IntuneWifiConfigurationPolicyAndroidEntrepriseDeviceOwnerdevicemanagementapplicabilityruleosversion
                if ($complexTypeStringResult)
                {
                    $Results.DeviceManagementApplicabilityRuleOsVersion = $complexTypeStringResult
                }
                else
                {
                    $Results.Remove('DeviceManagementApplicabilityRuleOsVersion') | Out-Null
                }
            }
            if ($Results.DeviceSettingStateSummaries)
            {
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString -ComplexObject $Results.DeviceSettingStateSummaries -CIMInstanceName IntuneWifiConfigurationPolicyAndroidEntrepriseDeviceOwnersettingstatedevicesummary
                if ($complexTypeStringResult)
                {
                    $Results.DeviceSettingStateSummaries = $complexTypeStringResult
                }
                else
                {
                    $Results.Remove('DeviceSettingStateSummaries') | Out-Null
                }
            }
            if ($Results.DeviceStatuses)
            {
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString -ComplexObject $Results.DeviceStatuses -CIMInstanceName IntuneWifiConfigurationPolicyAndroidEntrepriseDeviceOwnerdeviceconfigurationdevicestatus
                if ($complexTypeStringResult)
                {
                    $Results.DeviceStatuses = $complexTypeStringResult
                }
                else
                {
                    $Results.Remove('DeviceStatuses') | Out-Null
                }
            }
            if ($Results.GroupAssignments)
            {
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString -ComplexObject $Results.GroupAssignments -CIMInstanceName IntuneWifiConfigurationPolicyAndroidEntrepriseDeviceOwnerdeviceconfigurationgroupassignment
                if ($complexTypeStringResult)
                {
                    $Results.GroupAssignments = $complexTypeStringResult
                }
                else
                {
                    $Results.Remove('GroupAssignments') | Out-Null
                }
            }
            if ($Results.UserStatuses)
            {
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString -ComplexObject $Results.UserStatuses -CIMInstanceName IntuneWifiConfigurationPolicyAndroidEntrepriseDeviceOwnerdeviceconfigurationuserstatus
                if ($complexTypeStringResult)
                {
                    $Results.UserStatuses = $complexTypeStringResult
                }
                else
                {
                    $Results.Remove('UserStatuses') | Out-Null
                }
            }

            if($Results.Assignments)
            {
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString -ComplexObject $Results.Assignments -CIMInstanceName IntuneWifiConfigurationPolicyAndroidEntrepriseDeviceOwnerAssignments
                if ($complexTypeStringResult)
                {
                    $Results.Assignments = $complexTypeStringResult
                }
                else
                {
                    $Results.Remove('Assignments') | Out-Null
                }
            }

            $currentDSCBlock = Get-M365DSCExportContentForResource -ResourceName $ResourceName `
                -ConnectionMode $ConnectionMode `
                -ModulePath $PSScriptRoot `
                -Results $Results `
                -Credential $Credential

            if ($Results.DeviceManagementApplicabilityRuleDeviceMode)
            {
                $isCIMArray=$false
                if($Results.DeviceManagementApplicabilityRuleDeviceMode.getType().Fullname -like "*[[\]]")
                {
                    $isCIMArray=$true
                }
                $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "DeviceManagementApplicabilityRuleDeviceMode" -isCIMArray:$isCIMArray
            }
            if ($Results.DeviceManagementApplicabilityRuleOsEdition)
            {
                $isCIMArray=$false
                if($Results.DeviceManagementApplicabilityRuleOsEdition.getType().Fullname -like "*[[\]]")
                {
                    $isCIMArray=$true
                }
                $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "DeviceManagementApplicabilityRuleOsEdition" -isCIMArray:$isCIMArray
            }
            if ($Results.DeviceManagementApplicabilityRuleOsVersion)
            {
                $isCIMArray=$false
                if($Results.DeviceManagementApplicabilityRuleOsVersion.getType().Fullname -like "*[[\]]")
                {
                    $isCIMArray=$true
                }
                $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "DeviceManagementApplicabilityRuleOsVersion" -isCIMArray:$isCIMArray
            }
            if ($Results.DeviceSettingStateSummaries)
            {
                $isCIMArray=$false
                if($Results.DeviceSettingStateSummaries.getType().Fullname -like "*[[\]]")
                {
                    $isCIMArray=$true
                }
                $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "DeviceSettingStateSummaries" -isCIMArray:$isCIMArray
            }
            if ($Results.DeviceStatuses)
            {
                $isCIMArray=$false
                if($Results.DeviceStatuses.getType().Fullname -like "*[[\]]")
                {
                    $isCIMArray=$true
                }
                $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "DeviceStatuses" -isCIMArray:$isCIMArray
            }
            if ($Results.GroupAssignments)
            {
                $isCIMArray=$false
                if($Results.GroupAssignments.getType().Fullname -like "*[[\]]")
                {
                    $isCIMArray=$true
                }
                $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "GroupAssignments" -isCIMArray:$isCIMArray
            }
            if ($Results.UserStatuses)
            {
                $isCIMArray=$false
                if($Results.UserStatuses.getType().Fullname -like "*[[\]]")
                {
                    $isCIMArray=$true
                }
                $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "UserStatuses" -isCIMArray:$isCIMArray
            }

            if ($Results.Assignments)
            {
                $isCIMArray = $false
                if ($Results.Assignments.getType().Fullname -like "*[[\]]")
                {
                    $isCIMArray = $true
                }
                $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "Assignments" -isCIMArray:$isCIMArray
            }

            $dscContent += $currentDSCBlock
            Save-M365DSCPartialExport -Content $currentDSCBlock `
                -FileName $Global:PartialExportFileName
            $i++
            Write-Host $Global:M365DSCEmojiGreenCheckMark
        }
        return $dscContent
    }
    catch
    {
        Write-Host $Global:M365DSCEmojiGreenCheckMark
        try
        {
            Write-Verbose -Message $_
            $tenantIdValue = ''
            if (-not [System.String]::IsNullOrEmpty($TenantId))
            {
                $tenantIdValue = $TenantId
            }
            elseif ($null -ne $Credential)
            {
                $tenantIdValue = $Credential.UserName.Split('@')[1]
            }
            Add-M365DSCEvent -Message $_ -EntryType 'Error' `
                -EventID 1 -Source $($MyInvocation.MyCommand.Source) `
                -TenantId $tenantIdValue
        }
        catch
        {
            Write-Verbose -Message $_
        }
        return ''
    }
}

function Get-M365DSCAdditionalProperties
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param(
        [Parameter(Mandatory = 'true')]
        [System.Collections.Hashtable]
        $Properties
    )

    $additionalProperties = @(
                "SupportsScopeTags"
        "ConnectAutomatically"
        "ConnectWhenNetworkNameIsHidden"
        "NetworkName"
        "Ssid"
        "WiFiSecurityType"
        "AuthenticationMethod"
        "EapType"
        "InnerAuthenticationProtocolForEapTtls"
        "InnerAuthenticationProtocolForPeap"
        "OuterIdentityPrivacyTemporaryValue"
        "ProxyAutomaticConfigurationUrl"
        "ProxySettings"
        "TrustedServerCertificateNames"
        "DeviceSettingStateSummaries"
        "DeviceStatuses"
        "GroupAssignments"
        "UserStatuses"

    )
    $results = @{'@odata.type' = '#microsoft.graph.androidWorkProfileEnterpriseWiFiConfiguration' }
    $cloneProperties = $Properties.clone()
    foreach ($property in $cloneProperties.Keys)
    {
        if ($property -in ($additionalProperties) )
        {
            $propertyName = $property[0].ToString().ToLower() + $property.Substring(1, $property.Length - 1)
            if ($properties.$property -and $properties.$property.getType().FullName -like '*CIMInstance*')
            {
                if ($properties.$property.getType().FullName -like '*[[\]]')
                {
                    $array = @()
                    foreach ($item in $properties.$property)
                    {
                        $array += Convert-M365DSCDRGComplexTypeToHashtable -ComplexObject $item

                    }
                    $propertyValue = $array
                }
                else
                {
                    $propertyValue = Convert-M365DSCDRGComplexTypeToHashtable -ComplexObject $properties.$property
                }

            }
            else
            {
                $propertyValue = $properties.$property
            }


            $results.Add($propertyName, $propertyValue)

        }
    }
    if ($results.Count -eq 1)
    {
        return $null
    }
    return $results
}

function Update-DeviceConfigurationPolicyAssignment
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param (
        [Parameter(Mandatory = 'true')]
        [System.String]
        $DeviceConfigurationPolicyId,

        [Parameter()]
        [Array]
        $Targets,

        [Parameter()]
        [ValidateSet('deviceCompliancePolicies','intents','configurationPolicies','deviceConfigurations')]
        [System.String]
        $Repository='configurationPolicies',

        [Parameter()]
        [ValidateSet('v1.0','beta')]
        [System.String]
        $APIVersion='beta'
    )
    try
    {
        $deviceManagementPolicyAssignments=@()

        $Uri = "https://graph.microsoft.com/$APIVersion/deviceManagement/$Repository/$DeviceConfigurationPolicyId/assign"

        foreach ($target in $targets)
        {
            $formattedTarget = @{"@odata.type"=$target.dataType}
            if ($target.groupId)
            {
                $formattedTarget.Add('groupId',$target.groupId)
            }
            if ($target.collectionId)
            {
                $formattedTarget.Add('collectionId',$target.collectionId)
            }
            if ($target.deviceAndAppManagementAssignmentFilterType)
            {
                $formattedTarget.Add('deviceAndAppManagementAssignmentFilterType',$target.deviceAndAppManagementAssignmentFilterType)
            }
            if ($target.deviceAndAppManagementAssignmentFilterId)
            {
                $formattedTarget.Add('deviceAndAppManagementAssignmentFilterId',$target.deviceAndAppManagementAssignmentFilterId)
            }
            $deviceManagementPolicyAssignments += @{'target'= $formattedTarget}
        }
        $body = @{'assignments' = $deviceManagementPolicyAssignments}|ConvertTo-Json -Depth 20
        Invoke-MgGraphRequest -Method POST -Uri $Uri -Body $body -ErrorAction Stop
    }
    catch
    {
        try
        {
            $tenantIdValue = ""
            $tenantIdValue = $Credential.UserName.Split('@')[1]
            Add-M365DSCEvent -Message $_ -EntryType 'Error' `
                -EventID 1 -Source $($MyInvocation.MyCommand.Source) `
                -TenantId $tenantIdValue
        }
        catch
        {
            Write-Verbose -Message $_
        }
        throw 'There was an issue trying to update the assignments for {$DeviceConfigurationPolicyId}'
    }
}

Export-ModuleMember -Function *-TargetResource
