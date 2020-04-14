local metadata =
{
	plugin =
	{
		format = 'staticLibrary',

		-- This is the name without the 'lib' prefix.
		staticLibs = { 'plugin_coronaAds','z','xml2','c++'}, 

		frameworks = {'EventKit','EventKitUI','CoreTelephony','SafariServices','AssetsLibrary','WebKit','CoreLocation','AdSupport','StoreKit','CoreMotion'},

		frameworksOptional = {},
	},
}

return metadata