Return-Path: <SRS0=V00+=YS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B64CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 14:36:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1D9F5206DD
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 14:36:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Akbxa2/O"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439758AbfJYOf7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 25 Oct 2019 10:35:59 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46340 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbfJYOf7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 25 Oct 2019 10:35:59 -0400
Received: by mail-wr1-f66.google.com with SMTP id n15so2572556wrw.13
        for <devicetree@vger.kernel.org>; Fri, 25 Oct 2019 07:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=OEKy8DucXsT/1IR+waxgCMZS6DAZ/ELRD6UHiu3mIsU=;
        b=Akbxa2/OcSSb7dC/M6vcsyCudaowMHjLdQVx1DSOlh1eogZSd9GicbX03zM8KhT8Mo
         vI8F4CxWpedq1DEu1Nz19DBU/AF2WLtynPUl8BNnrmSjAILNhL4vm9ap6+k+jRAos9gi
         Y8gebdfW1i5fm0ycQePFPy0mAlA0asa2zFCqDxBEtGNg6aizfkElOI3s+nsdBq2a9H4m
         xXlxdG/PNE8CdLZetR+sP9c8oCuR83bpmWq6mietgPeLOyOfHXWF3qn0jkSwEVaKdX4v
         G1MYjRszDzVJ59czeA7hsf8uDUhRMZ+0aX3HNxxxtMMZqMsL9ocRAkvnvPBGix3RTsf+
         uO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=OEKy8DucXsT/1IR+waxgCMZS6DAZ/ELRD6UHiu3mIsU=;
        b=mlpMA3ZuQPJJ42QIOVfrBLNDjOSJA/vQ2L3reo+SqbyWCEGC5h+WBlpgRCkfX44ey3
         K3tZH01W8u8HR/uKwO002q2/btCDUAAmnN/NmG/1c/qIXNJYnmX77Gfr9vDbR+bxG0PQ
         MxxgkjtntNw1YayDEnXErZQiF0g4Ure0/12JtoDCEBbilV3zTlyPRSI1R6f3ozg6bC2r
         N3l3sC8eR2WQK3C1Uk+aZmSow4T0c9bvfZXWKPvseOjckK2KWBnXf2/G0V0vUFpI7HzJ
         nZ5x5y1aimwAGKanNBT93k37AIiCWMKsnTXk7TKZOj4/SLt/Cu2tt0wVG41lb7WTed0j
         BCqQ==
X-Gm-Message-State: APjAAAV32eQA9J35N933VNq+CpOmiTIHvy/+T8ASk4yON6V8e10Yshhh
        /6tld5QTOrWog0uoHohdSUUt6oDh7XSAiA==
X-Google-Smtp-Source: APXvYqyXIUru5tBQx803UHCXi80ktyzkzBwypPy9zA6YiyDQilPXj952GvO/dp3rJ8Xt8v/683JWKA==
X-Received: by 2002:adf:cd87:: with SMTP id q7mr3523895wrj.216.1572014155205;
        Fri, 25 Oct 2019 07:35:55 -0700 (PDT)
Received: from [192.168.1.62] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id g17sm2497856wrq.58.2019.10.25.07.35.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Oct 2019 07:35:54 -0700 (PDT)
Subject: Re: [PATCH v3 12/21] drm/bridge: Add an ->atomic_check() hook
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
 <20191023154512.9762-13-boris.brezillon@collabora.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <ec9ba270-1d08-305a-d5e1-5c079161a8bf@baylibre.com>
Date:   Fri, 25 Oct 2019 16:35:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191023154512.9762-13-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 23/10/2019 17:45, Boris Brezillon wrote:
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
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
