Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DADF0C432C0
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 18:17:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8D73320661
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 18:17:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JI/UVR1x"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbfLCSRR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 13:17:17 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:39392 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726564AbfLCSRR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Dec 2019 13:17:17 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE4AD309;
        Tue,  3 Dec 2019 19:17:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575397032;
        bh=NX5JWI3hET+/MB7TF0ps9TJ/voJtAAEfFbkaQ/yWSxY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JI/UVR1xE+l6nEhz0D26iSjp/dhCC1gmnHewe0xtB1V4ubxy/rAgg1s0E+lO1+NWV
         KKZ5i5A+OSIrwdD1/Xk5QJOn4DduXYJqYDns69t2yXonJjvUQ/+WA+xcyzG8hMyL5V
         OblqhXQiwx+WFTRY5h39nc0N5lJdX/wTdS9MtsJ4=
Date:   Tue, 3 Dec 2019 20:17:05 +0200
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
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v4 08/11] drm/bridge: Add a drm_bridge_state object
Message-ID: <20191203181705.GT4730@pendragon.ideasonboard.com>
References: <20191203141515.3597631-1-boris.brezillon@collabora.com>
 <20191203141515.3597631-9-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191203141515.3597631-9-boris.brezillon@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Boris,

Thank you for the patch.

On Tue, Dec 03, 2019 at 03:15:12PM +0100, Boris Brezillon wrote:
> One of the last remaining objects to not have its atomic state.
> 
> This is being motivated by our attempt to support runtime bus-format
> negotiation between elements of the bridge chain.
> This patch just paves the road for such a feature by adding a new
> drm_bridge_state object inheriting from drm_private_obj so we can
> re-use some of the existing state initialization/tracking logic.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
> Changes in v4:
> * Fix the doc
> * Kill default helpers (inlined)

I liked the default helpers, inlining their content makes the code more
difficult to follow in my opinion. I will however not push back if you
prefer not to have them.

