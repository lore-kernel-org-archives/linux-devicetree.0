Return-Path: <SRS0=V00+=YS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A2A5CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 13:28:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C22EF21D71
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 13:28:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="vCBL+TXp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727148AbfJYN24 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 25 Oct 2019 09:28:56 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39702 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbfJYN24 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 25 Oct 2019 09:28:56 -0400
Received: by mail-wr1-f66.google.com with SMTP id a11so2348525wra.6
        for <devicetree@vger.kernel.org>; Fri, 25 Oct 2019 06:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=9frL41InOv8K+U0+sJu6i/z5TY7zbxD/yHaCA3W+1bM=;
        b=vCBL+TXptQpWMTm9PKAq9RuLrmbTNMu530PqsysZU9ZcpQgeGBNBjVOAoDK4eYMWQ3
         vG9KUmaWQ//RYG7cJOJgX5UEieBUC6hE4Jzyny37RrdeJvpm/Sek0oq566gCbACMTWFS
         IfpUvCFx8LZaOz2IX3gEhxurUYyo38QK1Q/lpEgrdkJ/Rd140OljvlzYEcWrZO+bHE0U
         7riU8natFvcFN2ZfHGnfuCSxp6kUCgrWDPA3DmEZYAe4LammYUl5DvLENRDR+ozRCWST
         cRe5FvAs6zO8jskVVdThAiYymKwQaZ70joBiVpY2RVU+vNrzzMJyzYDMtUx2CxShZD9X
         5Fmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=9frL41InOv8K+U0+sJu6i/z5TY7zbxD/yHaCA3W+1bM=;
        b=FOE1kFlBQaOweYS6tLeOOzoQM+EXuCvvmxHglxxiMHbv3/rV+HT00oejck4Zh1AV7T
         KpADh2aC/RPJTplbPmNGslGv0T2zQXYxazdY3081cDrIxpZnzmqE+KIMHDJE3YZjnTpd
         QkmqWn5pAAG10DO9TUjlgjHa644p+LC4JB1h8J9E0wsdBFiCiWV2hpoNtlCEuVn73SKJ
         P8BmPqemcgV+P8cyOCcLJmvb+X1mnfR7kn+0VwhwAeHvDhGIcnSz6oPLgCVj1sTMosHd
         rHb4mWI2pQ1E4PgjZxBsF9AuUFeYcmWk4rzTGAoWZtvni+YWzXrjnI0y00WKRFwK3ivD
         bJlQ==
X-Gm-Message-State: APjAAAWthwg/o7kVlXlA7YqDKD4+OPhEAzfSLCHp49mtJ8FgqdiNd/oN
        cEWsxOW11QaHMWDxu6/UJG52MF4FWY/wGg==
X-Google-Smtp-Source: APXvYqwyFaKcAh8xGQIU2XGhUK3mJsa+SEMmfPfIMPkBNlal3ej7NJhx3KVDOGS4SfFPUhr0xH8RwA==
X-Received: by 2002:adf:edcc:: with SMTP id v12mr2962281wro.158.1572010130580;
        Fri, 25 Oct 2019 06:28:50 -0700 (PDT)
Received: from [192.168.1.62] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id n3sm2619297wrr.50.2019.10.25.06.28.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Oct 2019 06:28:50 -0700 (PDT)
Subject: Re: [PATCH v3 06/21] drm: Stop accessing encoder->bridge directly
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
 <20191023154512.9762-7-boris.brezillon@collabora.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <7560013f-43dc-5082-19be-bcc3a7982ccd@baylibre.com>
