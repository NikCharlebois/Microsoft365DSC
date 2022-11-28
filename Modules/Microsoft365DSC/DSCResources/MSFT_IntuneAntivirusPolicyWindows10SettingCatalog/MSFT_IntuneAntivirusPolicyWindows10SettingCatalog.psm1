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
        $CreationSource,

        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [System.Boolean]
        $IsAssigned,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [ValidateSet('none','android','iOS','macOS','windows10X','windows10','linux','unknownFutureValue')]
        [System.String]
        $Platforms,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $PriorityMetaData,

        [Parameter()]
        [System.String[]]
        $RoleScopeTagIds,

        [Parameter()]
        [System.Int32]
        $SettingCount,

        [Parameter()]
        [ValidateSet('none','mdm','windows10XManagement','configManager','appleRemoteManagement','microsoftSense','exchangeOnline','linuxMdm','enrollment','endpointPrivilegeManagement','unknownFutureValue')]
        [System.String]
        $Technologies,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $TemplateReference,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $Settings,



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
            Write-Verbose -Message "Getting instance by {DeviceManagementConfigurationPolicyId} = {$id}"
            $getValue = Get-MgDeviceManagementConfigurationPolicy -DeviceManagementConfigurationPolicyId $id -ErrorAction SilentlyContinue
        }
        if ($null -eq $getValue)
        {
            if ($id)
            {
                Write-Verbose -Message "Nothing with id {$id} was found"
            }
            Write-Verbose -Message "Getting instance by {<SecondaryKey>} = {$<SecondaryKey>}"
            $getValue = Get-MgDeviceManagementConfigurationPolicy -Filter "<SecondaryKey> eq '$<SecondaryKey>'" -ErrorAction SilentlyContinue
            if ($null -ne $getValue)
            {
                Write-Verbose -Message "Found instance with <SecondaryKey> = {$<SecondaryKey>}"
            }
        }
        else
        {
            Write-Verbose -Message "Found instance with id = {$id}"
        }
        #endregion
        
        if ($null -eq $getValue)
        {
            Write-Verbose -Message "No instances were found with either id or <SecondaryKey>"
            return $nullResult
        }

        $results = @{
            #region resource generator code
            Id = $getValue.Id
            CreationSource = $getValue.CreationSource
            Description = $getValue.Description
            IsAssigned = $getValue.AdditionalProperties.isAssigned
            Name = $getValue.AdditionalProperties.name
            Platforms = $getValue.AdditionalProperties.platforms
            RoleScopeTagIds = $getValue.AdditionalProperties.roleScopeTagIds
            SettingCount = $getValue.AdditionalProperties.settingCount
            Technologies = $getValue.AdditionalProperties.technologies

            
            Ensure                = 'Present'
            Credential            = $Credential
            ApplicationId         = $ApplicationId
            TenantId              = $TenantId
            ApplicationSecret     = $ApplicationSecret
            CertificateThumbprint = $CertificateThumbprint
            Managedidentity       = $ManagedIdentity.IsPresent
        }
        if ($getValue.additionalProperties.priorityMetaData)
        {
            $results.Add("PriorityMetaData", $getValue.additionalProperties.priorityMetaData)
        }
        if ($getValue.additionalProperties.templateReference)
        {
            $results.Add("TemplateReference", $getValue.additionalProperties.templateReference)
        }
        if ($getValue.additionalProperties.settings)
        {
            $results.Add("Settings", $getValue.additionalProperties.settings)
        }


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
        $CreationSource,

        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [System.Boolean]
        $IsAssigned,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [ValidateSet('none','android','iOS','macOS','windows10X','windows10','linux','unknownFutureValue')]
        [System.String]
        $Platforms,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $PriorityMetaData,

        [Parameter()]
        [System.String[]]
        $RoleScopeTagIds,

        [Parameter()]
        [System.Int32]
        $SettingCount,

        [Parameter()]
        [ValidateSet('none','mdm','windows10XManagement','configManager','appleRemoteManagement','microsoftSense','exchangeOnline','linuxMdm','enrollment','endpointPrivilegeManagement','unknownFutureValue')]
        [System.String]
        $Technologies,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $TemplateReference,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $Settings,



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
        $CreateParameters.add('@odata.type','#microsoft.graph.deviceManagementConfigurationPolicy')

        <#if ($AdditionalProperties)
        {
            $CreateParameters.add('AdditionalProperties', $AdditionalProperties)
        }#>
        
        #region resource generator code
        $currentInstance = New-MgDeviceManagementConfigurationPolicy -BodyParameter $CreateParameters

        #endregion
        
    }
    elseif ($Ensure -eq 'Present' -and $currentInstance.Ensure -eq 'Present')
    {
        Write-Verbose -Message "Updating {$DisplayName}"

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
        $UpdateParameters.add('@odata.type','#microsoft.graph.deviceManagementConfigurationPolicy')

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
        Update-MgDeviceManagementConfigurationPolicy -BodyParameter $UpdateParameters `
            -DeviceManagementConfigurationPolicyId $currentInstance.Id

        #endregion
        
        #Set-MgDeviceManagementConfigurationPolicyPriority -DeviceManagementConfigurationPolicyId $currentInstance.Id `
            #-Priority $PriorityValue

    }
    elseif ($Ensure -eq 'Absent' -and $currentInstance.Ensure -eq 'Present')
    {
        Write-Verbose -Message "Removing {$DisplayName}"

        
        #region resource generator code
        #endregion
        

        
        #region resource generator code
        Remove-MgDeviceManagementConfigurationPolicy -DeviceManagementConfigurationPolicyId $currentInstance.Id
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
        $CreationSource,

        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [System.Boolean]
        $IsAssigned,

        [Parameter()]
        [System.String]
        $Name,

        [Parameter()]
        [ValidateSet('none','android','iOS','macOS','windows10X','windows10','linux','unknownFutureValue')]
        [System.String]
        $Platforms,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $PriorityMetaData,

        [Parameter()]
        [System.String[]]
        $RoleScopeTagIds,

        [Parameter()]
        [System.Int32]
        $SettingCount,

        [Parameter()]
        [ValidateSet('none','mdm','windows10XManagement','configManager','appleRemoteManagement','microsoftSense','exchangeOnline','linuxMdm','enrollment','endpointPrivilegeManagement','unknownFutureValue')]
        [System.String]
        $Technologies,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $TemplateReference,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $Settings,



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
    elseif ($<SecondaryKey>)
    {
        Write-Verbose -Message "Testing configuration of {$<SecondaryKey>}"
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
        [array]$getValue = Get-MgDeviceManagementConfigurationPolicy `
            -All `
            -ErrorAction Stop | Where-Object `
            -FilterScript { `
                $_.TemplateReference.TemplateFamily -eq 'endpointSecurityAntivirus'  `
            }
        if (-not $getValue)
        {
            [array]$getValue = Get-MgDeviceManagementConfigurationPolicy `
                -All `
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

            if ($Results.PriorityMetaData)
            {
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString -ComplexObject $Results.PriorityMetaData -CIMInstanceName IntuneAntivirusPolicyWindows10SettingCatalogdevicemanagementprioritymetadata
                if ($complexTypeStringResult)
                {
                    $Results.PriorityMetaData = $complexTypeStringResult
                }
                else
                {
                    $Results.Remove('PriorityMetaData') | Out-Null
                }
            }
            if ($Results.TemplateReference)
            {
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString -ComplexObject $Results.TemplateReference -CIMInstanceName IntuneAntivirusPolicyWindows10SettingCatalogdevicemanagementconfigurationpolicytemplatereference
                if ($complexTypeStringResult)
                {
                    $Results.TemplateReference = $complexTypeStringResult
                }
                else
                {
                    $Results.Remove('TemplateReference') | Out-Null
                }
            }
            if ($Results.Settings)
            {
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString -ComplexObject $Results.Settings -CIMInstanceName IntuneAntivirusPolicyWindows10SettingCatalogdevicemanagementconfigurationsetting
                if ($complexTypeStringResult)
                {
                    $Results.Settings = $complexTypeStringResult
                }
                else
                {
                    $Results.Remove('Settings') | Out-Null
                }
            }



            $currentDSCBlock = Get-M365DSCExportContentForResource -ResourceName $ResourceName `
                -ConnectionMode $ConnectionMode `
                -ModulePath $PSScriptRoot `
                -Results $Results `
                -Credential $Credential

            if ($Results.PriorityMetaData)
            {
                $isCIMArray=$false
                if($Results.PriorityMetaData.getType().Fullname -like "*[[\]]")
                {
                    $isCIMArray=$true
                }
                $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "PriorityMetaData" -isCIMArray:$isCIMArray
            }
            if ($Results.TemplateReference)
            {
                $isCIMArray=$false
                if($Results.TemplateReference.getType().Fullname -like "*[[\]]")
                {
                    $isCIMArray=$true
                }
                $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "TemplateReference" -isCIMArray:$isCIMArray
            }
            if ($Results.Settings)
            {
                $isCIMArray=$false
                if($Results.Settings.getType().Fullname -like "*[[\]]")
                {
                    $isCIMArray=$true
                }
                $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "Settings" -isCIMArray:$isCIMArray
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
                "IsAssigned"
        "Name"
        "Platforms"
        "PriorityMetaData"
        "RoleScopeTagIds"
        "SettingCount"
        "Technologies"
        "TemplateReference"
        "Settings"

    )
    $results = @{'@odata.type' = '#microsoft.graph.deviceManagementConfigurationPolicy' }
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



Export-ModuleMember -Function *-TargetResource
