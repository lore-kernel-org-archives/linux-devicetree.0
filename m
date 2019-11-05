Return-Path: <SRS0=ig8w=Y5=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B94A5C5DF61
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 Nov 2019 16:05:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 73E25214B2
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 Nov 2019 16:05:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="i/qzGmPM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389970AbfKEQFW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 Nov 2019 11:05:22 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40054 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389949AbfKEQFV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 5 Nov 2019 11:05:21 -0500
Received: by mail-wm1-f67.google.com with SMTP id f3so9653809wmc.5
        for <devicetree@vger.kernel.org>; Tue, 05 Nov 2019 08:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ZOelgN0+L1uq7GNyPO77t69ucFuLNPOi6RxyfAU9S2g=;
        b=i/qzGmPM1HsxsqcRH6nJrhTDJzAoY9ZHcm4aSBRZGJqXdZ8h7T7p4vi6Q/ArIQY7y4
         MvO8gXHPAmWXJ1h4UGZCoGOsmSpUWisB/E3z2n/Zu+QTy+A7fq4rg4Uo5y9oiGHjOYQt
         A38cfOIoy0czElxsZ7YiXod93o0hN5CKVL3elfZp7IkG7uMdPdVbcZRh6xYeSygt7+Ho
         U7DGhFahkykO326S1o0c6gRWVNqth5F3cQuVBjC7kUle0qhTaU1VuCpjptSKJc+XUqq3
         dvEOe/1Pub7qErPOZHIlcbypMEbgpoa9pzaDZboBh2tSTw6GWf7Vo4QcZJRTyBAxZWHP
         yd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ZOelgN0+L1uq7GNyPO77t69ucFuLNPOi6RxyfAU9S2g=;
        b=T+A8QGlyFBF9ZElTbkGLKdUYXsuf3Bx6fQt63ImTVscc7ONzyvdk7ZeGt4wMDnQUrY
         CpRo1xBKizLCdXccSlQlxNqPUsJ7c8mJSetwQl/K52JXKhE8hrR4EzJETp7k1LzngcIv
         XeY4vbPaqr/lJr6lPQS3Sgj61Ze6001nERT6C7/xNMQl018Z2zrgL2mxipNypH/feisT
         b/A82cXOMZlW3osaBpDrKc6GhbMjhSKZkobHYpONNDI9quLvG5h/WCJU7OkFNY5Vi3+J
         ebtgnM3lznhTCjO6gOMHHI8upVUHfOADqvxJFQPsd8FcQJbaUEdNVUsln2n/TGZwLu9W
         IZbA==
X-Gm-Message-State: APjAAAUspg8IJdMphU4nI4iJsup0EbkKxMSme9bWKhpnNIB555E0OWf3
        mMPmK8ng9ZwVeB/B/O8cs8A0L1bfUXl47g==
X-Google-Smtp-Source: APXvYqwdBBirlEdxmRU/LDWcMOjojp2ZiecAWZcI6UCPfPpWm9puxH/Qji6WnKaYNfOoGb13Wla9wQ==
X-Received: by 2002:a7b:cb0b:: with SMTP id u11mr4767643wmj.125.1572969917761;
        Tue, 05 Nov 2019 08:05:17 -0800 (PST)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id z14sm9691518wrl.60.2019.11.05.08.05.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Nov 2019 08:05:17 -0800 (PST)
