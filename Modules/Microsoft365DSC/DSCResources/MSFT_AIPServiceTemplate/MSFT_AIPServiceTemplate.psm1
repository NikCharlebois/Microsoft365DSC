function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $Names,

        [Parameter(Mandatory = $true)]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $Descriptions,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $RightsDefinitions,

        [Parameter()]
        [System.String]
        [ValidateSet("AfterDays", "Never", "OnDate")]
        $ContentExpirationOption,

        [Parameter()]
        [System.String]
        $ContentExpirationDate,

        [Parameter()]
        [System.Int32]
        $ContentValidityDuration,

        [Parameter()]
        [System.Int32]
        [ValidateRange(-1, 9999)]
        $LicenseValidityDuration,

        [Parameter()]
        [System.String]
        [ValidateSet("Archived","Published")]
        $Status,

        [Parameter()]
        [System.String[]]
        $ScopedIdentities,

        [Parameter()]
        [System.Boolean]
        $EnableInLegacyApps,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present',

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $GlobalAdminAccount
    )

    Write-Verbose -Message "Getting configuration of Azure Information Protection Template"
    #region Telemetry
    $ResourceName = $MyInvocation.MyCommand.ModuleName.Replace("MSFT_", "")
    $data = [System.Collections.Generic.Dictionary[[String], [String]]]::new()
    $data.Add("Resource", $ResourceName)
    $data.Add("Method", $MyInvocation.MyCommand)
    $data.Add("Principal", $GlobalAdminAccount.UserName)
    $data.Add("TenantId", $TenantId)
    Add-M365DSCTelemetryEvent -Data $data
    #endregion

    $ConnectionMode = New-M365DSCConnection -Platform 'AzureInformationProtection' -InboundParameters $PSBoundParameters

    $AllTemplates = Get-AIPServiceTemplate

    $Template = $null
    foreach ($item in $AllTemplates)
    {
        $hashNames = @{}
        foreach ($entry in $item.Names)
        {
            $hashNames += @{
                $entry.Key = $entry.Value
            }
        }
        $comparison = Compare-Object -ReferenceObject $hashNames.Values `
            -DifferenceObject $Names.Values
        if ($null -eq $comparison)
        {
            $Template = $item
            $break
        }
    }

    if ($null -eq $Template)
    {
        $currentValues = $PSBoundParameters
        $currentValues.Ensure = "Absent"
        return $currentValues
    }
    else
    {
        $NamesValue = ConvertTo-NamePairCIMArray -InputObject $Template.Names
        $DescriptionsValue = ConvertTo-NamePairCIMArray `
            -InputObject -$Template.Descriptions
        $RightsDefinitionsValue = $null
        if ($null -ne $Template.RightsDefinitions)
        {
            $RightsDefinitionsValue= ConvertTo-RightsDefinitionsCIMArray `
                -RightsDefinitions $Template.RightsDefinitions
        }
        Write-Verbose "Found existing Azure Information Protection Template"
        $result = @{
            Names                   = $NamesValue
            Descriptions            = $DescriptionsValue
            RightsDefinitions       = $RightsDefinitionsValue
            ContentExpirationOption = $Template.ContentExpirationOption.ToString()
            ContentExpirationDate   = $Template.ContentExpirationDate.ToString()
            ContentValidityDuration = $Template.ContentValidityDuration.ToString()
            LicenseValidityDuration = $Template.LicenseValidityDuration.ToString()
            Status                  = $Template.Status
            ScopedIdentities        = $Template.ScopedIdentities
            EnableInLegacyApps      = [boolean]$Template.EnableInLegacyApps
            Ensure                  = "Present"
            GlobalAdminAccount      = $GlobalAdminAccount
        }

        Write-Verbose -Message "Get-TargetResource Result: `n $(Convert-M365DscHashtableToString -Hashtable $result)"
        return [HashTable]$result
    }
}

