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
        $AccountsBlockAddingNonMicrosoftAccountEmail,

        [Parameter()]
        [System.Boolean]
        $AntiTheftModeBlocked,

        [Parameter()]
        [ValidateSet('notConfigured','blocked','allowed')]
        [System.String]
        $AppsAllowTrustedAppsSideloading,

        [Parameter()]
        [System.Boolean]
        $AppsBlockWindowsStoreOriginatedApps,

        [Parameter()]
        [System.String[]]
        $BluetoothAllowedServices,

        [Parameter()]
        [System.Boolean]
        $BluetoothBlockAdvertising,

        [Parameter()]
        [System.Boolean]
        $BluetoothBlockDiscoverableMode,

        [Parameter()]
        [System.Boolean]
        $BluetoothBlocked,

        [Parameter()]
        [System.Boolean]
        $BluetoothBlockPrePairing,

        [Parameter()]
        [System.Boolean]
        $CameraBlocked,

        [Parameter()]
        [System.Boolean]
        $CellularBlockDataWhenRoaming,

        [Parameter()]
        [System.Boolean]
        $CellularBlockVpn,

        [Parameter()]
        [System.Boolean]
        $CellularBlockVpnWhenRoaming,

        [Parameter()]
        [System.Boolean]
        $CertificatesBlockManualRootCertificateInstallation,

        [Parameter()]
        [System.Boolean]
        $ConnectedDevicesServiceBlocked,

        [Parameter()]
        [System.Boolean]
        $CopyPasteBlocked,

        [Parameter()]
        [System.Boolean]
        $CortanaBlocked,

        [Parameter()]
        [System.Boolean]
        $DefenderBlockEndUserAccess,

        [Parameter()]
        [ValidateSet('notConfigured','high','highPlus','zeroTolerance')]
        [System.String]
        $DefenderCloudBlockLevel,

        [Parameter()]
        [System.Int32]
        $DefenderDaysBeforeDeletingQuarantinedMalware,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $DefenderDetectedMalwareActions,

        [Parameter()]
        [System.String[]]
        $DefenderFileExtensionsToExclude,

        [Parameter()]
        [System.String[]]
        $DefenderFilesAndFoldersToExclude,

        [Parameter()]
        [ValidateSet('userDefined','disable','monitorAllFiles','monitorIncomingFilesOnly','monitorOutgoingFilesOnly')]
        [System.String]
        $DefenderMonitorFileActivity,

        [Parameter()]
        [System.String[]]
        $DefenderProcessesToExclude,

        [Parameter()]
        [ValidateSet('userDefined','alwaysPrompt','promptBeforeSendingPersonalData','neverSendData','sendAllDataWithoutPrompting')]
        [System.String]
        $DefenderPromptForSampleSubmission,

        [Parameter()]
        [System.Boolean]
        $DefenderRequireBehaviorMonitoring,

        [Parameter()]
        [System.Boolean]
        $DefenderRequireCloudProtection,

        [Parameter()]
        [System.Boolean]
        $DefenderRequireNetworkInspectionSystem,

        [Parameter()]
        [System.Boolean]
        $DefenderRequireRealTimeMonitoring,

        [Parameter()]
        [System.Boolean]
        $DefenderScanArchiveFiles,

        [Parameter()]
        [System.Boolean]
        $DefenderScanDownloads,

        [Parameter()]
        [System.Boolean]
        $DefenderScanIncomingMail,

        [Parameter()]
        [System.Boolean]
        $DefenderScanMappedNetworkDrivesDuringFullScan,

        [Parameter()]
        [System.Int32]
        $DefenderScanMaxCpu,

        [Parameter()]
        [System.Boolean]
        $DefenderScanNetworkFiles,

        [Parameter()]
        [System.Boolean]
        $DefenderScanRemovableDrivesDuringFullScan,

        [Parameter()]
        [System.Boolean]
        $DefenderScanScriptsLoadedInInternetExplorer,

        [Parameter()]
        [ValidateSet('userDefined','disabled','quick','full')]
        [System.String]
        $DefenderScanType,

        [Parameter()]
        [System.String]
        $DefenderScheduledQuickScanTime,

        [Parameter()]
        [System.String]
        $DefenderScheduledScanTime,

        [Parameter()]
        [System.Int32]
        $DefenderSignatureUpdateIntervalInHours,

        [Parameter()]
        [ValidateSet('userDefined','everyday','sunday','monday','tuesday','wednesday','thursday','friday','saturday')]
        [System.String]
        $DefenderSystemScanSchedule,

        [Parameter()]
        [ValidateSet('notConfigured','blocked','allowed')]
        [System.String]
        $DeveloperUnlockSetting,

        [Parameter()]
        [System.Boolean]
        $DeviceManagementBlockFactoryResetOnMobile,

        [Parameter()]
        [System.Boolean]
        $DeviceManagementBlockManualUnenroll,

        [Parameter()]
        [ValidateSet('userDefined','none','basic','enhanced','full')]
        [System.String]
        $DiagnosticsDataSubmissionMode,

        [Parameter()]
        [System.Boolean]
        $EdgeAllowStartPagesModification,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockAccessToAboutFlags,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockAddressBarDropdown,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockAutofill,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockCompatibilityList,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockDeveloperTools,

        [Parameter()]
        [System.Boolean]
        $EdgeBlocked,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockExtensions,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockInPrivateBrowsing,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockJavaScript,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockLiveTileDataCollection,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockPasswordManager,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockPopups,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockSearchSuggestions,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockSendingDoNotTrackHeader,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockSendingIntranetTrafficToInternetExplorer,

        [Parameter()]
        [System.Boolean]
        $EdgeClearBrowsingDataOnExit,

        [Parameter()]
        [ValidateSet('userDefined','allow','blockThirdParty','blockAll')]
        [System.String]
        $EdgeCookiePolicy,

        [Parameter()]
        [System.Boolean]
        $EdgeDisableFirstRunPage,

        [Parameter()]
        [System.String]
        $EdgeEnterpriseModeSiteListLocation,

        [Parameter()]
        [System.String]
        $EdgeFirstRunUrl,

        [Parameter()]
        [System.String[]]
        $EdgeHomepageUrls,

        [Parameter()]
        [System.Boolean]
        $EdgeRequireSmartScreen,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $EdgeSearchEngine,

        [Parameter()]
        [System.Boolean]
        $EdgeSendIntranetTrafficToInternetExplorer,

        [Parameter()]
        [System.Boolean]
        $EdgeSyncFavoritesWithInternetExplorer,

        [Parameter()]
        [System.String]
        $EnterpriseCloudPrintDiscoveryEndPoint,

        [Parameter()]
        [System.Int32]
        $EnterpriseCloudPrintDiscoveryMaxLimit,

        [Parameter()]
        [System.String]
        $EnterpriseCloudPrintMopriaDiscoveryResourceIdentifier,

        [Parameter()]
        [System.String]
        $EnterpriseCloudPrintOAuthAuthority,

        [Parameter()]
        [System.String]
        $EnterpriseCloudPrintOAuthClientIdentifier,

        [Parameter()]
        [System.String]
        $EnterpriseCloudPrintResourceIdentifier,

        [Parameter()]
        [System.Boolean]
        $ExperienceBlockDeviceDiscovery,

        [Parameter()]
        [System.Boolean]
        $ExperienceBlockErrorDialogWhenNoSIM,

        [Parameter()]
        [System.Boolean]
        $ExperienceBlockTaskSwitcher,

        [Parameter()]
        [System.Boolean]
        $GameDvrBlocked,

        [Parameter()]
        [System.Boolean]
        $InternetSharingBlocked,

        [Parameter()]
        [System.Boolean]
        $LocationServicesBlocked,

        [Parameter()]
        [System.Boolean]
        $LockScreenAllowTimeoutConfiguration,

        [Parameter()]
        [System.Boolean]
        $LockScreenBlockActionCenterNotifications,

        [Parameter()]
        [System.Boolean]
        $LockScreenBlockCortana,

        [Parameter()]
        [System.Boolean]
        $LockScreenBlockToastNotifications,

        [Parameter()]
        [System.Int32]
        $LockScreenTimeoutInSeconds,

        [Parameter()]
        [System.Boolean]
        $LogonBlockFastUserSwitching,

        [Parameter()]
        [System.Boolean]
        $MicrosoftAccountBlocked,

        [Parameter()]
        [System.Boolean]
        $MicrosoftAccountBlockSettingsSync,

        [Parameter()]
        [System.Boolean]
        $NetworkProxyApplySettingsDeviceWide,

        [Parameter()]
        [System.String]
        $NetworkProxyAutomaticConfigurationUrl,

        [Parameter()]
        [System.Boolean]
        $NetworkProxyDisableAutoDetect,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $NetworkProxyServer,

        [Parameter()]
        [System.Boolean]
        $NfcBlocked,

        [Parameter()]
        [System.Boolean]
        $OneDriveDisableFileSync,

        [Parameter()]
        [System.Boolean]
        $PasswordBlockSimple,

        [Parameter()]
        [System.Int32]
        $PasswordExpirationDays,

        [Parameter()]
        [System.Int32]
        $PasswordMinimumCharacterSetCount,

        [Parameter()]
        [System.Int32]
        $PasswordMinimumLength,

        [Parameter()]
        [System.Int32]
        $PasswordMinutesOfInactivityBeforeScreenTimeout,

        [Parameter()]
        [System.Int32]
        $PasswordPreviousPasswordBlockCount,

        [Parameter()]
        [System.Boolean]
        $PasswordRequired,

        [Parameter()]
        [ValidateSet('deviceDefault','alphanumeric','numeric')]
        [System.String]
        $PasswordRequiredType,

        [Parameter()]
        [System.Boolean]
        $PasswordRequireWhenResumeFromIdleState,

        [Parameter()]
        [System.Int32]
        $PasswordSignInFailureCountBeforeFactoryReset,

        [Parameter()]
        [System.String]
        $PersonalizationDesktopImageUrl,

        [Parameter()]
        [System.String]
        $PersonalizationLockScreenImageUrl,

        [Parameter()]
        [ValidateSet('notConfigured','blocked','allowed')]
        [System.String]
        $PrivacyAdvertisingId,

        [Parameter()]
        [System.Boolean]
        $PrivacyAutoAcceptPairingAndConsentPrompts,

        [Parameter()]
        [System.Boolean]
        $PrivacyBlockInputPersonalization,

        [Parameter()]
        [System.Boolean]
        $ResetProtectionModeBlocked,

        [Parameter()]
        [ValidateSet('userDefined','strict','moderate')]
        [System.String]
        $SafeSearchFilter,

        [Parameter()]
        [System.Boolean]
        $ScreenCaptureBlocked,

        [Parameter()]
        [System.Boolean]
        $SearchBlockDiacritics,

        [Parameter()]
        [System.Boolean]
        $SearchDisableAutoLanguageDetection,

        [Parameter()]
        [System.Boolean]
        $SearchDisableIndexerBackoff,

        [Parameter()]
        [System.Boolean]
        $SearchDisableIndexingEncryptedItems,

        [Parameter()]
        [System.Boolean]
        $SearchDisableIndexingRemovableDrive,

        [Parameter()]
        [System.Boolean]
        $SearchEnableAutomaticIndexSizeManangement,

        [Parameter()]
        [System.Boolean]
        $SearchEnableRemoteQueries,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockAccountsPage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockAddProvisioningPackage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockAppsPage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockChangeLanguage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockChangePowerSleep,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockChangeRegion,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockChangeSystemTime,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockDevicesPage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockEaseOfAccessPage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockEditDeviceName,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockGamingPage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockNetworkInternetPage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockPersonalizationPage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockPrivacyPage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockRemoveProvisioningPackage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockSettingsApp,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockSystemPage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockTimeLanguagePage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockUpdateSecurityPage,

        [Parameter()]
        [System.Boolean]
        $SharedUserAppDataAllowed,

        [Parameter()]
        [System.Boolean]
        $SmartScreenBlockPromptOverride,

        [Parameter()]
        [System.Boolean]
        $SmartScreenBlockPromptOverrideForFiles,

        [Parameter()]
        [System.Boolean]
        $SmartScreenEnableAppInstallControl,

        [Parameter()]
        [System.Boolean]
        $StartBlockUnpinningAppsFromTaskbar,

        [Parameter()]
        [ValidateSet('userDefined','collapse','remove','disableSettingsApp')]
        [System.String]
        $StartMenuAppListVisibility,

        [Parameter()]
        [System.Boolean]
        $StartMenuHideChangeAccountSettings,

        [Parameter()]
        [System.Boolean]
        $StartMenuHideFrequentlyUsedApps,

        [Parameter()]
        [System.Boolean]
        $StartMenuHideHibernate,

        [Parameter()]
        [System.Boolean]
        $StartMenuHideLock,

        [Parameter()]
        [System.Boolean]
        $StartMenuHidePowerButton,

        [Parameter()]
        [System.Boolean]
        $StartMenuHideRecentJumpLists,

        [Parameter()]
        [System.Boolean]
        $StartMenuHideRecentlyAddedApps,

        [Parameter()]
        [System.Boolean]
        $StartMenuHideRestartOptions,

        [Parameter()]
        [System.Boolean]
        $StartMenuHideShutDown,

        [Parameter()]
        [System.Boolean]
        $StartMenuHideSignOut,

        [Parameter()]
        [System.Boolean]
        $StartMenuHideSleep,

        [Parameter()]
        [System.Boolean]
        $StartMenuHideSwitchAccount,

        [Parameter()]
        [System.Boolean]
        $StartMenuHideUserTile,

        [Parameter()]
        [System.String]
        $StartMenuLayoutEdgeAssetsXml,

        [Parameter()]
        [System.String]
        $StartMenuLayoutXml,

        [Parameter()]
        [ValidateSet('userDefined','fullScreen','nonFullScreen')]
        [System.String]
        $StartMenuMode,

        [Parameter()]
        [ValidateSet('notConfigured','hide','show')]
        [System.String]
        $StartMenuPinnedFolderDocuments,

        [Parameter()]
        [ValidateSet('notConfigured','hide','show')]
        [System.String]
        $StartMenuPinnedFolderDownloads,

        [Parameter()]
        [ValidateSet('notConfigured','hide','show')]
        [System.String]
        $StartMenuPinnedFolderFileExplorer,

        [Parameter()]
        [ValidateSet('notConfigured','hide','show')]
        [System.String]
        $StartMenuPinnedFolderHomeGroup,

        [Parameter()]
        [ValidateSet('notConfigured','hide','show')]
        [System.String]
        $StartMenuPinnedFolderMusic,

        [Parameter()]
        [ValidateSet('notConfigured','hide','show')]
        [System.String]
        $StartMenuPinnedFolderNetwork,

        [Parameter()]
        [ValidateSet('notConfigured','hide','show')]
        [System.String]
        $StartMenuPinnedFolderPersonalFolder,

        [Parameter()]
        [ValidateSet('notConfigured','hide','show')]
        [System.String]
        $StartMenuPinnedFolderPictures,

        [Parameter()]
        [ValidateSet('notConfigured','hide','show')]
        [System.String]
        $StartMenuPinnedFolderSettings,

        [Parameter()]
        [ValidateSet('notConfigured','hide','show')]
        [System.String]
        $StartMenuPinnedFolderVideos,

        [Parameter()]
        [System.Boolean]
        $StorageBlockRemovableStorage,

        [Parameter()]
        [System.Boolean]
        $StorageRequireMobileDeviceEncryption,

        [Parameter()]
        [System.Boolean]
        $StorageRestrictAppDataToSystemVolume,

        [Parameter()]
        [System.Boolean]
        $StorageRestrictAppInstallToSystemVolume,

        [Parameter()]
        [System.Boolean]
        $TenantLockdownRequireNetworkDuringOutOfBoxExperience,

        [Parameter()]
        [System.Boolean]
        $UsbBlocked,

        [Parameter()]
        [System.Boolean]
        $VoiceRecordingBlocked,

        [Parameter()]
        [System.Boolean]
        $WebRtcBlockLocalhostIpAddress,

        [Parameter()]
        [System.Boolean]
        $WiFiBlockAutomaticConnectHotspots,

        [Parameter()]
        [System.Boolean]
        $WiFiBlocked,

        [Parameter()]
        [System.Boolean]
        $WiFiBlockManualConfiguration,

        [Parameter()]
        [System.Int32]
        $WiFiScanInterval,

        [Parameter()]
        [System.Boolean]
        $WindowsSpotlightBlockConsumerSpecificFeatures,

        [Parameter()]
        [System.Boolean]
        $WindowsSpotlightBlocked,

        [Parameter()]
        [System.Boolean]
        $WindowsSpotlightBlockOnActionCenter,

        [Parameter()]
        [System.Boolean]
        $WindowsSpotlightBlockTailoredExperiences,

        [Parameter()]
        [System.Boolean]
        $WindowsSpotlightBlockThirdPartyNotifications,

        [Parameter()]
        [System.Boolean]
        $WindowsSpotlightBlockWelcomeExperience,

        [Parameter()]
        [System.Boolean]
        $WindowsSpotlightBlockWindowsTips,

        [Parameter()]
        [ValidateSet('notConfigured','disabled','enabled')]
        [System.String]
        $WindowsSpotlightConfigureOnLockScreen,

        [Parameter()]
        [System.Boolean]
        $WindowsStoreBlockAutoUpdate,

        [Parameter()]
        [System.Boolean]
        $WindowsStoreBlocked,

        [Parameter()]
        [System.Boolean]
        $WindowsStoreEnablePrivateStoreOnly,

        [Parameter()]
        [System.Boolean]
        $WirelessDisplayBlockProjectionToThisDevice,

        [Parameter()]
        [System.Boolean]
        $WirelessDisplayBlockUserInputFromReceiver,

        [Parameter()]
        [System.Boolean]
        $WirelessDisplayRequirePinForPairing,

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
            Write-Verbose -Message "Nothing with id {$id} was found"
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
            AccountsBlockAddingNonMicrosoftAccountEmail = $getValue.AdditionalProperties.accountsBlockAddingNonMicrosoftAccountEmail
            AntiTheftModeBlocked = $getValue.AdditionalProperties.antiTheftModeBlocked
            AppsAllowTrustedAppsSideloading = $getValue.AdditionalProperties.appsAllowTrustedAppsSideloading
            AppsBlockWindowsStoreOriginatedApps = $getValue.AdditionalProperties.appsBlockWindowsStoreOriginatedApps
            BluetoothAllowedServices = $getValue.AdditionalProperties.bluetoothAllowedServices
            BluetoothBlockAdvertising = $getValue.AdditionalProperties.bluetoothBlockAdvertising
            BluetoothBlockDiscoverableMode = $getValue.AdditionalProperties.bluetoothBlockDiscoverableMode
            BluetoothBlocked = $getValue.AdditionalProperties.bluetoothBlocked
            BluetoothBlockPrePairing = $getValue.AdditionalProperties.bluetoothBlockPrePairing
            CameraBlocked = $getValue.AdditionalProperties.cameraBlocked
            CellularBlockDataWhenRoaming = $getValue.AdditionalProperties.cellularBlockDataWhenRoaming
            CellularBlockVpn = $getValue.AdditionalProperties.cellularBlockVpn
            CellularBlockVpnWhenRoaming = $getValue.AdditionalProperties.cellularBlockVpnWhenRoaming
            CertificatesBlockManualRootCertificateInstallation = $getValue.AdditionalProperties.certificatesBlockManualRootCertificateInstallation
            ConnectedDevicesServiceBlocked = $getValue.AdditionalProperties.connectedDevicesServiceBlocked
            CopyPasteBlocked = $getValue.AdditionalProperties.copyPasteBlocked
            CortanaBlocked = $getValue.AdditionalProperties.cortanaBlocked
            DefenderBlockEndUserAccess = $getValue.AdditionalProperties.defenderBlockEndUserAccess
            DefenderCloudBlockLevel = $getValue.AdditionalProperties.defenderCloudBlockLevel
            DefenderDaysBeforeDeletingQuarantinedMalware = $getValue.AdditionalProperties.defenderDaysBeforeDeletingQuarantinedMalware
            DefenderFileExtensionsToExclude = $getValue.AdditionalProperties.defenderFileExtensionsToExclude
            DefenderFilesAndFoldersToExclude = $getValue.AdditionalProperties.defenderFilesAndFoldersToExclude
            DefenderMonitorFileActivity = $getValue.AdditionalProperties.defenderMonitorFileActivity
            DefenderProcessesToExclude = $getValue.AdditionalProperties.defenderProcessesToExclude
            DefenderPromptForSampleSubmission = $getValue.AdditionalProperties.defenderPromptForSampleSubmission
            DefenderRequireBehaviorMonitoring = $getValue.AdditionalProperties.defenderRequireBehaviorMonitoring
            DefenderRequireCloudProtection = $getValue.AdditionalProperties.defenderRequireCloudProtection
            DefenderRequireNetworkInspectionSystem = $getValue.AdditionalProperties.defenderRequireNetworkInspectionSystem
            DefenderRequireRealTimeMonitoring = $getValue.AdditionalProperties.defenderRequireRealTimeMonitoring
            DefenderScanArchiveFiles = $getValue.AdditionalProperties.defenderScanArchiveFiles
            DefenderScanDownloads = $getValue.AdditionalProperties.defenderScanDownloads
            DefenderScanIncomingMail = $getValue.AdditionalProperties.defenderScanIncomingMail
            DefenderScanMappedNetworkDrivesDuringFullScan = $getValue.AdditionalProperties.defenderScanMappedNetworkDrivesDuringFullScan
            DefenderScanMaxCpu = $getValue.AdditionalProperties.defenderScanMaxCpu
            DefenderScanNetworkFiles = $getValue.AdditionalProperties.defenderScanNetworkFiles
            DefenderScanRemovableDrivesDuringFullScan = $getValue.AdditionalProperties.defenderScanRemovableDrivesDuringFullScan
            DefenderScanScriptsLoadedInInternetExplorer = $getValue.AdditionalProperties.defenderScanScriptsLoadedInInternetExplorer
            DefenderScanType = $getValue.AdditionalProperties.defenderScanType
            DefenderScheduledQuickScanTime = $getValue.AdditionalProperties.defenderScheduledQuickScanTime
            DefenderScheduledScanTime = $getValue.AdditionalProperties.defenderScheduledScanTime
            DefenderSignatureUpdateIntervalInHours = $getValue.AdditionalProperties.defenderSignatureUpdateIntervalInHours
            DefenderSystemScanSchedule = $getValue.AdditionalProperties.defenderSystemScanSchedule
            DeveloperUnlockSetting = $getValue.AdditionalProperties.developerUnlockSetting
            DeviceManagementBlockFactoryResetOnMobile = $getValue.AdditionalProperties.deviceManagementBlockFactoryResetOnMobile
            DeviceManagementBlockManualUnenroll = $getValue.AdditionalProperties.deviceManagementBlockManualUnenroll
            DiagnosticsDataSubmissionMode = $getValue.AdditionalProperties.diagnosticsDataSubmissionMode
            EdgeAllowStartPagesModification = $getValue.AdditionalProperties.edgeAllowStartPagesModification
            EdgeBlockAccessToAboutFlags = $getValue.AdditionalProperties.edgeBlockAccessToAboutFlags
            EdgeBlockAddressBarDropdown = $getValue.AdditionalProperties.edgeBlockAddressBarDropdown
            EdgeBlockAutofill = $getValue.AdditionalProperties.edgeBlockAutofill
            EdgeBlockCompatibilityList = $getValue.AdditionalProperties.edgeBlockCompatibilityList
            EdgeBlockDeveloperTools = $getValue.AdditionalProperties.edgeBlockDeveloperTools
            EdgeBlocked = $getValue.AdditionalProperties.edgeBlocked
            EdgeBlockExtensions = $getValue.AdditionalProperties.edgeBlockExtensions
            EdgeBlockInPrivateBrowsing = $getValue.AdditionalProperties.edgeBlockInPrivateBrowsing
            EdgeBlockJavaScript = $getValue.AdditionalProperties.edgeBlockJavaScript
            EdgeBlockLiveTileDataCollection = $getValue.AdditionalProperties.edgeBlockLiveTileDataCollection
            EdgeBlockPasswordManager = $getValue.AdditionalProperties.edgeBlockPasswordManager
            EdgeBlockPopups = $getValue.AdditionalProperties.edgeBlockPopups
            EdgeBlockSearchSuggestions = $getValue.AdditionalProperties.edgeBlockSearchSuggestions
            EdgeBlockSendingDoNotTrackHeader = $getValue.AdditionalProperties.edgeBlockSendingDoNotTrackHeader
            EdgeBlockSendingIntranetTrafficToInternetExplorer = $getValue.AdditionalProperties.edgeBlockSendingIntranetTrafficToInternetExplorer
            EdgeClearBrowsingDataOnExit = $getValue.AdditionalProperties.edgeClearBrowsingDataOnExit
            EdgeCookiePolicy = $getValue.AdditionalProperties.edgeCookiePolicy
            EdgeDisableFirstRunPage = $getValue.AdditionalProperties.edgeDisableFirstRunPage
            EdgeEnterpriseModeSiteListLocation = $getValue.AdditionalProperties.edgeEnterpriseModeSiteListLocation
            EdgeFirstRunUrl = $getValue.AdditionalProperties.edgeFirstRunUrl
            EdgeHomepageUrls = $getValue.AdditionalProperties.edgeHomepageUrls
            EdgeRequireSmartScreen = $getValue.AdditionalProperties.edgeRequireSmartScreen
            EdgeSendIntranetTrafficToInternetExplorer = $getValue.AdditionalProperties.edgeSendIntranetTrafficToInternetExplorer
            EdgeSyncFavoritesWithInternetExplorer = $getValue.AdditionalProperties.edgeSyncFavoritesWithInternetExplorer
            EnterpriseCloudPrintDiscoveryEndPoint = $getValue.AdditionalProperties.enterpriseCloudPrintDiscoveryEndPoint
            EnterpriseCloudPrintDiscoveryMaxLimit = $getValue.AdditionalProperties.enterpriseCloudPrintDiscoveryMaxLimit
            EnterpriseCloudPrintMopriaDiscoveryResourceIdentifier = $getValue.AdditionalProperties.enterpriseCloudPrintMopriaDiscoveryResourceIdentifier
            EnterpriseCloudPrintOAuthAuthority = $getValue.AdditionalProperties.enterpriseCloudPrintOAuthAuthority
            EnterpriseCloudPrintOAuthClientIdentifier = $getValue.AdditionalProperties.enterpriseCloudPrintOAuthClientIdentifier
            EnterpriseCloudPrintResourceIdentifier = $getValue.AdditionalProperties.enterpriseCloudPrintResourceIdentifier
            ExperienceBlockDeviceDiscovery = $getValue.AdditionalProperties.experienceBlockDeviceDiscovery
            ExperienceBlockErrorDialogWhenNoSIM = $getValue.AdditionalProperties.experienceBlockErrorDialogWhenNoSIM
            ExperienceBlockTaskSwitcher = $getValue.AdditionalProperties.experienceBlockTaskSwitcher
            GameDvrBlocked = $getValue.AdditionalProperties.gameDvrBlocked
            InternetSharingBlocked = $getValue.AdditionalProperties.internetSharingBlocked
            LocationServicesBlocked = $getValue.AdditionalProperties.locationServicesBlocked
            LockScreenAllowTimeoutConfiguration = $getValue.AdditionalProperties.lockScreenAllowTimeoutConfiguration
            LockScreenBlockActionCenterNotifications = $getValue.AdditionalProperties.lockScreenBlockActionCenterNotifications
            LockScreenBlockCortana = $getValue.AdditionalProperties.lockScreenBlockCortana
            LockScreenBlockToastNotifications = $getValue.AdditionalProperties.lockScreenBlockToastNotifications
            LockScreenTimeoutInSeconds = $getValue.AdditionalProperties.lockScreenTimeoutInSeconds
            LogonBlockFastUserSwitching = $getValue.AdditionalProperties.logonBlockFastUserSwitching
            MicrosoftAccountBlocked = $getValue.AdditionalProperties.microsoftAccountBlocked
            MicrosoftAccountBlockSettingsSync = $getValue.AdditionalProperties.microsoftAccountBlockSettingsSync
            NetworkProxyApplySettingsDeviceWide = $getValue.AdditionalProperties.networkProxyApplySettingsDeviceWide
            NetworkProxyAutomaticConfigurationUrl = $getValue.AdditionalProperties.networkProxyAutomaticConfigurationUrl
            NetworkProxyDisableAutoDetect = $getValue.AdditionalProperties.networkProxyDisableAutoDetect
            NfcBlocked = $getValue.AdditionalProperties.nfcBlocked
            OneDriveDisableFileSync = $getValue.AdditionalProperties.oneDriveDisableFileSync
            PasswordBlockSimple = $getValue.AdditionalProperties.passwordBlockSimple
            PasswordExpirationDays = $getValue.AdditionalProperties.passwordExpirationDays
            PasswordMinimumCharacterSetCount = $getValue.AdditionalProperties.passwordMinimumCharacterSetCount
            PasswordMinimumLength = $getValue.AdditionalProperties.passwordMinimumLength
            PasswordMinutesOfInactivityBeforeScreenTimeout = $getValue.AdditionalProperties.passwordMinutesOfInactivityBeforeScreenTimeout
            PasswordPreviousPasswordBlockCount = $getValue.AdditionalProperties.passwordPreviousPasswordBlockCount
            PasswordRequired = $getValue.AdditionalProperties.passwordRequired
            PasswordRequiredType = $getValue.AdditionalProperties.passwordRequiredType
            PasswordRequireWhenResumeFromIdleState = $getValue.AdditionalProperties.passwordRequireWhenResumeFromIdleState
            PasswordSignInFailureCountBeforeFactoryReset = $getValue.AdditionalProperties.passwordSignInFailureCountBeforeFactoryReset
            PersonalizationDesktopImageUrl = $getValue.AdditionalProperties.personalizationDesktopImageUrl
            PersonalizationLockScreenImageUrl = $getValue.AdditionalProperties.personalizationLockScreenImageUrl
            PrivacyAdvertisingId = $getValue.AdditionalProperties.privacyAdvertisingId
            PrivacyAutoAcceptPairingAndConsentPrompts = $getValue.AdditionalProperties.privacyAutoAcceptPairingAndConsentPrompts
            PrivacyBlockInputPersonalization = $getValue.AdditionalProperties.privacyBlockInputPersonalization
            ResetProtectionModeBlocked = $getValue.AdditionalProperties.resetProtectionModeBlocked
            SafeSearchFilter = $getValue.AdditionalProperties.safeSearchFilter
            ScreenCaptureBlocked = $getValue.AdditionalProperties.screenCaptureBlocked
            SearchBlockDiacritics = $getValue.AdditionalProperties.searchBlockDiacritics
            SearchDisableAutoLanguageDetection = $getValue.AdditionalProperties.searchDisableAutoLanguageDetection
            SearchDisableIndexerBackoff = $getValue.AdditionalProperties.searchDisableIndexerBackoff
            SearchDisableIndexingEncryptedItems = $getValue.AdditionalProperties.searchDisableIndexingEncryptedItems
            SearchDisableIndexingRemovableDrive = $getValue.AdditionalProperties.searchDisableIndexingRemovableDrive
            SearchEnableAutomaticIndexSizeManangement = $getValue.AdditionalProperties.searchEnableAutomaticIndexSizeManangement
            SearchEnableRemoteQueries = $getValue.AdditionalProperties.searchEnableRemoteQueries
            SettingsBlockAccountsPage = $getValue.AdditionalProperties.settingsBlockAccountsPage
            SettingsBlockAddProvisioningPackage = $getValue.AdditionalProperties.settingsBlockAddProvisioningPackage
            SettingsBlockAppsPage = $getValue.AdditionalProperties.settingsBlockAppsPage
            SettingsBlockChangeLanguage = $getValue.AdditionalProperties.settingsBlockChangeLanguage
            SettingsBlockChangePowerSleep = $getValue.AdditionalProperties.settingsBlockChangePowerSleep
            SettingsBlockChangeRegion = $getValue.AdditionalProperties.settingsBlockChangeRegion
            SettingsBlockChangeSystemTime = $getValue.AdditionalProperties.settingsBlockChangeSystemTime
            SettingsBlockDevicesPage = $getValue.AdditionalProperties.settingsBlockDevicesPage
            SettingsBlockEaseOfAccessPage = $getValue.AdditionalProperties.settingsBlockEaseOfAccessPage
            SettingsBlockEditDeviceName = $getValue.AdditionalProperties.settingsBlockEditDeviceName
            SettingsBlockGamingPage = $getValue.AdditionalProperties.settingsBlockGamingPage
            SettingsBlockNetworkInternetPage = $getValue.AdditionalProperties.settingsBlockNetworkInternetPage
            SettingsBlockPersonalizationPage = $getValue.AdditionalProperties.settingsBlockPersonalizationPage
            SettingsBlockPrivacyPage = $getValue.AdditionalProperties.settingsBlockPrivacyPage
            SettingsBlockRemoveProvisioningPackage = $getValue.AdditionalProperties.settingsBlockRemoveProvisioningPackage
            SettingsBlockSettingsApp = $getValue.AdditionalProperties.settingsBlockSettingsApp
            SettingsBlockSystemPage = $getValue.AdditionalProperties.settingsBlockSystemPage
            SettingsBlockTimeLanguagePage = $getValue.AdditionalProperties.settingsBlockTimeLanguagePage
            SettingsBlockUpdateSecurityPage = $getValue.AdditionalProperties.settingsBlockUpdateSecurityPage
            SharedUserAppDataAllowed = $getValue.AdditionalProperties.sharedUserAppDataAllowed
            SmartScreenBlockPromptOverride = $getValue.AdditionalProperties.smartScreenBlockPromptOverride
            SmartScreenBlockPromptOverrideForFiles = $getValue.AdditionalProperties.smartScreenBlockPromptOverrideForFiles
            SmartScreenEnableAppInstallControl = $getValue.AdditionalProperties.smartScreenEnableAppInstallControl
            StartBlockUnpinningAppsFromTaskbar = $getValue.AdditionalProperties.startBlockUnpinningAppsFromTaskbar
            StartMenuAppListVisibility = $getValue.AdditionalProperties.startMenuAppListVisibility
            StartMenuHideChangeAccountSettings = $getValue.AdditionalProperties.startMenuHideChangeAccountSettings
            StartMenuHideFrequentlyUsedApps = $getValue.AdditionalProperties.startMenuHideFrequentlyUsedApps
            StartMenuHideHibernate = $getValue.AdditionalProperties.startMenuHideHibernate
            StartMenuHideLock = $getValue.AdditionalProperties.startMenuHideLock
            StartMenuHidePowerButton = $getValue.AdditionalProperties.startMenuHidePowerButton
            StartMenuHideRecentJumpLists = $getValue.AdditionalProperties.startMenuHideRecentJumpLists
            StartMenuHideRecentlyAddedApps = $getValue.AdditionalProperties.startMenuHideRecentlyAddedApps
            StartMenuHideRestartOptions = $getValue.AdditionalProperties.startMenuHideRestartOptions
            StartMenuHideShutDown = $getValue.AdditionalProperties.startMenuHideShutDown
            StartMenuHideSignOut = $getValue.AdditionalProperties.startMenuHideSignOut
            StartMenuHideSleep = $getValue.AdditionalProperties.startMenuHideSleep
            StartMenuHideSwitchAccount = $getValue.AdditionalProperties.startMenuHideSwitchAccount
            StartMenuHideUserTile = $getValue.AdditionalProperties.startMenuHideUserTile
            StartMenuLayoutEdgeAssetsXml = $getValue.AdditionalProperties.startMenuLayoutEdgeAssetsXml
            StartMenuLayoutXml = $getValue.AdditionalProperties.startMenuLayoutXml
            StartMenuMode = $getValue.AdditionalProperties.startMenuMode
            StartMenuPinnedFolderDocuments = $getValue.AdditionalProperties.startMenuPinnedFolderDocuments
            StartMenuPinnedFolderDownloads = $getValue.AdditionalProperties.startMenuPinnedFolderDownloads
            StartMenuPinnedFolderFileExplorer = $getValue.AdditionalProperties.startMenuPinnedFolderFileExplorer
            StartMenuPinnedFolderHomeGroup = $getValue.AdditionalProperties.startMenuPinnedFolderHomeGroup
            StartMenuPinnedFolderMusic = $getValue.AdditionalProperties.startMenuPinnedFolderMusic
            StartMenuPinnedFolderNetwork = $getValue.AdditionalProperties.startMenuPinnedFolderNetwork
            StartMenuPinnedFolderPersonalFolder = $getValue.AdditionalProperties.startMenuPinnedFolderPersonalFolder
            StartMenuPinnedFolderPictures = $getValue.AdditionalProperties.startMenuPinnedFolderPictures
            StartMenuPinnedFolderSettings = $getValue.AdditionalProperties.startMenuPinnedFolderSettings
            StartMenuPinnedFolderVideos = $getValue.AdditionalProperties.startMenuPinnedFolderVideos
            StorageBlockRemovableStorage = $getValue.AdditionalProperties.storageBlockRemovableStorage
            StorageRequireMobileDeviceEncryption = $getValue.AdditionalProperties.storageRequireMobileDeviceEncryption
            StorageRestrictAppDataToSystemVolume = $getValue.AdditionalProperties.storageRestrictAppDataToSystemVolume
            StorageRestrictAppInstallToSystemVolume = $getValue.AdditionalProperties.storageRestrictAppInstallToSystemVolume
            TenantLockdownRequireNetworkDuringOutOfBoxExperience = $getValue.AdditionalProperties.tenantLockdownRequireNetworkDuringOutOfBoxExperience
            UsbBlocked = $getValue.AdditionalProperties.usbBlocked
            VoiceRecordingBlocked = $getValue.AdditionalProperties.voiceRecordingBlocked
            WebRtcBlockLocalhostIpAddress = $getValue.AdditionalProperties.webRtcBlockLocalhostIpAddress
            WiFiBlockAutomaticConnectHotspots = $getValue.AdditionalProperties.wiFiBlockAutomaticConnectHotspots
            WiFiBlocked = $getValue.AdditionalProperties.wiFiBlocked
            WiFiBlockManualConfiguration = $getValue.AdditionalProperties.wiFiBlockManualConfiguration
            WiFiScanInterval = $getValue.AdditionalProperties.wiFiScanInterval
            WindowsSpotlightBlockConsumerSpecificFeatures = $getValue.AdditionalProperties.windowsSpotlightBlockConsumerSpecificFeatures
            WindowsSpotlightBlocked = $getValue.AdditionalProperties.windowsSpotlightBlocked
            WindowsSpotlightBlockOnActionCenter = $getValue.AdditionalProperties.windowsSpotlightBlockOnActionCenter
            WindowsSpotlightBlockTailoredExperiences = $getValue.AdditionalProperties.windowsSpotlightBlockTailoredExperiences
            WindowsSpotlightBlockThirdPartyNotifications = $getValue.AdditionalProperties.windowsSpotlightBlockThirdPartyNotifications
            WindowsSpotlightBlockWelcomeExperience = $getValue.AdditionalProperties.windowsSpotlightBlockWelcomeExperience
            WindowsSpotlightBlockWindowsTips = $getValue.AdditionalProperties.windowsSpotlightBlockWindowsTips
            WindowsSpotlightConfigureOnLockScreen = $getValue.AdditionalProperties.windowsSpotlightConfigureOnLockScreen
            WindowsStoreBlockAutoUpdate = $getValue.AdditionalProperties.windowsStoreBlockAutoUpdate
            WindowsStoreBlocked = $getValue.AdditionalProperties.windowsStoreBlocked
            WindowsStoreEnablePrivateStoreOnly = $getValue.AdditionalProperties.windowsStoreEnablePrivateStoreOnly
            WirelessDisplayBlockProjectionToThisDevice = $getValue.AdditionalProperties.wirelessDisplayBlockProjectionToThisDevice
            WirelessDisplayBlockUserInputFromReceiver = $getValue.AdditionalProperties.wirelessDisplayBlockUserInputFromReceiver
            WirelessDisplayRequirePinForPairing = $getValue.AdditionalProperties.wirelessDisplayRequirePinForPairing

            
            Ensure                = 'Present'
            Credential            = $Credential
            ApplicationId         = $ApplicationId
            TenantId              = $TenantId
            ApplicationSecret     = $ApplicationSecret
            CertificateThumbprint = $CertificateThumbprint
            Managedidentity       = $ManagedIdentity.IsPresent
        }
        if ($getValue.additionalProperties.defenderDetectedMalwareActions)
        {
            $results.Add("DefenderDetectedMalwareActions", $getValue.additionalProperties.defenderDetectedMalwareActions)
        }
        if ($getValue.additionalProperties.edgeSearchEngine)
        {
            $results.Add("EdgeSearchEngine", $getValue.additionalProperties.edgeSearchEngine)
        }
        if ($getValue.additionalProperties.networkProxyServer)
        {
            $results.Add("NetworkProxyServer", $getValue.additionalProperties.networkProxyServer)
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
        $AccountsBlockAddingNonMicrosoftAccountEmail,

        [Parameter()]
        [System.Boolean]
        $AntiTheftModeBlocked,

        [Parameter()]
        [ValidateSet('notConfigured','blocked','allowed')]
        [System.String]
        $AppsAllowTrustedAppsSideloading,

        [Parameter()]
        [System.Boolean]
        $AppsBlockWindowsStoreOriginatedApps,

        [Parameter()]
        [System.String[]]
        $BluetoothAllowedServices,

        [Parameter()]
        [System.Boolean]
        $BluetoothBlockAdvertising,

        [Parameter()]
        [System.Boolean]
        $BluetoothBlockDiscoverableMode,

        [Parameter()]
        [System.Boolean]
        $BluetoothBlocked,

        [Parameter()]
        [System.Boolean]
        $BluetoothBlockPrePairing,

        [Parameter()]
        [System.Boolean]
        $CameraBlocked,

        [Parameter()]
        [System.Boolean]
        $CellularBlockDataWhenRoaming,

        [Parameter()]
        [System.Boolean]
        $CellularBlockVpn,

        [Parameter()]
        [System.Boolean]
        $CellularBlockVpnWhenRoaming,

        [Parameter()]
        [System.Boolean]
        $CertificatesBlockManualRootCertificateInstallation,

        [Parameter()]
        [System.Boolean]
        $ConnectedDevicesServiceBlocked,

        [Parameter()]
        [System.Boolean]
        $CopyPasteBlocked,

        [Parameter()]
        [System.Boolean]
        $CortanaBlocked,

        [Parameter()]
        [System.Boolean]
        $DefenderBlockEndUserAccess,

        [Parameter()]
        [ValidateSet('notConfigured','high','highPlus','zeroTolerance')]
        [System.String]
        $DefenderCloudBlockLevel,

        [Parameter()]
        [System.Int32]
        $DefenderDaysBeforeDeletingQuarantinedMalware,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $DefenderDetectedMalwareActions,

        [Parameter()]
        [System.String[]]
        $DefenderFileExtensionsToExclude,

        [Parameter()]
        [System.String[]]
        $DefenderFilesAndFoldersToExclude,

        [Parameter()]
        [ValidateSet('userDefined','disable','monitorAllFiles','monitorIncomingFilesOnly','monitorOutgoingFilesOnly')]
        [System.String]
        $DefenderMonitorFileActivity,

        [Parameter()]
        [System.String[]]
        $DefenderProcessesToExclude,

        [Parameter()]
        [ValidateSet('userDefined','alwaysPrompt','promptBeforeSendingPersonalData','neverSendData','sendAllDataWithoutPrompting')]
        [System.String]
        $DefenderPromptForSampleSubmission,

        [Parameter()]
        [System.Boolean]
        $DefenderRequireBehaviorMonitoring,

        [Parameter()]
        [System.Boolean]
        $DefenderRequireCloudProtection,

        [Parameter()]
        [System.Boolean]
        $DefenderRequireNetworkInspectionSystem,

        [Parameter()]
        [System.Boolean]
        $DefenderRequireRealTimeMonitoring,

        [Parameter()]
        [System.Boolean]
        $DefenderScanArchiveFiles,

        [Parameter()]
        [System.Boolean]
        $DefenderScanDownloads,

        [Parameter()]
        [System.Boolean]
        $DefenderScanIncomingMail,

        [Parameter()]
        [System.Boolean]
        $DefenderScanMappedNetworkDrivesDuringFullScan,

        [Parameter()]
        [System.Int32]
        $DefenderScanMaxCpu,

        [Parameter()]
        [System.Boolean]
        $DefenderScanNetworkFiles,

        [Parameter()]
        [System.Boolean]
        $DefenderScanRemovableDrivesDuringFullScan,

        [Parameter()]
        [System.Boolean]
        $DefenderScanScriptsLoadedInInternetExplorer,

        [Parameter()]
        [ValidateSet('userDefined','disabled','quick','full')]
        [System.String]
        $DefenderScanType,

        [Parameter()]
        [System.String]
        $DefenderScheduledQuickScanTime,

        [Parameter()]
        [System.String]
        $DefenderScheduledScanTime,

        [Parameter()]
        [System.Int32]
        $DefenderSignatureUpdateIntervalInHours,

        [Parameter()]
        [ValidateSet('userDefined','everyday','sunday','monday','tuesday','wednesday','thursday','friday','saturday')]
        [System.String]
        $DefenderSystemScanSchedule,

        [Parameter()]
        [ValidateSet('notConfigured','blocked','allowed')]
        [System.String]
        $DeveloperUnlockSetting,

        [Parameter()]
        [System.Boolean]
        $DeviceManagementBlockFactoryResetOnMobile,

        [Parameter()]
        [System.Boolean]
        $DeviceManagementBlockManualUnenroll,

        [Parameter()]
        [ValidateSet('userDefined','none','basic','enhanced','full')]
        [System.String]
        $DiagnosticsDataSubmissionMode,

        [Parameter()]
        [System.Boolean]
        $EdgeAllowStartPagesModification,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockAccessToAboutFlags,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockAddressBarDropdown,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockAutofill,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockCompatibilityList,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockDeveloperTools,

        [Parameter()]
        [System.Boolean]
        $EdgeBlocked,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockExtensions,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockInPrivateBrowsing,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockJavaScript,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockLiveTileDataCollection,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockPasswordManager,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockPopups,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockSearchSuggestions,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockSendingDoNotTrackHeader,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockSendingIntranetTrafficToInternetExplorer,

        [Parameter()]
        [System.Boolean]
        $EdgeClearBrowsingDataOnExit,

        [Parameter()]
        [ValidateSet('userDefined','allow','blockThirdParty','blockAll')]
        [System.String]
        $EdgeCookiePolicy,

        [Parameter()]
        [System.Boolean]
        $EdgeDisableFirstRunPage,

        [Parameter()]
        [System.String]
        $EdgeEnterpriseModeSiteListLocation,

        [Parameter()]
        [System.String]
        $EdgeFirstRunUrl,

        [Parameter()]
        [System.String[]]
        $EdgeHomepageUrls,

        [Parameter()]
        [System.Boolean]
        $EdgeRequireSmartScreen,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $EdgeSearchEngine,

        [Parameter()]
        [System.Boolean]
        $EdgeSendIntranetTrafficToInternetExplorer,

        [Parameter()]
        [System.Boolean]
        $EdgeSyncFavoritesWithInternetExplorer,

        [Parameter()]
        [System.String]
        $EnterpriseCloudPrintDiscoveryEndPoint,

        [Parameter()]
        [System.Int32]
        $EnterpriseCloudPrintDiscoveryMaxLimit,

        [Parameter()]
        [System.String]
        $EnterpriseCloudPrintMopriaDiscoveryResourceIdentifier,

        [Parameter()]
        [System.String]
        $EnterpriseCloudPrintOAuthAuthority,

        [Parameter()]
        [System.String]
        $EnterpriseCloudPrintOAuthClientIdentifier,

        [Parameter()]
        [System.String]
        $EnterpriseCloudPrintResourceIdentifier,

        [Parameter()]
        [System.Boolean]
        $ExperienceBlockDeviceDiscovery,

        [Parameter()]
        [System.Boolean]
        $ExperienceBlockErrorDialogWhenNoSIM,

        [Parameter()]
        [System.Boolean]
        $ExperienceBlockTaskSwitcher,

        [Parameter()]
        [System.Boolean]
        $GameDvrBlocked,

        [Parameter()]
        [System.Boolean]
        $InternetSharingBlocked,

        [Parameter()]
        [System.Boolean]
        $LocationServicesBlocked,

        [Parameter()]
        [System.Boolean]
        $LockScreenAllowTimeoutConfiguration,

        [Parameter()]
        [System.Boolean]
        $LockScreenBlockActionCenterNotifications,

        [Parameter()]
        [System.Boolean]
        $LockScreenBlockCortana,

        [Parameter()]
        [System.Boolean]
        $LockScreenBlockToastNotifications,

        [Parameter()]
        [System.Int32]
        $LockScreenTimeoutInSeconds,

        [Parameter()]
        [System.Boolean]
        $LogonBlockFastUserSwitching,

        [Parameter()]
        [System.Boolean]
        $MicrosoftAccountBlocked,

        [Parameter()]
        [System.Boolean]
        $MicrosoftAccountBlockSettingsSync,

        [Parameter()]
        [System.Boolean]
        $NetworkProxyApplySettingsDeviceWide,

        [Parameter()]
        [System.String]
        $NetworkProxyAutomaticConfigurationUrl,

        [Parameter()]
        [System.Boolean]
        $NetworkProxyDisableAutoDetect,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $NetworkProxyServer,

        [Parameter()]
        [System.Boolean]
        $NfcBlocked,

        [Parameter()]
        [System.Boolean]
        $OneDriveDisableFileSync,

        [Parameter()]
        [System.Boolean]
        $PasswordBlockSimple,

        [Parameter()]
        [System.Int32]
        $PasswordExpirationDays,

        [Parameter()]
        [System.Int32]
        $PasswordMinimumCharacterSetCount,

        [Parameter()]
        [System.Int32]
        $PasswordMinimumLength,

        [Parameter()]
        [System.Int32]
        $PasswordMinutesOfInactivityBeforeScreenTimeout,

        [Parameter()]
        [System.Int32]
        $PasswordPreviousPasswordBlockCount,

        [Parameter()]
        [System.Boolean]
        $PasswordRequired,

        [Parameter()]
        [ValidateSet('deviceDefault','alphanumeric','numeric')]
        [System.String]
        $PasswordRequiredType,

        [Parameter()]
        [System.Boolean]
        $PasswordRequireWhenResumeFromIdleState,

        [Parameter()]
        [System.Int32]
        $PasswordSignInFailureCountBeforeFactoryReset,

        [Parameter()]
        [System.String]
        $PersonalizationDesktopImageUrl,

        [Parameter()]
        [System.String]
        $PersonalizationLockScreenImageUrl,

        [Parameter()]
        [ValidateSet('notConfigured','blocked','allowed')]
        [System.String]
        $PrivacyAdvertisingId,

        [Parameter()]
        [System.Boolean]
        $PrivacyAutoAcceptPairingAndConsentPrompts,

        [Parameter()]
        [System.Boolean]
        $PrivacyBlockInputPersonalization,

        [Parameter()]
        [System.Boolean]
        $ResetProtectionModeBlocked,

        [Parameter()]
        [ValidateSet('userDefined','strict','moderate')]
        [System.String]
        $SafeSearchFilter,

        [Parameter()]
        [System.Boolean]
        $ScreenCaptureBlocked,

        [Parameter()]
        [System.Boolean]
        $SearchBlockDiacritics,

        [Parameter()]
        [System.Boolean]
        $SearchDisableAutoLanguageDetection,

        [Parameter()]
        [System.Boolean]
        $SearchDisableIndexerBackoff,

        [Parameter()]
        [System.Boolean]
        $SearchDisableIndexingEncryptedItems,

        [Parameter()]
        [System.Boolean]
        $SearchDisableIndexingRemovableDrive,

        [Parameter()]
        [System.Boolean]
        $SearchEnableAutomaticIndexSizeManangement,

        [Parameter()]
        [System.Boolean]
        $SearchEnableRemoteQueries,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockAccountsPage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockAddProvisioningPackage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockAppsPage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockChangeLanguage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockChangePowerSleep,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockChangeRegion,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockChangeSystemTime,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockDevicesPage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockEaseOfAccessPage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockEditDeviceName,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockGamingPage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockNetworkInternetPage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockPersonalizationPage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockPrivacyPage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockRemoveProvisioningPackage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockSettingsApp,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockSystemPage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockTimeLanguagePage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockUpdateSecurityPage,

        [Parameter()]
        [System.Boolean]
        $SharedUserAppDataAllowed,

        [Parameter()]
        [System.Boolean]
        $SmartScreenBlockPromptOverride,

        [Parameter()]
        [System.Boolean]
        $SmartScreenBlockPromptOverrideForFiles,

        [Parameter()]
        [System.Boolean]
        $SmartScreenEnableAppInstallControl,

        [Parameter()]
        [System.Boolean]
        $StartBlockUnpinningAppsFromTaskbar,

        [Parameter()]
        [ValidateSet('userDefined','collapse','remove','disableSettingsApp')]
        [System.String]
        $StartMenuAppListVisibility,

        [Parameter()]
        [System.Boolean]
        $StartMenuHideChangeAccountSettings,

        [Parameter()]
        [System.Boolean]
        $StartMenuHideFrequentlyUsedApps,

        [Parameter()]
        [System.Boolean]
        $StartMenuHideHibernate,

        [Parameter()]
        [System.Boolean]
        $StartMenuHideLock,

        [Parameter()]
        [System.Boolean]
        $StartMenuHidePowerButton,

        [Parameter()]
        [System.Boolean]
        $StartMenuHideRecentJumpLists,

        [Parameter()]
        [System.Boolean]
        $StartMenuHideRecentlyAddedApps,

        [Parameter()]
        [System.Boolean]
        $StartMenuHideRestartOptions,

        [Parameter()]
        [System.Boolean]
        $StartMenuHideShutDown,

        [Parameter()]
        [System.Boolean]
        $StartMenuHideSignOut,

        [Parameter()]
        [System.Boolean]
        $StartMenuHideSleep,

        [Parameter()]
        [System.Boolean]
        $StartMenuHideSwitchAccount,

        [Parameter()]
        [System.Boolean]
        $StartMenuHideUserTile,

        [Parameter()]
        [System.String]
        $StartMenuLayoutEdgeAssetsXml,

        [Parameter()]
        [System.String]
        $StartMenuLayoutXml,

        [Parameter()]
        [ValidateSet('userDefined','fullScreen','nonFullScreen')]
        [System.String]
        $StartMenuMode,

        [Parameter()]
        [ValidateSet('notConfigured','hide','show')]
        [System.String]
        $StartMenuPinnedFolderDocuments,

        [Parameter()]
        [ValidateSet('notConfigured','hide','show')]
        [System.String]
        $StartMenuPinnedFolderDownloads,

        [Parameter()]
        [ValidateSet('notConfigured','hide','show')]
        [System.String]
        $StartMenuPinnedFolderFileExplorer,

        [Parameter()]
        [ValidateSet('notConfigured','hide','show')]
        [System.String]
        $StartMenuPinnedFolderHomeGroup,

        [Parameter()]
        [ValidateSet('notConfigured','hide','show')]
        [System.String]
        $StartMenuPinnedFolderMusic,

        [Parameter()]
        [ValidateSet('notConfigured','hide','show')]
        [System.String]
        $StartMenuPinnedFolderNetwork,

        [Parameter()]
        [ValidateSet('notConfigured','hide','show')]
        [System.String]
        $StartMenuPinnedFolderPersonalFolder,

        [Parameter()]
        [ValidateSet('notConfigured','hide','show')]
        [System.String]
        $StartMenuPinnedFolderPictures,

        [Parameter()]
        [ValidateSet('notConfigured','hide','show')]
        [System.String]
        $StartMenuPinnedFolderSettings,

        [Parameter()]
        [ValidateSet('notConfigured','hide','show')]
        [System.String]
        $StartMenuPinnedFolderVideos,

        [Parameter()]
        [System.Boolean]
        $StorageBlockRemovableStorage,

        [Parameter()]
        [System.Boolean]
        $StorageRequireMobileDeviceEncryption,

        [Parameter()]
        [System.Boolean]
        $StorageRestrictAppDataToSystemVolume,

        [Parameter()]
        [System.Boolean]
        $StorageRestrictAppInstallToSystemVolume,

        [Parameter()]
        [System.Boolean]
        $TenantLockdownRequireNetworkDuringOutOfBoxExperience,

        [Parameter()]
        [System.Boolean]
        $UsbBlocked,

        [Parameter()]
        [System.Boolean]
        $VoiceRecordingBlocked,

        [Parameter()]
        [System.Boolean]
        $WebRtcBlockLocalhostIpAddress,

        [Parameter()]
        [System.Boolean]
        $WiFiBlockAutomaticConnectHotspots,

        [Parameter()]
        [System.Boolean]
        $WiFiBlocked,

        [Parameter()]
        [System.Boolean]
        $WiFiBlockManualConfiguration,

        [Parameter()]
        [System.Int32]
        $WiFiScanInterval,

        [Parameter()]
        [System.Boolean]
        $WindowsSpotlightBlockConsumerSpecificFeatures,

        [Parameter()]
        [System.Boolean]
        $WindowsSpotlightBlocked,

        [Parameter()]
        [System.Boolean]
        $WindowsSpotlightBlockOnActionCenter,

        [Parameter()]
        [System.Boolean]
        $WindowsSpotlightBlockTailoredExperiences,

        [Parameter()]
        [System.Boolean]
        $WindowsSpotlightBlockThirdPartyNotifications,

        [Parameter()]
        [System.Boolean]
        $WindowsSpotlightBlockWelcomeExperience,

        [Parameter()]
        [System.Boolean]
        $WindowsSpotlightBlockWindowsTips,

        [Parameter()]
        [ValidateSet('notConfigured','disabled','enabled')]
        [System.String]
        $WindowsSpotlightConfigureOnLockScreen,

        [Parameter()]
        [System.Boolean]
        $WindowsStoreBlockAutoUpdate,

        [Parameter()]
        [System.Boolean]
        $WindowsStoreBlocked,

        [Parameter()]
        [System.Boolean]
        $WindowsStoreEnablePrivateStoreOnly,

        [Parameter()]
        [System.Boolean]
        $WirelessDisplayBlockProjectionToThisDevice,

        [Parameter()]
        [System.Boolean]
        $WirelessDisplayBlockUserInputFromReceiver,

        [Parameter()]
        [System.Boolean]
        $WirelessDisplayRequirePinForPairing,

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
        $CreateParameters.add('@odata.type','#microsoft.graph.windows10GeneralConfiguration')

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
        $UpdateParameters.add('@odata.type','#microsoft.graph.windows10GeneralConfiguration')

        <#if ($AdditionalProperties)
        {
            $UpdateParameters.add('AdditionalProperties', $AdditionalProperties)
        }#>

        
        #region resource generator code
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
        $AccountsBlockAddingNonMicrosoftAccountEmail,

        [Parameter()]
        [System.Boolean]
        $AntiTheftModeBlocked,

        [Parameter()]
        [ValidateSet('notConfigured','blocked','allowed')]
        [System.String]
        $AppsAllowTrustedAppsSideloading,

        [Parameter()]
        [System.Boolean]
        $AppsBlockWindowsStoreOriginatedApps,

        [Parameter()]
        [System.String[]]
        $BluetoothAllowedServices,

        [Parameter()]
        [System.Boolean]
        $BluetoothBlockAdvertising,

        [Parameter()]
        [System.Boolean]
        $BluetoothBlockDiscoverableMode,

        [Parameter()]
        [System.Boolean]
        $BluetoothBlocked,

        [Parameter()]
        [System.Boolean]
        $BluetoothBlockPrePairing,

        [Parameter()]
        [System.Boolean]
        $CameraBlocked,

        [Parameter()]
        [System.Boolean]
        $CellularBlockDataWhenRoaming,

        [Parameter()]
        [System.Boolean]
        $CellularBlockVpn,

        [Parameter()]
        [System.Boolean]
        $CellularBlockVpnWhenRoaming,

        [Parameter()]
        [System.Boolean]
        $CertificatesBlockManualRootCertificateInstallation,

        [Parameter()]
        [System.Boolean]
        $ConnectedDevicesServiceBlocked,

        [Parameter()]
        [System.Boolean]
        $CopyPasteBlocked,

        [Parameter()]
        [System.Boolean]
        $CortanaBlocked,

        [Parameter()]
        [System.Boolean]
        $DefenderBlockEndUserAccess,

        [Parameter()]
        [ValidateSet('notConfigured','high','highPlus','zeroTolerance')]
        [System.String]
        $DefenderCloudBlockLevel,

        [Parameter()]
        [System.Int32]
        $DefenderDaysBeforeDeletingQuarantinedMalware,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $DefenderDetectedMalwareActions,

        [Parameter()]
        [System.String[]]
        $DefenderFileExtensionsToExclude,

        [Parameter()]
        [System.String[]]
        $DefenderFilesAndFoldersToExclude,

        [Parameter()]
        [ValidateSet('userDefined','disable','monitorAllFiles','monitorIncomingFilesOnly','monitorOutgoingFilesOnly')]
        [System.String]
        $DefenderMonitorFileActivity,

        [Parameter()]
        [System.String[]]
        $DefenderProcessesToExclude,

        [Parameter()]
        [ValidateSet('userDefined','alwaysPrompt','promptBeforeSendingPersonalData','neverSendData','sendAllDataWithoutPrompting')]
        [System.String]
        $DefenderPromptForSampleSubmission,

        [Parameter()]
        [System.Boolean]
        $DefenderRequireBehaviorMonitoring,

        [Parameter()]
        [System.Boolean]
        $DefenderRequireCloudProtection,

        [Parameter()]
        [System.Boolean]
        $DefenderRequireNetworkInspectionSystem,

        [Parameter()]
        [System.Boolean]
        $DefenderRequireRealTimeMonitoring,

        [Parameter()]
        [System.Boolean]
        $DefenderScanArchiveFiles,

        [Parameter()]
        [System.Boolean]
        $DefenderScanDownloads,

        [Parameter()]
        [System.Boolean]
        $DefenderScanIncomingMail,

        [Parameter()]
        [System.Boolean]
        $DefenderScanMappedNetworkDrivesDuringFullScan,

        [Parameter()]
        [System.Int32]
        $DefenderScanMaxCpu,

        [Parameter()]
        [System.Boolean]
        $DefenderScanNetworkFiles,

        [Parameter()]
        [System.Boolean]
        $DefenderScanRemovableDrivesDuringFullScan,

        [Parameter()]
        [System.Boolean]
        $DefenderScanScriptsLoadedInInternetExplorer,

        [Parameter()]
        [ValidateSet('userDefined','disabled','quick','full')]
        [System.String]
        $DefenderScanType,

        [Parameter()]
        [System.String]
        $DefenderScheduledQuickScanTime,

        [Parameter()]
        [System.String]
        $DefenderScheduledScanTime,

        [Parameter()]
        [System.Int32]
        $DefenderSignatureUpdateIntervalInHours,

        [Parameter()]
        [ValidateSet('userDefined','everyday','sunday','monday','tuesday','wednesday','thursday','friday','saturday')]
        [System.String]
        $DefenderSystemScanSchedule,

        [Parameter()]
        [ValidateSet('notConfigured','blocked','allowed')]
        [System.String]
        $DeveloperUnlockSetting,

        [Parameter()]
        [System.Boolean]
        $DeviceManagementBlockFactoryResetOnMobile,

        [Parameter()]
        [System.Boolean]
        $DeviceManagementBlockManualUnenroll,

        [Parameter()]
        [ValidateSet('userDefined','none','basic','enhanced','full')]
        [System.String]
        $DiagnosticsDataSubmissionMode,

        [Parameter()]
        [System.Boolean]
        $EdgeAllowStartPagesModification,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockAccessToAboutFlags,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockAddressBarDropdown,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockAutofill,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockCompatibilityList,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockDeveloperTools,

        [Parameter()]
        [System.Boolean]
        $EdgeBlocked,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockExtensions,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockInPrivateBrowsing,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockJavaScript,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockLiveTileDataCollection,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockPasswordManager,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockPopups,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockSearchSuggestions,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockSendingDoNotTrackHeader,

        [Parameter()]
        [System.Boolean]
        $EdgeBlockSendingIntranetTrafficToInternetExplorer,

        [Parameter()]
        [System.Boolean]
        $EdgeClearBrowsingDataOnExit,

        [Parameter()]
        [ValidateSet('userDefined','allow','blockThirdParty','blockAll')]
        [System.String]
        $EdgeCookiePolicy,

        [Parameter()]
        [System.Boolean]
        $EdgeDisableFirstRunPage,

        [Parameter()]
        [System.String]
        $EdgeEnterpriseModeSiteListLocation,

        [Parameter()]
        [System.String]
        $EdgeFirstRunUrl,

        [Parameter()]
        [System.String[]]
        $EdgeHomepageUrls,

        [Parameter()]
        [System.Boolean]
        $EdgeRequireSmartScreen,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $EdgeSearchEngine,

        [Parameter()]
        [System.Boolean]
        $EdgeSendIntranetTrafficToInternetExplorer,

        [Parameter()]
        [System.Boolean]
        $EdgeSyncFavoritesWithInternetExplorer,

        [Parameter()]
        [System.String]
        $EnterpriseCloudPrintDiscoveryEndPoint,

        [Parameter()]
        [System.Int32]
        $EnterpriseCloudPrintDiscoveryMaxLimit,

        [Parameter()]
        [System.String]
        $EnterpriseCloudPrintMopriaDiscoveryResourceIdentifier,

        [Parameter()]
        [System.String]
        $EnterpriseCloudPrintOAuthAuthority,

        [Parameter()]
        [System.String]
        $EnterpriseCloudPrintOAuthClientIdentifier,

        [Parameter()]
        [System.String]
        $EnterpriseCloudPrintResourceIdentifier,

        [Parameter()]
        [System.Boolean]
        $ExperienceBlockDeviceDiscovery,

        [Parameter()]
        [System.Boolean]
        $ExperienceBlockErrorDialogWhenNoSIM,

        [Parameter()]
        [System.Boolean]
        $ExperienceBlockTaskSwitcher,

        [Parameter()]
        [System.Boolean]
        $GameDvrBlocked,

        [Parameter()]
        [System.Boolean]
        $InternetSharingBlocked,

        [Parameter()]
        [System.Boolean]
        $LocationServicesBlocked,

        [Parameter()]
        [System.Boolean]
        $LockScreenAllowTimeoutConfiguration,

        [Parameter()]
        [System.Boolean]
        $LockScreenBlockActionCenterNotifications,

        [Parameter()]
        [System.Boolean]
        $LockScreenBlockCortana,

        [Parameter()]
        [System.Boolean]
        $LockScreenBlockToastNotifications,

        [Parameter()]
        [System.Int32]
        $LockScreenTimeoutInSeconds,

        [Parameter()]
        [System.Boolean]
        $LogonBlockFastUserSwitching,

        [Parameter()]
        [System.Boolean]
        $MicrosoftAccountBlocked,

        [Parameter()]
        [System.Boolean]
        $MicrosoftAccountBlockSettingsSync,

        [Parameter()]
        [System.Boolean]
        $NetworkProxyApplySettingsDeviceWide,

        [Parameter()]
        [System.String]
        $NetworkProxyAutomaticConfigurationUrl,

        [Parameter()]
        [System.Boolean]
        $NetworkProxyDisableAutoDetect,

        [Parameter()]
        [Microsoft.Management.Infrastructure.CimInstance]
        $NetworkProxyServer,

        [Parameter()]
        [System.Boolean]
        $NfcBlocked,

        [Parameter()]
        [System.Boolean]
        $OneDriveDisableFileSync,

        [Parameter()]
        [System.Boolean]
        $PasswordBlockSimple,

        [Parameter()]
        [System.Int32]
        $PasswordExpirationDays,

        [Parameter()]
        [System.Int32]
        $PasswordMinimumCharacterSetCount,

        [Parameter()]
        [System.Int32]
        $PasswordMinimumLength,

        [Parameter()]
        [System.Int32]
        $PasswordMinutesOfInactivityBeforeScreenTimeout,

        [Parameter()]
        [System.Int32]
        $PasswordPreviousPasswordBlockCount,

        [Parameter()]
        [System.Boolean]
        $PasswordRequired,

        [Parameter()]
        [ValidateSet('deviceDefault','alphanumeric','numeric')]
        [System.String]
        $PasswordRequiredType,

        [Parameter()]
        [System.Boolean]
        $PasswordRequireWhenResumeFromIdleState,

        [Parameter()]
        [System.Int32]
        $PasswordSignInFailureCountBeforeFactoryReset,

        [Parameter()]
        [System.String]
        $PersonalizationDesktopImageUrl,

        [Parameter()]
        [System.String]
        $PersonalizationLockScreenImageUrl,

        [Parameter()]
        [ValidateSet('notConfigured','blocked','allowed')]
        [System.String]
        $PrivacyAdvertisingId,

        [Parameter()]
        [System.Boolean]
        $PrivacyAutoAcceptPairingAndConsentPrompts,

        [Parameter()]
        [System.Boolean]
        $PrivacyBlockInputPersonalization,

        [Parameter()]
        [System.Boolean]
        $ResetProtectionModeBlocked,

        [Parameter()]
        [ValidateSet('userDefined','strict','moderate')]
        [System.String]
        $SafeSearchFilter,

        [Parameter()]
        [System.Boolean]
        $ScreenCaptureBlocked,

        [Parameter()]
        [System.Boolean]
        $SearchBlockDiacritics,

        [Parameter()]
        [System.Boolean]
        $SearchDisableAutoLanguageDetection,

        [Parameter()]
        [System.Boolean]
        $SearchDisableIndexerBackoff,

        [Parameter()]
        [System.Boolean]
        $SearchDisableIndexingEncryptedItems,

        [Parameter()]
        [System.Boolean]
        $SearchDisableIndexingRemovableDrive,

        [Parameter()]
        [System.Boolean]
        $SearchEnableAutomaticIndexSizeManangement,

        [Parameter()]
        [System.Boolean]
        $SearchEnableRemoteQueries,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockAccountsPage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockAddProvisioningPackage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockAppsPage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockChangeLanguage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockChangePowerSleep,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockChangeRegion,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockChangeSystemTime,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockDevicesPage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockEaseOfAccessPage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockEditDeviceName,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockGamingPage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockNetworkInternetPage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockPersonalizationPage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockPrivacyPage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockRemoveProvisioningPackage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockSettingsApp,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockSystemPage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockTimeLanguagePage,

        [Parameter()]
        [System.Boolean]
        $SettingsBlockUpdateSecurityPage,

        [Parameter()]
        [System.Boolean]
        $SharedUserAppDataAllowed,

        [Parameter()]
        [System.Boolean]
        $SmartScreenBlockPromptOverride,

        [Parameter()]
        [System.Boolean]
        $SmartScreenBlockPromptOverrideForFiles,

        [Parameter()]
        [System.Boolean]
        $SmartScreenEnableAppInstallControl,

        [Parameter()]
        [System.Boolean]
        $StartBlockUnpinningAppsFromTaskbar,

        [Parameter()]
        [ValidateSet('userDefined','collapse','remove','disableSettingsApp')]
        [System.String]
        $StartMenuAppListVisibility,

        [Parameter()]
        [System.Boolean]
        $StartMenuHideChangeAccountSettings,

        [Parameter()]
        [System.Boolean]
        $StartMenuHideFrequentlyUsedApps,

        [Parameter()]
        [System.Boolean]
        $StartMenuHideHibernate,

        [Parameter()]
        [System.Boolean]
        $StartMenuHideLock,

        [Parameter()]
        [System.Boolean]
        $StartMenuHidePowerButton,

        [Parameter()]
        [System.Boolean]
        $StartMenuHideRecentJumpLists,

        [Parameter()]
        [System.Boolean]
        $StartMenuHideRecentlyAddedApps,

        [Parameter()]
        [System.Boolean]
        $StartMenuHideRestartOptions,

        [Parameter()]
        [System.Boolean]
        $StartMenuHideShutDown,

        [Parameter()]
        [System.Boolean]
        $StartMenuHideSignOut,

        [Parameter()]
        [System.Boolean]
        $StartMenuHideSleep,

        [Parameter()]
        [System.Boolean]
        $StartMenuHideSwitchAccount,

        [Parameter()]
        [System.Boolean]
        $StartMenuHideUserTile,

        [Parameter()]
        [System.String]
        $StartMenuLayoutEdgeAssetsXml,

        [Parameter()]
        [System.String]
        $StartMenuLayoutXml,

        [Parameter()]
        [ValidateSet('userDefined','fullScreen','nonFullScreen')]
        [System.String]
        $StartMenuMode,

        [Parameter()]
        [ValidateSet('notConfigured','hide','show')]
        [System.String]
        $StartMenuPinnedFolderDocuments,

        [Parameter()]
        [ValidateSet('notConfigured','hide','show')]
        [System.String]
        $StartMenuPinnedFolderDownloads,

        [Parameter()]
        [ValidateSet('notConfigured','hide','show')]
        [System.String]
        $StartMenuPinnedFolderFileExplorer,

        [Parameter()]
        [ValidateSet('notConfigured','hide','show')]
        [System.String]
        $StartMenuPinnedFolderHomeGroup,

        [Parameter()]
        [ValidateSet('notConfigured','hide','show')]
        [System.String]
        $StartMenuPinnedFolderMusic,

        [Parameter()]
        [ValidateSet('notConfigured','hide','show')]
        [System.String]
        $StartMenuPinnedFolderNetwork,

        [Parameter()]
        [ValidateSet('notConfigured','hide','show')]
        [System.String]
        $StartMenuPinnedFolderPersonalFolder,

        [Parameter()]
        [ValidateSet('notConfigured','hide','show')]
        [System.String]
        $StartMenuPinnedFolderPictures,

        [Parameter()]
        [ValidateSet('notConfigured','hide','show')]
        [System.String]
        $StartMenuPinnedFolderSettings,

        [Parameter()]
        [ValidateSet('notConfigured','hide','show')]
        [System.String]
        $StartMenuPinnedFolderVideos,

        [Parameter()]
        [System.Boolean]
        $StorageBlockRemovableStorage,

        [Parameter()]
        [System.Boolean]
        $StorageRequireMobileDeviceEncryption,

        [Parameter()]
        [System.Boolean]
        $StorageRestrictAppDataToSystemVolume,

        [Parameter()]
        [System.Boolean]
        $StorageRestrictAppInstallToSystemVolume,

        [Parameter()]
        [System.Boolean]
        $TenantLockdownRequireNetworkDuringOutOfBoxExperience,

        [Parameter()]
        [System.Boolean]
        $UsbBlocked,

        [Parameter()]
        [System.Boolean]
        $VoiceRecordingBlocked,

        [Parameter()]
        [System.Boolean]
        $WebRtcBlockLocalhostIpAddress,

        [Parameter()]
        [System.Boolean]
        $WiFiBlockAutomaticConnectHotspots,

        [Parameter()]
        [System.Boolean]
        $WiFiBlocked,

        [Parameter()]
        [System.Boolean]
        $WiFiBlockManualConfiguration,

        [Parameter()]
        [System.Int32]
        $WiFiScanInterval,

        [Parameter()]
        [System.Boolean]
        $WindowsSpotlightBlockConsumerSpecificFeatures,

        [Parameter()]
        [System.Boolean]
        $WindowsSpotlightBlocked,

        [Parameter()]
        [System.Boolean]
        $WindowsSpotlightBlockOnActionCenter,

        [Parameter()]
        [System.Boolean]
        $WindowsSpotlightBlockTailoredExperiences,

        [Parameter()]
        [System.Boolean]
        $WindowsSpotlightBlockThirdPartyNotifications,

        [Parameter()]
        [System.Boolean]
        $WindowsSpotlightBlockWelcomeExperience,

        [Parameter()]
        [System.Boolean]
        $WindowsSpotlightBlockWindowsTips,

        [Parameter()]
        [ValidateSet('notConfigured','disabled','enabled')]
        [System.String]
        $WindowsSpotlightConfigureOnLockScreen,

        [Parameter()]
        [System.Boolean]
        $WindowsStoreBlockAutoUpdate,

        [Parameter()]
        [System.Boolean]
        $WindowsStoreBlocked,

        [Parameter()]
        [System.Boolean]
        $WindowsStoreEnablePrivateStoreOnly,

        [Parameter()]
        [System.Boolean]
        $WirelessDisplayBlockProjectionToThisDevice,

        [Parameter()]
        [System.Boolean]
        $WirelessDisplayBlockUserInputFromReceiver,

        [Parameter()]
        [System.Boolean]
        $WirelessDisplayRequirePinForPairing,

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

    Write-Verbose -Message "Testing configuration of {$id}"

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
                $_.AdditionalProperties.'@odata.type' -eq '#microsoft.graph.windows10GeneralConfiguration'  `
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

            if ($Results.DefenderDetectedMalwareActions)
            {
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString -ComplexObject $Results.DefenderDetectedMalwareActions -CIMInstanceName Intunedefenderdetectedmalwareactions
                if ($complexTypeStringResult)
                {
                    $Results.DefenderDetectedMalwareActions = $complexTypeStringResult
                }
                else
                {
                    $Results.Remove('DefenderDetectedMalwareActions') | Out-Null
                }
            }
            if ($Results.EdgeSearchEngine)
            {
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString -ComplexObject $Results.EdgeSearchEngine -CIMInstanceName Intuneedgesearchenginebase
                if ($complexTypeStringResult)
                {
                    $Results.EdgeSearchEngine = $complexTypeStringResult
                }
                else
                {
                    $Results.Remove('EdgeSearchEngine') | Out-Null
                }
            }
            if ($Results.NetworkProxyServer)
            {
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString -ComplexObject $Results.NetworkProxyServer -CIMInstanceName Intunewindows10networkproxyserver
                if ($complexTypeStringResult)
                {
                    $Results.NetworkProxyServer = $complexTypeStringResult
                }
                else
                {
                    $Results.Remove('NetworkProxyServer') | Out-Null
                }
            }
            if ($Results.DeviceSettingStateSummaries)
            {
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString -ComplexObject $Results.DeviceSettingStateSummaries -CIMInstanceName Intunesettingstatedevicesummary
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
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString -ComplexObject $Results.DeviceStatuses -CIMInstanceName Intunedeviceconfigurationdevicestatus
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
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString -ComplexObject $Results.UserStatuses -CIMInstanceName Intunedeviceconfigurationuserstatus
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
                $complexTypeStringResult = Get-M365DSCDRGComplexTypeToString -ComplexObject $Results.Assignments -CIMInstanceName IntuneDeviceConfigurationPolicyWindows10Assignments
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

            if ($Results.DefenderDetectedMalwareActions)
            {
                $isCIMArray=$false
                if($Results.DefenderDetectedMalwareActions.getType().Fullname -like "*[[\]]")
                {
                    $isCIMArray=$true
                }
                $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "DefenderDetectedMalwareActions" -isCIMArray:$isCIMArray
            }
            if ($Results.EdgeSearchEngine)
            {
                $isCIMArray=$false
                if($Results.EdgeSearchEngine.getType().Fullname -like "*[[\]]")
                {
                    $isCIMArray=$true
                }
                $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "EdgeSearchEngine" -isCIMArray:$isCIMArray
            }
            if ($Results.NetworkProxyServer)
            {
                $isCIMArray=$false
                if($Results.NetworkProxyServer.getType().Fullname -like "*[[\]]")
                {
                    $isCIMArray=$true
                }
                $currentDSCBlock = Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "NetworkProxyServer" -isCIMArray:$isCIMArray
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
                $isCIMArray=$false
                if($Results.Assignments.getType().Fullname -like "*[[\]]")
                {
                    $isCIMArray=$true
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
                "AccountsBlockAddingNonMicrosoftAccountEmail"
        "AntiTheftModeBlocked"
        "AppsAllowTrustedAppsSideloading"
        "AppsBlockWindowsStoreOriginatedApps"
        "BluetoothAllowedServices"
        "BluetoothBlockAdvertising"
        "BluetoothBlockDiscoverableMode"
        "BluetoothBlocked"
        "BluetoothBlockPrePairing"
        "CameraBlocked"
        "CellularBlockDataWhenRoaming"
        "CellularBlockVpn"
        "CellularBlockVpnWhenRoaming"
        "CertificatesBlockManualRootCertificateInstallation"
        "ConnectedDevicesServiceBlocked"
        "CopyPasteBlocked"
        "CortanaBlocked"
        "DefenderBlockEndUserAccess"
        "DefenderCloudBlockLevel"
        "DefenderDaysBeforeDeletingQuarantinedMalware"
        "DefenderDetectedMalwareActions"
        "DefenderFileExtensionsToExclude"
        "DefenderFilesAndFoldersToExclude"
        "DefenderMonitorFileActivity"
        "DefenderProcessesToExclude"
        "DefenderPromptForSampleSubmission"
        "DefenderRequireBehaviorMonitoring"
        "DefenderRequireCloudProtection"
        "DefenderRequireNetworkInspectionSystem"
        "DefenderRequireRealTimeMonitoring"
        "DefenderScanArchiveFiles"
        "DefenderScanDownloads"
        "DefenderScanIncomingMail"
        "DefenderScanMappedNetworkDrivesDuringFullScan"
        "DefenderScanMaxCpu"
        "DefenderScanNetworkFiles"
        "DefenderScanRemovableDrivesDuringFullScan"
        "DefenderScanScriptsLoadedInInternetExplorer"
        "DefenderScanType"
        "DefenderScheduledQuickScanTime"
        "DefenderScheduledScanTime"
        "DefenderSignatureUpdateIntervalInHours"
        "DefenderSystemScanSchedule"
        "DeveloperUnlockSetting"
        "DeviceManagementBlockFactoryResetOnMobile"
        "DeviceManagementBlockManualUnenroll"
        "DiagnosticsDataSubmissionMode"
        "EdgeAllowStartPagesModification"
        "EdgeBlockAccessToAboutFlags"
        "EdgeBlockAddressBarDropdown"
        "EdgeBlockAutofill"
        "EdgeBlockCompatibilityList"
        "EdgeBlockDeveloperTools"
        "EdgeBlocked"
        "EdgeBlockExtensions"
        "EdgeBlockInPrivateBrowsing"
        "EdgeBlockJavaScript"
        "EdgeBlockLiveTileDataCollection"
        "EdgeBlockPasswordManager"
        "EdgeBlockPopups"
        "EdgeBlockSearchSuggestions"
        "EdgeBlockSendingDoNotTrackHeader"
        "EdgeBlockSendingIntranetTrafficToInternetExplorer"
        "EdgeClearBrowsingDataOnExit"
        "EdgeCookiePolicy"
        "EdgeDisableFirstRunPage"
        "EdgeEnterpriseModeSiteListLocation"
        "EdgeFirstRunUrl"
        "EdgeHomepageUrls"
        "EdgeRequireSmartScreen"
        "EdgeSearchEngine"
        "EdgeSendIntranetTrafficToInternetExplorer"
        "EdgeSyncFavoritesWithInternetExplorer"
        "EnterpriseCloudPrintDiscoveryEndPoint"
        "EnterpriseCloudPrintDiscoveryMaxLimit"
        "EnterpriseCloudPrintMopriaDiscoveryResourceIdentifier"
        "EnterpriseCloudPrintOAuthAuthority"
        "EnterpriseCloudPrintOAuthClientIdentifier"
        "EnterpriseCloudPrintResourceIdentifier"
        "ExperienceBlockDeviceDiscovery"
        "ExperienceBlockErrorDialogWhenNoSIM"
        "ExperienceBlockTaskSwitcher"
        "GameDvrBlocked"
        "InternetSharingBlocked"
        "LocationServicesBlocked"
        "LockScreenAllowTimeoutConfiguration"
        "LockScreenBlockActionCenterNotifications"
        "LockScreenBlockCortana"
        "LockScreenBlockToastNotifications"
        "LockScreenTimeoutInSeconds"
        "LogonBlockFastUserSwitching"
        "MicrosoftAccountBlocked"
        "MicrosoftAccountBlockSettingsSync"
        "NetworkProxyApplySettingsDeviceWide"
        "NetworkProxyAutomaticConfigurationUrl"
        "NetworkProxyDisableAutoDetect"
        "NetworkProxyServer"
        "NfcBlocked"
        "OneDriveDisableFileSync"
        "PasswordBlockSimple"
        "PasswordExpirationDays"
        "PasswordMinimumCharacterSetCount"
        "PasswordMinimumLength"
        "PasswordMinutesOfInactivityBeforeScreenTimeout"
        "PasswordPreviousPasswordBlockCount"
        "PasswordRequired"
        "PasswordRequiredType"
        "PasswordRequireWhenResumeFromIdleState"
        "PasswordSignInFailureCountBeforeFactoryReset"
        "PersonalizationDesktopImageUrl"
        "PersonalizationLockScreenImageUrl"
        "PrivacyAdvertisingId"
        "PrivacyAutoAcceptPairingAndConsentPrompts"
        "PrivacyBlockInputPersonalization"
        "ResetProtectionModeBlocked"
        "SafeSearchFilter"
        "ScreenCaptureBlocked"
        "SearchBlockDiacritics"
        "SearchDisableAutoLanguageDetection"
        "SearchDisableIndexerBackoff"
        "SearchDisableIndexingEncryptedItems"
        "SearchDisableIndexingRemovableDrive"
        "SearchEnableAutomaticIndexSizeManangement"
        "SearchEnableRemoteQueries"
        "SettingsBlockAccountsPage"
        "SettingsBlockAddProvisioningPackage"
        "SettingsBlockAppsPage"
        "SettingsBlockChangeLanguage"
        "SettingsBlockChangePowerSleep"
        "SettingsBlockChangeRegion"
        "SettingsBlockChangeSystemTime"
        "SettingsBlockDevicesPage"
        "SettingsBlockEaseOfAccessPage"
        "SettingsBlockEditDeviceName"
        "SettingsBlockGamingPage"
        "SettingsBlockNetworkInternetPage"
        "SettingsBlockPersonalizationPage"
        "SettingsBlockPrivacyPage"
        "SettingsBlockRemoveProvisioningPackage"
        "SettingsBlockSettingsApp"
        "SettingsBlockSystemPage"
        "SettingsBlockTimeLanguagePage"
        "SettingsBlockUpdateSecurityPage"
        "SharedUserAppDataAllowed"
        "SmartScreenBlockPromptOverride"
        "SmartScreenBlockPromptOverrideForFiles"
        "SmartScreenEnableAppInstallControl"
        "StartBlockUnpinningAppsFromTaskbar"
        "StartMenuAppListVisibility"
        "StartMenuHideChangeAccountSettings"
        "StartMenuHideFrequentlyUsedApps"
        "StartMenuHideHibernate"
        "StartMenuHideLock"
        "StartMenuHidePowerButton"
        "StartMenuHideRecentJumpLists"
        "StartMenuHideRecentlyAddedApps"
        "StartMenuHideRestartOptions"
        "StartMenuHideShutDown"
        "StartMenuHideSignOut"
        "StartMenuHideSleep"
        "StartMenuHideSwitchAccount"
        "StartMenuHideUserTile"
        "StartMenuLayoutEdgeAssetsXml"
        "StartMenuLayoutXml"
        "StartMenuMode"
        "StartMenuPinnedFolderDocuments"
        "StartMenuPinnedFolderDownloads"
        "StartMenuPinnedFolderFileExplorer"
        "StartMenuPinnedFolderHomeGroup"
        "StartMenuPinnedFolderMusic"
        "StartMenuPinnedFolderNetwork"
        "StartMenuPinnedFolderPersonalFolder"
        "StartMenuPinnedFolderPictures"
        "StartMenuPinnedFolderSettings"
        "StartMenuPinnedFolderVideos"
        "StorageBlockRemovableStorage"
        "StorageRequireMobileDeviceEncryption"
        "StorageRestrictAppDataToSystemVolume"
        "StorageRestrictAppInstallToSystemVolume"
        "TenantLockdownRequireNetworkDuringOutOfBoxExperience"
        "UsbBlocked"
        "VoiceRecordingBlocked"
        "WebRtcBlockLocalhostIpAddress"
        "WiFiBlockAutomaticConnectHotspots"
        "WiFiBlocked"
        "WiFiBlockManualConfiguration"
        "WiFiScanInterval"
        "WindowsSpotlightBlockConsumerSpecificFeatures"
        "WindowsSpotlightBlocked"
        "WindowsSpotlightBlockOnActionCenter"
        "WindowsSpotlightBlockTailoredExperiences"
        "WindowsSpotlightBlockThirdPartyNotifications"
        "WindowsSpotlightBlockWelcomeExperience"
        "WindowsSpotlightBlockWindowsTips"
        "WindowsSpotlightConfigureOnLockScreen"
        "WindowsStoreBlockAutoUpdate"
        "WindowsStoreBlocked"
        "WindowsStoreEnablePrivateStoreOnly"
        "WirelessDisplayBlockProjectionToThisDevice"
        "WirelessDisplayBlockUserInputFromReceiver"
        "WirelessDisplayRequirePinForPairing"
        "DeviceSettingStateSummaries"
        "DeviceStatuses"
        "UserStatuses"

    )
    $results = @{'@odata.type' = '#microsoft.graph.windows10GeneralConfiguration' }
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
        $body = @{'assignments'=$deviceManagementPolicyAssignments}|ConvertTo-Json -Depth 20
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