Date:   Fri, 25 Oct 2019 15:28:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191023154512.9762-7-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 23/10/2019 17:44, Boris Brezillon wrote:
> We are about to replace the single-linked bridge list by a double-linked
> one based on list.h, leading to the suppression of the encoder->bridge
> field. But before we can do that we must provide a
> drm_bridge_chain_get_first_bridge() bridge helper and patch all drivers
> and core helpers to use it instead of directly accessing encoder->bridge.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c    | 25 +++++++++++++++++--------
>  drivers/gpu/drm/drm_encoder.c          |  3 ++-
>  drivers/gpu/drm/drm_probe_helper.c     |  4 +++-
>  drivers/gpu/drm/msm/edp/edp_bridge.c   | 10 ++++++++--
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 11 ++++++++---
>  include/drm/drm_bridge.h               | 15 +++++++++++++++
>  6 files changed, 53 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index cf678be58fa4..f02ddffd4960 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -419,6 +419,7 @@ mode_fixup(struct drm_atomic_state *state)
>  	for_each_new_connector_in_state(state, connector, new_conn_state, i) {
>  		const struct drm_encoder_helper_funcs *funcs;
>  		struct drm_encoder *encoder;
> +		struct drm_bridge *bridge;
>  
>  		WARN_ON(!!new_conn_state->best_encoder != !!new_conn_state->crtc);
>  
> @@ -435,7 +436,8 @@ mode_fixup(struct drm_atomic_state *state)
>  		encoder = new_conn_state->best_encoder;
>  		funcs = encoder->helper_private;
>  
> -		ret = drm_bridge_chain_mode_fixup(encoder->bridge,
> +		bridge = drm_bridge_chain_get_first_bridge(encoder);
> +		ret = drm_bridge_chain_mode_fixup(bridge,
>  					&new_crtc_state->mode,
>  					&new_crtc_state->adjusted_mode);
>  		if (!ret) {
> @@ -493,6 +495,7 @@ static enum drm_mode_status mode_valid_path(struct drm_connector *connector,
>  					    struct drm_crtc *crtc,
>  					    const struct drm_display_mode *mode)
>  {
> +	struct drm_bridge *bridge;
>  	enum drm_mode_status ret;
>  
>  	ret = drm_encoder_mode_valid(encoder, mode);
> @@ -502,7 +505,8 @@ static enum drm_mode_status mode_valid_path(struct drm_connector *connector,
>  		return ret;
>  	}
>  
> -	ret = drm_bridge_chain_mode_valid(encoder->bridge, mode);
> +	bridge = drm_bridge_chain_get_first_bridge(encoder);
> +	ret = drm_bridge_chain_mode_valid(bridge, mode);
>  	if (ret != MODE_OK) {
>  		DRM_DEBUG_ATOMIC("[BRIDGE] mode_valid() failed\n");
>  		return ret;
> @@ -985,6 +989,7 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
>  	for_each_oldnew_connector_in_state(old_state, connector, old_conn_state, new_conn_state, i) {
>  		const struct drm_encoder_helper_funcs *funcs;
>  		struct drm_encoder *encoder;
> +		struct drm_bridge *bridge;
>  
>  		/* Shut down everything that's in the changeset and currently
>  		 * still on. So need to check the old, saved state. */
> @@ -1021,7 +1026,8 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
>  		 * Each encoder has at most one connector (since we always steal
>  		 * it away), so we won't call disable hooks twice.
>  		 */
> -		drm_atomic_bridge_chain_disable(encoder->bridge, old_state);
> +		bridge = drm_bridge_chain_get_first_bridge(encoder);
> +		drm_atomic_bridge_chain_disable(bridge, old_state);
>  
>  		/* Right function depends upon target state. */
>  		if (funcs) {
> @@ -1035,7 +1041,7 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
>  				funcs->dpms(encoder, DRM_MODE_DPMS_OFF);
>  		}
>  
> -		drm_atomic_bridge_chain_post_disable(encoder->bridge,
> +		drm_atomic_bridge_chain_post_disable(bridge,
>  						     old_state);
>  	}
>  
> @@ -1190,6 +1196,7 @@ crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *old_state)
>  		const struct drm_encoder_helper_funcs *funcs;
>  		struct drm_encoder *encoder;
>  		struct drm_display_mode *mode, *adjusted_mode;
> +		struct drm_bridge *bridge;
>  
>  		if (!new_conn_state->best_encoder)
>  			continue;
> @@ -1217,8 +1224,8 @@ crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *old_state)
>  			funcs->mode_set(encoder, mode, adjusted_mode);
>  		}
>  
> -		drm_bridge_chain_mode_set(encoder->bridge, mode,
> -					  adjusted_mode);
> +		bridge = drm_bridge_chain_get_first_bridge(encoder);
> +		drm_bridge_chain_mode_set(bridge, mode, adjusted_mode);
>  	}
>  }
>  
> @@ -1317,6 +1324,7 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
>  	for_each_new_connector_in_state(old_state, connector, new_conn_state, i) {
>  		const struct drm_encoder_helper_funcs *funcs;
>  		struct drm_encoder *encoder;
> +		struct drm_bridge *bridge;
>  
>  		if (!new_conn_state->best_encoder)
>  			continue;
> @@ -1335,7 +1343,8 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
>  		 * Each encoder has at most one connector (since we always steal
>  		 * it away), so we won't call enable hooks twice.
>  		 */
> -		drm_atomic_bridge_chain_pre_enable(encoder->bridge, old_state);
> +		bridge = drm_bridge_chain_get_first_bridge(encoder);
> +		drm_atomic_bridge_chain_pre_enable(bridge, old_state);
>  
>  		if (funcs) {
>  			if (funcs->atomic_enable)
> @@ -1346,7 +1355,7 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
>  				funcs->commit(encoder);
>  		}
>  
> -		drm_atomic_bridge_chain_enable(encoder->bridge, old_state);
> +		drm_atomic_bridge_chain_enable(bridge, old_state);
>  	}
>  
>  	drm_atomic_helper_commit_writebacks(dev, old_state);
> diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> index 80d88a55302e..4fe9e723e227 100644
> --- a/drivers/gpu/drm/drm_encoder.c
> +++ b/drivers/gpu/drm/drm_encoder.c
> @@ -167,9 +167,10 @@ void drm_encoder_cleanup(struct drm_encoder *encoder)
>  	 */
>  
>  	if (encoder->bridge) {
> -		struct drm_bridge *bridge = encoder->bridge;
> +		struct drm_bridge *bridge;
>  		struct drm_bridge *next;
>  
> +		bridge = drm_bridge_chain_get_first_bridge(encoder);
>  		while (bridge) {
>  			next = bridge->next;
>  			drm_bridge_detach(bridge);
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index c3ea722065c4..576b4b7dcd89 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -101,6 +101,7 @@ drm_mode_validate_pipeline(struct drm_display_mode *mode,
>  
>  	/* Step 2: Validate against encoders and crtcs */
>  	drm_connector_for_each_possible_encoder(connector, encoder) {
> +		struct drm_bridge *bridge;
>  		struct drm_crtc *crtc;
>  
>  		ret = drm_encoder_mode_valid(encoder, mode);
> @@ -112,7 +113,8 @@ drm_mode_validate_pipeline(struct drm_display_mode *mode,
>  			continue;
>  		}
>  
> -		ret = drm_bridge_chain_mode_valid(encoder->bridge, mode);
> +		bridge = drm_bridge_chain_get_first_bridge(encoder);
> +		ret = drm_bridge_chain_mode_valid(bridge, mode);
>  		if (ret != MODE_OK) {
>  			/* There is also no point in continuing for crtc check
>  			 * here. */
> diff --git a/drivers/gpu/drm/msm/edp/edp_bridge.c b/drivers/gpu/drm/msm/edp/edp_bridge.c
> index 2950bba4aca9..b65b5cc2dba2 100644
> --- a/drivers/gpu/drm/msm/edp/edp_bridge.c
> +++ b/drivers/gpu/drm/msm/edp/edp_bridge.c
> @@ -55,8 +55,14 @@ static void edp_bridge_mode_set(struct drm_bridge *bridge,
>  	DBG("set mode: " DRM_MODE_FMT, DRM_MODE_ARG(mode));
>  
>  	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
> -		if ((connector->encoder != NULL) &&
> -			(connector->encoder->bridge == bridge)) {
> +		struct drm_encoder *encoder = connector->encoder;
> +		struct drm_bridge *first_bridge;
> +
> +		if (!connector->encoder)
> +			continue;
> +
> +		first_bridge = drm_bridge_chain_get_first_bridge(encoder);
> +		if (bridge == first_bridge) {
>  			msm_edp_ctrl_timing_cfg(edp->ctrl,
>  				adjusted_mode, &connector->display_info);
>  			break;
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index 2da46e3dc4ae..7a1f1e5f0326 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -14,6 +14,7 @@
>  
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_fb_cma_helper.h>
> @@ -680,9 +681,10 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
>  			rcdu->encoders[RCAR_DU_OUTPUT_LVDS0 + rcrtc->index];
>  		const struct drm_display_mode *mode =
>  			&crtc->state->adjusted_mode;
> +		struct drm_bridge *bridge;
>  
> -		rcar_lvds_clk_enable(encoder->base.bridge,
> -				     mode->clock * 1000);
> +		bridge = drm_bridge_chain_get_first_bridge(&encoder->base);
> +		rcar_lvds_clk_enable(bridge, mode->clock * 1000);
>  	}
>  
>  	rcar_du_crtc_start(rcrtc);
> @@ -702,12 +704,15 @@ static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
>  	    rstate->outputs == BIT(RCAR_DU_OUTPUT_DPAD0)) {
>  		struct rcar_du_encoder *encoder =
>  			rcdu->encoders[RCAR_DU_OUTPUT_LVDS0 + rcrtc->index];
> +		struct drm_bridge *bridge;
> +
>  
>  		/*
>  		 * Disable the LVDS clock output, see
>  		 * rcar_du_crtc_atomic_enable().
>  		 */
> -		rcar_lvds_clk_disable(encoder->base.bridge);
> +		bridge = drm_bridge_chain_get_first_bridge(&encoder->base);
> +		rcar_lvds_clk_disable(bridge);
>  	}
>  
>  	spin_lock_irq(&crtc->dev->event_lock);
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 8aeba83fcf31..27eef63ce0ff 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -25,6 +25,7 @@
>  
>  #include <linux/list.h>
>  #include <linux/ctype.h>
> +#include <drm/drm_encoder.h>
>  #include <drm/drm_mode_object.h>
>  #include <drm/drm_modes.h>
>  
> @@ -422,6 +423,20 @@ drm_bridge_chain_get_next_bridge(struct drm_bridge *bridge)
>  	return bridge->next;
>  }
>  
> +/**
> + * drm_bridge_chain_get_first_bridge() - Get the first bridge in the chain
> + * @encoder: encoder object
> + *
> + * RETURNS:
> + * the first bridge in the chain, or NULL if @encoder has no bridge attached
> + * to it.
> + */
> +static inline struct drm_bridge *
> +drm_bridge_chain_get_first_bridge(struct drm_encoder *encoder)
> +{
> +	return encoder->bridge;
> +}
> +
>  bool drm_bridge_chain_mode_fixup(struct drm_bridge *bridge,
>  				 const struct drm_display_mode *mode,
>  				 struct drm_display_mode *adjusted_mode);
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
