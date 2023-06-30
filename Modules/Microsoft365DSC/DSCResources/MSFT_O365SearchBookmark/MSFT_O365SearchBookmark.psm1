function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [String]
        $DisplayName,

        [Parameter(Mandatory = $true)]
        [System.String]
        $WebUrl,

        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [System.String[]]
        $Categories,

        [Parameter()]
        [System.String]
        $AvailabilityStartDateTime,

        [Parameter()]
        [System.String]
        $AvailabilityEndDateTime,

        [Parameter()]
        [System.String[]]
        $LanguageTags,

        [Parameter()]
        [ValidateSet("unknown", "android", "androidForWork", "ios", "macOS", "windowsPhone81", "windowsPhone81AndLater", "windows10AndLater", "androidWorkProfile", "androidASOP")]
        [System.String[]]
        $Platforms,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $TargetedVariations,

        [Parameter()]
        [System.String[]]
        $PowerAppsIds,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $Keywords,

        [Parameter()]
        [ValidateSet("published", "draft", "excluded", "unknownFutureValue")]
        [System.String]
        $State,

        [Parameter()]
        [System.String[]]
        $GroupIds,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
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

    $ConnectionMode = New-M365DSCConnection -Workload 'MicrosoftGraph' `
        -InboundParameters $PSBoundParameters `
        -ProfileName 'beta'

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

    $AvailabilityStartDateTimeValue = $null
    if (-not [System.String]::IsNullOrEmpty($bookmark.AvailabilityStartDateTime))
    {
        $AvailabilityStartDateTimeValue = $bookmark.AvailabilityStartDateTime.ToString()
    }
    $AvailabilityEndDateTimeValue = $null
    if (-not [System.String]::IsNullOrEmpty($bookmark.AvailabilityEndDateTime))
    {
        $AvailabilityEndDateTimeValue = $bookmark.AvailabilityEndDateTime.ToString()
    }

    try
    {
        Write-Verbose -Message "Attempting to retrieve Bookmark by DisplayName {$DisplayName}"

        if ($null -ne $Script:exportedInstances -and $Script:ExportMode)
        {
            $bookmark = $Script:exportedInstances | Where-Object -FilterScript {$_.DisplayName -eq $DisplayName}
        }
        else
        {
            $bookmark = Get-MgSearchBookmark -Filter "DisplayName eq '$($DisplayName)'"
        }

        if ($null -eq $bookmark)
        {
            return $nullReturn
        }

        # Variations
        $targetedVariationsValue = @()
        if ($null -ne $bookmark.TargetedVariations)
        {
            foreach ($variation in $bookmark.TargetedVariations)
            {
                $currentVariation = @{
                    DisplayName  = $variation.DisplayName
                    Description  = $variation.Description
                    WebUrl       = $variation.WebUrl
                    LanguageTags = [Array]$variation.LanguageTags
                    Platforms    = [Array]$variation.Platforms
                }
                $targetedVariationsValue += $currentVariation
            }
        }

        return @{
            DisplayName               = $bookmark.DisplayName
            Description               = $bookmark.Description
            WebUrl                    = $bookmark.WebUrl
            Categories                = [Array]$bookmark.Categories
            AvailabilityStartDateTime = $AvailabilityStartDateTimeValue
            AvailabilityEndDateTime   = $AvailabilityEndDateTimeValue
            LanguageTags              = [Array]$bookmark.LanguageTags
            Platforms                 = [String[]]$bookmark.Platforms
            TargetedVariations        = $targetedVariationsValue
            PowerAppsIds              = [Array]$bookmark.PowerAppsIds
            Keywords                  = $bookmark.Keywords
            State                     = $bookmark.State
            GroupIds                  = $bookmark.GroupIds
            Credential                = $Credential
            ApplicationId             = $ApplicationId
            TenantId                  = $TenantId
            ApplicationSecret         = $ApplicationSecret
            CertificateThumbprint     = $CertificateThumbprint
            ManagedIdentity           = $ManagedIdentity.IsPresent
        }
    }
    catch
    {
        New-M365DSCLogEntry -Message 'Error retrieving data:' `
            -Exception $_ `
            -Source $($MyInvocation.MyCommand.Source) `
            -TenantId $TenantId `
            -Credential $Credential

        return $nullReturn
    }
}

