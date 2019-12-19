Return-Path: <SRS0=R1yt=2J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C543CC43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 21:54:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 94F77222C2
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 21:54:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbfLSVyE convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Dec 2019 16:54:04 -0500
Received: from mailoutvs40.siol.net ([185.57.226.231]:60496 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727029AbfLSVyE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 19 Dec 2019 16:54:04 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 7703C523A48;
        Thu, 19 Dec 2019 22:54:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id OlitNYJ3RhBr; Thu, 19 Dec 2019 22:53:59 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id CF79B523A46;
        Thu, 19 Dec 2019 22:53:59 +0100 (CET)
Received: from jernej-laptop.localnet (cpe-86-58-102-7.static.triera.net [86.58.102.7])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id 5BEE1523A26;
        Thu, 19 Dec 2019 22:53:59 +0100 (CET)
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
Subject: Re: [PATCH v5 3/4] drm/bridge: Add an ->atomic_check() hook
Date:   Thu, 19 Dec 2019 22:53:59 +0100
Message-ID: <5239253.a7MQNZ880q@jernej-laptop>
In-Reply-To: <20191219101151.28039-4-narmstrong@baylibre.com>
References: <20191219101151.28039-1-narmstrong@baylibre.com> <20191219101151.28039-4-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi!

Dne četrtek, 19. december 2019 ob 11:11:50 CET je Neil Armstrong napisal(a):
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> So that bridge drivers have a way to check/reject an atomic operation.
> The drm_atomic_bridge_chain_check() (which is just a wrapper around
> the ->atomic_check() hook) is called in place of
> drm_bridge_chain_mode_fixup() (when ->atomic_check() is not implemented,
> the core falls back on ->mode_fixup(), so the behavior should stay
> the same for existing bridge drivers).
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
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
> * Add R-bs
> 
> Changes in v3:
> * None
> 
> Changes in v2:
> * Clarify the fact that ->atomic_check() is replacing ->mode_fixup()
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 12 +++---
>  drivers/gpu/drm/drm_bridge.c        | 62 +++++++++++++++++++++++++++++
>  include/drm/drm_bridge.h            | 29 +++++++++++++-
>  3 files changed, 96 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c
> b/drivers/gpu/drm/drm_atomic_helper.c index b3e1aedd9d7a..44536b421d65
> 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -437,12 +437,12 @@ mode_fixup(struct drm_atomic_state *state)
>  		funcs = encoder->helper_private;
> 
>  		bridge = drm_bridge_chain_get_first_bridge(encoder);
> -		ret = drm_bridge_chain_mode_fixup(bridge,
> -					&new_crtc_state->mode,
> -					&new_crtc_state-
>adjusted_mode);
> -		if (!ret) {
> -			DRM_DEBUG_ATOMIC("Bridge fixup failed\n");
> -			return -EINVAL;
> +		ret = drm_atomic_bridge_chain_check(bridge,
> +						    
new_crtc_state,
> +						    
new_conn_state);
> +		if (ret) {
> +			DRM_DEBUG_ATOMIC("Bridge atomic check 
failed\n");
> +			return ret;
>  		}
> 
>  		if (funcs && funcs->atomic_check) {
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 6bdc4ab789c9..442804598f60 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -609,6 +609,68 @@ void drm_atomic_bridge_chain_enable(struct drm_bridge
> *bridge, }
>  EXPORT_SYMBOL(drm_atomic_bridge_chain_enable);
> 
> +static int drm_atomic_bridge_check(struct drm_bridge *bridge,
> +				   struct drm_crtc_state 
*crtc_state,
> +				   struct drm_connector_state 
*conn_state)
> +{
> +	if (bridge->funcs->atomic_check) {
> +		struct drm_bridge_state *bridge_state;
> +		int ret;
> +
> +		bridge_state = 
drm_atomic_get_new_bridge_state(crtc_state->state,
> +							       
bridge);
> +		if (WARN_ON(!bridge_state))
> +			return -EINVAL;
> +
> +		ret = bridge->funcs->atomic_check(bridge, bridge_state,
> +						  
crtc_state, conn_state);
> +		if (ret)
> +			return ret;
> +	} else if (bridge->funcs->mode_fixup) {
> +		if (!bridge->funcs->mode_fixup(bridge, &crtc_state->mode,
> +					       &crtc_state-
>adjusted_mode))
> +			return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * drm_atomic_bridge_chain_check() - Do an atomic check on the bridge chain
> + * @bridge: bridge control structure
> + * @crtc_state: new CRTC state
> + * @conn_state: new connector state
> + *
> + * Calls &drm_bridge_funcs.atomic_check() (falls back on
> + * &drm_bridge_funcs.mode_fixup()) op for all the bridges in the encoder
> chain, + * starting from the last bridge to the first. These are called
> before calling + * &drm_encoder_helper_funcs.atomic_check()
> + *
> + * RETURNS:
> + * 0 on success, a negative error code on failure
> + */
> +int drm_atomic_bridge_chain_check(struct drm_bridge *bridge,
> +				  struct drm_crtc_state 
*crtc_state,
> +				  struct drm_connector_state 
*conn_state)
> +{
> +	struct drm_encoder *encoder = bridge->encoder;
> +	struct drm_bridge *iter;
> +
> +	list_for_each_entry_reverse(iter, &encoder->bridge_chain, 
chain_node) {
> +		int ret;
> +
> +		ret = drm_atomic_bridge_check(iter, crtc_state, 
conn_state);
> +		if (ret)
> +			return ret;
> +
> +		if (iter == bridge)
> +			break;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_atomic_bridge_chain_check);
> +
>  /**
>   * drm_atomic_helper_bridge_destroy_state() - Default destroy state helper
>   * @bridge: the bridge this state refers to
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 0331e330635b..269f0d1da339 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -128,7 +128,9 @@ struct drm_bridge_funcs {
>  	 * this function passes all other callbacks must succeed for this
>  	 * configuration.
>  	 *
> -	 * The @mode_fixup callback is optional.
> +	 * The mode_fixup callback is optional. 
&drm_bridge_funcs.mode_fixup()
> +	 * is not called when &drm_bridge_funcs.atomic_check() is 
implemented,
> +	 * so only one of them should be provided.
>  	 *
>  	 * NOTE:
>  	 *
> @@ -385,6 +387,28 @@ struct drm_bridge_funcs {
>  	void (*atomic_destroy_state)(struct drm_bridge *bridge,
>  				     struct drm_bridge_state 
*state);
> 
> +	/**
> +	 * @atomic_check:
> +	 *
> +	 * This method is responsible for checking bridge state 
correctness.
> +	 * It can also check the state of the surrounding components in 
chain
> +	 * to make sure the whole pipeline can work properly.
> +	 *
> +	 * &drm_bridge_funcs.atomic_check() hooks are called in reverse
> +	 * order (from the last to the first bridge).
> +	 *
> +	 * This method is optional. &drm_bridge_funcs.mode_fixup() is not
> +	 * called when &drm_bridge_funcs.atomic_check() is implemented, so 
only
> +	 * one of them should be provided.
> +	 *
> +	 * RETURNS:
> +	 * zero if the check passed, a negative error code otherwise.
> +	 */
> +	int (*atomic_check)(struct drm_bridge *bridge,
> +			    struct drm_bridge_state *bridge_state,
> +			    struct drm_crtc_state *crtc_state,
> +			    struct drm_connector_state *conn_state);
> +
>  	/**
>  	 * @atomic_reset:
>  	 *
> @@ -552,6 +576,9 @@ void drm_bridge_chain_mode_set(struct drm_bridge
> *bridge, void drm_bridge_chain_pre_enable(struct drm_bridge *bridge);
>  void drm_bridge_chain_enable(struct drm_bridge *bridge);
> 
> +int drm_atomic_bridge_chain_check(struct drm_bridge *bridge,
> +				  struct drm_crtc_state 
*crtc_state,
> +				  struct drm_connector_state 
*conn_state);
>  void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
>  				     struct drm_atomic_state 
*state);
>  void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,




