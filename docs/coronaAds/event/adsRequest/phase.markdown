# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [adsRequest][plugin.coronaAds.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Corona Ads, coronaAds, adsRequest, phase
> __See also__			[adsRequest][plugin.coronaAds.event.adsRequest]
>						[coronaAds.*][plugin.coronaAds]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[String][api.type.String] value indicating the phase of the [adsRequest][plugin.coronaAds.event.adsRequest] event. Possible values include:

* `"init"` &mdash; Indicates that the Corona Ads service was initialized successfully. You should wait until __after__ this phase occurs to begin showing ads with [coronaAds.show()][plugin.coronaAds.show].

* `"request"` &mdash; Indicates that an ad was requested. For this phase, [event.placementId][plugin.coronaAds.event.adsRequest.placementId] provides context on the individual placement associated with the event.

* `"found"` &mdash; Indicates that an ad was found and is ready to be shown. For this phase, [event.network][plugin.coronaAds.event.adsRequest.network] and [event.identifier][plugin.coronaAds.event.adsRequest.identifier] denote the utilized ad network and the identifier required by the network, for example `"aerserv"` and the PLC used to call it. Additionally, [event.placementId][plugin.coronaAds.event.adsRequest.placementId] provides context on the individual placement associated with the event.

* `"failed"` &mdash; Indicates that an ad could __not__ be found. For this phase, [event.network][plugin.coronaAds.event.adsRequest.network] and [event.identifier][plugin.coronaAds.event.adsRequest.identifier] denote the last network called and the identifier used to call it. Additionally, [event.placementId][plugin.coronaAds.event.adsRequest.placementId] provides context on the individual placement associated with the event.

* `"shown"` &mdash; Indicates that an ad has shown. For this phase, [event.network][plugin.coronaAds.event.adsRequest.network] and [event.identifier][plugin.coronaAds.event.adsRequest.identifier] denote the ad network called and the identifier required by the network. Additionally, [event.placementId][plugin.coronaAds.event.adsRequest.placementId] provides context on the individual placement associated with the event.

* `"closed"` &mdash; Indicates that an ad was closed by the user or hidden via [coronaAds.hide()][plugin.coronaAds.hide]. For this phase, [event.placementId][plugin.coronaAds.event.adsRequest.placementId] provides context on the individual placement associated with the event.
