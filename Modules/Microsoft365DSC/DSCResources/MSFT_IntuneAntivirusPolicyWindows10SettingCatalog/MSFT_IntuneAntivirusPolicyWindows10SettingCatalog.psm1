function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
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
        [System.String[]]
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
        [System.String[]]
        $Technologies,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $TemplateReference,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $Settings,

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
            Write-Verbose -Message "Getting instance by {Name} = {$Name}"
            $getValue = Get-MgDeviceManagementConfigurationPolicy -Filter "Name eq '$Name'" -ErrorAction SilentlyContinue
            if ($null -ne $getValue)
            {
                Write-Verbose -Message "Found instance with Name = {$Name}"
            }
        }
        else
        {
            Write-Verbose -Message "Found instance with id = {$id}"
        }
        #endregion

        if ($null -eq $getValue)
        {
            Write-Verbose -Message "No instances were found with either id or Name"
            return $nullResult
        }

        $results = @{
            #region resource generator code
            Id                    = if ($null -ne $getValue.Id){$getValue.Id.ToString()}else{$null}
            CreationSource        = if ($null -ne $getValue.CreationSource){$getValue.CreationSource.ToString()}else{$null}
            Description           = if ($null -ne $getValue.Description){$getValue.Description.ToString()}else{$null}
            IsAssigned            = $getValue.IsAssigned
            Name                  = if ($null -ne $getValue.Name){$getValue.Name.ToString()}else{$null}
            Platforms             = if ($getValue.Platforms.GetType().BaseType.Name -eq 'ValueType'){$getValue.Platforms.ToString().Split(',')}else{$getValue.Platforms}
            RoleScopeTagIds       = if ($getValue.RoleScopeTagIds.GetType().BaseType.Name -eq 'ValueType'){$getValue.RoleScopeTagIds.ToString().Split(',')}else{$getValue.RoleScopeTagIds}
            SettingCount          = $getValue.SettingCount
            Technologies          = if ($getValue.Technologies.GetType().BaseType.Name -eq 'ValueType'){$getValue.Technologies.ToString().Split(',')}else{$getValue.Technologies}
            Ensure                = 'Present'
            Credential            = $Credential
            ApplicationId         = $ApplicationId
            TenantId              = $TenantId
            ApplicationSecret     = $ApplicationSecret
            CertificateThumbprint = $CertificateThumbprint
            Managedidentity       = $ManagedIdentity.IsPresent
        }
        if ($getValue.PriorityMetaData)
        {
            $results.Add("PriorityMetaData", (Get-M365DSCDRGComplexTypeToHashtable -ComplexObject $getValue.PriorityMetaData))
        }
        if ($getValue.TemplateReference)
        {
            $results.Add("TemplateReference", (Get-M365DSCDRGComplexTypeToHashtable -ComplexObject $getValue.TemplateReference))
        }
        if ($getValue.Settings)
        {
            $results.Add("Settings", (Get-M365DSCDRGComplexTypeToHashtable -ComplexObject $getValue.Settings))
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
        [System.String[]]
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
        [System.String[]]
        $Technologies,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $TemplateReference,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $Settings,

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

    # Ensure the proper dependencies are installed in the current environment.
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
        Write-Verbose -Message "Creating {$Name}"

        $CreateParameters = ([Hashtable]$PSBoundParameters).Clone()
        $CreateParameters = Rename-M365DSCCimInstanceODataParameter -Properties $CreateParameters
        $CreateParameters.Remove('Id') | Out-Null
        $CreateParameters.Remove('Verbose') | Out-Null

        $keys = (([Hashtable]$CreateParameters).clone()).Keys
        foreach ($key in $keys)
        {
            $keyName = $key.substring(0,1).toLower()+$key.substring(1,$key.length-1)
            $keyValue = $CreateParameters.$key
            if ($null -ne $CreateParameters.$key -and $CreateParameters.$key.getType().Name -like "*cimInstance*")
            {
                $keyValue = Convert-M365DSCDRGComplexTypeToHashtable -ComplexObject $CreateParameters.$key
            }
            $CreateParameters.Remove($key) | Out-Null
            $CreateParameters.Add($keyName,$keyValue)
        }
        $CreateParameters.Add('@odata.type','#microsoft.graph.deviceManagementConfigurationPolicy')
        Write-Verbose -Message "Creating New Instance with parameters:`r`n$(Convert-M365DscHashtableToString -Hashtable $CreateParameters)"
        $currentInstance = New-MgDeviceManagementConfigurationPolicy -BodyParameter $CreateParameters
    }
    elseif ($Ensure -eq 'Present' -and $currentInstance.Ensure -eq 'Present')
    {
        Write-Verbose -Message "Updating {$DisplayName}"

        $UpdateParameters = ([Hashtable]$PSBoundParameters).clone()
        $UpdateParameters = Rename-M365DSCCimInstanceODataParameter -Properties $UpdateParameters
        $UpdateParameters.Remove('Id') | Out-Null
        $UpdateParameters.Remove('Verbose') | Out-Null

        $keys = (([Hashtable]$UpdateParameters).clone()).Keys
        foreach ($key in $keys)
        {
            $keyName = $key.substring(0,1).toLower()+$key.substring(1,$key.length-1)
            $keyValue = $UpdateParameters.$key
            if ($null -ne $UpdateParameters.$key -and $UpdateParameters.$key.getType().Name -like "*cimInstance*")
            {
                $keyValue = Convert-M365DSCDRGComplexTypeToHashtable -ComplexObject $UpdateParameters.$key
            }
            $UpdateParameters.Remove($key) | Out-Null
            $UpdateParameters.Add($keyName,$keyValue)
        }
        $UpdateParameters.Add('@odata.type','#microsoft.graph.deviceManagementConfigurationPolicy')

        Write-Verbose -Message "Updating {$($currentInstance.Id)} with`r`n$($UpdateParameters | Out-String)"
        Update-MgDeviceManagementConfigurationPolicy -BodyParameter $UpdateParameters `
            -DeviceManagementConfigurationPolicyId $currentInstance.Id
    }
    elseif ($Ensure -eq 'Absent' -and $currentInstance.Ensure -eq 'Present')
    {
        Write-Verbose -Message "Removing {$DisplayName}"
        Remove-MgDeviceManagementConfigurationPolicy -DeviceManagementConfigurationPolicyId $currentInstance.Id
    }
}

function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
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
        [System.String[]]
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
        [System.String[]]
        $Technologies,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $TemplateReference,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $Settings,

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
    elseif ($Name)
    {
        Write-Verbose -Message "Testing configuration of {$Name}"
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
            $displayedKey = $config.id
            if (-not [String]::IsNullOrEmpty($config.Name))
            {
                $displayedKey = $config.Name
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

Export-ModuleMember -Function *-TargetResource

