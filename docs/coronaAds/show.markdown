# coronaAds.show()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Corona Ads, coronaAds, show
> __See also__          [coronaAds.init()][plugin.coronaAds.init]
>						[coronaAds.hide()][plugin.coronaAds.hide]
>						[adsRequest][plugin.coronaAds.event.adsRequest]
>						[coronaAds.*][plugin.coronaAds]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Shows an ad in the specified placement.

Note that you must first [initialize][plugin.coronaAds.init] Corona Ads __and__ wait for an event [phase][plugin.coronaads.event.adsRequest.phase] of `"init"` before attempting to show an ad.

See the [adsRequest][plugin.coronaAds.event.adsRequest] documentation for details on handling Corona Ads events.


## Syntax

	coronaAds.show( placementId [, showCloseButton] )

##### placementId ~^(required)^~
_[String][api.type.String]._ The placement identifier where the ad is to be shown.

##### showCloseButton ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, a close button will appear on the ad __if__ permitted by the ad server partner. Default is `false`.


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
