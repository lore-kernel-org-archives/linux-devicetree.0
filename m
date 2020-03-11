Return-Path: <SRS0=AZXu=44=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E273C4CECE
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 21:11:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7D7A720739
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 21:11:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UgFFS3Ma"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729331AbgCKVLS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Mar 2020 17:11:18 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39344 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726684AbgCKVLS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Mar 2020 17:11:18 -0400
Received: by mail-pg1-f194.google.com with SMTP id s2so1864083pgv.6
        for <devicetree@vger.kernel.org>; Wed, 11 Mar 2020 14:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NSfkleXDa5UPJsZWkmUSl1QpNzKwRs0wnvQ0H8hAcuc=;
        b=UgFFS3MautlLOAeYiAPLohAO7UDp9cITkh8tKbVU+R8+PzZ84LCRDmE4r6j88TS8VF
         TtV7+eFJOw1U6dwNTENpSlCfGxrz1XIuw061O6GtubW6D+lbVb/ki1tQmUyJ5Zi9Iubu
         l2GjAnAp2tk5nFCUnGm49gG98L4bLmg0KOAnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NSfkleXDa5UPJsZWkmUSl1QpNzKwRs0wnvQ0H8hAcuc=;
        b=HEM9EhL+AYxJILvvxsw6rlOi6RguX8ZJV9JI+sCQkgnhGhU0SwPyY14ByPmVCisSd7
         bN3z47aI4pt283lMl5QiYL3Hj0pqt97smjGedyvvfZuhQKvpqLUqVc8gNTaaCJK77lD/
         TncrJagRTqiGBOnSptYABQOG9ifLsXzX5puOggF+v5mTTGkZLfFMWgdHBKpmP3nZmRB0
         e/ugQm0K2nbeZUBOrQgMP4qvaoavbWyyiGoOWu/hnRDVIK8lHgqSC0aWtbaCHHfGrUVD
         2e/wcBNdTtoW2TCgh0LT4j6KlSrUwSOh68JS3QOrG3SnsOiEOt8fTSglpoVdfT0/j9YH
         dJNw==
X-Gm-Message-State: ANhLgQ1cn0E4hFvIvO5Xs8qgJANhUhH6Q2gmYSQBEbyPp6hUF9C8mxKm
        5a0r7JdBegdv5cahjFInYP/tdQ==
X-Google-Smtp-Source: ADFU+vvdn/plQdKp95zl7wL0YroSpLRU6DvjOwBhsyyoJR3bH/TAf4i7y2lkFOcgEOXSJin55tABKg==
X-Received: by 2002:a63:9d04:: with SMTP id i4mr4553990pgd.294.1583961075013;
        Wed, 11 Mar 2020 14:11:15 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id u12sm51075103pfm.165.2020.03.11.14.11.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2020 14:11:14 -0700 (PDT)
Date:   Wed, 11 Mar 2020 14:11:13 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        robdclark@gmail.com, seanpaul@chromium.org, sean@poorly.run
Subject: Re: [PATCH v6 2/2] drm/panel: add support for rm69299 visionox panel
 driver
Message-ID: <20200311211113.GC144492@google.com>
References: <20200311085807.21984-1-harigovi@codeaurora.org>
 <20200311085807.21984-3-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200311085807.21984-3-harigovi@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

thanks for re-spinning!

One more comment inline.

On Wed, Mar 11, 2020 at 02:28:07PM +0530, Harigovindan P wrote:

> diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> new file mode 100644
> index 000000000000..b226723a7543
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
>
> ...
>
> +static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct visionox_rm69299 *ctx;
> +	int ret;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	ctx->supplies[0].supply = "vdda";
> +	ctx->supplies[1].supply = "vdd3p3";
> +
> +	ret = devm_regulator_bulk_get(ctx->panel.dev, ARRAY_SIZE(ctx->supplies),
> +				      ctx->supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	ctx->reset_gpio = devm_gpiod_get(ctx->panel.dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->reset_gpio)) {
> +		DRM_DEV_ERROR(dev, "cannot get reset gpio %ld\n",
> +			PTR_ERR(ctx->reset_gpio));
> +		return PTR_ERR(ctx->reset_gpio);
> +	}
> +
> +	drm_panel_init(&ctx->panel, dev, &visionox_rm69299_drm_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +	ctx->panel.dev = dev;
> +	ctx->panel.funcs = &visionox_rm69299_drm_funcs;
> +	drm_panel_add(&ctx->panel);
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM |
> +		MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(dev, "dsi attach failed ret = %d\n", ret);
> +		goto err_dsi_attach;
> +	}
> +
> +	ret = regulator_set_load(ctx->supplies[0].consumer, 32000);
> +	if (ret) {
> +		mipi_dsi_detach(dsi);
> +		goto err_dsi_attach;
> +	}

the common way to do this kind of unwinding in the kernel would be to add
something like this before 'err_dsi_attach':

err_set_load:
	mipi_dsi_detach(dsi);


and then just do 'goto err_set_load' in the error paths.

> +
> +	ret = regulator_set_load(ctx->supplies[1].consumer, 13200);
> +	if (ret) {
> +		mipi_dsi_detach(dsi);
> +		goto err_dsi_attach;
> +	}
> +
> +	return 0;
> +
> +err_dsi_attach:
> +	drm_panel_remove(&ctx->panel);
> +	return ret;
> +}

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
