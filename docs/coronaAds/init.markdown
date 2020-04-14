# coronaAds.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Corona Ads, coronaAds, init
> __See also__          [coronaAds.show()][plugin.coronaAds.show]
>						[coronaAds.*][plugin.coronaAds]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`coronaAds.init()` initializes the Corona&nbsp;Ads service. This call is required and must be executed before making other calls such as [coronaAds.show()][plugin.coronaAds.show].

Once initialized, an event [phase][plugin.coronaads.event.adsRequest.phase] of `"init"` will be dispatched to the specified [listener][api.type.Listener] function.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

You must wait for a successful `"init"` [phase][plugin.coronaAds.event.adsRequest.phase] event before trying to show ads.

</div>


## Syntax

	coronaAds.init( apiKey, listener )

##### apiKey ~^(required)^~
_[String][api.type.String]._ API key for the app, generated on the [Corona Ads](http://monetize.coronalabs.com) dashboard.

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ Listener function that will receive [adsRequest][plugin.coronaAds.event.adsRequest] events.


## Example

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
