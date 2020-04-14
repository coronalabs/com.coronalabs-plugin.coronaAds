# coronaAds.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Corona Ads, coronaAds
> __Platforms__			Android, iOS
> __Sample__			[https://github.com/coronalabs/plugins-sample-coronaAds](https://github.com/coronalabs/plugins-sample-coronaAds)
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This plugin enables native Corona ads and provides a simple set of functions to include banner, static interstitial, and video interstitial ads in your apps.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Corona Ads is known to work alongside all other plugins __except__ the [Facebook Audience Network][plugin.fbAudienceNetwork] plugin. Currently you can use either Corona&nbsp;Ads or Facebook Audience Network, but you can't use both at the same time.

</div>


## Setup

To use Corona Ads, you must be a registered Corona developer. If you're not already registered, please do so [here](https://developer.coronalabs.com/).

Once registered, simply log into the [Corona Developer Portal](https://developer.coronalabs.com/) and proceed as follows:

1. Access the [Corona Ads](https://monetize.coronalabs.com) dashboard by clicking the <nobr>__Monetize with Corona Ads__</nobr> button:

<div class="image-indent" style="max-width: 271px;">

![][images.docs.corona-ads-db-0]

</div>

2. In the top bar, select the __My&nbsp;Apps__ tab:

<div class="image-indent" style="width:80%;">

![][images.docs.corona-ads-db-1]

</div>

3. Click the __New&nbsp;App__ button:

<div class="image-indent" style="width:80%;">

![][images.docs.corona-ads-db-2]

</div>

4. Supply the details about the app and click __Continue__ when finished.

5. On the next screen, note the entries which must be added to the app's `build.settings` file \([guide][guide.distribution.buildSettings]\), specifically the three additions within `plugins` and, for&nbsp;iOS, the three entries within <nobr>`iphone` &rarr; `plist`</nobr> <nobr>(refer to [Project Settings](#settings) below)</nobr>.

6. Finally, study the sample code block which will allow you to quickly begin showing Corona&nbsp;Ads within your app. This code, which mirrors [Basic Integration](#integration) below, should function without edits, but you should eventually substitute your own API&nbsp;key and placement&nbsp;ID(s) for integration within your app. See [Customization](#customization) below for details.


<a id="integration"></a>

## Basic Integration

``````lua
local coronaAds = require( "plugin.coronaAds" )

-- Substitute your own placement IDs when generated
local bannerPlacement = "top-banner-320x50"
local interstitialPlacement = "interstitial-1"

-- Corona Ads listener function
local function adListener( event )

	-- Successful initialization of Corona Ads
	if ( event.phase == "init" ) then
		-- Show an ad
		coronaAds.show( bannerPlacement, false )
		--coronaAds.show( interstitialPlacement, true )
	end
end

-- Initialize Corona Ads (substitute your own API key when generated)
coronaAds.init( "5223c2c3-cf81-4c43-ae41-2d4ed16552bc", adListener )
``````


<a id="customization"></a>

## Customization

Once you've achieved basic integration of Corona&nbsp;Ads, you should substitute your own API&nbsp;key and create at least one unique ad placement:

1. In the top bar, select the __My&nbsp;Apps__ tab:

<div class="image-indent" style="width:80%;">

![][images.docs.corona-ads-db-1]

</div>

2. Locate the appropriate app in the table. Below its name, click the <nobr>__Show API Key__</nobr> button to reveal the __API&nbsp;key__&nbsp;&mdash; this is the unique key which you should use when initializing Corona&nbsp;Ads via [coronaAds.init()][plugin.coronaAds.init].

3. Next, create a unique ad placement by clicking the __New&nbsp;Placement__ button:

<div class="image-indent" style="width:80%;">

![][images.docs.corona-ads-db-3]

</div>

4. On the next screen, specify a new __placement&nbsp;name__. This should clearly identify the __ad&nbsp;format__ which will be shown via the placement, for instance <nobr>`Static Interstitial`</nobr>. In the table below, select the ad format associated with the placement and then click __Add&nbsp;Placement__.

5. At this point, the list of apps will be refreshed. For the appropriate app, a new __placement&nbsp;ID__ will exist based on the options you specified. This is the unique ID which you should use when showing this ad type via [coronaAds.show()][plugin.coronaAds.show]. Note that you must use this placement&nbsp;ID in your code, __not__ the placement name&nbsp;&mdash; the distinction being that the ID is a lowercase string containing no spaces, for example <nobr>`static-interstitial`</nobr>.

6. If you wish to create additional placements for the app, simply repeat steps <nobr>3 to 5</nobr>.


## Syntax

	local coronaAds = require( "plugin.coronaAds" )


## Functions

#### [coronaAds.init()][plugin.coronaAds.init]

#### [coronaAds.show()][plugin.coronaAds.show]

#### [coronaAds.hide()][plugin.coronaAds.hide]


## Events

#### [adsRequest][plugin.coronaAds.event.adsRequest]


<a id="settings"></a>

## Project Settings

To use this plugin, add two entries into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````lua
settings =
{
	plugins =
	{
		["plugin.coronaAds"] =
		{
			publisherId = "com.coronalabs",
			supportedPlatforms = { iphone=true, android=true }
		},
		["plugin.google.play.services"] =
        {
            publisherId = "com.coronalabs",
			supportedPlatforms = { android=true }
        },
		["shared.android.support.v4"] =
		{
			publisherId = "com.coronalabs",
			supportedPlatforms = { android=true }
		},
	},
}
``````

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

If building for iOS, you must add the following three <nobr>key-value</nobr> pairs to the <nobr>`iphone` &rarr; `plist`</nobr> table of `build.settings`. Collectively, these bypass App Transport Security (ATS) and prompt the user to allow or disallow <nobr>location-based</nobr> services.

``````lua
settings =
{
	iphone =
	{
		plist =
		{
			NSAppTransportSecurity = { NSAllowsArbitraryLoads=true },
			NSLocationAlwaysUsageDescription = { "" },
			NSLocationWhenInUseUsageDescription = { "" },
		},
	},
}
``````

</div>

<div class="guide-notebox">
<div class="notebox-title">Note</div>

For Android, the following permissions/features/activities are automatically added when using this plugin:

``````lua
	android =
	{
		usesPermissions =
		{
			"android.permission.INTERNET",
			"android.permission.ACCESS_COARSE_LOCATION",
			"android.permission.ACCESS_FINE_LOCATION",
			"android.permission.ACCESS_NETWORK_STATE",
			"com.google.android.providers.gsf.permissions.READ_GSERVICES"
		},
		applicationChildElements =
		{
			[[<activity android:name="com.facebook.ads.InterstitialAdActivity"
				android:configChanges="keyboardHidden|orientation|screenSize"/>]]
		},
	},
``````

</div>


<!---

## Enterprise

### Android

If you are configuring your app for [Corona Enterprise](http://www.coronalabs.com/products/enterprise/) on Android, add the following to your `AndroidManifest.xml` file:

``````xml
<activity android:name="com.facebook.ads.InterstitialAdActivity"
	android:configChanges="keyboardHidden|orientation|screenSize"/>
``````

-->


## Support

* [Email](mailto:ads@coronalabs.com)
* [Corona Forums](https://forums.coronalabs.com/forum/656-corona-ads/)
