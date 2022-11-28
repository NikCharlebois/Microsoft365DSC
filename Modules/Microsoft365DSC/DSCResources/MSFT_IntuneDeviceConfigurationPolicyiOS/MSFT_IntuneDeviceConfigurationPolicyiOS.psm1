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
        [System.String]
        $DisplayName,

        [Parameter()]
        [System.Boolean]
        $AccountBlockModification,

        [Parameter()]
        [System.Boolean]
        $ActivationLockAllowWhenSupervised,

        [Parameter()]
        [System.Boolean]
        $AirDropBlocked,

        [Parameter()]
        [System.Boolean]
        $AirDropForceUnmanagedDropTarget,

        [Parameter()]
        [System.Boolean]
        $AirPlayForcePairingPasswordForOutgoingRequests,

        [Parameter()]
        [System.Boolean]
        $AppleNewsBlocked,

        [Parameter()]
        [System.Boolean]
        $AppleWatchBlockPairing,

        [Parameter()]
        [System.Boolean]
        $AppleWatchForceWristDetection,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $AppsSingleAppModeList,

        [Parameter()]
        [System.Boolean]
        $AppStoreBlockAutomaticDownloads,

        [Parameter()]
        [System.Boolean]
        $AppStoreBlocked,

        [Parameter()]
        [System.Boolean]
        $AppStoreBlockInAppPurchases,

        [Parameter()]
        [System.Boolean]
        $AppStoreBlockUIAppInstallation,

        [Parameter()]
        [System.Boolean]
        $AppStoreRequirePassword,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $AppsVisibilityList,

        [Parameter()]
        [ValidateSet('none','appsInListCompliant','appsNotInListCompliant')]
        [System.String]
        $AppsVisibilityListType,

        [Parameter()]
        [System.Boolean]
        $BluetoothBlockModification,

        [Parameter()]
        [System.Boolean]
        $CameraBlocked,

        [Parameter()]
        [System.Boolean]
        $CellularBlockDataRoaming,

        [Parameter()]
        [System.Boolean]
        $CellularBlockGlobalBackgroundFetchWhileRoaming,

        [Parameter()]
        [System.Boolean]
        $CellularBlockPerAppDataModification,

        [Parameter()]
        [System.Boolean]
        $CellularBlockPersonalHotspot,

        [Parameter()]
        [System.Boolean]
        $CellularBlockVoiceRoaming,

        [Parameter()]
        [System.Boolean]
        $CertificatesBlockUntrustedTlsCertificates,

        [Parameter()]
        [System.Boolean]
        $ClassroomAppBlockRemoteScreenObservation,

        [Parameter()]
        [System.Boolean]
        $ClassroomAppForceUnpromptedScreenObservation,

        [Parameter()]
        [ValidateSet('none','appsInListCompliant','appsNotInListCompliant')]
        [System.String]
        $CompliantAppListType,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $CompliantAppsList,

        [Parameter()]
        [System.Boolean]
        $ConfigurationProfileBlockChanges,

        [Parameter()]
        [System.Boolean]
        $DefinitionLookupBlocked,

        [Parameter()]
        [System.Boolean]
        $DeviceBlockEnableRestrictions,

        [Parameter()]
        [System.Boolean]
        $DeviceBlockEraseContentAndSettings,

        [Parameter()]
        [System.Boolean]
        $DeviceBlockNameModification,

        [Parameter()]
        [System.Boolean]
        $DiagnosticDataBlockSubmission,

        [Parameter()]
        [System.Boolean]
        $DiagnosticDataBlockSubmissionModification,

        [Parameter()]
        [System.Boolean]
        $DocumentsBlockManagedDocumentsInUnmanagedApps,

        [Parameter()]
        [System.Boolean]
        $DocumentsBlockUnmanagedDocumentsInManagedApps,

        [Parameter()]
        [System.String[]]
        $EmailInDomainSuffixes,

        [Parameter()]
        [System.Boolean]
        $EnterpriseAppBlockTrust,

        [Parameter()]
        [System.Boolean]
        $EnterpriseAppBlockTrustModification,

        [Parameter()]
        [System.Boolean]
        $FaceTimeBlocked,

        [Parameter()]
        [System.Boolean]
        $FindMyFriendsBlocked,

        [Parameter()]
        [System.Boolean]
        $GameCenterBlocked,

        [Parameter()]
        [System.Boolean]
        $GamingBlockGameCenterFriends,

        [Parameter()]
        [System.Boolean]
        $GamingBlockMultiplayer,

        [Parameter()]
        [System.Boolean]
        $HostPairingBlocked,

        [Parameter()]
        [System.Boolean]
        $IBooksStoreBlocked,

        [Parameter()]
        [System.Boolean]
        $IBooksStoreBlockErotica,

        [Parameter()]
        [System.Boolean]
        $ICloudBlockActivityContinuation,

        [Parameter()]
        [System.Boolean]
        $ICloudBlockBackup,

        [Parameter()]
        [System.Boolean]
        $ICloudBlockDocumentSync,

        [Parameter()]
        [System.Boolean]
        $ICloudBlockManagedAppsSync,

        [Parameter()]
        [System.Boolean]
        $ICloudBlockPhotoLibrary,

        [Parameter()]
        [System.Boolean]
        $ICloudBlockPhotoStreamSync,

        [Parameter()]
        [System.Boolean]
        $ICloudBlockSharedPhotoStream,

        [Parameter()]
        [System.Boolean]
        $ICloudRequireEncryptedBackup,

        [Parameter()]
        [System.Boolean]
        $ITunesBlockExplicitContent,

        [Parameter()]
        [System.Boolean]
        $ITunesBlockMusicService,

        [Parameter()]
        [System.Boolean]
        $ITunesBlockRadio,

        [Parameter()]
        [System.Boolean]
        $KeyboardBlockAutoCorrect,

        [Parameter()]
        [System.Boolean]
        $KeyboardBlockDictation,

        [Parameter()]
        [System.Boolean]
        $KeyboardBlockPredictive,

        [Parameter()]
        [System.Boolean]
        $KeyboardBlockShortcuts,

        [Parameter()]
        [System.Boolean]
        $KeyboardBlockSpellCheck,

        [Parameter()]
        [System.Boolean]
        $KioskModeAllowAssistiveSpeak,

        [Parameter()]
        [System.Boolean]
        $KioskModeAllowAssistiveTouchSettings,

        [Parameter()]
        [System.Boolean]
        $KioskModeAllowAutoLock,

        [Parameter()]
        [System.Boolean]
        $KioskModeAllowColorInversionSettings,

        [Parameter()]
        [System.Boolean]
        $KioskModeAllowRingerSwitch,

        [Parameter()]
        [System.Boolean]
        $KioskModeAllowScreenRotation,

        [Parameter()]
        [System.Boolean]
        $KioskModeAllowSleepButton,

        [Parameter()]
        [System.Boolean]
        $KioskModeAllowTouchscreen,

        [Parameter()]
        [System.Boolean]
        $KioskModeAllowVoiceOverSettings,

        [Parameter()]
        [System.Boolean]
        $KioskModeAllowVolumeButtons,

        [Parameter()]
        [System.Boolean]
        $KioskModeAllowZoomSettings,

        [Parameter()]
        [System.String]
        $KioskModeAppStoreUrl,

        [Parameter()]
        [System.String]
        $KioskModeBuiltInAppId,

        [Parameter()]
        [System.String]
        $KioskModeManagedAppId,

        [Parameter()]
        [System.Boolean]
        $KioskModeRequireAssistiveTouch,

        [Parameter()]
        [System.Boolean]
        $KioskModeRequireColorInversion,

        [Parameter()]
        [System.Boolean]
        $KioskModeRequireMonoAudio,

        [Parameter()]
        [System.Boolean]
        $KioskModeRequireVoiceOver,

        [Parameter()]
        [System.Boolean]
        $KioskModeRequireZoom,

        [Parameter()]
        [System.Boolean]
        $LockScreenBlockControlCenter,

        [Parameter()]
        [System.Boolean]
        $LockScreenBlockNotificationView,

        [Parameter()]
        [System.Boolean]
        $LockScreenBlockPassbook,

        [Parameter()]
        [System.Boolean]
        $LockScreenBlockTodayView,

        [Parameter()]
        [ValidateSet('allAllowed','allBlocked','agesAbove4','agesAbove9','agesAbove12','agesAbove17')]
        [System.String]
        $MediaContentRatingApps,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $MediaContentRatingAustralia,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $MediaContentRatingCanada,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $MediaContentRatingFrance,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $MediaContentRatingGermany,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $MediaContentRatingIreland,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $MediaContentRatingJapan,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $MediaContentRatingNewZealand,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $MediaContentRatingUnitedKingdom,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $MediaContentRatingUnitedStates,

        [Parameter()]
        [System.Boolean]
        $MessagesBlocked,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $NetworkUsageRules,

        [Parameter()]
        [System.Boolean]
        $NotificationsBlockSettingsModification,

        [Parameter()]
        [System.Boolean]
        $PasscodeBlockFingerprintModification,

        [Parameter()]
        [System.Boolean]
        $PasscodeBlockFingerprintUnlock,

        [Parameter()]
        [System.Boolean]
        $PasscodeBlockModification,

        [Parameter()]
        [System.Boolean]
        $PasscodeBlockSimple,

        [Parameter()]
        [System.Int32]
        $PasscodeExpirationDays,

        [Parameter()]
        [System.Int32]
        $PasscodeMinimumCharacterSetCount,

        [Parameter()]
        [System.Int32]
        $PasscodeMinimumLength,

        [Parameter()]
        [System.Int32]
        $PasscodeMinutesOfInactivityBeforeLock,

        [Parameter()]
        [System.Int32]
        $PasscodeMinutesOfInactivityBeforeScreenTimeout,

        [Parameter()]
        [System.Int32]
        $PasscodePreviousPasscodeBlockCount,

        [Parameter()]
        [System.Boolean]
        $PasscodeRequired,

        [Parameter()]
        [ValidateSet('deviceDefault','alphanumeric','numeric')]
        [System.String]
        $PasscodeRequiredType,

        [Parameter()]
        [System.Int32]
        $PasscodeSignInFailureCountBeforeWipe,

        [Parameter()]
        [System.Boolean]
        $PodcastsBlocked,

        [Parameter()]
        [System.Boolean]
        $SafariBlockAutofill,

        [Parameter()]
        [System.Boolean]
        $SafariBlocked,

        [Parameter()]
        [System.Boolean]
        $SafariBlockJavaScript,

        [Parameter()]
        [System.Boolean]
        $SafariBlockPopups,

        [Parameter()]
        [ValidateSet('browserDefault','blockAlways','allowCurrentWebSite','allowFromWebsitesVisited','allowAlways')]
        [System.String]
        $SafariCookieSettings,

        [Parameter()]
        [System.String[]]
        $SafariManagedDomains,

        [Parameter()]
        [System.String[]]
        $SafariPasswordAutoFillDomains,

        [Parameter()]
        [System.Boolean]
        $SafariRequireFraudWarning,

        [Parameter()]
        [System.Boolean]
        $ScreenCaptureBlocked,

        [Parameter()]
        [System.Boolean]
        $SiriBlocked,

        [Parameter()]
        [System.Boolean]
        $SiriBlockedWhenLocked,

        [Parameter()]
        [System.Boolean]
        $SiriBlockUserGeneratedContent,

        [Parameter()]
        [System.Boolean]
        $SiriRequireProfanityFilter,

        [Parameter()]
        [System.Boolean]
        $SpotlightBlockInternetResults,

        [Parameter()]
        [System.Boolean]
        $VoiceDialingBlocked,

        [Parameter()]
        [System.Boolean]
        $WallpaperBlockModification,

        [Parameter()]
        [System.Boolean]
        $WiFiConnectOnlyToConfiguredNetworks,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $DeviceSettingStateSummaries,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $DeviceStatuses,

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
            -ProfileName 'v1.0'

        Select-MgProfile 'v1.0'
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
            AccountBlockModification = $getValue.AdditionalProperties.accountBlockModification
            ActivationLockAllowWhenSupervised = $getValue.AdditionalProperties.activationLockAllowWhenSupervised
            AirDropBlocked = $getValue.AdditionalProperties.airDropBlocked
            AirDropForceUnmanagedDropTarget = $getValue.AdditionalProperties.airDropForceUnmanagedDropTarget
            AirPlayForcePairingPasswordForOutgoingRequests = $getValue.AdditionalProperties.airPlayForcePairingPasswordForOutgoingRequests
            AppleNewsBlocked = $getValue.AdditionalProperties.appleNewsBlocked
            AppleWatchBlockPairing = $getValue.AdditionalProperties.appleWatchBlockPairing
            AppleWatchForceWristDetection = $getValue.AdditionalProperties.appleWatchForceWristDetection
            AppStoreBlockAutomaticDownloads = $getValue.AdditionalProperties.appStoreBlockAutomaticDownloads
            AppStoreBlocked = $getValue.AdditionalProperties.appStoreBlocked
            AppStoreBlockInAppPurchases = $getValue.AdditionalProperties.appStoreBlockInAppPurchases
            AppStoreBlockUIAppInstallation = $getValue.AdditionalProperties.appStoreBlockUIAppInstallation
            AppStoreRequirePassword = $getValue.AdditionalProperties.appStoreRequirePassword
            AppsVisibilityListType = $getValue.AdditionalProperties.appsVisibilityListType
            BluetoothBlockModification = $getValue.AdditionalProperties.bluetoothBlockModification
            CameraBlocked = $getValue.AdditionalProperties.cameraBlocked
            CellularBlockDataRoaming = $getValue.AdditionalProperties.cellularBlockDataRoaming
            CellularBlockGlobalBackgroundFetchWhileRoaming = $getValue.AdditionalProperties.cellularBlockGlobalBackgroundFetchWhileRoaming
            CellularBlockPerAppDataModification = $getValue.AdditionalProperties.cellularBlockPerAppDataModification
            CellularBlockPersonalHotspot = $getValue.AdditionalProperties.cellularBlockPersonalHotspot
            CellularBlockVoiceRoaming = $getValue.AdditionalProperties.cellularBlockVoiceRoaming
            CertificatesBlockUntrustedTlsCertificates = $getValue.AdditionalProperties.certificatesBlockUntrustedTlsCertificates
            ClassroomAppBlockRemoteScreenObservation = $getValue.AdditionalProperties.classroomAppBlockRemoteScreenObservation
            ClassroomAppForceUnpromptedScreenObservation = $getValue.AdditionalProperties.classroomAppForceUnpromptedScreenObservation
            CompliantAppListType = $getValue.AdditionalProperties.compliantAppListType
            ConfigurationProfileBlockChanges = $getValue.AdditionalProperties.configurationProfileBlockChanges
            DefinitionLookupBlocked = $getValue.AdditionalProperties.definitionLookupBlocked
            DeviceBlockEnableRestrictions = $getValue.AdditionalProperties.deviceBlockEnableRestrictions
            DeviceBlockEraseContentAndSettings = $getValue.AdditionalProperties.deviceBlockEraseContentAndSettings
            DeviceBlockNameModification = $getValue.AdditionalProperties.deviceBlockNameModification
            DiagnosticDataBlockSubmission = $getValue.AdditionalProperties.diagnosticDataBlockSubmission
            DiagnosticDataBlockSubmissionModification = $getValue.AdditionalProperties.diagnosticDataBlockSubmissionModification
            DocumentsBlockManagedDocumentsInUnmanagedApps = $getValue.AdditionalProperties.documentsBlockManagedDocumentsInUnmanagedApps
            DocumentsBlockUnmanagedDocumentsInManagedApps = $getValue.AdditionalProperties.documentsBlockUnmanagedDocumentsInManagedApps
            EmailInDomainSuffixes = $getValue.AdditionalProperties.emailInDomainSuffixes
            EnterpriseAppBlockTrust = $getValue.AdditionalProperties.enterpriseAppBlockTrust
            EnterpriseAppBlockTrustModification = $getValue.AdditionalProperties.enterpriseAppBlockTrustModification
            FaceTimeBlocked = $getValue.AdditionalProperties.faceTimeBlocked
            FindMyFriendsBlocked = $getValue.AdditionalProperties.findMyFriendsBlocked
            GameCenterBlocked = $getValue.AdditionalProperties.gameCenterBlocked
            GamingBlockGameCenterFriends = $getValue.AdditionalProperties.gamingBlockGameCenterFriends
            GamingBlockMultiplayer = $getValue.AdditionalProperties.gamingBlockMultiplayer
            HostPairingBlocked = $getValue.AdditionalProperties.hostPairingBlocked
            IBooksStoreBlocked = $getValue.AdditionalProperties.iBooksStoreBlocked
            IBooksStoreBlockErotica = $getValue.AdditionalProperties.iBooksStoreBlockErotica
            ICloudBlockActivityContinuation = $getValue.AdditionalProperties.iCloudBlockActivityContinuation
            ICloudBlockBackup = $getValue.AdditionalProperties.iCloudBlockBackup
            ICloudBlockDocumentSync = $getValue.AdditionalProperties.iCloudBlockDocumentSync
            ICloudBlockManagedAppsSync = $getValue.AdditionalProperties.iCloudBlockManagedAppsSync
            ICloudBlockPhotoLibrary = $getValue.AdditionalProperties.iCloudBlockPhotoLibrary
            ICloudBlockPhotoStreamSync = $getValue.AdditionalProperties.iCloudBlockPhotoStreamSync
            ICloudBlockSharedPhotoStream = $getValue.AdditionalProperties.iCloudBlockSharedPhotoStream
            ICloudRequireEncryptedBackup = $getValue.AdditionalProperties.iCloudRequireEncryptedBackup
            ITunesBlockExplicitContent = $getValue.AdditionalProperties.iTunesBlockExplicitContent
            ITunesBlockMusicService = $getValue.AdditionalProperties.iTunesBlockMusicService
            ITunesBlockRadio = $getValue.AdditionalProperties.iTunesBlockRadio
            KeyboardBlockAutoCorrect = $getValue.AdditionalProperties.keyboardBlockAutoCorrect
            KeyboardBlockDictation = $getValue.AdditionalProperties.keyboardBlockDictation
            KeyboardBlockPredictive = $getValue.AdditionalProperties.keyboardBlockPredictive
            KeyboardBlockShortcuts = $getValue.AdditionalProperties.keyboardBlockShortcuts
            KeyboardBlockSpellCheck = $getValue.AdditionalProperties.keyboardBlockSpellCheck
            KioskModeAllowAssistiveSpeak = $getValue.AdditionalProperties.kioskModeAllowAssistiveSpeak
            KioskModeAllowAssistiveTouchSettings = $getValue.AdditionalProperties.kioskModeAllowAssistiveTouchSettings
            KioskModeAllowAutoLock = $getValue.AdditionalProperties.kioskModeAllowAutoLock
            KioskModeAllowColorInversionSettings = $getValue.AdditionalProperties.kioskModeAllowColorInversionSettings
            KioskModeAllowRingerSwitch = $getValue.AdditionalProperties.kioskModeAllowRingerSwitch
            KioskModeAllowScreenRotation = $getValue.AdditionalProperties.kioskModeAllowScreenRotation
            KioskModeAllowSleepButton = $getValue.AdditionalProperties.kioskModeAllowSleepButton
            KioskModeAllowTouchscreen = $getValue.AdditionalProperties.kioskModeAllowTouchscreen
            KioskModeAllowVoiceOverSettings = $getValue.AdditionalProperties.kioskModeAllowVoiceOverSettings
            KioskModeAllowVolumeButtons = $getValue.AdditionalProperties.kioskModeAllowVolumeButtons
            KioskModeAllowZoomSettings = $getValue.AdditionalProperties.kioskModeAllowZoomSettings
            KioskModeAppStoreUrl = $getValue.AdditionalProperties.kioskModeAppStoreUrl
            KioskModeBuiltInAppId = $getValue.AdditionalProperties.kioskModeBuiltInAppId
            KioskModeManagedAppId = $getValue.AdditionalProperties.kioskModeManagedAppId
            KioskModeRequireAssistiveTouch = $getValue.AdditionalProperties.kioskModeRequireAssistiveTouch
            KioskModeRequireColorInversion = $getValue.AdditionalProperties.kioskModeRequireColorInversion
            KioskModeRequireMonoAudio = $getValue.AdditionalProperties.kioskModeRequireMonoAudio
            KioskModeRequireVoiceOver = $getValue.AdditionalProperties.kioskModeRequireVoiceOver
            KioskModeRequireZoom = $getValue.AdditionalProperties.kioskModeRequireZoom
            LockScreenBlockControlCenter = $getValue.AdditionalProperties.lockScreenBlockControlCenter
            LockScreenBlockNotificationView = $getValue.AdditionalProperties.lockScreenBlockNotificationView
            LockScreenBlockPassbook = $getValue.AdditionalProperties.lockScreenBlockPassbook
            LockScreenBlockTodayView = $getValue.AdditionalProperties.lockScreenBlockTodayView
            MediaContentRatingApps = $getValue.AdditionalProperties.mediaContentRatingApps
            MessagesBlocked = $getValue.AdditionalProperties.messagesBlocked
            NotificationsBlockSettingsModification = $getValue.AdditionalProperties.notificationsBlockSettingsModification
            PasscodeBlockFingerprintModification = $getValue.AdditionalProperties.passcodeBlockFingerprintModification
            PasscodeBlockFingerprintUnlock = $getValue.AdditionalProperties.passcodeBlockFingerprintUnlock
            PasscodeBlockModification = $getValue.AdditionalProperties.passcodeBlockModification
            PasscodeBlockSimple = $getValue.AdditionalProperties.passcodeBlockSimple
            PasscodeExpirationDays = $getValue.AdditionalProperties.passcodeExpirationDays
            PasscodeMinimumCharacterSetCount = $getValue.AdditionalProperties.passcodeMinimumCharacterSetCount
            PasscodeMinimumLength = $getValue.AdditionalProperties.passcodeMinimumLength
            PasscodeMinutesOfInactivityBeforeLock = $getValue.AdditionalProperties.passcodeMinutesOfInactivityBeforeLock
            PasscodeMinutesOfInactivityBeforeScreenTimeout = $getValue.AdditionalProperties.passcodeMinutesOfInactivityBeforeScreenTimeout
            PasscodePreviousPasscodeBlockCount = $getValue.AdditionalProperties.passcodePreviousPasscodeBlockCount
            PasscodeRequired = $getValue.AdditionalProperties.passcodeRequired
            PasscodeRequiredType = $getValue.AdditionalProperties.passcodeRequiredType
            PasscodeSignInFailureCountBeforeWipe = $getValue.AdditionalProperties.passcodeSignInFailureCountBeforeWipe
            PodcastsBlocked = $getValue.AdditionalProperties.podcastsBlocked
            SafariBlockAutofill = $getValue.AdditionalProperties.safariBlockAutofill
            SafariBlocked = $getValue.AdditionalProperties.safariBlocked
            SafariBlockJavaScript = $getValue.AdditionalProperties.safariBlockJavaScript
            SafariBlockPopups = $getValue.AdditionalProperties.safariBlockPopups
            SafariCookieSettings = $getValue.AdditionalProperties.safariCookieSettings
            SafariManagedDomains = $getValue.AdditionalProperties.safariManagedDomains
            SafariPasswordAutoFillDomains = $getValue.AdditionalProperties.safariPasswordAutoFillDomains
            SafariRequireFraudWarning = $getValue.AdditionalProperties.safariRequireFraudWarning
            ScreenCaptureBlocked = $getValue.AdditionalProperties.screenCaptureBlocked
            SiriBlocked = $getValue.AdditionalProperties.siriBlocked
            SiriBlockedWhenLocked = $getValue.AdditionalProperties.siriBlockedWhenLocked
            SiriBlockUserGeneratedContent = $getValue.AdditionalProperties.siriBlockUserGeneratedContent
            SiriRequireProfanityFilter = $getValue.AdditionalProperties.siriRequireProfanityFilter
            SpotlightBlockInternetResults = $getValue.AdditionalProperties.spotlightBlockInternetResults
            VoiceDialingBlocked = $getValue.AdditionalProperties.voiceDialingBlocked
            WallpaperBlockModification = $getValue.AdditionalProperties.wallpaperBlockModification
            WiFiConnectOnlyToConfiguredNetworks = $getValue.AdditionalProperties.wiFiConnectOnlyToConfiguredNetworks

            
            Ensure                = 'Present'
            Credential            = $Credential
            ApplicationId         = $ApplicationId
            TenantId              = $TenantId
            ApplicationSecret     = $ApplicationSecret
            CertificateThumbprint = $CertificateThumbprint
            Managedidentity       = $ManagedIdentity.IsPresent
        }
        if ($getValue.additionalProperties.appsSingleAppModeList)
        {
            $results.Add("AppsSingleAppModeList", $getValue.additionalProperties.appsSingleAppModeList)
        }
        if ($getValue.additionalProperties.appsVisibilityList)
        {
            $results.Add("AppsVisibilityList", $getValue.additionalProperties.appsVisibilityList)
        }
        if ($getValue.additionalProperties.compliantAppsList)
        {
            $results.Add("CompliantAppsList", $getValue.additionalProperties.compliantAppsList)
        }
        if ($getValue.additionalProperties.mediaContentRatingAustralia)
        {
            $results.Add("MediaContentRatingAustralia", $getValue.additionalProperties.mediaContentRatingAustralia)
        }
        if ($getValue.additionalProperties.mediaContentRatingCanada)
        {
            $results.Add("MediaContentRatingCanada", $getValue.additionalProperties.mediaContentRatingCanada)
        }
        if ($getValue.additionalProperties.mediaContentRatingFrance)
        {
            $results.Add("MediaContentRatingFrance", $getValue.additionalProperties.mediaContentRatingFrance)
        }
        if ($getValue.additionalProperties.mediaContentRatingGermany)
        {
            $results.Add("MediaContentRatingGermany", $getValue.additionalProperties.mediaContentRatingGermany)
        }
        if ($getValue.additionalProperties.mediaContentRatingIreland)
        {
            $results.Add("MediaContentRatingIreland", $getValue.additionalProperties.mediaContentRatingIreland)
        }
        if ($getValue.additionalProperties.mediaContentRatingJapan)
        {
            $results.Add("MediaContentRatingJapan", $getValue.additionalProperties.mediaContentRatingJapan)
        }
        if ($getValue.additionalProperties.mediaContentRatingNewZealand)
        {
            $results.Add("MediaContentRatingNewZealand", $getValue.additionalProperties.mediaContentRatingNewZealand)
        }
        if ($getValue.additionalProperties.mediaContentRatingUnitedKingdom)
        {
            $results.Add("MediaContentRatingUnitedKingdom", $getValue.additionalProperties.mediaContentRatingUnitedKingdom)
        }
        if ($getValue.additionalProperties.mediaContentRatingUnitedStates)
        {
            $results.Add("MediaContentRatingUnitedStates", $getValue.additionalProperties.mediaContentRatingUnitedStates)
        }
        if ($getValue.additionalProperties.networkUsageRules)
        {
            $results.Add("NetworkUsageRules", $getValue.additionalProperties.networkUsageRules)
        }
        if ($getValue.additionalProperties.deviceSettingStateSummaries)
        {
            $results.Add("DeviceSettingStateSummaries", $getValue.additionalProperties.deviceSettingStateSummaries)
        }
        if ($getValue.additionalProperties.deviceStatuses)
        {
            $results.Add("DeviceStatuses", $getValue.additionalProperties.deviceStatuses)
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
        [System.String]
        $DisplayName,

        [Parameter()]
        [System.Boolean]
        $AccountBlockModification,

        [Parameter()]
        [System.Boolean]
        $ActivationLockAllowWhenSupervised,

        [Parameter()]
        [System.Boolean]
        $AirDropBlocked,

        [Parameter()]
        [System.Boolean]
        $AirDropForceUnmanagedDropTarget,

        [Parameter()]
        [System.Boolean]
        $AirPlayForcePairingPasswordForOutgoingRequests,

        [Parameter()]
        [System.Boolean]
        $AppleNewsBlocked,

        [Parameter()]
        [System.Boolean]
        $AppleWatchBlockPairing,

        [Parameter()]
        [System.Boolean]
        $AppleWatchForceWristDetection,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $AppsSingleAppModeList,

        [Parameter()]
        [System.Boolean]
        $AppStoreBlockAutomaticDownloads,

        [Parameter()]
        [System.Boolean]
        $AppStoreBlocked,

        [Parameter()]
        [System.Boolean]
        $AppStoreBlockInAppPurchases,

        [Parameter()]
        [System.Boolean]
        $AppStoreBlockUIAppInstallation,

        [Parameter()]
        [System.Boolean]
        $AppStoreRequirePassword,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $AppsVisibilityList,

        [Parameter()]
        [ValidateSet('none','appsInListCompliant','appsNotInListCompliant')]
        [System.String]
        $AppsVisibilityListType,

        [Parameter()]
        [System.Boolean]
        $BluetoothBlockModification,

        [Parameter()]
        [System.Boolean]
        $CameraBlocked,

        [Parameter()]
        [System.Boolean]
        $CellularBlockDataRoaming,

        [Parameter()]
        [System.Boolean]
        $CellularBlockGlobalBackgroundFetchWhileRoaming,

        [Parameter()]
        [System.Boolean]
        $CellularBlockPerAppDataModification,

        [Parameter()]
        [System.Boolean]
        $CellularBlockPersonalHotspot,

        [Parameter()]
        [System.Boolean]
        $CellularBlockVoiceRoaming,

        [Parameter()]
        [System.Boolean]
        $CertificatesBlockUntrustedTlsCertificates,

        [Parameter()]
        [System.Boolean]
        $ClassroomAppBlockRemoteScreenObservation,

        [Parameter()]
        [System.Boolean]
        $ClassroomAppForceUnpromptedScreenObservation,

        [Parameter()]
        [ValidateSet('none','appsInListCompliant','appsNotInListCompliant')]
        [System.String]
        $CompliantAppListType,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $CompliantAppsList,

        [Parameter()]
        [System.Boolean]
        $ConfigurationProfileBlockChanges,

        [Parameter()]
        [System.Boolean]
        $DefinitionLookupBlocked,

        [Parameter()]
        [System.Boolean]
        $DeviceBlockEnableRestrictions,

        [Parameter()]
        [System.Boolean]
        $DeviceBlockEraseContentAndSettings,

        [Parameter()]
        [System.Boolean]
        $DeviceBlockNameModification,

        [Parameter()]
        [System.Boolean]
        $DiagnosticDataBlockSubmission,

        [Parameter()]
        [System.Boolean]
        $DiagnosticDataBlockSubmissionModification,

        [Parameter()]
        [System.Boolean]
        $DocumentsBlockManagedDocumentsInUnmanagedApps,

        [Parameter()]
        [System.Boolean]
        $DocumentsBlockUnmanagedDocumentsInManagedApps,

        [Parameter()]
        [System.String[]]
        $EmailInDomainSuffixes,

        [Parameter()]
        [System.Boolean]
        $EnterpriseAppBlockTrust,

        [Parameter()]
        [System.Boolean]
        $EnterpriseAppBlockTrustModification,

        [Parameter()]
        [System.Boolean]
        $FaceTimeBlocked,

        [Parameter()]
        [System.Boolean]
        $FindMyFriendsBlocked,

        [Parameter()]
        [System.Boolean]
        $GameCenterBlocked,

        [Parameter()]
        [System.Boolean]
        $GamingBlockGameCenterFriends,

        [Parameter()]
        [System.Boolean]
        $GamingBlockMultiplayer,

        [Parameter()]
        [System.Boolean]
        $HostPairingBlocked,

        [Parameter()]
        [System.Boolean]
        $IBooksStoreBlocked,

        [Parameter()]
        [System.Boolean]
        $IBooksStoreBlockErotica,

        [Parameter()]
        [System.Boolean]
        $ICloudBlockActivityContinuation,

        [Parameter()]
        [System.Boolean]
        $ICloudBlockBackup,

        [Parameter()]
        [System.Boolean]
        $ICloudBlockDocumentSync,

        [Parameter()]
        [System.Boolean]
        $ICloudBlockManagedAppsSync,

        [Parameter()]
        [System.Boolean]
        $ICloudBlockPhotoLibrary,

        [Parameter()]
        [System.Boolean]
        $ICloudBlockPhotoStreamSync,

        [Parameter()]
        [System.Boolean]
        $ICloudBlockSharedPhotoStream,

        [Parameter()]
        [System.Boolean]
        $ICloudRequireEncryptedBackup,

        [Parameter()]
        [System.Boolean]
        $ITunesBlockExplicitContent,

        [Parameter()]
        [System.Boolean]
        $ITunesBlockMusicService,

        [Parameter()]
        [System.Boolean]
        $ITunesBlockRadio,

        [Parameter()]
        [System.Boolean]
        $KeyboardBlockAutoCorrect,

        [Parameter()]
        [System.Boolean]
        $KeyboardBlockDictation,

        [Parameter()]
        [System.Boolean]
        $KeyboardBlockPredictive,

        [Parameter()]
        [System.Boolean]
        $KeyboardBlockShortcuts,

        [Parameter()]
        [System.Boolean]
        $KeyboardBlockSpellCheck,

        [Parameter()]
        [System.Boolean]
        $KioskModeAllowAssistiveSpeak,

        [Parameter()]
        [System.Boolean]
        $KioskModeAllowAssistiveTouchSettings,

        [Parameter()]
        [System.Boolean]
        $KioskModeAllowAutoLock,

        [Parameter()]
        [System.Boolean]
        $KioskModeAllowColorInversionSettings,

        [Parameter()]
        [System.Boolean]
        $KioskModeAllowRingerSwitch,

        [Parameter()]
        [System.Boolean]
        $KioskModeAllowScreenRotation,

        [Parameter()]
        [System.Boolean]
        $KioskModeAllowSleepButton,

        [Parameter()]
        [System.Boolean]
        $KioskModeAllowTouchscreen,

        [Parameter()]
        [System.Boolean]
        $KioskModeAllowVoiceOverSettings,

        [Parameter()]
        [System.Boolean]
        $KioskModeAllowVolumeButtons,

        [Parameter()]
        [System.Boolean]
        $KioskModeAllowZoomSettings,

        [Parameter()]
        [System.String]
        $KioskModeAppStoreUrl,

        [Parameter()]
        [System.String]
        $KioskModeBuiltInAppId,

        [Parameter()]
        [System.String]
        $KioskModeManagedAppId,

        [Parameter()]
        [System.Boolean]
        $KioskModeRequireAssistiveTouch,

        [Parameter()]
        [System.Boolean]
        $KioskModeRequireColorInversion,

        [Parameter()]
        [System.Boolean]
        $KioskModeRequireMonoAudio,

        [Parameter()]
        [System.Boolean]
        $KioskModeRequireVoiceOver,

        [Parameter()]
        [System.Boolean]
        $KioskModeRequireZoom,

        [Parameter()]
        [System.Boolean]
        $LockScreenBlockControlCenter,

        [Parameter()]
        [System.Boolean]
        $LockScreenBlockNotificationView,

        [Parameter()]
        [System.Boolean]
        $LockScreenBlockPassbook,

        [Parameter()]
        [System.Boolean]
        $LockScreenBlockTodayView,

        [Parameter()]
        [ValidateSet('allAllowed','allBlocked','agesAbove4','agesAbove9','agesAbove12','agesAbove17')]
        [System.String]
        $MediaContentRatingApps,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $MediaContentRatingAustralia,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $MediaContentRatingCanada,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $MediaContentRatingFrance,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $MediaContentRatingGermany,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $MediaContentRatingIreland,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $MediaContentRatingJapan,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $MediaContentRatingNewZealand,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $MediaContentRatingUnitedKingdom,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $MediaContentRatingUnitedStates,

        [Parameter()]
        [System.Boolean]
        $MessagesBlocked,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $NetworkUsageRules,

        [Parameter()]
        [System.Boolean]
        $NotificationsBlockSettingsModification,

        [Parameter()]
        [System.Boolean]
        $PasscodeBlockFingerprintModification,

        [Parameter()]
        [System.Boolean]
        $PasscodeBlockFingerprintUnlock,

        [Parameter()]
        [System.Boolean]
        $PasscodeBlockModification,

        [Parameter()]
        [System.Boolean]
        $PasscodeBlockSimple,

        [Parameter()]
        [System.Int32]
        $PasscodeExpirationDays,

        [Parameter()]
        [System.Int32]
        $PasscodeMinimumCharacterSetCount,

        [Parameter()]
        [System.Int32]
        $PasscodeMinimumLength,

        [Parameter()]
        [System.Int32]
        $PasscodeMinutesOfInactivityBeforeLock,

        [Parameter()]
        [System.Int32]
        $PasscodeMinutesOfInactivityBeforeScreenTimeout,

        [Parameter()]
        [System.Int32]
        $PasscodePreviousPasscodeBlockCount,

        [Parameter()]
        [System.Boolean]
        $PasscodeRequired,

        [Parameter()]
        [ValidateSet('deviceDefault','alphanumeric','numeric')]
        [System.String]
        $PasscodeRequiredType,

        [Parameter()]
        [System.Int32]
        $PasscodeSignInFailureCountBeforeWipe,

        [Parameter()]
        [System.Boolean]
        $PodcastsBlocked,

        [Parameter()]
        [System.Boolean]
        $SafariBlockAutofill,

        [Parameter()]
        [System.Boolean]
        $SafariBlocked,

        [Parameter()]
        [System.Boolean]
        $SafariBlockJavaScript,

        [Parameter()]
        [System.Boolean]
        $SafariBlockPopups,

        [Parameter()]
        [ValidateSet('browserDefault','blockAlways','allowCurrentWebSite','allowFromWebsitesVisited','allowAlways')]
        [System.String]
        $SafariCookieSettings,

        [Parameter()]
        [System.String[]]
        $SafariManagedDomains,

        [Parameter()]
        [System.String[]]
        $SafariPasswordAutoFillDomains,

        [Parameter()]
        [System.Boolean]
        $SafariRequireFraudWarning,

        [Parameter()]
        [System.Boolean]
        $ScreenCaptureBlocked,

        [Parameter()]
        [System.Boolean]
        $SiriBlocked,

        [Parameter()]
        [System.Boolean]
        $SiriBlockedWhenLocked,

        [Parameter()]
        [System.Boolean]
        $SiriBlockUserGeneratedContent,

        [Parameter()]
        [System.Boolean]
        $SiriRequireProfanityFilter,

        [Parameter()]
        [System.Boolean]
        $SpotlightBlockInternetResults,

        [Parameter()]
        [System.Boolean]
        $VoiceDialingBlocked,

        [Parameter()]
        [System.Boolean]
        $WallpaperBlockModification,

        [Parameter()]
        [System.Boolean]
        $WiFiConnectOnlyToConfiguredNetworks,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $DeviceSettingStateSummaries,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $DeviceStatuses,

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
            -ProfileName 'v1.0'

        Select-MgProfile 'v1.0' -ErrorAction Stop
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
        $CreateParameters.add('@odata.type','#microsoft.graph.iosGeneralDeviceConfiguration')

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
        $UpdateParameters.add('@odata.type','#microsoft.graph.iosGeneralDeviceConfiguration')

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
        [System.String]
        $DisplayName,

        [Parameter()]
        [System.Boolean]
        $AccountBlockModification,

        [Parameter()]
        [System.Boolean]
        $ActivationLockAllowWhenSupervised,

        [Parameter()]
        [System.Boolean]
        $AirDropBlocked,

        [Parameter()]
        [System.Boolean]
        $AirDropForceUnmanagedDropTarget,

        [Parameter()]
        [System.Boolean]
        $AirPlayForcePairingPasswordForOutgoingRequests,

        [Parameter()]
        [System.Boolean]
        $AppleNewsBlocked,

        [Parameter()]
        [System.Boolean]
        $AppleWatchBlockPairing,

        [Parameter()]
        [System.Boolean]
        $AppleWatchForceWristDetection,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $AppsSingleAppModeList,

        [Parameter()]
        [System.Boolean]
        $AppStoreBlockAutomaticDownloads,

        [Parameter()]
        [System.Boolean]
        $AppStoreBlocked,

        [Parameter()]
        [System.Boolean]
        $AppStoreBlockInAppPurchases,

        [Parameter()]
        [System.Boolean]
        $AppStoreBlockUIAppInstallation,

        [Parameter()]
        [System.Boolean]
        $AppStoreRequirePassword,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $AppsVisibilityList,

        [Parameter()]
        [ValidateSet('none','appsInListCompliant','appsNotInListCompliant')]
        [System.String]
        $AppsVisibilityListType,

        [Parameter()]
        [System.Boolean]
        $BluetoothBlockModification,

        [Parameter()]
        [System.Boolean]
        $CameraBlocked,

        [Parameter()]
        [System.Boolean]
        $CellularBlockDataRoaming,

        [Parameter()]
        [System.Boolean]
        $CellularBlockGlobalBackgroundFetchWhileRoaming,

        [Parameter()]
        [System.Boolean]
        $CellularBlockPerAppDataModification,

        [Parameter()]
        [System.Boolean]
        $CellularBlockPersonalHotspot,

        [Parameter()]
        [System.Boolean]
        $CellularBlockVoiceRoaming,

        [Parameter()]
        [System.Boolean]
        $CertificatesBlockUntrustedTlsCertificates,

        [Parameter()]
        [System.Boolean]
        $ClassroomAppBlockRemoteScreenObservation,

        [Parameter()]
        [System.Boolean]
        $ClassroomAppForceUnpromptedScreenObservation,

        [Parameter()]
        [ValidateSet('none','appsInListCompliant','appsNotInListCompliant')]
        [System.String]
        $CompliantAppListType,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $CompliantAppsList,

        [Parameter()]
        [System.Boolean]
        $ConfigurationProfileBlockChanges,

        [Parameter()]
        [System.Boolean]
        $DefinitionLookupBlocked,

        [Parameter()]
        [System.Boolean]
        $DeviceBlockEnableRestrictions,

        [Parameter()]
        [System.Boolean]
        $DeviceBlockEraseContentAndSettings,

        [Parameter()]
        [System.Boolean]
        $DeviceBlockNameModification,

        [Parameter()]
        [System.Boolean]
        $DiagnosticDataBlockSubmission,

        [Parameter()]
        [System.Boolean]
        $DiagnosticDataBlockSubmissionModification,

        [Parameter()]
        [System.Boolean]
        $DocumentsBlockManagedDocumentsInUnmanagedApps,

        [Parameter()]
        [System.Boolean]
        $DocumentsBlockUnmanagedDocumentsInManagedApps,

        [Parameter()]
        [System.String[]]
        $EmailInDomainSuffixes,

        [Parameter()]
        [System.Boolean]
        $EnterpriseAppBlockTrust,

        [Parameter()]
        [System.Boolean]
        $EnterpriseAppBlockTrustModification,

        [Parameter()]
        [System.Boolean]
        $FaceTimeBlocked,

        [Parameter()]
        [System.Boolean]
        $FindMyFriendsBlocked,

        [Parameter()]
        [System.Boolean]
        $GameCenterBlocked,

        [Parameter()]
        [System.Boolean]
        $GamingBlockGameCenterFriends,

        [Parameter()]
        [System.Boolean]
        $GamingBlockMultiplayer,

        [Parameter()]
        [System.Boolean]
        $HostPairingBlocked,

        [Parameter()]
        [System.Boolean]
        $IBooksStoreBlocked,

        [Parameter()]
        [System.Boolean]
        $IBooksStoreBlockErotica,

        [Parameter()]
        [System.Boolean]
        $ICloudBlockActivityContinuation,

        [Parameter()]
        [System.Boolean]
        $ICloudBlockBackup,

        [Parameter()]
        [System.Boolean]
        $ICloudBlockDocumentSync,

        [Parameter()]
        [System.Boolean]
        $ICloudBlockManagedAppsSync,

        [Parameter()]
        [System.Boolean]
        $ICloudBlockPhotoLibrary,

        [Parameter()]
        [System.Boolean]
        $ICloudBlockPhotoStreamSync,

        [Parameter()]
        [System.Boolean]
        $ICloudBlockSharedPhotoStream,

        [Parameter()]
        [System.Boolean]
        $ICloudRequireEncryptedBackup,

        [Parameter()]
        [System.Boolean]
        $ITunesBlockExplicitContent,

        [Parameter()]
        [System.Boolean]
        $ITunesBlockMusicService,

        [Parameter()]
        [System.Boolean]
        $ITunesBlockRadio,

        [Parameter()]
        [System.Boolean]
        $KeyboardBlockAutoCorrect,

        [Parameter()]
        [System.Boolean]
        $KeyboardBlockDictation,

        [Parameter()]
        [System.Boolean]
        $KeyboardBlockPredictive,

        [Parameter()]
        [System.Boolean]
        $KeyboardBlockShortcuts,

        [Parameter()]
        [System.Boolean]
        $KeyboardBlockSpellCheck,

        [Parameter()]
        [System.Boolean]
        $KioskModeAllowAssistiveSpeak,

        [Parameter()]
        [System.Boolean]
        $KioskModeAllowAssistiveTouchSettings,

        [Parameter()]
        [System.Boolean]
        $KioskModeAllowAutoLock,

        [Parameter()]
        [System.Boolean]
        $KioskModeAllowColorInversionSettings,

        [Parameter()]
        [System.Boolean]
        $KioskModeAllowRingerSwitch,

        [Parameter()]
        [System.Boolean]
        $KioskModeAllowScreenRotation,

        [Parameter()]
        [System.Boolean]
        $KioskModeAllowSleepButton,

        [Parameter()]
        [System.Boolean]
        $KioskModeAllowTouchscreen,

        [Parameter()]
        [System.Boolean]
        $KioskModeAllowVoiceOverSettings,

        [Parameter()]
        [System.Boolean]
        $KioskModeAllowVolumeButtons,

        [Parameter()]
        [System.Boolean]
        $KioskModeAllowZoomSettings,

        [Parameter()]
        [System.String]
        $KioskModeAppStoreUrl,

        [Parameter()]
        [System.String]
        $KioskModeBuiltInAppId,

        [Parameter()]
        [System.String]
        $KioskModeManagedAppId,

        [Parameter()]
        [System.Boolean]
        $KioskModeRequireAssistiveTouch,

        [Parameter()]
        [System.Boolean]
        $KioskModeRequireColorInversion,

        [Parameter()]
        [System.Boolean]
        $KioskModeRequireMonoAudio,

        [Parameter()]
        [System.Boolean]
        $KioskModeRequireVoiceOver,

        [Parameter()]
        [System.Boolean]
        $KioskModeRequireZoom,

        [Parameter()]
        [System.Boolean]
        $LockScreenBlockControlCenter,

        [Parameter()]
        [System.Boolean]
        $LockScreenBlockNotificationView,

        [Parameter()]
        [System.Boolean]
        $LockScreenBlockPassbook,

        [Parameter()]
        [System.Boolean]
        $LockScreenBlockTodayView,

        [Parameter()]
        [ValidateSet('allAllowed','allBlocked','agesAbove4','agesAbove9','agesAbove12','agesAbove17')]
        [System.String]
        $MediaContentRatingApps,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $MediaContentRatingAustralia,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $MediaContentRatingCanada,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $MediaContentRatingFrance,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $MediaContentRatingGermany,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $MediaContentRatingIreland,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $MediaContentRatingJapan,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $MediaContentRatingNewZealand,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $MediaContentRatingUnitedKingdom,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $MediaContentRatingUnitedStates,

        [Parameter()]
        [System.Boolean]
        $MessagesBlocked,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $NetworkUsageRules,

        [Parameter()]
        [System.Boolean]
        $NotificationsBlockSettingsModification,

        [Parameter()]
        [System.Boolean]
        $PasscodeBlockFingerprintModification,

        [Parameter()]
        [System.Boolean]
        $PasscodeBlockFingerprintUnlock,

        [Parameter()]
        [System.Boolean]
        $PasscodeBlockModification,

        [Parameter()]
        [System.Boolean]
        $PasscodeBlockSimple,

        [Parameter()]
        [System.Int32]
        $PasscodeExpirationDays,

        [Parameter()]
        [System.Int32]
        $PasscodeMinimumCharacterSetCount,

        [Parameter()]
        [System.Int32]
        $PasscodeMinimumLength,

        [Parameter()]
        [System.Int32]
        $PasscodeMinutesOfInactivityBeforeLock,

        [Parameter()]
        [System.Int32]
        $PasscodeMinutesOfInactivityBeforeScreenTimeout,

        [Parameter()]
        [System.Int32]
        $PasscodePreviousPasscodeBlockCount,

        [Parameter()]
        [System.Boolean]
        $PasscodeRequired,

        [Parameter()]
        [ValidateSet('deviceDefault','alphanumeric','numeric')]
        [System.String]
        $PasscodeRequiredType,

        [Parameter()]
        [System.Int32]
        $PasscodeSignInFailureCountBeforeWipe,

        [Parameter()]
        [System.Boolean]
        $PodcastsBlocked,

        [Parameter()]
        [System.Boolean]
        $SafariBlockAutofill,

        [Parameter()]
        [System.Boolean]
        $SafariBlocked,

        [Parameter()]
        [System.Boolean]
        $SafariBlockJavaScript,

        [Parameter()]
        [System.Boolean]
        $SafariBlockPopups,

        [Parameter()]
        [ValidateSet('browserDefault','blockAlways','allowCurrentWebSite','allowFromWebsitesVisited','allowAlways')]
        [System.String]
        $SafariCookieSettings,

        [Parameter()]
        [System.String[]]
        $SafariManagedDomains,

        [Parameter()]
        [System.String[]]
        $SafariPasswordAutoFillDomains,

        [Parameter()]
        [System.Boolean]
        $SafariRequireFraudWarning,

        [Parameter()]
        [System.Boolean]
        $ScreenCaptureBlocked,

        [Parameter()]
        [System.Boolean]
        $SiriBlocked,

        [Parameter()]
        [System.Boolean]
        $SiriBlockedWhenLocked,

        [Parameter()]
        [System.Boolean]
        $SiriBlockUserGeneratedContent,

        [Parameter()]
        [System.Boolean]
        $SiriRequireProfanityFilter,

        [Parameter()]
        [System.Boolean]
        $SpotlightBlockInternetResults,

        [Parameter()]
        [System.Boolean]
        $VoiceDialingBlocked,

        [Parameter()]
        [System.Boolean]
        $WallpaperBlockModification,

        [Parameter()]
        [System.Boolean]
        $WiFiConnectOnlyToConfiguredNetworks,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $DeviceSettingStateSummaries,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance[]]
        $DeviceStatuses,

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
        -ProfileName 'v1.0'
    Select-MgProfile 'v1.0' -ErrorAction Stop

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
                $_.AdditionalProperties.'@odata.type' -eq '#microsoft.graph.iosGeneralDeviceConfiguration'  `
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

            if ($Results.AppsSingleAppModeList)
            {
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString -ComplexObject $Results.AppsSingleAppModeList -CIMInstanceName IntuneDeviceConfigurationPolicyiOSapplistitem
                if ($complexTypeStringResult)
                {
                    $Results.AppsSingleAppModeList = $complexTypeStringResult
                }
                else
                {
                    $Results.Remove('AppsSingleAppModeList') | Out-Null
                }
            }
            if ($Results.AppsVisibilityList)
            {
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString -ComplexObject $Results.AppsVisibilityList -CIMInstanceName IntuneDeviceConfigurationPolicyiOSapplistitem
                if ($complexTypeStringResult)
                {
                    $Results.AppsVisibilityList = $complexTypeStringResult
                }
                else
                {
                    $Results.Remove('AppsVisibilityList') | Out-Null
                }
            }
            if ($Results.CompliantAppsList)
            {
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString -ComplexObject $Results.CompliantAppsList -CIMInstanceName IntuneDeviceConfigurationPolicyiOSapplistitem
                if ($complexTypeStringResult)
                {
                    $Results.CompliantAppsList = $complexTypeStringResult
                }
                else
                {
                    $Results.Remove('CompliantAppsList') | Out-Null
                }
            }
            if ($Results.MediaContentRatingAustralia)
            {
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString -ComplexObject $Results.MediaContentRatingAustralia -CIMInstanceName IntuneDeviceConfigurationPolicyiOSmediacontentratingaustralia
                if ($complexTypeStringResult)
                {
                    $Results.MediaContentRatingAustralia = $complexTypeStringResult
                }
                else
                {
                    $Results.Remove('MediaContentRatingAustralia') | Out-Null
                }
            }
            if ($Results.MediaContentRatingCanada)
            {
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString -ComplexObject $Results.MediaContentRatingCanada -CIMInstanceName IntuneDeviceConfigurationPolicyiOSmediacontentratingcanada
                if ($complexTypeStringResult)
                {
                    $Results.MediaContentRatingCanada = $complexTypeStringResult
                }
                else
                {
                    $Results.Remove('MediaContentRatingCanada') | Out-Null
                }
            }
            if ($Results.MediaContentRatingFrance)
            {
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString -ComplexObject $Results.MediaContentRatingFrance -CIMInstanceName IntuneDeviceConfigurationPolicyiOSmediacontentratingfrance
                if ($complexTypeStringResult)
                {
                    $Results.MediaContentRatingFrance = $complexTypeStringResult
                }
                else
                {
                    $Results.Remove('MediaContentRatingFrance') | Out-Null
                }
            }
            if ($Results.MediaContentRatingGermany)
            {
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString -ComplexObject $Results.MediaContentRatingGermany -CIMInstanceName IntuneDeviceConfigurationPolicyiOSmediacontentratinggermany
                if ($complexTypeStringResult)
                {
                    $Results.MediaContentRatingGermany = $complexTypeStringResult
                }
                else
                {
                    $Results.Remove('MediaContentRatingGermany') | Out-Null
                }
            }
            if ($Results.MediaContentRatingIreland)
            {
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString -ComplexObject $Results.MediaContentRatingIreland -CIMInstanceName IntuneDeviceConfigurationPolicyiOSmediacontentratingireland
                if ($complexTypeStringResult)
                {
                    $Results.MediaContentRatingIreland = $complexTypeStringResult
                }
                else
                {
                    $Results.Remove('MediaContentRatingIreland') | Out-Null
                }
            }
            if ($Results.MediaContentRatingJapan)
            {
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString -ComplexObject $Results.MediaContentRatingJapan -CIMInstanceName IntuneDeviceConfigurationPolicyiOSmediacontentratingjapan
                if ($complexTypeStringResult)
                {
                    $Results.MediaContentRatingJapan = $complexTypeStringResult
                }
                else
                {
                    $Results.Remove('MediaContentRatingJapan') | Out-Null
                }
            }
            if ($Results.MediaContentRatingNewZealand)
            {
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString -ComplexObject $Results.MediaContentRatingNewZealand -CIMInstanceName IntuneDeviceConfigurationPolicyiOSmediacontentratingnewzealand
                if ($complexTypeStringResult)
                {
                    $Results.MediaContentRatingNewZealand = $complexTypeStringResult
                }
                else
                {
                    $Results.Remove('MediaContentRatingNewZealand') | Out-Null
                }
            }
            if ($Results.MediaContentRatingUnitedKingdom)
            {
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString -ComplexObject $Results.MediaContentRatingUnitedKingdom -CIMInstanceName IntuneDeviceConfigurationPolicyiOSmediacontentratingunitedkingdom
                if ($complexTypeStringResult)
                {
                    $Results.MediaContentRatingUnitedKingdom = $complexTypeStringResult
                }
                else
                {
                    $Results.Remove('MediaContentRatingUnitedKingdom') | Out-Null
                }
            }
            if ($Results.MediaContentRatingUnitedStates)
            {
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString -ComplexObject $Results.MediaContentRatingUnitedStates -CIMInstanceName IntuneDeviceConfigurationPolicyiOSmediacontentratingunitedstates
                if ($complexTypeStringResult)
                {
                    $Results.MediaContentRatingUnitedStates = $complexTypeStringResult
                }
                else
                {
                    $Results.Remove('MediaContentRatingUnitedStates') | Out-Null
                }
            }
            if ($Results.NetworkUsageRules)
            {
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString -ComplexObject $Results.NetworkUsageRules -CIMInstanceName IntuneDeviceConfigurationPolicyiOSiosnetworkusagerule
                if ($complexTypeStringResult)
                {
                    $Results.NetworkUsageRules = $complexTypeStringResult
                }
                else
                {
                    $Results.Remove('NetworkUsageRules') | Out-Null
                }
            }
            if ($Results.DeviceSettingStateSummaries)
            {
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString -ComplexObject $Results.DeviceSettingStateSummaries -CIMInstanceName IntuneDeviceConfigurationPolicyiOSsettingstatedevicesummary
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
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString -ComplexObject $Results.DeviceStatuses -CIMInstanceName IntuneDeviceConfigurationPolicyiOSdeviceconfigurationdevicestatus
                if ($complexTypeStringResult)
                {
                    $Results.DeviceStatuses = $complexTypeStringResult
                }
                else
                {
                    $Results.Remove('DeviceStatuses') | Out-Null
                }
            }
            if ($Results.UserStatuses)
            {
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString -ComplexObject $Results.UserStatuses -CIMInstanceName IntuneDeviceConfigurationPolicyiOSdeviceconfigurationuserstatus
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
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString -ComplexObject $Results.Assignments -CIMInstanceName IntuneDeviceConfigurationPolicyiOSAssignments
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

            if ($Results.AppsSingleAppModeList)
            {
                $isCIMArray=$false
                if($Results.AppsSingleAppModeList.getType().Fullname -like "*[[\]]")
                {
                    $isCIMArray=$true
                }
                $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "AppsSingleAppModeList" -isCIMArray:$isCIMArray
            }
            if ($Results.AppsVisibilityList)
            {
                $isCIMArray=$false
                if($Results.AppsVisibilityList.getType().Fullname -like "*[[\]]")
                {
                    $isCIMArray=$true
                }
                $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "AppsVisibilityList" -isCIMArray:$isCIMArray
            }
            if ($Results.CompliantAppsList)
            {
                $isCIMArray=$false
                if($Results.CompliantAppsList.getType().Fullname -like "*[[\]]")
                {
                    $isCIMArray=$true
                }
                $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "CompliantAppsList" -isCIMArray:$isCIMArray
            }
            if ($Results.MediaContentRatingAustralia)
            {
                $isCIMArray=$false
                if($Results.MediaContentRatingAustralia.getType().Fullname -like "*[[\]]")
                {
                    $isCIMArray=$true
                }
                $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "MediaContentRatingAustralia" -isCIMArray:$isCIMArray
            }
            if ($Results.MediaContentRatingCanada)
            {
                $isCIMArray=$false
                if($Results.MediaContentRatingCanada.getType().Fullname -like "*[[\]]")
                {
                    $isCIMArray=$true
                }
                $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "MediaContentRatingCanada" -isCIMArray:$isCIMArray
            }
            if ($Results.MediaContentRatingFrance)
            {
                $isCIMArray=$false
                if($Results.MediaContentRatingFrance.getType().Fullname -like "*[[\]]")
                {
                    $isCIMArray=$true
                }
                $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "MediaContentRatingFrance" -isCIMArray:$isCIMArray
            }
            if ($Results.MediaContentRatingGermany)
            {
                $isCIMArray=$false
                if($Results.MediaContentRatingGermany.getType().Fullname -like "*[[\]]")
                {
                    $isCIMArray=$true
                }
                $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "MediaContentRatingGermany" -isCIMArray:$isCIMArray
            }
            if ($Results.MediaContentRatingIreland)
            {
                $isCIMArray=$false
                if($Results.MediaContentRatingIreland.getType().Fullname -like "*[[\]]")
                {
                    $isCIMArray=$true
                }
                $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "MediaContentRatingIreland" -isCIMArray:$isCIMArray
            }
            if ($Results.MediaContentRatingJapan)
            {
                $isCIMArray=$false
                if($Results.MediaContentRatingJapan.getType().Fullname -like "*[[\]]")
                {
                    $isCIMArray=$true
                }
                $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "MediaContentRatingJapan" -isCIMArray:$isCIMArray
            }
            if ($Results.MediaContentRatingNewZealand)
            {
                $isCIMArray=$false
                if($Results.MediaContentRatingNewZealand.getType().Fullname -like "*[[\]]")
                {
                    $isCIMArray=$true
                }
                $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "MediaContentRatingNewZealand" -isCIMArray:$isCIMArray
            }
            if ($Results.MediaContentRatingUnitedKingdom)
            {
                $isCIMArray=$false
                if($Results.MediaContentRatingUnitedKingdom.getType().Fullname -like "*[[\]]")
                {
                    $isCIMArray=$true
                }
                $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "MediaContentRatingUnitedKingdom" -isCIMArray:$isCIMArray
            }
            if ($Results.MediaContentRatingUnitedStates)
            {
                $isCIMArray=$false
                if($Results.MediaContentRatingUnitedStates.getType().Fullname -like "*[[\]]")
                {
                    $isCIMArray=$true
                }
                $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "MediaContentRatingUnitedStates" -isCIMArray:$isCIMArray
            }
            if ($Results.NetworkUsageRules)
            {
                $isCIMArray=$false
                if($Results.NetworkUsageRules.getType().Fullname -like "*[[\]]")
                {
                    $isCIMArray=$true
                }
                $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "NetworkUsageRules" -isCIMArray:$isCIMArray
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
                "AccountBlockModification"
        "ActivationLockAllowWhenSupervised"
        "AirDropBlocked"
        "AirDropForceUnmanagedDropTarget"
        "AirPlayForcePairingPasswordForOutgoingRequests"
        "AppleNewsBlocked"
        "AppleWatchBlockPairing"
        "AppleWatchForceWristDetection"
        "AppsSingleAppModeList"
        "AppStoreBlockAutomaticDownloads"
        "AppStoreBlocked"
        "AppStoreBlockInAppPurchases"
        "AppStoreBlockUIAppInstallation"
        "AppStoreRequirePassword"
        "AppsVisibilityList"
        "AppsVisibilityListType"
        "BluetoothBlockModification"
        "CameraBlocked"
        "CellularBlockDataRoaming"
        "CellularBlockGlobalBackgroundFetchWhileRoaming"
        "CellularBlockPerAppDataModification"
        "CellularBlockPersonalHotspot"
        "CellularBlockVoiceRoaming"
        "CertificatesBlockUntrustedTlsCertificates"
        "ClassroomAppBlockRemoteScreenObservation"
        "ClassroomAppForceUnpromptedScreenObservation"
        "CompliantAppListType"
        "CompliantAppsList"
        "ConfigurationProfileBlockChanges"
        "DefinitionLookupBlocked"
        "DeviceBlockEnableRestrictions"
        "DeviceBlockEraseContentAndSettings"
        "DeviceBlockNameModification"
        "DiagnosticDataBlockSubmission"
        "DiagnosticDataBlockSubmissionModification"
        "DocumentsBlockManagedDocumentsInUnmanagedApps"
        "DocumentsBlockUnmanagedDocumentsInManagedApps"
        "EmailInDomainSuffixes"
        "EnterpriseAppBlockTrust"
        "EnterpriseAppBlockTrustModification"
        "FaceTimeBlocked"
        "FindMyFriendsBlocked"
        "GameCenterBlocked"
        "GamingBlockGameCenterFriends"
        "GamingBlockMultiplayer"
        "HostPairingBlocked"
        "IBooksStoreBlocked"
        "IBooksStoreBlockErotica"
        "ICloudBlockActivityContinuation"
        "ICloudBlockBackup"
        "ICloudBlockDocumentSync"
        "ICloudBlockManagedAppsSync"
        "ICloudBlockPhotoLibrary"
        "ICloudBlockPhotoStreamSync"
        "ICloudBlockSharedPhotoStream"
        "ICloudRequireEncryptedBackup"
        "ITunesBlockExplicitContent"
        "ITunesBlockMusicService"
        "ITunesBlockRadio"
        "KeyboardBlockAutoCorrect"
        "KeyboardBlockDictation"
        "KeyboardBlockPredictive"
        "KeyboardBlockShortcuts"
        "KeyboardBlockSpellCheck"
        "KioskModeAllowAssistiveSpeak"
        "KioskModeAllowAssistiveTouchSettings"
        "KioskModeAllowAutoLock"
        "KioskModeAllowColorInversionSettings"
        "KioskModeAllowRingerSwitch"
        "KioskModeAllowScreenRotation"
        "KioskModeAllowSleepButton"
        "KioskModeAllowTouchscreen"
        "KioskModeAllowVoiceOverSettings"
        "KioskModeAllowVolumeButtons"
        "KioskModeAllowZoomSettings"
        "KioskModeAppStoreUrl"
        "KioskModeBuiltInAppId"
        "KioskModeManagedAppId"
        "KioskModeRequireAssistiveTouch"
        "KioskModeRequireColorInversion"
        "KioskModeRequireMonoAudio"
        "KioskModeRequireVoiceOver"
        "KioskModeRequireZoom"
        "LockScreenBlockControlCenter"
        "LockScreenBlockNotificationView"
        "LockScreenBlockPassbook"
        "LockScreenBlockTodayView"
        "MediaContentRatingApps"
        "MediaContentRatingAustralia"
        "MediaContentRatingCanada"
        "MediaContentRatingFrance"
        "MediaContentRatingGermany"
        "MediaContentRatingIreland"
        "MediaContentRatingJapan"
        "MediaContentRatingNewZealand"
        "MediaContentRatingUnitedKingdom"
        "MediaContentRatingUnitedStates"
        "MessagesBlocked"
        "NetworkUsageRules"
        "NotificationsBlockSettingsModification"
        "PasscodeBlockFingerprintModification"
        "PasscodeBlockFingerprintUnlock"
        "PasscodeBlockModification"
        "PasscodeBlockSimple"
        "PasscodeExpirationDays"
        "PasscodeMinimumCharacterSetCount"
        "PasscodeMinimumLength"
        "PasscodeMinutesOfInactivityBeforeLock"
        "PasscodeMinutesOfInactivityBeforeScreenTimeout"
        "PasscodePreviousPasscodeBlockCount"
        "PasscodeRequired"
        "PasscodeRequiredType"
        "PasscodeSignInFailureCountBeforeWipe"
        "PodcastsBlocked"
        "SafariBlockAutofill"
        "SafariBlocked"
        "SafariBlockJavaScript"
        "SafariBlockPopups"
        "SafariCookieSettings"
        "SafariManagedDomains"
        "SafariPasswordAutoFillDomains"
        "SafariRequireFraudWarning"
        "ScreenCaptureBlocked"
        "SiriBlocked"
        "SiriBlockedWhenLocked"
        "SiriBlockUserGeneratedContent"
        "SiriRequireProfanityFilter"
        "SpotlightBlockInternetResults"
        "VoiceDialingBlocked"
        "WallpaperBlockModification"
        "WiFiConnectOnlyToConfiguredNetworks"
        "DeviceSettingStateSummaries"
        "DeviceStatuses"
        "UserStatuses"

    )
    $results = @{'@odata.type' = '#microsoft.graph.iosGeneralDeviceConfiguration' }
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
