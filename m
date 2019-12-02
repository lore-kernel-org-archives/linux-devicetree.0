Return-Path: <SRS0=pYa2=ZY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F17C432C0
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 17:03:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ABF7820848
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 17:03:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="apOvdzYF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727655AbfLBRDr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 12:03:47 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37456 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727601AbfLBRDr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Dec 2019 12:03:47 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4AE5E309;
        Mon,  2 Dec 2019 18:03:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575306223;
        bh=8B+MR8jgFupVuPJxryWnFCiBjXyLZ/cVdPkv8Ba1+qM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=apOvdzYFSdlagm+i+zqVCUMIKhvVQTzAhyK/NVntLaQyfQAfj1cUTyY85wattpfR5
         bWJfCxdHdbYmaV86h4Bv1eHLjqak2qi1PzM4/ssWApc9ZUEGkDsHBr5oh0D/Ktxbzv
         fPQdZ28aHvO/LUaJ4HHXfD6RrwN3+4qNCW21rS4k=
Date:   Mon, 2 Dec 2019 19:03:36 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     dri-devel@lists.freedesktop.org,
        Lucas Stach <l.stach@pengutronix.de>,
        Chris Healy <cphealy@gmail.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        kernel@collabora.com, Daniel Vetter <daniel@ffwll.ch>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark <robdclark@gmail.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 12/21] drm/bridge: Add an ->atomic_check() hook
Message-ID: <20191202170336.GP4929@pendragon.ideasonboard.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <20191023154512.9762-13-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191023154512.9762-13-boris.brezillon@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Boris,

Thank you for the patch.

On Wed, Oct 23, 2019 at 05:45:03PM +0200, Boris Brezillon wrote:
> So that bridge drivers have a way to check/reject an atomic operation.
> The drm_atomic_bridge_chain_check() (which is just a wrapper around
> the ->atomic_check() hook) is called in place of
> drm_bridge_chain_mode_fixup() (when ->atomic_check() is not implemented,
> the core falls back on ->mode_fixup(), so the behavior should stay
> the same for existing bridge drivers).
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
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
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index de985ba7ce2d..1d0a19511a0d 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -437,12 +437,12 @@ mode_fixup(struct drm_atomic_state *state)
>  		funcs = encoder->helper_private;
>  
>  		bridge = drm_bridge_chain_get_first_bridge(encoder);
> -		ret = drm_bridge_chain_mode_fixup(bridge,
> -					&new_crtc_state->mode,
> -					&new_crtc_state->adjusted_mode);
> -		if (!ret) {
> -			DRM_DEBUG_ATOMIC("Bridge fixup failed\n");
> -			return -EINVAL;
> +		ret = drm_atomic_bridge_chain_check(bridge,
> +						    new_crtc_state,
> +						    new_conn_state);
> +		if (ret) {
> +			DRM_DEBUG_ATOMIC("Bridge atomic check failed\n");
> +			return ret;
>  		}
>  
>  		if (funcs && funcs->atomic_check) {
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 377866e3214f..990e056296bd 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -615,6 +615,68 @@ void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
>  }
>  EXPORT_SYMBOL(drm_atomic_bridge_chain_enable);
>  
> +static int drm_atomic_bridge_check(struct drm_bridge *bridge,
> +				   struct drm_crtc_state *crtc_state,
> +				   struct drm_connector_state *conn_state)
> +{
> +	if (bridge->funcs->atomic_check) {
> +		struct drm_bridge_state *bridge_state;
> +		int ret;
> +
> +		bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
> +							       bridge);
> +		if (WARN_ON(!bridge_state))
> +			return -EINVAL;
> +
> +		ret = bridge->funcs->atomic_check(bridge, bridge_state,
> +						  crtc_state, conn_state);
> +		if (ret)
> +			return ret;
> +	} else if (bridge->funcs->mode_fixup) {
> +		if (!bridge->funcs->mode_fixup(bridge, &crtc_state->mode,
> +					       &crtc_state->adjusted_mode))
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
> + * &drm_bridge_funcs.mode_fixup()) op for all the bridges in the encoder chain,
> + * starting from the last bridge to the first. These are called before calling
> + * &drm_encoder_helper_funcs.atomic_check()
> + *
> + * RETURNS:
> + * 0 on success, a negative error code on failure
> + */
> +int drm_atomic_bridge_chain_check(struct drm_bridge *bridge,
> +				  struct drm_crtc_state *crtc_state,
> +				  struct drm_connector_state *conn_state)
> +{
> +	struct drm_encoder *encoder = bridge->encoder;
> +	struct drm_bridge *iter;
> +
> +	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
> +		int ret;
> +
> +		ret = drm_atomic_bridge_check(iter, crtc_state, conn_state);
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
> index b1f557d8dba9..2beb1ef9a733 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -127,7 +127,9 @@ struct drm_bridge_funcs {
>  	 * this function passes all other callbacks must succeed for this
>  	 * configuration.
>  	 *
> -	 * The @mode_fixup callback is optional.
> +	 * The mode_fixup callback is optional. &drm_bridge_funcs.mode_fixup()
> +	 * is not called when &drm_bridge_funcs.atomic_check() is implemented,
> +	 * so only one of them should be provided.
>  	 *
>  	 * NOTE:
>  	 *
> @@ -391,6 +393,28 @@ struct drm_bridge_funcs {
>  	void (*atomic_destroy_state)(struct drm_bridge *bridge,
>  				     struct drm_bridge_state *state);
>  
> +	/**
> +	 * @atomic_check:
> +	 *
> +	 * This method is responsible for checking bridge state correctness.
> +	 * It can also check the state of the surrounding components in chain
> +	 * to make sure the whole pipeline can work properly.

As explained in the review of the RFC, I think it's a mistake not to
define the semantics of this operation precisely, and in particular not
to define explictly what parameters bridge drivers are allowed to modify
here. I however don't want to make this a prerequisite for your series,
so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

but I'm sure we'll regret this later when different bridges will have
slightly incompatible implementations.

> +	 *
> +	 * &drm_bridge_funcs.atomic_check() hooks are called in reverse
> +	 * order (from the last to the first bridge).
> +	 *
> +	 * This method is optional. &drm_bridge_funcs.mode_fixup() is not
> +	 * called when &drm_bridge_funcs.atomic_check() is implemented, so only
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
> @@ -542,6 +566,9 @@ void drm_bridge_chain_mode_set(struct drm_bridge *bridge,
>  void drm_bridge_chain_pre_enable(struct drm_bridge *bridge);
>  void drm_bridge_chain_enable(struct drm_bridge *bridge);
>  
> +int drm_atomic_bridge_chain_check(struct drm_bridge *bridge,
> +				  struct drm_crtc_state *crtc_state,
> +				  struct drm_connector_state *conn_state);
>  void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
>  				     struct drm_atomic_state *state);
>  void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,

-- 
Regards,

Laurent Pinchart
