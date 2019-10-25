Return-Path: <SRS0=V00+=YS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD09CA9EBC
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 13:27:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EE93721D81
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 13:27:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="yCYWZ5Wg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394626AbfJYN1a (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 25 Oct 2019 09:27:30 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44034 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbfJYN1a (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 25 Oct 2019 09:27:30 -0400
Received: by mail-wr1-f67.google.com with SMTP id z11so2318634wro.11
        for <devicetree@vger.kernel.org>; Fri, 25 Oct 2019 06:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=wqdQnDHAFWYBrYek3ZBFw/xYtoqqpkBX9EDIQCuKN6M=;
        b=yCYWZ5Wg/QMiX84Aq9Ugy2DuA/rOnJa0SSre2839OfxeToaJPrSWJPJykkYU6D2f5a
         m77Gme5i7fA9PHHub8rc2juYDu0lU18004P2HRoNwxs4mX31hq4+hHXQtq1//2tJ5fxl
         GbLyXynhScYcV1r2PafcGPrQwe/IJBg3Ti1Nz/5MK4TjwTxnM7aATzP4aMsbhUEAHacJ
         C2Ga+6iz0fs5O0YYUAhizCjeXC6m5NO9PeIjE1fMDaqy0yDiBZ63pe8Chfpkw9nZr+39
         qaSq/XDxqzyemReQ23bZ4KSfuGyfOhidrq9jVsPo//vy0QejYiW8LrhkR9+92sxVVRO/
         eEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=wqdQnDHAFWYBrYek3ZBFw/xYtoqqpkBX9EDIQCuKN6M=;
        b=Gsky/pq3qZhxzSRKfU06Lo3TN7G3yFY+6J70AFr7Tz/Ac0f4u9E5HOKurKvlQ7pqcW
         Iq+F0oRRVBu8nMAl4Vk3uU2eNR0zzSk1Yijukr4iCGzrPUb2CQ2Z/5u4aoZT+CQaiVCm
         5qQhWfHfyrNbLTf0Fkcnc4ocx0nUCVbF/Zb4EIGxGte9JAgG5NU/D3Tr8dP5f5o7R1N3
         n91SXoine1QZuHPFz4H/KmkJqDg3SrNWOjpT76DTyzRfqP2Us43wC6f1QRICJeVIA5b/
         lNeffdJp6zb8H591lZm+rmglsnCf0f36I7ru03yzhJJ85idwhhDMCdAX/p5CDvDPm+FL
         D7xg==
X-Gm-Message-State: APjAAAV1KD0rGE3REv3sWb5XLJ7zdDMLvx7noRYKaGTybHeDIMYzqT7x
        xt0H/3ieoJAhAKqiVvhHwo5tX/evBNvs/w==
X-Google-Smtp-Source: APXvYqx3IrU5oSS/XI6Af6XoIgn76qalcqNao9OBfL2Ozm3+DuNj+dU7/VwAmwz0L2nnGAiEyR0rhg==
X-Received: by 2002:a5d:62c5:: with SMTP id o5mr3295378wrv.388.1572010046488;
        Fri, 25 Oct 2019 06:27:26 -0700 (PDT)
Received: from [192.168.1.62] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id u10sm2754199wmj.0.2019.10.25.06.27.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Oct 2019 06:27:26 -0700 (PDT)
Subject: Re: [PATCH v3 05/21] drm/bridge: Introduce
 drm_bridge_chain_get_next_bridge()
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
 <20191023154512.9762-6-boris.brezillon@collabora.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <e23b5a71-ec0a-7442-0759-6921a4c08a24@baylibre.com>