function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [String]
        $DisplayName,

        [Parameter(Mandatory = $true)]
        [System.String]
        $WebUrl,

        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [System.String[]]
        $Categories,

        [Parameter()]
        [System.String]
        $AvailabilityStartDateTime,

        [Parameter()]
        [System.String]
        $AvailabilityEndDateTime,

        [Parameter()]
        [System.String[]]
        $LanguageTags,

        [Parameter()]
        [ValidateSet("unknown", "android", "androidForWork", "ios", "macOS", "windowsPhone81", "windowsPhone81AndLater", "windows10AndLater", "androidWorkProfile", "androidASOP")]
        [System.String[]]
        $Platforms,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $TargetedVariations,

        [Parameter()]
        [System.String[]]
        $PowerAppsIds,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $Keywords,

        [Parameter()]
        [ValidateSet("published", "draft", "excluded", "unknownFutureValue")]
        [System.String]
        $State,

        [Parameter()]
        [System.String[]]
        $GroupIds,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
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

    Write-Verbose -Message "Setting configuration of Search Bookmark {$DisplayName}"
    $ConnectionMode = New-M365DSCConnection -Workload 'MicrosoftGraph' `
        -InboundParameters $PSBoundParameters `
        -ProfileName 'beta'

    if ($ConnectionMode -eq 'Credentials')
    {
        $TenantId = $Credential.UserName.Split('@')[1]
    }

    #region Item Insights
    $currentValues = Get-TargetResource @PSBoundParameters
    #endregion

    $opsParameter = ([Hashtable]$PSBoundParameters).clone()
    $opsParameter.Remove("Credential") | Out-Null
    $opsParameter.Remove("ApplicationId") | Out-Null
    $opsParameter.Remove("TenantId") | Out-Null
    $opsParameter.Remove("CertificateThumbpring") | Out-Null
    $opsParameter.Remove("ApplicationSecret") | Out-Null
    $opsParameter.Remove("ManagedIdentity") | Out-Null

    if ($null -ne $TargetedVariations)
    {
        $TargetedVariationsValue = @()
        foreach ($variation in $TargetedVariations)
        {
            $current = @{
                description  = $variation.Description
            }
            if (-not [System.String]::IsNullOrEmpty($variation.DisplayName))
            {
                $current.Add("displayName", $variation.DisplayName)
            }

            if (-not [System.String]::IsNullOrEmpty($variation.WebUrl))
            {
                $current.Add("webUrl", $variation.WebUrl)
            }

            if (-not [System.String]::IsNullOrEmpty($variation.LanguageTag))
            {
                $current.Add("languageTag", $variation.LanguageTag)
            }

            if (-not [System.String]::IsNullOrEmpty($variation.Platform))
            {
                $current.Add("platform", $variation.Platform)
            }
            $TargetedVariationsValue += $current
        }
        $opsParameter.TargetedVariations = $TargetedVariationsValue
    }

    if ($null -ne $Keywords)
    {
        $KeywordsValue = @{
            matchSimilarKeywords  = $Keywords.MatchSimilarKeywords
        }

        if (-not [System.String]::IsNullOrEmpty($Keywords.Keywords))
        {
            $KeywordsValue.Add("keywords", $Keywords.Keywords)
        }

        if (-not [System.String]::IsNullOrEmpty($Keywords.ReservedKeywords))
        {
            $KeywordsValue.Add("reservedKeywords", $Keywords.ReservedKeywords)
        }
        $opsParameter.Keywords = $KeywordsValue
    }

    if ($Platforms.Length -eq 0)
    {
        $opsParameter.Remove("Platforms") | Out-Null
    }

    if ($LanguageTags.Length -eq 0)
    {
        $opsParameter.Remove("LanguageTags") | Out-Null
    }

    if ($GroupIds.Length -eq 0)
    {
        $opsParameter.Remove("GroupIds") | Out-Null
    }

    if ([System.String]::IsNullOrEmpty($WebUrl))
    {
        $opsParameter.Remove("WebUrl") | Out-Null
    }

    if ($Ensure-eq 'Present' -and $currentValues.Ensure -eq 'Absent')
    {
        Write-Verbose -Message "Creating new O365 Search Bookmark {$DisplayName}"
        Write-Verbose -Message "$(Convert-M365DscHashtableToString -Hashtable $opsParameter)"
        New-MgSearchBookmark @opsParameter
    }
    elseif ($Ensure -eq 'Present' -and $currentValues.Ensure -eq 'Present')
    {
        $bookmark = Get-MgSearchBookmark -Filter "DisplayName eq '$DisplayName'"
        if ($null -ne $bookmark)
        {
            $opsParameter.Add("BookmarkId", $bookmark.Id)
            Update-MgSearchBookmark @opsParameter
        }
        else
        {
            throw "Couldn't find bookmark {$DisplayName}"
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
        [String]
        $DisplayName,

        [Parameter(Mandatory = $true)]
        [System.String]
        $WebUrl,

        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [System.String[]]
        $Categories,

        [Parameter()]
        [System.String]
        $AvailabilityStartDateTime,

        [Parameter()]
        [System.String]
        $AvailabilityEndDateTime,

        [Parameter()]
        [System.String[]]
        $LanguageTags,

        [Parameter()]
        [ValidateSet("unknown", "android", "androidForWork", "ios", "macOS", "windowsPhone81", "windowsPhone81AndLater", "windows10AndLater", "androidWorkProfile", "androidASOP")]
        [System.String[]]
        $Platforms,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $TargetedVariations,

        [Parameter()]
        [System.String[]]
        $PowerAppsIds,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $Keywords,

        [Parameter()]
        [ValidateSet("published", "draft", "excluded", "unknownFutureValue")]
        [System.String]
        $State,

        [Parameter()]
        [System.String[]]
        $GroupIds,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
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

    Write-Verbose -Message 'Testing configuration for Search And Intelligence Configuration Settings.'

    $CurrentValues = Get-TargetResource @PSBoundParameters
    $ValuesToCheck = ([Hashtable]$PSBoundParameters).Clone()

    Write-Verbose -Message "Current Values: $(Convert-M365DscHashtableToString -Hashtable $CurrentValues)"
    Write-Verbose -Message "Target Values: $(Convert-M365DscHashtableToString -Hashtable $PSBoundParameters)"

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
    $ConnectionMode = New-M365DSCConnection -Workload 'MicrosoftGraph' `
        -InboundParameters $PSBoundParameters `
        -ProfileName 'beta'

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

    $i = 1
    Write-Host "`r`n" -NoNewline
    $Script:ExportMode = $true
    [array] $Script:exportedInstances = Get-MgSearchBookmark -Filter "not IsSuggested"
    try
    {
        $dscContent = [System.Text.StringBuilder]::new()
        foreach ($bookmark in $Script:exportedInstances)
        {
            Write-Host "    |---[$i/$($Script:exportedInstances.Count)] $($bookmark.DisplayName)" -NoNewline
            $Params = @{
                DisplayName           = $bookmark.DisplayName
                WebUrl                = $bookmark.WebUrl
                Credential            = $Credential
                ApplicationId         = $ApplicationId
                TenantId              = $TenantId
                ApplicationSecret     = $ApplicationSecret
                CertificateThumbprint = $CertificateThumbprint
                Managedidentity       = $ManagedIdentity.IsPresent
            }

            $Results = Get-TargetResource @Params

            if ($Results -is [System.Collections.Hashtable] -and $Results.Count -gt 1)
            {
                $Results = Update-M365DSCExportAuthenticationResults -ConnectionMode $ConnectionMode `
                    -Results $Results

                if ($Results.TargetedVariations.Count -gt 0)
                {
                    $Results.TargetedVariations = Get-M365DSCO365SearchBookmarkVariationAsString $Results.TargetedVariations
                }

                if ($Results.Keywords.Count -gt 0)
                {
                    $Results.Keywords = Get-M365DSCO365SearchBookmarkKeywordAsString $Results.Keywords
                }

                $currentDSCBlock = Get-M365DSCExportContentForResource -ResourceName $ResourceName `
                    -ConnectionMode $ConnectionMode `
                    -ModulePath $PSScriptRoot `
                    -Results $Results `
                    -Credential $Credential

                if ($null -ne $Results.TargetedVariations)
                {
                    $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock `
                        -ParameterName 'TargetedVariations' -IsCIMArray:$true
                }
                if ($null -ne $Results.Keywords)
                {
                    $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock `
                        -ParameterName 'Keywords' -IsCIMArray:$false
                }
                $dscContent.Append($currentDSCBlock) | Out-Null

                Save-M365DSCPartialExport -Content $currentDSCBlock `
                    -FileName $Global:PartialExportFileName
            }
            Write-Host $Global:M365DSCEmojiGreenCheckMark
            $i++
        }
        return $dscContent.ToString()
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

function Get-M365DSCO365SearchBookmarkVariationAsString
{
    [CmdletBinding()]
    [OutputType([System.String])]
    param(
        [Parameter(Mandatory = $true)]
        [System.Collections.ArrayList]
        $Variations
    )

    $StringContent = [System.Text.StringBuilder]::New()
    $StringContent.Append('@(') | Out-Null
    foreach ($variation in $Variations)
    {
        $StringContent.Append("MSFT_O365SearchBookmarkVariation {`r`n") | Out-Null
        $DisplayNameValue = $variation.DisplayName
        if (-not [System.String]::IsNullOrEmpty($DisplayNameValue))
        {
            $DisplayNameValue = $variation.DisplayName.Replace("'", "''")
        }
        $StringContent.Append("                DisplayName  = '" + $DisplayNameValue + "'`r`n") | Out-Null
        $StringCOntent.Append("                WebUrl       = '" + $variation.WebUrl + "'`r`n") | Out-Null
        if (-not [System.String]::IsNullOrEmpty($variation.Description))
        {
            $DescriptionValue = $variation.Description.Replace("'", "''").Replace("`"", '`"')
            $StringContent.Append("                Description  = '" + $DescriptionValue + "'`r`n") | Out-Null
        }
        if (-not [System.String]::IsNullOrEmpty($variation.LanguageTag))
        {
            $StringContent.Append("                LanguageTag = '" + $variation.LanguageTag + "'`r`n") | Out-Null
        }
        if (-not [System.String]::IsNullOrEmpty($variation.Platform))
        {
            $StringContent.Append("                Platform    = '" + $variation.Platform + "'`r`n") | Out-Null
        }
        $StringContent.Append("            }`r`n") | Out-Null
    }
    $StringContent.Append('            )') | Out-Null
    return $StringContent.ToString()
}

function Get-M365DSCO365SearchBookmarkKeywordAsString
{
    [CmdletBinding()]
    [OutputType([System.String])]
    param(
        [Parameter(Mandatory = $true)]
        [System.Collections.ArrayList]
        $Keywords
    )

    $StringContent = [System.Text.StringBuilder]::New()
    $StringContent.Append("MSFT_O365SearchBookmarkKeyword {`r`n") | Out-Null
    $StringContent.Append("                Keywords             = @('" + ($Keywords.Keywords.Replace("'", "''") -join ''',''') + "')`r`n") | Out-Null
    $StringContent.Append("                MatchSimilarKeywords = `$" + $Keywords.MatchSimilarKeywords + "`r`n") | Out-Null
    if ($null -ne $Keywords.ReservedKeywords)
    {
        $StringContent.Append("                ReservedKeywords     = @('" + ($Keywords.ReservedKeywords.Replace("'", "''") -join ''',''') + "')`r`n") | Out-Null
    }
    $StringContent.Append("            }`r`n") | Out-Null
    return $StringContent.ToString()
}

Export-ModuleMember -Function *-TargetResource