Subject: Re: [PATCH v3 09/21] drm/bridge: Add a drm_bridge_state object
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        dri-devel@lists.freedesktop.org
Cc:     Lucas Stach <l.stach@pengutronix.de>,
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
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <20191023154512.9762-10-boris.brezillon@collabora.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <6e60e98e-46b2-a979-511e-4717bc6feadc@baylibre.com>
Date:   Tue, 5 Nov 2019 17:05:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191023154512.9762-10-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 23/10/2019 17:45, Boris Brezillon wrote:
> One of the last remaining objects to not have its atomic state.
> 
> This is being motivated by our attempt to support runtime bus-format
> negotiation between elements of the bridge chain.
> This patch just paves the road for such a feature by adding a new
> drm_bridge_state object inheriting from drm_private_obj so we can
> re-use some of the existing state initialization/tracking logic.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Changes in v3:
> * None
> 
> Changes in v2:
> * Use drm_for_each_bridge_in_chain()
> * Rename helpers to be more consistent with the rest of the DRM API
> * Improve/fix the doc
> ---
>  drivers/gpu/drm/drm_atomic.c        |  39 +++++++
>  drivers/gpu/drm/drm_atomic_helper.c |  20 ++++
>  drivers/gpu/drm/drm_bridge.c        | 168 +++++++++++++++++++++++++++-
>  include/drm/drm_atomic.h            |   3 +
>  include/drm/drm_bridge.h            | 118 +++++++++++++++++++
>  5 files changed, 343 insertions(+), 5 deletions(-)
> 
[...]

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
> index 238e84ab63a3..a608c47d1de5 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -25,6 +25,7 @@
>  
>  #include <linux/list.h>
>  #include <linux/ctype.h>
> +#include <drm/drm_atomic.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_mode_object.h>
>  #include <drm/drm_modes.h>
> @@ -33,6 +34,23 @@ struct drm_bridge;
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
> @@ -338,6 +356,48 @@ struct drm_bridge_funcs {
>  	 */
>  	void (*atomic_post_disable)(struct drm_bridge *bridge,
>  				    struct drm_atomic_state *state);
> +
> +	/**
> +	 * @atomic_duplicate_state:
> +	 *
> +	 * Duplicate the current bridge state object (which is guaranteed to be
> +	 * non-NULL).
> +	 *
> +	 * The atomic_duplicate_state() is optional, the core falls back on
> +	 * &drm_atomic_helper_bridge_duplicate_state() when not implemented.
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
> +	 * The atomic_destroy_state hook is optional, the coref falls back on
> +	 * &drm_atomic_helper_bridge_destroy_state() when not implemented.
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
> +	 * The atomic_reset hook is optional, the core falls back on
> +	 * &drm_atomic_helper_bridge_reset() when not implemented.
> +	 *
> +	 * RETURNS:
> +	 * A valid drm_bridge_state object in case of success, an ERR_PTR()
> +	 * giving the reaon of the failure otherwise.
> +	 */
> +	struct drm_bridge_state *(*atomic_reset)(struct drm_bridge *bridge);
>  };
>  
>  /**
> @@ -380,6 +440,8 @@ struct drm_bridge_timings {
>   * struct drm_bridge - central DRM bridge control structure
>   */
>  struct drm_bridge {
> +	/** @base: inherit from &drm_private_object */
> +	struct drm_private_obj base;
>  	/** @dev: DRM device this bridge belongs to */
>  	struct drm_device *dev;
>  	/** @encoder: encoder to which this bridge is connected */
> @@ -404,6 +466,12 @@ struct drm_bridge {
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
> @@ -475,6 +543,56 @@ void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
>  void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
>  				    struct drm_atomic_state *state);
>  
> +void __drm_atomic_helper_bridge_reset(struct drm_bridge *bridge,
> +				      struct drm_bridge_state *state);
> +struct drm_bridge_state *
> +drm_atomic_helper_bridge_reset(struct drm_bridge *bridge);
> +void drm_atomic_helper_bridge_destroy_state(struct drm_bridge *bridge,
> +					    struct drm_bridge_state *state);
> +void __drm_atomic_helper_bridge_duplicate_state(struct drm_bridge *bridge,
> +						struct drm_bridge_state *new);
> +struct drm_bridge_state *
> +drm_atomic_helper_bridge_duplicate_state(struct drm_bridge *bridge);
> +
> +static inline struct drm_bridge_state *
> +drm_atomic_get_bridge_state(struct drm_atomic_state *state,
> +			    struct drm_bridge *bridge)
> +{
> +	struct drm_private_state *obj_state;
> +
> +	obj_state = drm_atomic_get_private_obj_state(state, &bridge->base);
> +	if (!obj_state)
> +		return NULL;

drm_atomic_get_private_obj_state will return an error object on error, so should be:
	if (IS_ERR(obj_state))
              return ERR_CAST(obj_state);

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
> 

With this fixed, you can keep my Reviewed-by

Neil
