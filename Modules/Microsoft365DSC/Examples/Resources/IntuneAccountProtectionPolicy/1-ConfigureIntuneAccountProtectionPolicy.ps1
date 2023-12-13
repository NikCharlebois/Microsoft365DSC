<#
This example is used to test new resources and showcase the usage of new resources being worked on.
It is not meant to use as a production baseline.
#>

Configuration Example
{
    param(
        [Parameter(Mandatory = $true)]
        [PSCredential]
        $Credscredential
    )
    Import-DscResource -ModuleName Microsoft365DSC

    node localhost
    {
        IntuneAccountProtectionPolicy 'myAccountProtectionPolicy'
        {
            Assignments                                            = @();
            deviceGuardLocalSystemAuthorityCredentialGuardSettings = "enableWithUEFILock";
            DisplayName                                            = "TestProtectionPolicy";
            enhancedAntiSpoofingForFacialFeaturesEnabled           = $False;
            Ensure                                                 = "Present";
            pinLowercaseCharactersUsage                            = "notConfigured";
            pinRecoveryEnabled                                     = $False;
            pinSpecialCharactersUsage                              = "notConfigured";
            pinUppercaseCharactersUsage                            = "notConfigured";
            securityDeviceRequired                                 = $False;
            unlockWithBiometricsEnabled                            = $False;
            useCertificatesForOnPremisesAuthEnabled                = $False;
            useSecurityKeyForSignin                                = $True;
            windowsHelloForBusinessBlocked                         = "notConfigured";
            Credential                                             = $Credscredential
        }
    }
}
