# coronaAds.hide()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Corona Ads, coronaAds, hide
> __See also__          [coronaAds.show()][plugin.coronaAds.show]
>						[coronaAds.*][plugin.coronaAds]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Hides an ad in the specified placement, or hides all ads.


## Syntax

	coronaAds.hide( [placementId] )

##### placementId ~^(optional)^~
_[String][api.type.String]._ The placement identifier for the ad to be hidden. If omitted, all currently displayed ads will be hidden.


## Example

``````lua
local coronaAds = require( "plugin.coronaAds" )

-- Substitute your own placement ID when generated
local bannerPlacement = "top-banner-320x50"

-- Corona Ads listener function
local function adListener( event )

	-- Successful initialization of Corona Ads
	if ( event.phase == "init" ) then
		-- Show an ad
		coronaAds.show( bannerPlacement, false )
	end
end

-- Initialize Corona Ads (substitute your own API key when generated)
coronaAds.init( "5223c2c3-cf81-4c43-ae41-2d4ed16552bc", adListener )

-- Sometime later, hide the ad
coronaAds.hide( bannerPlacement )
``````