> * Fix drm_atomic_get_bridge_state() to check for an ERR_PTR()
> * Add Neil's R-b
> 
> Changes in v3:
> * None
> 
> Changes in v2:
> * Use drm_for_each_bridge_in_chain()
> * Rename helpers to be more consistent with the rest of the DRM API
> * Improve/fix the doc
> ---
>  drivers/gpu/drm/drm_atomic.c        |  39 +++++++++
>  drivers/gpu/drm/drm_atomic_helper.c |  20 +++++
>  drivers/gpu/drm/drm_bridge.c        | 118 ++++++++++++++++++++++++++--
>  include/drm/drm_atomic.h            |   3 +
>  include/drm/drm_bridge.h            | 116 +++++++++++++++++++++++++++
>  5 files changed, 290 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 14aeaf736321..02f8034f5240 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -30,6 +30,7 @@
>  
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_uapi.h>
> +#include <drm/drm_bridge.h>
>  #include <drm/drm_debugfs.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_drv.h>
> @@ -1015,6 +1016,44 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
>  		connector->funcs->atomic_print_state(p, state);
>  }
>  
> +/**
> + * drm_atomic_add_encoder_bridges - add bridges attached to an encoder
> + * @state: atomic state
> + * @encoder: DRM encoder
> + *
> + * This function adds all bridges attached to @encoder. This is needed to add
> + * bridge states to @state and make them available when
> + * &bridge_funcs.atomic_{check,pre_enable,enable,disable_post_disable}() are
> + * called
> + *
> + * Returns:
> + * 0 on success or can fail with -EDEADLK or -ENOMEM. When the error is EDEADLK
> + * then the w/w mutex code has detected a deadlock and the entire atomic
> + * sequence must be restarted. All other errors are fatal.
> + */
> +int
> +drm_atomic_add_encoder_bridges(struct drm_atomic_state *state,
> +			       struct drm_encoder *encoder)
> +{
> +	struct drm_bridge_state *bridge_state;
> +	struct drm_bridge *bridge;
> +
> +	if (!encoder)
> +		return 0;
> +
> +	DRM_DEBUG_ATOMIC("Adding all bridges for [encoder:%d:%s] to %p\n",
> +			 encoder->base.id, encoder->name, state);
> +
> +	drm_for_each_bridge_in_chain(encoder, bridge) {
> +		bridge_state = drm_atomic_get_bridge_state(state, bridge);
> +		if (IS_ERR(bridge_state))
> +			return PTR_ERR(bridge_state);
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_atomic_add_encoder_bridges);
> +
>  /**
>   * drm_atomic_add_affected_connectors - add connectors for crtc
>   * @state: atomic state
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 29c3115bf9e2..e2f7f336a2d2 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -730,6 +730,26 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>  			return ret;
>  	}
>  
> +	/*
> +	 * Iterate over all connectors again, and add all affected bridges to
> +	 * the state.
> +	 */
> +	for_each_oldnew_connector_in_state(state, connector,
> +					   old_connector_state,
> +					   new_connector_state, i) {
> +		struct drm_encoder *encoder;
> +
> +		encoder = old_connector_state->best_encoder;
> +		ret = drm_atomic_add_encoder_bridges(state, encoder);
> +		if (ret)
> +			return ret;
> +
> +		encoder = new_connector_state->best_encoder;
> +		ret = drm_atomic_add_encoder_bridges(state, encoder);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	ret = mode_valid(state);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index b6517b4fa3d1..bf5a2243a115 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -25,6 +25,7 @@
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  
> +#include <drm/drm_atomic_state_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_encoder.h>
>  
> @@ -89,6 +90,48 @@ void drm_bridge_remove(struct drm_bridge *bridge)
>  }
>  EXPORT_SYMBOL(drm_bridge_remove);
>  
> +static struct drm_private_state *
> +drm_bridge_atomic_duplicate_priv_state(struct drm_private_obj *obj)
> +{
> +	struct drm_bridge *bridge = drm_priv_to_bridge(obj);
> +	struct drm_bridge_state *state;
> +
> +	if (bridge->funcs->atomic_duplicate_state) {
> +		state = bridge->funcs->atomic_duplicate_state(bridge);
> +
> +		return state ? &state->base : NULL;
> +	}
> +
> +	if (WARN_ON(!bridge->base.state))
> +		return NULL;
> +
> +	state = kzalloc(sizeof(*state), GFP_KERNEL);
> +	if (!state)
> +		return NULL;
> +
> +	__drm_atomic_helper_bridge_duplicate_state(bridge, state);
> +
> +	return &state->base;
> +}
> +
> +static void
> +drm_bridge_atomic_destroy_priv_state(struct drm_private_obj *obj,
> +				     struct drm_private_state *s)
> +{
> +	struct drm_bridge_state *state = drm_priv_to_bridge_state(s);
> +	struct drm_bridge *bridge = drm_priv_to_bridge(obj);
> +
> +	if (bridge->funcs->atomic_destroy_state)
> +		bridge->funcs->atomic_destroy_state(bridge, state);
> +	else
> +		kfree(state);
> +}
> +
> +static const struct drm_private_state_funcs drm_bridge_priv_state_funcs = {
> +	.atomic_duplicate_state = drm_bridge_atomic_duplicate_priv_state,
> +	.atomic_destroy_state = drm_bridge_atomic_destroy_priv_state,
> +};
> +
>  /**
>   * drm_bridge_attach - attach the bridge to an encoder's chain
>   *
> @@ -114,6 +157,7 @@ EXPORT_SYMBOL(drm_bridge_remove);
>  int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
>  		      struct drm_bridge *previous)
>  {
> +	struct drm_bridge_state *state;
>  	int ret;
>  
>  	if (!encoder || !bridge)
> @@ -135,15 +179,40 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
>  
>  	if (bridge->funcs->attach) {
>  		ret = bridge->funcs->attach(bridge);
> -		if (ret < 0) {
> -			list_del(&bridge->chain_node);
> -			bridge->dev = NULL;
> -			bridge->encoder = NULL;
> -			return ret;
> -		}
> +		if (ret < 0)
> +			goto err_reset_bridge;
>  	}
>  
> +	if (bridge->funcs->atomic_reset) {
> +		state = bridge->funcs->atomic_reset(bridge);
> +	} else {
> +		state = kzalloc(sizeof(*state), GFP_KERNEL);
> +		if (state)
> +			__drm_atomic_helper_bridge_reset(bridge, state);
> +		else
> +			state = ERR_PTR(-ENOMEM);
> +	}
> +
> +	if (IS_ERR(state)) {
> +		ret = PTR_ERR(state);
> +		goto err_detach_bridge;
> +	}
> +
> +	drm_atomic_private_obj_init(bridge->dev, &bridge->base,
> +				    &state->base,
> +				    &drm_bridge_priv_state_funcs);
> +
>  	return 0;
> +
> +err_detach_bridge:
> +	if (bridge->funcs->detach)
> +		bridge->funcs->detach(bridge);
> +
> +err_reset_bridge:
> +	bridge->dev = NULL;
> +	bridge->encoder = NULL;
> +	list_del(&bridge->chain_node);
> +	return ret;
>  }
>  EXPORT_SYMBOL(drm_bridge_attach);
>  
> @@ -155,6 +224,8 @@ void drm_bridge_detach(struct drm_bridge *bridge)
>  	if (WARN_ON(!bridge->dev))
>  		return;
>  
> +	drm_atomic_private_obj_fini(&bridge->base);
> +
>  	if (bridge->funcs->detach)
>  		bridge->funcs->detach(bridge);
>  
> @@ -516,6 +587,41 @@ void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
>  }
>  EXPORT_SYMBOL(drm_atomic_bridge_chain_enable);
>  
> +/**
> + * __drm_atomic_helper_bridge_reset() - Initialize a bridge state to its
> + *					default
> + * @bridge: the bridge this state is refers to
> + * @state: bridge state to initialize
> + *
> + * Initialize the bridge state to default values. This is meant to be* called

s/be\*/be/

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> + * by the bridge &drm_plane_funcs.reset hook for bridges that subclass the
> + * bridge state.
> + */
> +void __drm_atomic_helper_bridge_reset(struct drm_bridge *bridge,
> +				      struct drm_bridge_state *state)
> +{
> +	memset(state, 0, sizeof(*state));
> +	state->bridge = bridge;
> +}
> +EXPORT_SYMBOL(__drm_atomic_helper_bridge_reset);
> +
> +/**
> + * __drm_atomic_helper_bridge_duplicate_state() - Copy atomic bridge state
> + * @bridge: bridge object
> + * @state: atomic bridge state
> + *
> + * Copies atomic state from a bridge's current state and resets inferred values.
> + * This is useful for drivers that subclass the bridge state.
> + */
> +void __drm_atomic_helper_bridge_duplicate_state(struct drm_bridge *bridge,
> +						struct drm_bridge_state *state)
> +{
> +	__drm_atomic_helper_private_obj_duplicate_state(&bridge->base,
> +							&state->base);
> +	state->bridge = bridge;
> +}
> +EXPORT_SYMBOL(__drm_atomic_helper_bridge_duplicate_state);
> +
>  #ifdef CONFIG_OF
>  /**
>   * of_drm_find_bridge - find the bridge corresponding to the device node in
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index b6c73fd9f55a..e08582773d6c 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -660,6 +660,9 @@ __drm_atomic_get_current_plane_state(struct drm_atomic_state *state,
>  	return plane->state;
>  }
>  
> +int __must_check
> +drm_atomic_add_encoder_bridges(struct drm_atomic_state *state,
> +			       struct drm_encoder *encoder);
>  int __must_check
>  drm_atomic_add_affected_connectors(struct drm_atomic_state *state,
>  				   struct drm_crtc *crtc);
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index d7d714023050..db5fc18d49bd 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -25,6 +25,8 @@
>  
>  #include <linux/list.h>
>  #include <linux/ctype.h>
> +
> +#include <drm/drm_atomic.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_mode_object.h>
>  #include <drm/drm_modes.h>
> @@ -33,6 +35,23 @@ struct drm_bridge;
>  struct drm_bridge_timings;
>  struct drm_panel;
>  
> +/**
> + * struct drm_bridge_state - Atomic bridge state object
> + * @base: inherit from &drm_private_state
> + * @bridge: the bridge this state refers to
> + */
> +struct drm_bridge_state {
> +	struct drm_private_state base;
> +
> +	struct drm_bridge *bridge;
> +};
> +
> +static inline struct drm_bridge_state *
> +drm_priv_to_bridge_state(struct drm_private_state *priv)
> +{
> +	return container_of(priv, struct drm_bridge_state, base);
> +}
> +
>  /**
>   * struct drm_bridge_funcs - drm_bridge control functions
>   */
> @@ -338,6 +357,49 @@ struct drm_bridge_funcs {
>  	 */
>  	void (*atomic_post_disable)(struct drm_bridge *bridge,
>  				    struct drm_atomic_state *old_state);
> +
> +	/**
> +	 * @atomic_duplicate_state:
> +	 *
> +	 * Duplicate the current bridge state object (which is guaranteed to be
> +	 * non-NULL).
> +	 *
> +	 * The atomic_duplicate_state() is optional. When not implemented the
> +	 * core allocates a drm_bridge_state object and calls
> +	 * &__drm_atomic_helper_bridge_duplicate_state() to initialize it.
> +	 *
> +	 * RETURNS:
> +	 * A valid drm_bridge_state object or NULL if the allocation fails.
> +	 */
> +	struct drm_bridge_state *(*atomic_duplicate_state)(struct drm_bridge *bridge);
> +
> +	/**
> +	 * @atomic_destroy_state:
> +	 *
> +	 * Destroy a bridge state object previously allocated by
> +	 * &drm_bridge_funcs.atomic_duplicate_state().
> +	 *
> +	 * The atomic_destroy_state hook is optional. When not implemented the
> +	 * core calls kfree() on the state.
> +	 */
> +	void (*atomic_destroy_state)(struct drm_bridge *bridge,
> +				     struct drm_bridge_state *state);
> +
> +	/**
> +	 * @atomic_reset:
> +	 *
> +	 * Reset the bridge to a predefined state (or retrieve its current
> +	 * state) and return a &drm_bridge_state object matching this state.
> +	 * This function is called at attach time.
> +	 *
> +	 * The atomic_reset hook is optional. When not implemented the core
> +	 * allocates a new state and calls &__drm_atomic_helper_bridge_reset().
> +	 *
> +	 * RETURNS:
> +	 * A valid drm_bridge_state object in case of success, an ERR_PTR()
> +	 * giving the reason of the failure otherwise.
> +	 */
> +	struct drm_bridge_state *(*atomic_reset)(struct drm_bridge *bridge);
>  };
>  
>  /**
> @@ -380,6 +442,8 @@ struct drm_bridge_timings {
>   * struct drm_bridge - central DRM bridge control structure
>   */
>  struct drm_bridge {
> +	/** @base: inherit from &drm_private_object */
> +	struct drm_private_obj base;
>  	/** @dev: DRM device this bridge belongs to */
>  	struct drm_device *dev;
>  	/** @encoder: encoder to which this bridge is connected */
> @@ -404,6 +468,12 @@ struct drm_bridge {
>  	void *driver_private;
>  };
>  
> +static inline struct drm_bridge *
> +drm_priv_to_bridge(struct drm_private_obj *priv)
> +{
> +	return container_of(priv, struct drm_bridge, base);
> +}
> +
>  void drm_bridge_add(struct drm_bridge *bridge);
>  void drm_bridge_remove(struct drm_bridge *bridge);
>  struct drm_bridge *of_drm_find_bridge(struct device_node *np);
> @@ -491,6 +561,52 @@ void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
>  void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
>  				    struct drm_atomic_state *state);
>  
> +void __drm_atomic_helper_bridge_reset(struct drm_bridge *bridge,
> +				      struct drm_bridge_state *state);
> +struct drm_bridge_state *
> +drm_atomic_helper_bridge_reset(struct drm_bridge *bridge);
> +void __drm_atomic_helper_bridge_duplicate_state(struct drm_bridge *bridge,
> +						struct drm_bridge_state *new);
> +
> +static inline struct drm_bridge_state *
> +drm_atomic_get_bridge_state(struct drm_atomic_state *state,
> +			    struct drm_bridge *bridge)
> +{
> +	struct drm_private_state *obj_state;
> +
> +	obj_state = drm_atomic_get_private_obj_state(state, &bridge->base);
> +	if (IS_ERR(obj_state))
> +		return ERR_CAST(obj_state);
> +
> +	return drm_priv_to_bridge_state(obj_state);
> +}
> +
> +static inline struct drm_bridge_state *
> +drm_atomic_get_old_bridge_state(struct drm_atomic_state *state,
> +				struct drm_bridge *bridge)
> +{
> +	struct drm_private_state *obj_state;
> +
> +	obj_state = drm_atomic_get_old_private_obj_state(state, &bridge->base);
> +	if (!obj_state)
> +		return NULL;
> +
> +	return drm_priv_to_bridge_state(obj_state);
> +}
> +
> +static inline struct drm_bridge_state *
> +drm_atomic_get_new_bridge_state(struct drm_atomic_state *state,
> +				struct drm_bridge *bridge)
> +{
> +	struct drm_private_state *obj_state;
> +
> +	obj_state = drm_atomic_get_new_private_obj_state(state, &bridge->base);
> +	if (!obj_state)
> +		return NULL;
> +
> +	return drm_priv_to_bridge_state(obj_state);
> +}
> +
>  #ifdef CONFIG_DRM_PANEL_BRIDGE
>  struct drm_bridge *drm_panel_bridge_add(struct drm_panel *panel);
>  struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
> -- 
> 2.23.0
> 

-- 
Regards,

Laurent Pinchart
