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
        [System.Boolean]
        $AccountEnabled = $true,

        [Parameter()]
        [System.String]
        $DeviceCategory,

        [Parameter(Mandatory = $true)]
        [System.String]
        $DeviceId,

        [Parameter()]
        [ValidateSet("Unknown", "Company", "Personal")]
        [System.String]
        $DeviceOwnership,

        [Parameter()]
        [System.String]
        $EnrollmentProfileName,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $ExtensionAttributes,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $AlternativeSecurityIds,

        [Parameter()]
        [System.Boolean]
        $IsManaged,

        [Parameter(Mandatory = $true)]
        [System.String]
        $OperatingSystem,

        [Parameter(Mandatory = $true)]
        [System.String]
        $OperatingSystemVersion,

        [Parameter()]
        [ValidateSet("RegisteredDevice", "SecureVM", "Printer", "Shared, IoT")]
        [System.String]
        $ProfileType = "RegisteredDevice",

        [Parameter()]
        [System.String[]]
        $SystemLabels,

        [Parameter()]
        [ValidateSet('Present')]
        [System.String]
        $Ensure = 'Present',

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

    Write-Verbose -Message "Getting configuration of AzureAD Device {$DisplayName}"
    $ConnectionMode = New-M365DSCConnection -Workload 'MicrosoftGraph' `
        -InboundParameters $PSBoundParameters

    #Ensure the proper dependencies are installed in the current environment.
    Confirm-M365DSCDependencies

    #region Telemetry
    $ResourceName = $MyInvocation.MyCommand.ModuleName -replace 'MSFT_', ''
    $CommandName = $MyInvocation.MyCommand
    $data = Format-M365DSCTelemetryParameters -ResourceName $ResourceName `
        -CommandName $CommandName `
        -Parameters $PSBoundParameters
    Add-M365DSCTelemetryEvent -Data $data
    #endregion

    $nullReturn = $PSBoundParameters
    $nullReturn.Ensure = 'Absent'

    try
    {
        $device = Get-MgBetaDevice -Filter "DisplayName eq '$DisplayName'" -ErrorAction SilentlyContinue
        if ($null -eq $device -and -not [System.String]::IsNullOrEmpty($DeviceId))
        {
            $device = Get-MgBetaDevice -Filter "DeviceId eq '$DeviceId'" -ErrorAction SilentlyContinue
            if ($null -eq $device -and -not [System.String]::IsNullOrEmpty($Id))
            {
                $device = Get-MgBetaDevice -Filter "Id eq '$Id'" -ErrorAction SilentlyContinue
            }
        }
    }
    catch
    {
        $message = "Could not find device {$DisplayName}"

        New-M365DSCLogEntry -Message $message `
            -Exception $_ `
            -Source $($MyInvocation.MyCommand.Source) `
            -TenantId $TenantId `
            -Credential $Credential

        return $nullReturn
    }

    if ($null -eq $Device)
    {
        $message = "Device {$DisplayName} was not found"

        New-M365DSCLogEntry -Message $message `
            -Source $($MyInvocation.MyCommand.Source) `
            -TenantId $TenantId `
            -Credential $Credential

        return $nullReturn
    }
    else
    {
        Write-Verbose -Message 'Get-TargetResource: Found existing device {$DisplayName}'

        if ($ExtensionAttributes.Length -gt 0)
        {
            $extensionAttributesValue = @()
            foreach ($attribute in $ExtensionAttributes)
            {
                $extensionAttributesValue += @{
                    ExtensionAttribute1   = $attribute.extensionAttribute1
                    ExtensionAttribute2   = $attribute.extensionAttribute2
                    ExtensionAttribute3   = $attribute.extensionAttribute3
                    ExtensionAttribute4   = $attribute.extensionAttribute4
                    ExtensionAttribute5   = $attribute.extensionAttribute5
                    ExtensionAttribute6   = $attribute.extensionAttribute6
                    ExtensionAttribute7   = $attribute.extensionAttribute7
                    ExtensionAttribute8   = $attribute.extensionAttribute8
                    ExtensionAttribute9   = $attribute.extensionAttribute9
                    ExtensionAttribute10  = $attribute.extensionAttribute10
                    ExtensionAttribute11  = $attribute.extensionAttribute11
                    ExtensionAttribute12  = $attribute.extensionAttribute12
                    ExtensionAttribute13  = $attribute.extensionAttribute13
                    ExtensionAttribute14  = $attribute.extensionAttribute14
                    ExtensionAttribute15  = $attribute.extensionAttribute15
                }
            }
        }

        $alternativeSecurityIdsValue = @{
            Type = $Device.AlternativeSecurityIds.Type
            Key  = [System.Text.Encoding]::Unicode.GetString([byte[]]$Device.AlternativeSecurityIds.Key)
        }

        $result = @{
            DisplayName            = $Device.DisplayName
            Id                     = $Device.Id
            AccountEnabled         = [Boolean]$Device.AccountEnabled
            DeviceCategory         = $Device.DeviceCategory
            DeviceId               = $Device.DeviceId
            DeviceOwnership        = $Device.DeviceOwnership
            EnrollmentProfileName  = $Device.EnrollmentProfileName
            ExtensionAttributes    = $extensionAttributesValue
            AlternativeSecurityIds = $alternativeSecurityIdsValue
            IsManaged              = [Boolean]$Device.IsManaged
            OperatingSystem        = $Device.OperatingSystem
            OperatingSystemVersion = $Device.OperatingSystemVersion
            ProfileType            = $Device.ProfileType
            SystemLabels           = [Array]$Device.SystemLabels
            Ensure                 = 'Present'
            Credential             = $Credential
            ApplicationSecret      = $ApplicationSecret
            ApplicationId          = $ApplicationId
            TenantId               = $TenantId
            CertificateThumbprint  = $CertificateThumbprint
            Managedidentity        = $ManagedIdentity.IsPresent
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
        $Id,

        [Parameter()]
        [System.Boolean]
        $AccountEnabled = $true,

        [Parameter()]
        [System.String]
        $DeviceCategory,

        [Parameter(Mandatory = $true)]
        [System.String]
        $DeviceId,

        [Parameter()]
        [ValidateSet("Unknown", "Company", "Personal")]
        [System.String]
        $DeviceOwnership,

        [Parameter()]
        [System.String]
        $EnrollmentProfileName,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $ExtensionAttributes,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $AlternativeSecurityIds,

        [Parameter()]
        [System.Boolean]
        $IsManaged,

        [Parameter(Mandatory = $true)]
        [System.String]
        $OperatingSystem,

        [Parameter(Mandatory = $true)]
        [System.String]
        $OperatingSystemVersion,

        [Parameter()]
        [ValidateSet("RegisteredDevice", "SecureVM", "Printer", "Shared, IoT")]
        [System.String]
        $ProfileType = "RegisteredDevice",

        [Parameter()]
        [System.String[]]
        $SystemLabels,

        [Parameter()]
        [ValidateSet('Present')]
        [System.String]
        $Ensure = 'Present',

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
    Write-Verbose -Message 'Setting configuration of AzureAD Authorization Policy'

    #Ensure the proper dependencies are installed in the current environment.
    Confirm-M365DSCDependencies

    #region Telemetry
    $ResourceName = $MyInvocation.MyCommand.ModuleName -replace 'MSFT_', ''
    $CommandName = $MyInvocation.MyCommand
    $data = Format-M365DSCTelemetryParameters -ResourceName $ResourceName `
        -CommandName $CommandName `
        -Parameters $PSBoundParameters
    Add-M365DSCTelemetryEvent -Data $data
    #endregion

    $currentInstance = Get-TargetResource @PSBoundParameters

    $currentParameters = ([hashtable]$PSBoundParameters).Clone()
    $currentParameters.Remove('ApplicationId') | Out-Null
    $currentParameters.Remove('TenantId') | Out-Null
    $currentParameters.Remove('CertificateThumbprint') | Out-Null
    $currentParameters.Remove('ApplicationSecret') | Out-Null
    $currentParameters.Remove('Ensure') | Out-Null
    $currentParameters.Remove('Credential') | Out-Null
    $currentParameters.Remove('ManagedIdentity') | Out-Null

    if ($null -ne $ExtensionAttributes)
    {
        $extensionAttributesValue = @{}
        foreach ($key in $ExtensionAttributes.Keys)
        {
            $extensionAttributesValue.Add($key, $ExtensionAttributes[$key])
        }
        $currentParameters.ExtensionAttributes = $extensionAttributesValue
    }

    if ($null -ne $AlternativeSecurityIds)
    {
        $currentParameters.AlternativeSecurityIds = @{
            type = $AlternativeSecurityIds.Type
            key  = [System.Text.Encoding]::Unicode.GetBytes($AlternativeSecurityIds.Key)
        }
    }

    if ($currentInstance.Ensure -eq 'Absent' -and $Ensure -eq 'Present')
    {
        Write-Verbose -Message "Creating new AzureAD Device {$DisplayName} with parameters"
        Write-Verbose -Message $(Convert-M365DscHashtableToString -Hashtable $currentParameters)
        $currentParameters.Remove("Id") | Out-Null

        New-MgBetaDevice @currentParameters
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
        [System.Boolean]
        $AccountEnabled = $true,

        [Parameter()]
        [System.String]
        $DeviceCategory,

        [Parameter(Mandatory = $true)]
        [System.String]
        $DeviceId,

        [Parameter()]
        [ValidateSet("Unknown", "Company", "Personal")]
        [System.String]
        $DeviceOwnership,

        [Parameter()]
        [System.String]
        $EnrollmentProfileName,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $ExtensionAttributes,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $AlternativeSecurityIds,

        [Parameter()]
        [System.Boolean]
        $IsManaged,

        [Parameter(Mandatory = $true)]
        [System.String]
        $OperatingSystem,

        [Parameter(Mandatory = $true)]
        [System.String]
        $OperatingSystemVersion,

        [Parameter()]
        [ValidateSet("RegisteredDevice", "SecureVM", "Printer", "Shared, IoT")]
        [System.String]
        $ProfileType = "RegisteredDevice",

        [Parameter()]
        [System.String[]]
        $SystemLabels,

        [Parameter()]
        [ValidateSet('Present')]
        [System.String]
        $Ensure = 'Present',

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

    Write-Verbose -Message "Testing configuration of AzureAD Device $DisplayName"

    $CurrentValues = Get-TargetResource @PSBoundParameters

    Write-Verbose -Message "Target Values: $(Convert-M365DscHashtableToString -Hashtable $PSBoundParameters)"

    $ValuesToCheck = $PSBoundParameters

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
    $ResourceName = $MyInvocation.MyCommand.ModuleName -replace 'MSFT_', ''
    $CommandName = $MyInvocation.MyCommand
    $data = Format-M365DSCTelemetryParameters -ResourceName $ResourceName `
        -CommandName $CommandName `
        -Parameters $PSBoundParameters
    Add-M365DSCTelemetryEvent -Data $data
    #endregion

    $ConnectionMode = New-M365DSCConnection -Workload 'MicrosoftGraph' `
        -InboundParameters $PSBoundParameters

    try
    {
        $dscContent = [System.Text.StringBuilder]::New()

        $Script:ExportMode = $true
        [array] $Script:exportedInstances = Get-MgBetaDevice -Filter $Filter -All -ErrorAction Stop
        $i = 1
        Write-Host "`r`n" -NoNewline
        foreach ($AADDevice in $Script:exportedInstances)
        {
            Write-Host "    |---[$i/$($Script:exportedInstances.Count)] $($AADDevice.DisplayName)" -NoNewline
            $params = @{
                DisplayName            = $AADDevice.DisplayName
                OperatingSystem        = $AADDevice.OperatingSystem
                OperatingSystemVersion = $AADDevice.OperatingSystemVersion
                Credential             = $Credential
                ApplicationId          = $ApplicationId
                TenantId               = $TenantId
                ApplicationSecret      = $ApplicationSecret
                CertificateThumbprint  = $CertificateThumbprint
                ManagedIdentity        = $ManagedIdentity
            }
            $Results = Get-TargetResource @Params

            if ($Results -is [System.Collections.Hashtable] -and $Results.Count -gt 1)
            {
                $results = Update-M365DSCExportAuthenticationResults -ConnectionMode $ConnectionMode `
                    -Results $results
                if ($Results.ExtensionAttributes.Count -gt 0)
                {
                    $Results.Permissions = Get-M365DSCAzureADDeviceExtensionAsString $Results.ExtensionAttributes
                }
                if ($Results.AlternativeSecurityIds.Count -gt 0)
                {
                    $Results.AlternativeSecurityIds = Get-M365DSCAzureADDeviceSecurityIdAsString $Results.AlternativeSecurityIds
                }
                $currentDSCBlock = Get-M365DSCExportContentForResource -ResourceName $ResourceName `
                    -ConnectionMode $ConnectionMode `
                    -ModulePath $PSScriptRoot `
                    -Results $results `
                    -Credential $Credential

                if ($null -ne $Results.ExtensionAttributes)
                {
                    $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock `
                        -ParameterName 'ExtensionAttributes'
                }
                if ($null -ne $Results.AlternativeSecurityIds)
                {
                    $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock `
                        -ParameterName 'AlternativeSecurityIds'
                }
                Save-M365DSCPartialExport -Content $currentDSCBlock `
                    -FileName $Global:PartialExportFileName
                $dscContent.Append($currentDSCBlock) | Out-Null
                Write-Host $Global:M365DSCEmojiGreenCheckMark
            }
            else
            {
                Write-Host $Global:M365DSCEmojiRedX
            }
            $i++
        }

        return $dscContent
    }
    catch
    {
        Write-Host $Global:M365DSCEmojiRedX

        New-M365DSCLogEntry -Message 'Error during Export:' `
            -Exception $_ `
            -Source $($MyInvocation.MyCommand.Source) `
            -TenantId $TenantId `
            -Credential $Credential

        return ''
    }
}

function Get-M365DSCAzureADDeviceSecurityIdAsString
{
    [CmdletBinding()]
    [OutputType([System.String])]
    param(
        [Parameter(Mandatory = $true)]
        [System.Collections.ArrayList]
        $AlternativeSecurityIds
    )

    $StringContent = '@('
    foreach ($item in $AlternativeSecurityIds)
    {
        $StringContent += "MSFT_AADDeviceAlternativeSecurityId {`r`n"
        $StringContent += "                Type   = $($item.Type)`r`n"
        $StringContent += "                Key    = '$($item.Key)'`r`n"
        $StringContent += "            }`r`n"
    }
    $StringContent += '            )'
    return $StringContent
}

function Get-M365DSCAzureADDeviceExtensionAsString
{
    [CmdletBinding()]
    [OutputType([System.String])]
    param(
        [Parameter(Mandatory = $true)]
        [System.Collections.ArrayList]
        $ExtensionAttributes
    )

    $StringContent = '@('
    foreach ($attribute in $ExtensionAttributes)
    {
        $StringContent += "MSFT_AADDeviceExtensionAttribute {`r`n"
        $StringContent += "                ExtensionAttribute1   = '$($attribute.extensionAttribute1)'`r`n"
        $StringContent += "                ExtensionAttribute2   = '$($attribute.extensionAttribute2)'`r`n"
        $StringContent += "                ExtensionAttribute3   = '$($attribute.extensionAttribute3)'`r`n"
        $StringContent += "                ExtensionAttribute4   = '$($attribute.extensionAttribute4)'`r`n"
        $StringContent += "                ExtensionAttribute5   = '$($attribute.extensionAttribute5)'`r`n"
        $StringContent += "                ExtensionAttribute6   = '$($attribute.extensionAttribute6)'`r`n"
        $StringContent += "                ExtensionAttribute7   = '$($attribute.extensionAttribute7)'`r`n"
        $StringContent += "                ExtensionAttribute8   = '$($attribute.extensionAttribute8)'`r`n"
        $StringContent += "                ExtensionAttribute9   = '$($attribute.extensionAttribute9)'`r`n"
        $StringContent += "                ExtensionAttribute10  = '$($attribute.extensionAttribute10)'`r`n"
        $StringContent += "                ExtensionAttribute11  = '$($attribute.extensionAttribute11)'`r`n"
        $StringContent += "                ExtensionAttribute12  = '$($attribute.extensionAttribute12)'`r`n"
        $StringContent += "                ExtensionAttribute13  = '$($attribute.extensionAttribute13)'`r`n"
        $StringContent += "                ExtensionAttribute14  = '$($attribute.extensionAttribute14)'`r`n"
        $StringContent += "                ExtensionAttribute15  = '$($attribute.extensionAttribute15)'`r`n"
        $StringContent += "            }`r`n"
    }
    $StringContent += '            )'
    return $StringContent
}

Export-ModuleMember -Function *-TargetResource
