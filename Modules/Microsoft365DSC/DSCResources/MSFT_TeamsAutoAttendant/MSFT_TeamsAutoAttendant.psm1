function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [Parameter()]
        [System.String]
        $OperatorId,

        [Parameter()]
        [System.String]
        $OperatorType,

        [Parameter()]
        [System.String]
        $LanguageId,

        [Parameter()]
        [System.String]
        $VoiceId,

        [Parameter()]
        [System.UInt32]
        $TimeZoneId,

        [Parameter()]
        [System.Boolean]
        $VoiceResponseEnabled,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $DefaultCallFlow,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $CallFlows,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $Schedules,

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
        [System.String]
        $CertificateThumbprint
    )

    Write-Verbose -Message "Getting configuration of Teams Auto Attendant {$Name}"

    $ConnectionMode = New-M365DSCConnection -Workload 'MicrosoftTeams' `
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
        $autoAttendant = Get-CsAutoAttendant -NameFilter $Name `
            -ErrorAction SilentlyContinue | Where-Object -FilterScript {$_.Name -eq $Name}

        if ($null -eq $autoAttendant)
        {
            return $nullReturn
        }
        else
        {
            #region DefaultCallFlow
            $sb = [System.Text.StringBuilder]::New()
            $sb.Append("        MSFT_TeamsAutoAttendantDefaultCallFlow`r`n        {`r`n") | Out-Null
            $sb.Append("            Name                   = '$($autoAttendant.DefaultCallFlow.Name)'") | Out-Null
            $sb.Append("            ForceListenMenuEnabled = '$($autoAttendant.DefaultCallFlow.ForceListenMenuEnabled)'") | Out-Null
            $sb.Append("            Greetings              = MSFT_TeamsAutoAttendantPrompt`r`n            {`r`n") | Out-Null
            $sb.Append("                ActivityType       = '$($autoAttendant.DefaultCallFlow.Greetings[0].ActivityType)'`r`n") | Out-Null
            $sb.Append("                TextToSpeechPrompt = '$($autoAttendant.DefaultCallFlow.Greetings[0].TextToSpeechPrompt)'`r`n") | Out-Null
            $sb.Append("                AudioFilePrompt    = '$($autoAttendant.DefaultCallFlow.Greetings[0].AutioFilePrompt)'`r`n") | Out-Null
            $sb.Append("            }`r`n") | Out-Null
            $sb.Append("            Menu                   = MSFT_TeamsAutoAttendantMenu`r`n            {`r`n") | Out-Null
            $sb.Append("                Name = '$($autoAttendant.DefaultCallFLow.Menu.Name)'`r`n") | Out-Null
            $sb.Append("                Prompts = ") | Out-Null
            foreach ($prompt in $autoAttendant.DefaultCallFLow.Menu.Prompts)
            {
                $sb.Append("                    MSFT_TeamsAutoAttendantPrompt`r`n            {`r`n") | Out-Null
                $sb.Append("                        ActivityType       = '$($prompt.ActivityType)'`r`n") | Out-Null
                $sb.Append("                        TextToSpeechPrompt = '$($prompt.TextToSpeechPrompt)'`r`n") | Out-Null
                $sb.Append("                        AudioFilePrompt    = '$($prompt.AutioFilePrompt)'`r`n") | Out-Null
                $sb.Append("                    }`r`n") | Out-Null
            }
            $sb.Append("            }`r`n") | Out-Null
            $sb.Append("        }`r`n") | Out-Null
            $autoAttendant.
            #endregion

            return @{
                Name                  = $autoAttendant.Name
                OperatorId            = $autoAttendant.Operator.Id
                OperatorType          = $autoAttendant.Operator.Type
                LanguageId            = $autoAttendant.LanguageId
                VoiceId               = $autoAttendant.VoiceId
                TimeZoneId            = $autoAttendant.TimeZoneId
                EnableVoiceResponse   = $autoAttendant.VoiceResponseEnabled
                Ensure                = 'Present'
                Credential            = $Credential
                ApplicationId         = $ApplicationId
                TenantId              = $TenantId
                CertificateThumbprint = $CertificateThumbprint
            }
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
        [System.String]
        $Name,

        [Parameter()]
        [ValidateRange(15,180)]
        [System.UInt16]
        $AgentAlertTime,

        [Parameter()]
        [System.Boolean]
        $AllowOptOut,

        [Parameter()]
        [System.String[]]
        $DistributionLists,

        [Parameter()]
        [System.Boolean]
        $UseDefaultMusicOnHold,

        [Parameter()]
        [System.String]
        $WelcomeMusicAudioFileId,

        [Parameter()]
        [System.String]
        $MusicOnHoldAudioFileId,

        [Parameter()]
        [ValidateSet("DisconnectWithBusy","Forward","Voicemail","SharedVoicemail")]
        [System.String]
        $OverflowAction,

        [Parameter()]
        [System.String]
        $OverflowActionTarget,

        [Parameter()]
        [ValidateRange(0,200)]
        [System.UInt16]
        $OverflowThreshold,

        [Parameter()]
        [ValidateSet("Disconnect","Forward","Voicemail","SharedVoicemail")]
        [System.String]
        $TimeoutAction,

        [Parameter()]
        [System.String]
        $TimeoutActionTarget,

        [Parameter()]
        [ValidateRange(0,2700)]
        [System.UInt16]
        $TimeoutThreshold,

        [Parameter()]
        [ValidateSet("Attendant","Serial","RoundRobin","LongestIdle")]
        [System.String]
        $RoutingMethod,

        [Parameter()]
        [System.Boolean]
        $PresenceBasedRouting,

        [Parameter()]
        [System.Boolean]
        $ConferenceMode,

        [Parameter()]
        [System.String[]]
        $Users,

        [Parameter()]
        [System.String]
        $LanguageId,

        [Parameter()]
        [System.String[]]
        $OboResourceAccountIds,

        [Parameter()]
        [System.String]
        $OverflowDisconnectTextToSpeechPrompt,

        [Parameter()]
        [System.String]
        $OverflowDisconnectAudioFilePrompt,

        [Parameter()]
        [System.String]
        $OverflowRedirectPersonTextToSpeechPrompt,

        [Parameter()]
        [System.String]
        $OverflowRedirectPersonAudioFilePrompt,

        [Parameter()]
        [System.String]
        $OverflowRedirectVoiceAppTextToSpeechPrompt,

        [Parameter()]
        [System.String]
        $OverflowRedirectVoiceAppAudioFilePrompt,

        [Parameter()]
        [System.String]
        $OverflowRedirectPhoneNumberTextToSpeechPrompt,

        [Parameter()]
        [System.String]
        $OverflowRedirectPhoneNumberAudioFilePrompt,

        [Parameter()]
        [System.String]
        $OverflowRedirectVoicemailTextToSpeechPrompt,

        [Parameter()]
        [System.String]
        $OverflowRedirectVoicemailAudioFilePrompt,

        [Parameter()]
        [System.String]
        $OverflowSharedVoicemailTextToSpeechPrompt,

        [Parameter()]
        [System.String]
        $OverflowSharedVoicemailAudioFilePrompt,

        [Parameter()]
        [System.Boolean]
        $EnableOverflowSharedVoicemailTranscription,

        [Parameter()]
        [System.String]
        $TimeoutDisconnectTextToSpeechPrompt,

        [Parameter()]
        [System.String]
        $TimeoutDisconnectAudioFilePrompt,

        [Parameter()]
        [System.String]
        $TimeoutRedirectPersonTextToSpeechPrompt,

        [Parameter()]
        [System.String]
        $TimeoutRedirectPersonAudioFilePrompt,

        [Parameter()]
        [System.String]
        $TimeoutRedirectVoiceAppTextToSpeechPrompt,

        [Parameter()]
        [System.String]
        $TimeoutRedirectVoiceAppAudioFilePrompt,

        [Parameter()]
        [System.String]
        $TimeoutRedirectPhoneNumberTextToSpeechPrompt,

        [Parameter()]
        [System.String]
        $TimeoutRedirectPhoneNumberAudioFilePrompt,

        [Parameter()]
        [System.String]
        $TimeoutRedirectVoicemailTextToSpeechPrompt,

        [Parameter()]
        [System.String]
        $TimeoutRedirectVoicemailAudioFilePrompt,

        [Parameter()]
        [System.String]
        $TimeoutSharedVoicemailTextToSpeechPrompt,

        [Parameter()]
        [System.String]
        $TimeoutSharedVoicemailAudioFilePrompt,

        [Parameter()]
        [System.Boolean]
        $EnableTimeoutSharedVoicemailTranscription,

        [Parameter()]
        [System.String]
        $ChannelId,

        [Parameter()]
        [System.String]
        $ChannelUserObjectId,

        [Parameter()]
        [System.String[]]
        $AuthorizedUsers,

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
        [System.String]
        $CertificateThumbprint
    )

    Write-Verbose -Message "Setting configuration of Teams Call Queue {$Name}"

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

    $ConnectionMode = New-M365DSCConnection -Workload 'MicrosoftTeams' `
        -InboundParameters $PSBoundParameters

    $currentValues = Get-TargetResource @PSBoundParameters

    $opsParameters = $PSBoundParameters
    $opsParameters.Remove('Credential') | Out-Null
    $opsParameters.Remove('ApplicationId') | Out-Null
    $opsParameters.Remove('TenantId') | Out-Null
    $opsParameters.Remove('CertificateThumbprint') | Out-Null
    $opsParameters.Remove('Ensure') | Out-Null

    if ($currentValues.Ensure -eq 'Absent' -and 'Present' -eq $Ensure )
    {
        Write-Verbose -Message "Creating a new Teams Call Queue {$Name}"
        New-CsCallQueue @opsParameters
    }
    elseif (($currentValues.Ensure -eq 'Present' -and 'Present' -eq $Ensure))
    {
        Write-Verbose -Message "Updating Teams Call Queue {$Name}"
        $queue = Get-CsCallQueue -NameFilter $Name
        $opsParameters.Add('Identity', $queue.Id)
        Set-CsCallQueue @opsParameters
    }
    elseif (($Ensure -eq 'Absent' -and $currentValues.Ensure -eq 'Present'))
    {
        Write-Verbose -Message "Removing Teams Call Queue {$Name}"
        $queue = Get-CsCallQueue -NameFilter $Name
        Remove-CsCallQueue -Identity $queue.Id
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
        $Name,

        [Parameter()]
        [ValidateRange(15,180)]
        [System.UInt16]
        $AgentAlertTime,

        [Parameter()]
        [System.Boolean]
        $AllowOptOut,

        [Parameter()]
        [System.String[]]
        $DistributionLists,

        [Parameter()]
        [System.Boolean]
        $UseDefaultMusicOnHold,

        [Parameter()]
        [System.String]
        $WelcomeMusicAudioFileId,

        [Parameter()]
        [System.String]
        $MusicOnHoldAudioFileId,

        [Parameter()]
        [ValidateSet("DisconnectWithBusy","Forward","Voicemail","SharedVoicemail")]
        [System.String]
        $OverflowAction,

        [Parameter()]
        [System.String]
        $OverflowActionTarget,

        [Parameter()]
        [ValidateRange(0,200)]
        [System.UInt16]
        $OverflowThreshold,

        [Parameter()]
        [ValidateSet("Disconnect","Forward","Voicemail","SharedVoicemail")]
        [System.String]
        $TimeoutAction,

        [Parameter()]
        [System.String]
        $TimeoutActionTarget,

        [Parameter()]
        [ValidateRange(0,2700)]
        [System.UInt16]
        $TimeoutThreshold,

        [Parameter()]
        [ValidateSet("Attendant","Serial","RoundRobin","LongestIdle")]
        [System.String]
        $RoutingMethod,

        [Parameter()]
        [System.Boolean]
        $PresenceBasedRouting,

        [Parameter()]
        [System.Boolean]
        $ConferenceMode,

        [Parameter()]
        [System.String[]]
        $Users,

        [Parameter()]
        [System.String]
        $LanguageId,

        [Parameter()]
        [System.String[]]
        $OboResourceAccountIds,

        [Parameter()]
        [System.String]
        $OverflowDisconnectTextToSpeechPrompt,

        [Parameter()]
        [System.String]
        $OverflowDisconnectAudioFilePrompt,

        [Parameter()]
        [System.String]
        $OverflowRedirectPersonTextToSpeechPrompt,

        [Parameter()]
        [System.String]
        $OverflowRedirectPersonAudioFilePrompt,

        [Parameter()]
        [System.String]
        $OverflowRedirectVoiceAppTextToSpeechPrompt,

        [Parameter()]
        [System.String]
        $OverflowRedirectVoiceAppAudioFilePrompt,

        [Parameter()]
        [System.String]
        $OverflowRedirectPhoneNumberTextToSpeechPrompt,

        [Parameter()]
        [System.String]
        $OverflowRedirectPhoneNumberAudioFilePrompt,

        [Parameter()]
        [System.String]
        $OverflowRedirectVoicemailTextToSpeechPrompt,

        [Parameter()]
        [System.String]
        $OverflowRedirectVoicemailAudioFilePrompt,

        [Parameter()]
        [System.String]
        $OverflowSharedVoicemailTextToSpeechPrompt,

        [Parameter()]
        [System.String]
        $OverflowSharedVoicemailAudioFilePrompt,

        [Parameter()]
        [System.Boolean]
        $EnableOverflowSharedVoicemailTranscription,

        [Parameter()]
        [System.String]
        $TimeoutDisconnectTextToSpeechPrompt,

        [Parameter()]
        [System.String]
        $TimeoutDisconnectAudioFilePrompt,

        [Parameter()]
        [System.String]
        $TimeoutRedirectPersonTextToSpeechPrompt,

        [Parameter()]
        [System.String]
        $TimeoutRedirectPersonAudioFilePrompt,

        [Parameter()]
        [System.String]
        $TimeoutRedirectVoiceAppTextToSpeechPrompt,

        [Parameter()]
        [System.String]
        $TimeoutRedirectVoiceAppAudioFilePrompt,

        [Parameter()]
        [System.String]
        $TimeoutRedirectPhoneNumberTextToSpeechPrompt,

        [Parameter()]
        [System.String]
        $TimeoutRedirectPhoneNumberAudioFilePrompt,

        [Parameter()]
        [System.String]
        $TimeoutRedirectVoicemailTextToSpeechPrompt,

        [Parameter()]
        [System.String]
        $TimeoutRedirectVoicemailAudioFilePrompt,

        [Parameter()]
        [System.String]
        $TimeoutSharedVoicemailTextToSpeechPrompt,

        [Parameter()]
        [System.String]
        $TimeoutSharedVoicemailAudioFilePrompt,

        [Parameter()]
        [System.Boolean]
        $EnableTimeoutSharedVoicemailTranscription,

        [Parameter()]
        [System.String]
        $ChannelId,

        [Parameter()]
        [System.String]
        $ChannelUserObjectId,

        [Parameter()]
        [System.String[]]
        $AuthorizedUsers,

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
        [System.String]
        $CertificateThumbprint
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

    Write-Verbose -Message "Testing configuration of Teams Call Queue {$Name}"

    $CurrentValues = Get-TargetResource @PSBoundParameters

    Write-Verbose -Message "Current Values: $(Convert-M365DscHashtableToString -Hashtable $CurrentValues)"
    Write-Verbose -Message "Target Values: $(Convert-M365DscHashtableToString -Hashtable $PSBoundParameters)"

    $ValuesToCheck = $PSBoundParameters

    $TestResult = Test-M365DSCParameterState `
        -CurrentValues $CurrentValues `
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
        [System.String]
        $CertificateThumbprint
    )
    $ConnectionMode = New-M365DSCConnection -Workload 'MicrosoftTeams' `
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

    try
    {
        $i = 1
        $Script:ExportMode = $true
        [array] $Script:exportedInstances = Get-CsCallQueue -ErrorAction Stop
        $dscContent = [System.Text.StringBuilder]::New()
        Write-Host "`r`n" -NoNewline
        foreach ($instance in $exportedInstances)
        {
            Write-Host "    |---[$i/$($exportedInstances.Count)] $($instance.Name)" -NoNewline

            $params = @{
                Name                  = $instance.Name
                Ensure                = 'Present'
                Credential            = $Credential
                ApplicationId         = $ApplicationId
                TenantId              = $TenantId
                CertificateThumbprint = $CertificateThumbprint
            }
            $Results = Get-TargetResource @Params
            $Results = Update-M365DSCExportAuthenticationResults -ConnectionMode $ConnectionMode `
                -Results $Results
            $currentDSCBlock = Get-M365DSCExportContentForResource -ResourceName $ResourceName `
                -ConnectionMode $ConnectionMode `
                -ModulePath $PSScriptRoot `
                -Results $Results `
                -Credential $Credential
            $dscContent.Append($currentDSCBlock) | Out-Null
            Save-M365DSCPartialExport -Content $currentDSCBlock `
                -FileName $Global:PartialExportFileName
            $i++
            Write-Host $Global:M365DSCEmojiGreenCheckMark
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

Export-ModuleMember -Function *-TargetResource
