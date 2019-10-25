Return-Path: <SRS0=V00+=YS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A5D2CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 13:27:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 25FF221D7F
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 13:27:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OCrJbirk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbfJYN1G (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 25 Oct 2019 09:27:06 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40874 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394609AbfJYN1G (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 25 Oct 2019 09:27:06 -0400
Received: by mail-wr1-f65.google.com with SMTP id o28so2337748wro.7
        for <devicetree@vger.kernel.org>; Fri, 25 Oct 2019 06:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=B/d9KWWNbVhMtxnEMcx1k9zWGkN3yR+FlIR37FkCRus=;
        b=OCrJbirkkJ1MHJx0bmXbSfJRWIotMI7A0GmhLpfKS0epx3azvvqIv+KXaLS83TdO3A
         OmShs6gVdNYjYvOPFN2BFaRbnyhXS8djPdqgnE7sOMSvXMnVdFi+i0gAkfoh3T6NWdB+
         E1uqq4Kd3Sd2E/DETzl4bdbZqsoYygwHuSw1XKNPsDmBaCeujULUHDj11ThHRMVEd0qO
         NkF7Pf3gqh0+29cr+gZQAP5bYg90UX78fAlaTxD4pHsaZHT47S1ZDWgnzZvxfG6kE3xd
         XJLVuTSihb6QjgepzuDV9AZ2C0WDK9pxCcyawVRqrAgJFXaTUWIwUIGF5R3iedFkHGNe
         Ziww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=B/d9KWWNbVhMtxnEMcx1k9zWGkN3yR+FlIR37FkCRus=;
        b=RQdotu/Gz7cSXLyy3dj2cZb/ZRipeag0yTg37UwwnWIHBeQgTxq1pnAY81fdqc6adI
         HDbvAfSWAXMEo4WTO+eJEAaAYQjYeh2ZVomtfyp6n3emFBweyY9L/2h+emPt10R6S0mm
         lz5asZFlXItW2D3xLKF6F7yPdGqZsT+3MDzwxYYdz+Z+iN27Teb2CYBMPPonKah+cF3W
         krZ5Bxd9pAjnnTSpmLPPCgQN4xS4LAqQc+GhZdI+csnBkaDjGnN9fopeVR+ivUTnYxBi
         tCKEYxpoHFG/ZSnWLD227Bu2HR/qT6dBNY9tkDPhr440KCpZ0+L1fqnykN76AVaqbIee
         J37g==
X-Gm-Message-State: APjAAAW+tuBwzE69I9S6LOrcIKSR2P+S2lYLkrDcT2LQiQsrg8dN8kig
        wNM4mwugXJyr91lNDizih8YyP+/0rp12Lw==
X-Google-Smtp-Source: APXvYqzGHoM344lyp/jPuIQhcyG80T2iSAXGZOaOFBGHMGwal6BlKpaqQNccZYGBghoem7rJbRJ9Fw==
X-Received: by 2002:adf:ecc7:: with SMTP id s7mr3012623wro.305.1572010020958;
        Fri, 25 Oct 2019 06:27:00 -0700 (PDT)
Received: from [192.168.1.62] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id f204sm2585570wmf.32.2019.10.25.06.26.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Oct 2019 06:27:00 -0700 (PDT)
Subject: Re: [PATCH v3 04/21] drm/bridge: Rename bridge helpers targeting a
 bridge chain
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
 <20191023154512.9762-5-boris.brezillon@collabora.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <bebc1b04-a149-86a4-dd3f-ed475af0ea29@baylibre.com>
Date:   Fri, 25 Oct 2019 15:26:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191023154512.9762-5-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 23/10/2019 17:44, Boris Brezillon wrote:
> Change the prefix of bridge helpers targeting a bridge chain from
> drm_bridge_ to drm_bridge_chain_ to better reflect the fact that
> the operation will happen on all elements of chain, starting at the
> bridge passed in argument.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Changes in v3:
> * None
> 
> Changes in v2:
> * Pass te bridge, not the encoder, so we can later act on a sub-chain
>   instead of the whole chain
> ---
>  drivers/gpu/drm/drm_atomic_helper.c |  19 +++--
>  drivers/gpu/drm/drm_bridge.c        | 125 ++++++++++++++--------------
>  drivers/gpu/drm/drm_probe_helper.c  |   2 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi.c |   4 +-
>  include/drm/drm_bridge.h            |  64 +++++++-------
>  5 files changed, 112 insertions(+), 102 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 587052751b48..cf678be58fa4 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -435,8 +435,9 @@ mode_fixup(struct drm_atomic_state *state)
>  		encoder = new_conn_state->best_encoder;
>  		funcs = encoder->helper_private;
>  
> -		ret = drm_bridge_mode_fixup(encoder->bridge, &new_crtc_state->mode,
> -				&new_crtc_state->adjusted_mode);
> +		ret = drm_bridge_chain_mode_fixup(encoder->bridge,
> +					&new_crtc_state->mode,
> +					&new_crtc_state->adjusted_mode);
>  		if (!ret) {
>  			DRM_DEBUG_ATOMIC("Bridge fixup failed\n");
>  			return -EINVAL;
> @@ -501,7 +502,7 @@ static enum drm_mode_status mode_valid_path(struct drm_connector *connector,
>  		return ret;
>  	}
>  
> -	ret = drm_bridge_mode_valid(encoder->bridge, mode);
> +	ret = drm_bridge_chain_mode_valid(encoder->bridge, mode);
>  	if (ret != MODE_OK) {
>  		DRM_DEBUG_ATOMIC("[BRIDGE] mode_valid() failed\n");
>  		return ret;
> @@ -1020,7 +1021,7 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
>  		 * Each encoder has at most one connector (since we always steal
>  		 * it away), so we won't call disable hooks twice.
>  		 */
> -		drm_atomic_bridge_disable(encoder->bridge, old_state);
> +		drm_atomic_bridge_chain_disable(encoder->bridge, old_state);
>  
>  		/* Right function depends upon target state. */
>  		if (funcs) {
> @@ -1034,7 +1035,8 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
>  				funcs->dpms(encoder, DRM_MODE_DPMS_OFF);
>  		}
>  
> -		drm_atomic_bridge_post_disable(encoder->bridge, old_state);
> +		drm_atomic_bridge_chain_post_disable(encoder->bridge,
> +						     old_state);
>  	}
>  
>  	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
> @@ -1215,7 +1217,8 @@ crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *old_state)
>  			funcs->mode_set(encoder, mode, adjusted_mode);
>  		}
>  
> -		drm_bridge_mode_set(encoder->bridge, mode, adjusted_mode);
> +		drm_bridge_chain_mode_set(encoder->bridge, mode,
> +					  adjusted_mode);
>  	}
>  }
>  
> @@ -1332,7 +1335,7 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
>  		 * Each encoder has at most one connector (since we always steal
>  		 * it away), so we won't call enable hooks twice.
>  		 */
> -		drm_atomic_bridge_pre_enable(encoder->bridge, old_state);
> +		drm_atomic_bridge_chain_pre_enable(encoder->bridge, old_state);
>  
>  		if (funcs) {
>  			if (funcs->atomic_enable)
> @@ -1343,7 +1346,7 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
>  				funcs->commit(encoder);
>  		}
>  
> -		drm_atomic_bridge_enable(encoder->bridge, old_state);
> +		drm_atomic_bridge_chain_enable(encoder->bridge, old_state);
>  	}
>  
>  	drm_atomic_helper_commit_writebacks(dev, old_state);
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index cba537c99e43..54c874493c57 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -172,8 +172,8 @@ void drm_bridge_detach(struct drm_bridge *bridge)
>   */
>  
>  /**
> - * drm_bridge_mode_fixup - fixup proposed mode for all bridges in the
> - *			   encoder chain
> + * drm_bridge_chain_mode_fixup - fixup proposed mode for all bridges in the
> + *				 encoder chain
>   * @bridge: bridge control structure
>   * @mode: desired mode to be set for the bridge
>   * @adjusted_mode: updated mode that works for this bridge
> @@ -186,9 +186,9 @@ void drm_bridge_detach(struct drm_bridge *bridge)
>   * RETURNS:
>   * true on success, false on failure
>   */
> -bool drm_bridge_mode_fixup(struct drm_bridge *bridge,
> -			const struct drm_display_mode *mode,
> -			struct drm_display_mode *adjusted_mode)
> +bool drm_bridge_chain_mode_fixup(struct drm_bridge *bridge,
> +				 const struct drm_display_mode *mode,
> +				 struct drm_display_mode *adjusted_mode)
>  {
>  	bool ret = true;
>  
> @@ -198,15 +198,16 @@ bool drm_bridge_mode_fixup(struct drm_bridge *bridge,
>  	if (bridge->funcs->mode_fixup)
>  		ret = bridge->funcs->mode_fixup(bridge, mode, adjusted_mode);
>  
> -	ret = ret && drm_bridge_mode_fixup(bridge->next, mode, adjusted_mode);
> +	ret = ret && drm_bridge_chain_mode_fixup(bridge->next, mode,
> +						 adjusted_mode);
>  
>  	return ret;
>  }
> -EXPORT_SYMBOL(drm_bridge_mode_fixup);
> +EXPORT_SYMBOL(drm_bridge_chain_mode_fixup);
>  
>  /**
> - * drm_bridge_mode_valid - validate the mode against all bridges in the
> - * 			   encoder chain.
> + * drm_bridge_chain_mode_valid - validate the mode against all bridges in the
> + *				 encoder chain.
>   * @bridge: bridge control structure
>   * @mode: desired mode to be validated
>   *
> @@ -219,8 +220,9 @@ EXPORT_SYMBOL(drm_bridge_mode_fixup);
>   * RETURNS:
>   * MODE_OK on success, drm_mode_status Enum error code on failure
>   */
> -enum drm_mode_status drm_bridge_mode_valid(struct drm_bridge *bridge,
> -					   const struct drm_display_mode *mode)
> +enum drm_mode_status
> +drm_bridge_chain_mode_valid(struct drm_bridge *bridge,
> +			    const struct drm_display_mode *mode)
>  {
>  	enum drm_mode_status ret = MODE_OK;
>  
> @@ -233,12 +235,12 @@ enum drm_mode_status drm_bridge_mode_valid(struct drm_bridge *bridge,
>  	if (ret != MODE_OK)
>  		return ret;
>  
> -	return drm_bridge_mode_valid(bridge->next, mode);
> +	return drm_bridge_chain_mode_valid(bridge->next, mode);
>  }
> -EXPORT_SYMBOL(drm_bridge_mode_valid);
> +EXPORT_SYMBOL(drm_bridge_chain_mode_valid);
>  
>  /**
> - * drm_bridge_disable - disables all bridges in the encoder chain
> + * drm_bridge_chain_disable - disables all bridges in the encoder chain
>   * @bridge: bridge control structure
>   *
>   * Calls &drm_bridge_funcs.disable op for all the bridges in the encoder
> @@ -247,20 +249,21 @@ EXPORT_SYMBOL(drm_bridge_mode_valid);
>   *
>   * Note: the bridge passed should be the one closest to the encoder
>   */
> -void drm_bridge_disable(struct drm_bridge *bridge)
> +void drm_bridge_chain_disable(struct drm_bridge *bridge)
>  {
>  	if (!bridge)
>  		return;
>  
> -	drm_bridge_disable(bridge->next);
> +	drm_bridge_chain_disable(bridge->next);
>  
>  	if (bridge->funcs->disable)
>  		bridge->funcs->disable(bridge);
>  }
> -EXPORT_SYMBOL(drm_bridge_disable);
> +EXPORT_SYMBOL(drm_bridge_chain_disable);
>  
>  /**
> - * drm_bridge_post_disable - cleans up after disabling all bridges in the encoder chain
> + * drm_bridge_chain_post_disable - cleans up after disabling all bridges in the
> + *				   encoder chain
>   * @bridge: bridge control structure
>   *
>   * Calls &drm_bridge_funcs.post_disable op for all the bridges in the
> @@ -269,7 +272,7 @@ EXPORT_SYMBOL(drm_bridge_disable);
>   *
>   * Note: the bridge passed should be the one closest to the encoder
>   */
> -void drm_bridge_post_disable(struct drm_bridge *bridge)
> +void drm_bridge_chain_post_disable(struct drm_bridge *bridge)
>  {
>  	if (!bridge)
>  		return;
> @@ -277,25 +280,25 @@ void drm_bridge_post_disable(struct drm_bridge *bridge)
>  	if (bridge->funcs->post_disable)
>  		bridge->funcs->post_disable(bridge);
>  
> -	drm_bridge_post_disable(bridge->next);
> +	drm_bridge_chain_post_disable(bridge->next);
>  }
> -EXPORT_SYMBOL(drm_bridge_post_disable);
> +EXPORT_SYMBOL(drm_bridge_chain_post_disable);
>  
>  /**
> - * drm_bridge_mode_set - set proposed mode for all bridges in the
> - *			 encoder chain
> + * drm_bridge_chain_mode_set - set proposed mode for all bridges in the
> + *			       encoder chain
>   * @bridge: bridge control structure
> - * @mode: desired mode to be set for the bridge
> - * @adjusted_mode: updated mode that works for this bridge
> + * @mode: desired mode to be set for the encoder chain
> + * @adjusted_mode: updated mode that works for this encoder chain
>   *
>   * Calls &drm_bridge_funcs.mode_set op for all the bridges in the
>   * encoder chain, starting from the first bridge to the last.
>   *
>   * Note: the bridge passed should be the one closest to the encoder
>   */
> -void drm_bridge_mode_set(struct drm_bridge *bridge,
> -			 const struct drm_display_mode *mode,
> -			 const struct drm_display_mode *adjusted_mode)
> +void drm_bridge_chain_mode_set(struct drm_bridge *bridge,
> +			       const struct drm_display_mode *mode,
> +			       const struct drm_display_mode *adjusted_mode)
>  {
>  	if (!bridge)
>  		return;
> @@ -303,13 +306,13 @@ void drm_bridge_mode_set(struct drm_bridge *bridge,
>  	if (bridge->funcs->mode_set)
>  		bridge->funcs->mode_set(bridge, mode, adjusted_mode);
>  
> -	drm_bridge_mode_set(bridge->next, mode, adjusted_mode);
> +	drm_bridge_chain_mode_set(bridge->next, mode, adjusted_mode);
>  }
> -EXPORT_SYMBOL(drm_bridge_mode_set);
> +EXPORT_SYMBOL(drm_bridge_chain_mode_set);
>  
>  /**
> - * drm_bridge_pre_enable - prepares for enabling all
> - *			   bridges in the encoder chain
> + * drm_bridge_chain_pre_enable - prepares for enabling all bridges in the
> + *				 encoder chain
>   * @bridge: bridge control structure
>   *
>   * Calls &drm_bridge_funcs.pre_enable op for all the bridges in the encoder
> @@ -318,20 +321,20 @@ EXPORT_SYMBOL(drm_bridge_mode_set);
>   *
>   * Note: the bridge passed should be the one closest to the encoder
>   */
> -void drm_bridge_pre_enable(struct drm_bridge *bridge)
> +void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
>  {
>  	if (!bridge)
>  		return;
>  
> -	drm_bridge_pre_enable(bridge->next);
> +	drm_bridge_chain_pre_enable(bridge->next);
>  
>  	if (bridge->funcs->pre_enable)
>  		bridge->funcs->pre_enable(bridge);
>  }
> -EXPORT_SYMBOL(drm_bridge_pre_enable);
> +EXPORT_SYMBOL(drm_bridge_chain_pre_enable);
>  
>  /**
> - * drm_bridge_enable - enables all bridges in the encoder chain
> + * drm_bridge_chain_enable - enables all bridges in the encoder chain
>   * @bridge: bridge control structure
>   *
>   * Calls &drm_bridge_funcs.enable op for all the bridges in the encoder
> @@ -340,7 +343,7 @@ EXPORT_SYMBOL(drm_bridge_pre_enable);
>   *
>   * Note that the bridge passed should be the one closest to the encoder
>   */
> -void drm_bridge_enable(struct drm_bridge *bridge)
> +void drm_bridge_chain_enable(struct drm_bridge *bridge)
>  {
>  	if (!bridge)
>  		return;
> @@ -348,12 +351,12 @@ void drm_bridge_enable(struct drm_bridge *bridge)
>  	if (bridge->funcs->enable)
>  		bridge->funcs->enable(bridge);
>  
> -	drm_bridge_enable(bridge->next);
> +	drm_bridge_chain_enable(bridge->next);
>  }
> -EXPORT_SYMBOL(drm_bridge_enable);
> +EXPORT_SYMBOL(drm_bridge_chain_enable);
>  
>  /**
> - * drm_atomic_bridge_disable - disables all bridges in the encoder chain
> + * drm_atomic_bridge_chain_disable - disables all bridges in the encoder chain
>   * @bridge: bridge control structure
>   * @state: atomic state being committed
>   *
> @@ -364,24 +367,24 @@ EXPORT_SYMBOL(drm_bridge_enable);
>   *
>   * Note: the bridge passed should be the one closest to the encoder
>   */
> -void drm_atomic_bridge_disable(struct drm_bridge *bridge,
> -			       struct drm_atomic_state *state)
> +void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
> +				     struct drm_atomic_state *state)
>  {
>  	if (!bridge)
>  		return;
>  
> -	drm_atomic_bridge_disable(bridge->next, state);
> +	drm_atomic_bridge_chain_disable(bridge->next, state);
>  
>  	if (bridge->funcs->atomic_disable)
>  		bridge->funcs->atomic_disable(bridge, state);
>  	else if (bridge->funcs->disable)
>  		bridge->funcs->disable(bridge);
>  }
> -EXPORT_SYMBOL(drm_atomic_bridge_disable);
> +EXPORT_SYMBOL(drm_atomic_bridge_chain_disable);
>  
>  /**
> - * drm_atomic_bridge_post_disable - cleans up after disabling all bridges in the
> - *				    encoder chain
> + * drm_atomic_bridge_chain_post_disable - cleans up after disabling all bridges
> + *					  in the encoder chain
>   * @bridge: bridge control structure
>   * @state: atomic state being committed
>   *
> @@ -392,8 +395,8 @@ EXPORT_SYMBOL(drm_atomic_bridge_disable);
>   *
>   * Note: the bridge passed should be the one closest to the encoder
>   */
> -void drm_atomic_bridge_post_disable(struct drm_bridge *bridge,
> -				    struct drm_atomic_state *state)
> +void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
> +					  struct drm_atomic_state *state)
>  {
>  	if (!bridge)
>  		return;
> @@ -403,13 +406,13 @@ void drm_atomic_bridge_post_disable(struct drm_bridge *bridge,
>  	else if (bridge->funcs->post_disable)
>  		bridge->funcs->post_disable(bridge);
>  
> -	drm_atomic_bridge_post_disable(bridge->next, state);
> +	drm_atomic_bridge_chain_post_disable(bridge->next, state);
>  }
> -EXPORT_SYMBOL(drm_atomic_bridge_post_disable);
> +EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
>  
>  /**
> - * drm_atomic_bridge_pre_enable - prepares for enabling all bridges in the
> - *				  encoder chain
> + * drm_atomic_bridge_chain_pre_enable - prepares for enabling all bridges in
> + *					the encoder chain
>   * @bridge: bridge control structure
>   * @state: atomic state being committed
>   *
> @@ -420,23 +423,23 @@ EXPORT_SYMBOL(drm_atomic_bridge_post_disable);
>   *
>   * Note: the bridge passed should be the one closest to the encoder
>   */
> -void drm_atomic_bridge_pre_enable(struct drm_bridge *bridge,
> -				  struct drm_atomic_state *state)
> +void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
> +					struct drm_atomic_state *state)
>  {
>  	if (!bridge)
>  		return;
>  
> -	drm_atomic_bridge_pre_enable(bridge->next, state);
> +	drm_atomic_bridge_chain_pre_enable(bridge->next, state);
>  
>  	if (bridge->funcs->atomic_pre_enable)
>  		bridge->funcs->atomic_pre_enable(bridge, state);
>  	else if (bridge->funcs->pre_enable)
>  		bridge->funcs->pre_enable(bridge);
>  }
> -EXPORT_SYMBOL(drm_atomic_bridge_pre_enable);
> +EXPORT_SYMBOL(drm_atomic_bridge_chain_pre_enable);
>  
>  /**
> - * drm_atomic_bridge_enable - enables all bridges in the encoder chain
> + * drm_atomic_bridge_chain_enable - enables all bridges in the encoder chain
>   * @bridge: bridge control structure
>   * @state: atomic state being committed
>   *
> @@ -447,8 +450,8 @@ EXPORT_SYMBOL(drm_atomic_bridge_pre_enable);
>   *
>   * Note: the bridge passed should be the one closest to the encoder
>   */
> -void drm_atomic_bridge_enable(struct drm_bridge *bridge,
> -			      struct drm_atomic_state *state)
> +void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
> +				    struct drm_atomic_state *state)
>  {
>  	if (!bridge)
>  		return;
> @@ -458,9 +461,9 @@ void drm_atomic_bridge_enable(struct drm_bridge *bridge,
>  	else if (bridge->funcs->enable)
>  		bridge->funcs->enable(bridge);
>  
> -	drm_atomic_bridge_enable(bridge->next, state);
> +	drm_atomic_bridge_chain_enable(bridge->next, state);
>  }
> -EXPORT_SYMBOL(drm_atomic_bridge_enable);
> +EXPORT_SYMBOL(drm_atomic_bridge_chain_enable);
>  
>  #ifdef CONFIG_OF
>  /**
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index a7c87abe88d0..c3ea722065c4 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -112,7 +112,7 @@ drm_mode_validate_pipeline(struct drm_display_mode *mode,
>  			continue;
>  		}
>  
> -		ret = drm_bridge_mode_valid(encoder->bridge, mode);
> +		ret = drm_bridge_chain_mode_valid(encoder->bridge, mode);
>  		if (ret != MODE_OK) {
>  			/* There is also no point in continuing for crtc check
>  			 * here. */
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index c79b1f855d89..ea68b5adccbe 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1247,8 +1247,8 @@ static int mtk_hdmi_conn_mode_valid(struct drm_connector *conn,
>  		struct drm_display_mode adjusted_mode;
>  
>  		drm_mode_copy(&adjusted_mode, mode);
> -		if (!drm_bridge_mode_fixup(hdmi->bridge.next, mode,
> -					   &adjusted_mode))
> +		if (!drm_bridge_chain_mode_fixup(hdmi->bridge.next, mode,
> +						 &adjusted_mode))
>  			return MODE_BAD;
>  	}
>  
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index c0a2286a81e9..726435baf4ad 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -254,9 +254,10 @@ struct drm_bridge_funcs {
>  	 * there is one) when this callback is called.
>  	 *
>  	 * Note that this function will only be invoked in the context of an
> -	 * atomic commit. It will not be invoked from &drm_bridge_pre_enable. It
> -	 * would be prudent to also provide an implementation of @pre_enable if
> -	 * you are expecting driver calls into &drm_bridge_pre_enable.
> +	 * atomic commit. It will not be invoked from
> +	 * &drm_bridge_chain_pre_enable. It would be prudent to also provide an
> +	 * implementation of @pre_enable if you are expecting driver calls into
> +	 * &drm_bridge_chain_pre_enable.
>  	 *
>  	 * The @atomic_pre_enable callback is optional.
>  	 */
> @@ -279,9 +280,9 @@ struct drm_bridge_funcs {
>  	 * chain if there is one.
>  	 *
>  	 * Note that this function will only be invoked in the context of an
> -	 * atomic commit. It will not be invoked from &drm_bridge_enable. It
> -	 * would be prudent to also provide an implementation of @enable if
> -	 * you are expecting driver calls into &drm_bridge_enable.
> +	 * atomic commit. It will not be invoked from &drm_bridge_chain_enable.
> +	 * It would be prudent to also provide an implementation of @enable if
> +	 * you are expecting driver calls into &drm_bridge_chain_enable.
>  	 *
>  	 * The @atomic_enable callback is optional.
>  	 */
> @@ -301,9 +302,10 @@ struct drm_bridge_funcs {
>  	 * signals) feeding it is still running when this callback is called.
>  	 *
>  	 * Note that this function will only be invoked in the context of an
> -	 * atomic commit. It will not be invoked from &drm_bridge_disable. It
> -	 * would be prudent to also provide an implementation of @disable if
> -	 * you are expecting driver calls into &drm_bridge_disable.
> +	 * atomic commit. It will not be invoked from
> +	 * &drm_bridge_chain_disable. It would be prudent to also provide an
> +	 * implementation of @disable if you are expecting driver calls into
> +	 * &drm_bridge_chain_disable.
>  	 *
>  	 * The @atomic_disable callback is optional.
>  	 */
> @@ -325,10 +327,11 @@ struct drm_bridge_funcs {
>  	 * called.
>  	 *
>  	 * Note that this function will only be invoked in the context of an
> -	 * atomic commit. It will not be invoked from &drm_bridge_post_disable.
> +	 * atomic commit. It will not be invoked from
> +	 * &drm_bridge_chain_post_disable.
>  	 * It would be prudent to also provide an implementation of
>  	 * @post_disable if you are expecting driver calls into
> -	 * &drm_bridge_post_disable.
> +	 * &drm_bridge_chain_post_disable.
>  	 *
>  	 * The @atomic_post_disable callback is optional.
>  	 */
> @@ -406,27 +409,28 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np);
>  int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
>  		      struct drm_bridge *previous);
>  
> -bool drm_bridge_mode_fixup(struct drm_bridge *bridge,
> -			   const struct drm_display_mode *mode,
> -			   struct drm_display_mode *adjusted_mode);
> -enum drm_mode_status drm_bridge_mode_valid(struct drm_bridge *bridge,
> -					   const struct drm_display_mode *mode);
> -void drm_bridge_disable(struct drm_bridge *bridge);
> -void drm_bridge_post_disable(struct drm_bridge *bridge);
> -void drm_bridge_mode_set(struct drm_bridge *bridge,
> -			 const struct drm_display_mode *mode,
> -			 const struct drm_display_mode *adjusted_mode);
> -void drm_bridge_pre_enable(struct drm_bridge *bridge);
> -void drm_bridge_enable(struct drm_bridge *bridge);
> +bool drm_bridge_chain_mode_fixup(struct drm_bridge *bridge,
> +				 const struct drm_display_mode *mode,
> +				 struct drm_display_mode *adjusted_mode);
> +enum drm_mode_status
> +drm_bridge_chain_mode_valid(struct drm_bridge *bridge,
> +			    const struct drm_display_mode *mode);
> +void drm_bridge_chain_disable(struct drm_bridge *bridge);
> +void drm_bridge_chain_post_disable(struct drm_bridge *bridge);
> +void drm_bridge_chain_mode_set(struct drm_bridge *bridge,
> +			       const struct drm_display_mode *mode,
> +			       const struct drm_display_mode *adjusted_mode);
> +void drm_bridge_chain_pre_enable(struct drm_bridge *bridge);
> +void drm_bridge_chain_enable(struct drm_bridge *bridge);
>  
> -void drm_atomic_bridge_disable(struct drm_bridge *bridge,
> -			       struct drm_atomic_state *state);
> -void drm_atomic_bridge_post_disable(struct drm_bridge *bridge,
> +void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
> +				     struct drm_atomic_state *state);
> +void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
> +					  struct drm_atomic_state *state);
> +void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
> +					struct drm_atomic_state *state);
> +void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
>  				    struct drm_atomic_state *state);
> -void drm_atomic_bridge_pre_enable(struct drm_bridge *bridge,
> -				  struct drm_atomic_state *state);
> -void drm_atomic_bridge_enable(struct drm_bridge *bridge,
> -			      struct drm_atomic_state *state);
>  
>  #ifdef CONFIG_DRM_PANEL_BRIDGE
>  struct drm_bridge *drm_panel_bridge_add(struct drm_panel *panel);
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
