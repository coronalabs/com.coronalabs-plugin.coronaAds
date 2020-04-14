local metadata =
{
	plugin =
	{
		format = 'jar', -- Valid values are 'jar'
		manifest =
		{
			permissions = {},
			usesPermissions =
			{
				"android.permission.INTERNET",
				"android.permission.ACCESS_COARSE_LOCATION",
				"android.permission.ACCESS_FINE_LOCATION",
				"android.permission.ACCESS_NETWORK_STATE",
			},
			usesFeatures = {},
            applicationChildElements =
            {
            	[[<activity android:name="com.facebook.ads.InterstitialAdActivity"
              		android:configChanges="keyboardHidden|orientation|screenSize"/>
			  	<activity android:name="com.mobfox.sdk.interstitialads.InterstitialActivity"></activity>]]
            }
		},
	},
	coronaManifest =
    {
        dependencies =
        {
            ["shared.google.play.services.ads"] = "com.coronalabs"
        }
    }
}

return metadata;