function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $Names,

        [Parameter(Mandatory = $true)]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $Descriptions,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $RightsDefinitions,

        [Parameter()]
        [System.String]
        [ValidateSet("AfterDays", "Never", "OnDate")]
        $ContentExpirationOption,

        [Parameter()]
        [System.String]
        $ContentExpirationDate,

        [Parameter()]
        [System.Int32]
        $ContentValidityDuration,

        [Parameter()]
        [System.Int32]
        [ValidateRange(-1, 9999)]
        $LicenseValidityDuration,

        [Parameter()]
        [System.String]
        [ValidateSet("Archived","Published")]
        $Status,

        [Parameter()]
        [System.String[]]
        $ScopedIdentities,

        [Parameter()]
        [System.Boolean]
        $EnableInLegacyApps,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present',

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $GlobalAdminAccount
    )

    Write-Verbose -Message "Setting configuration of Azure AD Groups Naming Policy"
    #region Telemetry
    $ResourceName = $MyInvocation.MyCommand.ModuleName.Replace("MSFT_", "")
    $data = [System.Collections.Generic.Dictionary[[String], [String]]]::new()
    $data.Add("Resource", $ResourceName)
    $data.Add("Method", $MyInvocation.MyCommand)
    $data.Add("Principal", $GlobalAdminAccount.UserName)
    $data.Add("TenantId", $TenantId)
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
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $Names,

        [Parameter(Mandatory = $true)]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $Descriptions,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $RightsDefinitions,

        [Parameter()]
        [System.String]
        [ValidateSet("AfterDays", "Never", "OnDate")]
        $ContentExpirationOption,

        [Parameter()]
        [System.String]
        $ContentExpirationDate,

        [Parameter()]
        [System.Int32]
        $ContentValidityDuration,

        [Parameter()]
        [System.Int32]
        [ValidateRange(-1, 9999)]
        $LicenseValidityDuration,

        [Parameter()]
        [System.String]
        [ValidateSet("Archived","Published")]
        $Status,

        [Parameter()]
        [System.String[]]
        $ScopedIdentities,

        [Parameter()]
        [System.Boolean]
        $EnableInLegacyApps,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present',

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $GlobalAdminAccount
    )

    Write-Verbose -Message "Testing configuration of AzureAD Groups Naming Policy"

    $CurrentValues = Get-TargetResource @PSBoundParameters

    Write-Verbose -Message "Target Values: $(Convert-M365DscHashtableToString -Hashtable $PSBoundParameters)"

    $ValuesToCheck = $PSBoundParameters
    $ValuesToCheck.Remove('GlobalAdminAccount') | Out-Null

    $TestResult = Test-Microsoft365DSCParameterState -CurrentValues $CurrentValues `
        -Source $($MyInvocation.MyCommand.Source) `
        -DesiredValues $ValuesToCheck `
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

    $dscContent = ''
    $i = 1
    $ConnectionMode = New-M365DSCConnection -Platform 'AzureInformationProtection' `
        -InboundParameters $PSBoundParameters

    [Array]$Templates = Get-AIPServiceTemplate

    Write-Host "`r`n" -NoNewLine
    foreach ($Template in $Templates)
    {
        $objNames = ConvertTo-NameValuePairCIMArray -InputObject $Template.Names
        $objDescriptions = ConvertTo-NameValuePairCIMArray -InputObject $Template.Descriptions
        $Params = @{
            Names              = $objNames
            Descriptions       = $objDescriptions
            GlobalAdminAccount = $GlobalAdminAccount
        }

        $Results = Get-TargetResource @Params

        # HACK to convert back the result has a HashTable
        $newResults = @{}
        foreach ($entry in $Results)
        {
            if ($null -ne $entry)
            {
                foreach ($key in $entry.Keys)
                {
                    $newResults += @{
                        $key = $entry.$key
                    }
                }
            }
        }
        $Results = $newResults

        if ($Results.Ensure -eq 'Present')
        {
            Write-Host "    |---[$i/$($Templates.Count)] $($Template.Name)" -NoNewLine
            if ($null -ne $Results.RightsDefinitions)
            {
                $RightsDefinitionValue =  ConvertTo-RightsDefinitionsString `
                    -RightsDefinitions $Results.RightsDefinitions
                $Results.RightsDefinitions = $RightsDefinitionValue
            }

            $namesHash = $null
            foreach ($name in $Results.Names)
            {
                $namesHash += @{
                    $name.Key = $name.Value
                }
            }

            $Results.Names = $namesHash

            $descriptionsHash = $null
            foreach ($description in $Results.Descriptions)
            {
                $descriptionsHash += @{
                    $description.Key = $description.Value
                }
            }

            $Results.Descriptions = $descriptionsHash

            $Results = Update-M365DSCExportAuthenticationResults -ConnectionMode $ConnectionMode `
                -Results $Results
            $currentDSCBlock = Get-M365DSCExportContentForResource -ResourceName $ResourceName `
                -ConnectionMode $ConnectionMode `
                -ModulePath $PSScriptRoot `
                -Results $Results `
                -GlobalAdminAccount $GlobalAdminAccount

            if ($null -ne $Results.RightsDefinitions)
            {
                $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock `
                    -ParameterName "RightsDefinitions"
            }

            Write-Host $Global:M365DSCEmojiGreenCheckMark
            $dscContent += $currentDSCBlock
        }
    }
    return $dscContent
}

function ConvertTo-RightsDefinitionsString
{
    [CmdletBinding()]
    [OutputType([System.String])]
    param(
        [Parameter(Mandatory = $true)]
        $RightsDefinitions
    )

    $StringContent = "@(`r`n"
    foreach ($definition in $RightsDefinitions)
    {
        $StringContent += "                MSFT_AIPRightsDefinition`r`n"
        $StringContent += "                {`r`n"
        $StringContent += "                    EmailAddress  = '$($definition.Email)'`r`n"
        $StringContent += "                    Rights        = '$($definition.Rights -Join ",")'`r`n"
        $StringContent += "                }`r`n"
    }
    $StringContent += "            )"
    return $StringContent
}

function ConvertTo-RightsDefinitionsCIMArray
{
    [CmdletBinding()]
    [OutputType([System.Object[]])]
    Param(
        [parameter(Mandatory = $true)]
        [System.Object[]]
        $RightsDefinitions
    )
    $definitions = @()
    foreach ($definition in $RightsDefinitions)
    {
        $entry = @{
            EmailAddress  = $definition.Identity
            Rights        = $definition.Rights
        }
        $definitions += $entry
    }
    return $definitions
}

function ConvertTo-NameValuePairCIMArray
{
    [CmdletBinding()]
    [OutputType([Microsoft.Management.Infrastructure.CimInstance])]
    Param(
        [parameter(Mandatory = $true)]
        [System.Object]
        $InputObject
    )
    $results = @{}
    foreach ($object in $InputObject)
    {
        $results.Add($object.Key, $object.Value)
    }
    return $results
}


Export-ModuleMember -Function *-TargetResource
