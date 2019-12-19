Return-Path: <SRS0=R1yt=2J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC2EEC43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 21:53:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 832C0222C2
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 21:53:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726959AbfLSVx0 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Dec 2019 16:53:26 -0500
Received: from mailoutvs5.siol.net ([185.57.226.196]:60320 "EHLO mail.siol.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726998AbfLSVxZ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 19 Dec 2019 16:53:25 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 259DD523987;
        Thu, 19 Dec 2019 22:53:20 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id bHu1hfrIcIdL; Thu, 19 Dec 2019 22:53:19 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 4943B5239CE;
        Thu, 19 Dec 2019 22:53:19 +0100 (CET)
Received: from jernej-laptop.localnet (cpe-86-58-102-7.static.triera.net [86.58.102.7])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id B48D4523987;
        Thu, 19 Dec 2019 22:53:18 +0100 (CET)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     dri-devel@lists.freedesktop.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chris Healy <cphealy@gmail.com>, devicetree@vger.kernel.org,
        Jonas Karlman <jonas@kwiboo.se>,
        Rob Herring <robh+dt@kernel.org>,
        Seung-Woo Kim <sw0312.kim@samsung.com>
Subject: Re: [PATCH v5 2/4] drm/bridge: Patch atomic hooks to take a drm_bridge_state
Date:   Thu, 19 Dec 2019 22:53:18 +0100
Message-ID: <121292462.iSFXEu5GbM@jernej-laptop>
In-Reply-To: <20191219101151.28039-3-narmstrong@baylibre.com>
References: <20191219101151.28039-1-narmstrong@baylibre.com> <20191219101151.28039-3-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi!

Dne četrtek, 19. december 2019 ob 11:11:49 CET je Neil Armstrong napisal(a):
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> This way the drm_bridge_funcs interface is consistent with the rest of
> the subsystem.
> 
> The only driver implementing those hooks (analogix DP) is patched too.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---

Reviewed by: Jernej Skrabec <jernej.skrabec@siol.net>

Best regards,
Jernej

> Changes in v5:
> * None
> 
> Changes in v4:
> * Rename func params into old_bridge_state
> * Add Laurent's Rb
> 
> Changes in v3:
> * Old state clarification moved to a separate patch
> 
> Changes in v2:
> * Pass the old bridge state
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 41 +++++++------
>  drivers/gpu/drm/drm_bridge.c                  | 61 +++++++++++++++----
>  include/drm/drm_bridge.h                      |  8 +--
>  3 files changed, 77 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c index
> 6effe532f820..6fab71985cd4 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1289,19 +1289,21 @@ struct drm_crtc *analogix_dp_get_new_crtc(struct
> analogix_dp_device *dp, return conn_state->crtc;
>  }
> 
> -static void analogix_dp_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> -						 struct 
drm_atomic_state *state)
> +static void
> +analogix_dp_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> +				     struct drm_bridge_state 
*old_bridge_state)
>  {
> +	struct drm_atomic_state *old_state = old_bridge_state->base.state;
>  	struct analogix_dp_device *dp = bridge->driver_private;
>  	struct drm_crtc *crtc;
>  	struct drm_crtc_state *old_crtc_state;
>  	int ret;
> 
> -	crtc = analogix_dp_get_new_crtc(dp, state);
> +	crtc = analogix_dp_get_new_crtc(dp, old_state);
>  	if (!crtc)
>  		return;
> 
> -	old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
> +	old_crtc_state = drm_atomic_get_old_crtc_state(old_state, crtc);
>  	/* Don't touch the panel if we're coming back from PSR */
>  	if (old_crtc_state && old_crtc_state->self_refresh_active)
>  		return;
> @@ -1366,20 +1368,22 @@ static int analogix_dp_set_bridge(struct
> analogix_dp_device *dp) return ret;
>  }
> 
> -static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
> -					     struct 
drm_atomic_state *state)
> +static void
> +analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
> +				 struct drm_bridge_state 
*old_bridge_state)
>  {
> +	struct drm_atomic_state *old_state = old_bridge_state->base.state;
>  	struct analogix_dp_device *dp = bridge->driver_private;
>  	struct drm_crtc *crtc;
>  	struct drm_crtc_state *old_crtc_state;
>  	int timeout_loop = 0;
>  	int ret;
> 
> -	crtc = analogix_dp_get_new_crtc(dp, state);
> +	crtc = analogix_dp_get_new_crtc(dp, old_state);
>  	if (!crtc)
>  		return;
> 
> -	old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
> +	old_crtc_state = drm_atomic_get_old_crtc_state(old_state, crtc);
>  	/* Not a full enable, just disable PSR and continue */
>  	if (old_crtc_state && old_crtc_state->self_refresh_active) {
>  		ret = analogix_dp_disable_psr(dp);
> @@ -1440,18 +1444,20 @@ static void analogix_dp_bridge_disable(struct
> drm_bridge *bridge) dp->dpms_mode = DRM_MODE_DPMS_OFF;
>  }
> 
> -static void analogix_dp_bridge_atomic_disable(struct drm_bridge *bridge,
> -					      struct 
drm_atomic_state *state)
> +static void
> +analogix_dp_bridge_atomic_disable(struct drm_bridge *bridge,
> +				  struct drm_bridge_state 
*old_bridge_state)
>  {
> +	struct drm_atomic_state *old_state = old_bridge_state->base.state;
>  	struct analogix_dp_device *dp = bridge->driver_private;
>  	struct drm_crtc *crtc;
>  	struct drm_crtc_state *new_crtc_state = NULL;
> 
> -	crtc = analogix_dp_get_new_crtc(dp, state);
> +	crtc = analogix_dp_get_new_crtc(dp, old_state);
>  	if (!crtc)
>  		goto out;
> 
> -	new_crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +	new_crtc_state = drm_atomic_get_new_crtc_state(old_state, crtc);
>  	if (!new_crtc_state)
>  		goto out;
> 
> @@ -1463,20 +1469,21 @@ static void analogix_dp_bridge_atomic_disable(struct
> drm_bridge *bridge, analogix_dp_bridge_disable(bridge);
>  }
> 
> -static
> -void analogix_dp_bridge_atomic_post_disable(struct drm_bridge *bridge,
> -					    struct 
drm_atomic_state *state)
> +static void
> +analogix_dp_bridge_atomic_post_disable(struct drm_bridge *bridge,
> +				struct drm_bridge_state 
*old_bridge_state)
>  {
> +	struct drm_atomic_state *old_state = old_bridge_state->base.state;
>  	struct analogix_dp_device *dp = bridge->driver_private;
>  	struct drm_crtc *crtc;
>  	struct drm_crtc_state *new_crtc_state;
>  	int ret;
> 
> -	crtc = analogix_dp_get_new_crtc(dp, state);
> +	crtc = analogix_dp_get_new_crtc(dp, old_state);
>  	if (!crtc)
>  		return;
> 
> -	new_crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +	new_crtc_state = drm_atomic_get_new_crtc_state(old_state, crtc);
>  	if (!new_crtc_state || !new_crtc_state->self_refresh_active)
>  		return;
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index a3921b45f044..6bdc4ab789c9 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -465,10 +465,19 @@ void drm_atomic_bridge_chain_disable(struct drm_bridge
> *bridge,
> 
>  	encoder = bridge->encoder;
>  	list_for_each_entry_reverse(iter, &encoder->bridge_chain, 
chain_node) {
> -		if (iter->funcs->atomic_disable)
> -			iter->funcs->atomic_disable(iter, 
old_state);
> -		else if (iter->funcs->disable)
> +		if (iter->funcs->atomic_disable) {
> +			struct drm_bridge_state *old_bridge_state;
> +
> +			old_bridge_state =
> +				
drm_atomic_get_old_bridge_state(old_state,
> +								
iter);
> +			if (WARN_ON(!old_bridge_state))
> +				return;
> +
> +			iter->funcs->atomic_disable(iter, 
old_bridge_state);
> +		} else if (iter->funcs->disable) {
>  			iter->funcs->disable(iter);
> +		}
> 
>  		if (iter == bridge)
>  			break;
> @@ -499,10 +508,20 @@ void drm_atomic_bridge_chain_post_disable(struct
> drm_bridge *bridge,
> 
>  	encoder = bridge->encoder;
>  	list_for_each_entry_from(bridge, &encoder->bridge_chain, 
chain_node) {
> -		if (bridge->funcs->atomic_post_disable)
> -			bridge->funcs->atomic_post_disable(bridge, 
old_state);
> -		else if (bridge->funcs->post_disable)
> +		if (bridge->funcs->atomic_post_disable) {
> +			struct drm_bridge_state *old_bridge_state;
> +
> +			old_bridge_state =
> +				
drm_atomic_get_old_bridge_state(old_state,
> +								
bridge);
> +			if (WARN_ON(!old_bridge_state))
> +				return;
> +
> +			bridge->funcs->atomic_post_disable(bridge,
> +							   
old_bridge_state);
> +		} else if (bridge->funcs->post_disable) {
>  			bridge->funcs->post_disable(bridge);
> +		}
>  	}
>  }
>  EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
> @@ -531,10 +550,19 @@ void drm_atomic_bridge_chain_pre_enable(struct
> drm_bridge *bridge,
> 
>  	encoder = bridge->encoder;
>  	list_for_each_entry_reverse(iter, &encoder->bridge_chain, 
chain_node) {
> -		if (iter->funcs->atomic_pre_enable)
> -			iter->funcs->atomic_pre_enable(iter, 
old_state);
> -		else if (iter->funcs->pre_enable)
> +		if (iter->funcs->atomic_pre_enable) {
> +			struct drm_bridge_state *old_bridge_state;
> +
> +			old_bridge_state =
> +				
drm_atomic_get_old_bridge_state(old_state,
> +								
iter);
> +			if (WARN_ON(!old_bridge_state))
> +				return;
> +
> +			iter->funcs->atomic_pre_enable(iter, 
old_bridge_state);
> +		} else if (iter->funcs->pre_enable) {
>  			iter->funcs->pre_enable(iter);
> +		}
> 
>  		if (iter == bridge)
>  			break;
> @@ -564,10 +592,19 @@ void drm_atomic_bridge_chain_enable(struct drm_bridge
> *bridge,
> 
>  	encoder = bridge->encoder;
>  	list_for_each_entry_from(bridge, &encoder->bridge_chain, 
chain_node) {
> -		if (bridge->funcs->atomic_enable)
> -			bridge->funcs->atomic_enable(bridge, 
old_state);
> -		else if (bridge->funcs->enable)
> +		if (bridge->funcs->atomic_enable) {
> +			struct drm_bridge_state *old_bridge_state;
> +
> +			old_bridge_state =
> +				
drm_atomic_get_old_bridge_state(old_state,
> +								
bridge);
> +			if (WARN_ON(!old_bridge_state))
> +				return;
> +
> +			bridge->funcs->atomic_enable(bridge, 
old_bridge_state);
> +		} else if (bridge->funcs->enable) {
>  			bridge->funcs->enable(bridge);
> +		}
>  	}
>  }
>  EXPORT_SYMBOL(drm_atomic_bridge_chain_enable);
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 8a926c1a08db..0331e330635b 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -282,7 +282,7 @@ struct drm_bridge_funcs {
>  	 * The @atomic_pre_enable callback is optional.
>  	 */
>  	void (*atomic_pre_enable)(struct drm_bridge *bridge,
> -				  struct drm_atomic_state 
*old_state);
> +				  struct drm_bridge_state 
*old_bridge_state);
> 
>  	/**
>  	 * @atomic_enable:
> @@ -307,7 +307,7 @@ struct drm_bridge_funcs {
>  	 * The @atomic_enable callback is optional.
>  	 */
>  	void (*atomic_enable)(struct drm_bridge *bridge,
> -			      struct drm_atomic_state *old_state);
> +			      struct drm_bridge_state 
*old_bridge_state);
>  	/**
>  	 * @atomic_disable:
>  	 *
> @@ -330,7 +330,7 @@ struct drm_bridge_funcs {
>  	 * The @atomic_disable callback is optional.
>  	 */
>  	void (*atomic_disable)(struct drm_bridge *bridge,
> -			       struct drm_atomic_state *old_state);
> +			       struct drm_bridge_state 
*old_bridge_state);
> 
>  	/**
>  	 * @atomic_post_disable:
> @@ -356,7 +356,7 @@ struct drm_bridge_funcs {
>  	 * The @atomic_post_disable callback is optional.
>  	 */
>  	void (*atomic_post_disable)(struct drm_bridge *bridge,
> -				    struct drm_atomic_state 
*old_state);
> +				    struct drm_bridge_state 
*old_bridge_state);
> 
>  	/**
>  	 * @atomic_duplicate_state:




