@{
    Intune = @(
        @{
            ResourceName             = 'IntuneDeviceConfigurationPolicyiOS'
            GraphModuleCmdLetNoun    = 'MgDeviceManagementDeviceConfiguration'
            APIVersion               = 'beta'
            SelectionFilter          = @{
                AdditionalPropertiesType = 'iosGeneralDeviceConfiguration'
            }
        },
        @{
            ResourceName             = 'IntuneDeviceConfigurationPolicyWindows10'
            GraphModuleCmdLetNoun    = 'MgDeviceManagementDeviceConfiguration'
            APIVersion               = 'beta'
            SelectionFilter          = @{
                AdditionalPropertiesType = 'windows10GeneralConfiguration'
            }
        },
        @{
            ResourceName             = 'IntuneDeviceEnrollmentLimitRestriction'
            GraphModuleCmdLetNoun    = 'MgDeviceManagementDeviceEnrollmentConfiguration'
            APIVersion               = 'beta'
            SelectionFilter          = @{
                AdditionalPropertiesType = 'deviceEnrollmentLimitConfiguration'
            }
        },
        @{
            ResourceName             = 'IntuneWifiConfigurationPolicyAndroidEntrepriseDeviceOwner'
            GraphModuleCmdLetNoun    = 'MgDeviceManagementDeviceConfiguration'
            APIVersion               = 'beta'
            SelectionFilter          = @{
                AdditionalPropertiesType = 'androidWorkProfileEnterpriseWiFiConfiguration'
            }
        }
    )
}