Date:   Fri, 25 Oct 2019 15:27:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191023154512.9762-6-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 23/10/2019 17:44, Boris Brezillon wrote:
> And use it in drivers accessing the bridge->next field directly.
> This is part of our attempt to make the bridge chain a double-linked list
> based on the generic list helpers.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Changes in v3:
> * Inline drm_bridge_chain_get_next_bridge() (Suggested by Laurent)
> 
> Changes in v2:
> * Kill the last/first helpers (they're not really needed)
> * Drop the !bridge || !bridge->encoder test
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c |  3 ++-
>  drivers/gpu/drm/mediatek/mtk_hdmi.c     |  6 ++++--
>  drivers/gpu/drm/omapdrm/omap_drv.c      |  4 ++--
>  drivers/gpu/drm/omapdrm/omap_encoder.c  |  3 ++-
>  drivers/gpu/drm/vc4/vc4_dsi.c           |  4 +++-
>  include/drm/drm_bridge.h                | 13 +++++++++++++
>  6 files changed, 26 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 3915f50b005e..005c67894b78 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1593,9 +1593,10 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
>  				  struct mipi_dsi_device *device)
>  {
>  	struct exynos_dsi *dsi = host_to_dsi(host);
> -	struct drm_bridge *out_bridge = dsi->bridge.next;
>  	struct drm_device *drm = dsi->encoder.dev;
> +	struct drm_bridge *out_bridge;
>  
> +	out_bridge = drm_bridge_chain_get_next_bridge(&dsi->bridge);
>  	if (dsi->panel) {
>  		mutex_lock(&drm->mode_config.mutex);
>  		exynos_dsi_disable(&dsi->bridge);
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index ea68b5adccbe..cfaa5aab8876 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1238,16 +1238,18 @@ static int mtk_hdmi_conn_mode_valid(struct drm_connector *conn,
>  				    struct drm_display_mode *mode)
>  {
>  	struct mtk_hdmi *hdmi = hdmi_ctx_from_conn(conn);
> +	struct drm_bridge *next_bridge;
>  
>  	dev_dbg(hdmi->dev, "xres=%d, yres=%d, refresh=%d, intl=%d clock=%d\n",
>  		mode->hdisplay, mode->vdisplay, mode->vrefresh,
>  		!!(mode->flags & DRM_MODE_FLAG_INTERLACE), mode->clock * 1000);
>  
> -	if (hdmi->bridge.next) {
> +	next_bridge = drm_bridge_chain_get_next_bridge(&hdmi->bridge);
> +	if (next_bridge) {
>  		struct drm_display_mode adjusted_mode;
>  
>  		drm_mode_copy(&adjusted_mode, mode);
> -		if (!drm_bridge_chain_mode_fixup(hdmi->bridge.next, mode,
> +		if (!drm_bridge_chain_mode_fixup(next_bridge, mode,
>  						 &adjusted_mode))
>  			return MODE_BAD;
>  	}
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
> index b3e22c890c51..865164fe28dc 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> @@ -217,8 +217,8 @@ static int omap_display_id(struct omap_dss_device *output)
>  	} else if (output->bridge) {
>  		struct drm_bridge *bridge = output->bridge;
>  
> -		while (bridge->next)
> -			bridge = bridge->next;
> +		while (drm_bridge_chain_get_next_bridge(bridge))
> +			bridge = drm_bridge_chain_get_next_bridge(bridge);
>  
>  		node = bridge->of_node;
>  	} else if (output->panel) {
> diff --git a/drivers/gpu/drm/omapdrm/omap_encoder.c b/drivers/gpu/drm/omapdrm/omap_encoder.c
> index 24bbe9f2a32e..8ca54081997e 100644
> --- a/drivers/gpu/drm/omapdrm/omap_encoder.c
> +++ b/drivers/gpu/drm/omapdrm/omap_encoder.c
> @@ -126,7 +126,8 @@ static void omap_encoder_mode_set(struct drm_encoder *encoder,
>  	for (dssdev = output; dssdev; dssdev = dssdev->next)
>  		omap_encoder_update_videomode_flags(&vm, dssdev->bus_flags);
>  
> -	for (bridge = output->bridge; bridge; bridge = bridge->next) {
> +	for (bridge = output->bridge; bridge;
> +	     bridge = drm_bridge_chain_get_next_bridge(bridge)) {
>  		if (!bridge->timings)
>  			continue;
>  
> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
> index 49f8a313e759..49c47185aff0 100644
> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> @@ -1644,8 +1644,10 @@ static void vc4_dsi_unbind(struct device *dev, struct device *master,
>  	struct drm_device *drm = dev_get_drvdata(master);
>  	struct vc4_dev *vc4 = to_vc4_dev(drm);
>  	struct vc4_dsi *dsi = dev_get_drvdata(dev);
> +	struct drm_bridge *bridge;
>  
> -	if (dsi->bridge.next)
> +	bridge = drm_bridge_chain_get_next_bridge(&dsi->bridge);
> +	if (bridge)
>  		pm_runtime_disable(dev);
>  
>  	vc4_dsi_encoder_destroy(dsi->encoder);
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 726435baf4ad..8aeba83fcf31 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -409,6 +409,19 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np);
>  int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
>  		      struct drm_bridge *previous);
>  
> +/**
> + * drm_bridge_chain_get_next_bridge() - Get the next bridge in the chain
> + * @bridge: bridge object
> + *
> + * RETURNS:
> + * the next bridge in the chain, or NULL if @bridge is the last.
> + */
> +static inline struct drm_bridge *
> +drm_bridge_chain_get_next_bridge(struct drm_bridge *bridge)
> +{
> +	return bridge->next;
> +}
> +
>  bool drm_bridge_chain_mode_fixup(struct drm_bridge *bridge,
>  				 const struct drm_display_mode *mode,
>  				 struct drm_display_mode *adjusted_mode);
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
