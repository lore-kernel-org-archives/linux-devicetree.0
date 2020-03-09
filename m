Return-Path: <SRS0=Fzrg=42=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01DD5C3F2C6
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Mar 2020 17:05:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C6DF12465D
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Mar 2020 17:05:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kuoQUG9a"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727198AbgCIRFh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Mar 2020 13:05:37 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41099 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727101AbgCIRFh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Mar 2020 13:05:37 -0400
Received: by mail-pl1-f195.google.com with SMTP id t14so4229938plr.8
        for <devicetree@vger.kernel.org>; Mon, 09 Mar 2020 10:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TBjaSzT2srnKrAudJf1OGvf6fJmlAuZnL+/SoFFDeQs=;
        b=kuoQUG9aYByCTvr8FqB2wYmH5ZWs0lLVdIavrZWbjHpil2umTLSDyRhoq5YaiSW7EJ
         YReXk56wyZmDIKCyFHGRFTLcey2OMhS+VLVsXxcZu9Jjf1oD4KAd2F2mpM0YZfbgascA
         TxkMxyE7t1M64pji+W/EOSRHinX2dNWBOt7Gk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TBjaSzT2srnKrAudJf1OGvf6fJmlAuZnL+/SoFFDeQs=;
        b=oOiQmXeJmMpMAbYcEhbhoUGpWmw0P1lK1CEzkMTIUBQMYO6zL8QCs6YflnV/cvXjOV
         a8No+uGaxaLRJjdRcpHVfvnW2iemIVQHxHt2KaDiTzykRsjbuBm5RCcwNDG3q+Ld11FI
         3gOq24BLAqE4PG2Qc8KjJz5qg6c8FEcRgXWWsXCLmcDujHh3lD+1yzyrc83bAEDO7Lmb
         Wy2yg7MhM5lFRuxAiJeHQdtdM1+ZTfZk79AHJmJM7f+uoXLrS2MYi6rVIVNi+6mnf7+A
         U2uAhKfOJNAr/PM8RpOEw0/ee2+IwRgYgxP/RZHKjNbqEfS34UNnOdcWYwqkEgCUUE5X
         j8QQ==
X-Gm-Message-State: ANhLgQ14wUtaw0y5WCzdGBeTo+/mCcXvVv7XMayoL3uTnmWYbeUa3ODM
        nlibWBqrvMIn1E6S8FVFXQVdaQ==
X-Google-Smtp-Source: ADFU+vs3ZXRlDpRJrpqXVwgbR3EMTeT2/174EW+zDgms5nXB95GCrTzl98LeDLcAvE3Fy/GQtfkY5g==
X-Received: by 2002:a17:902:401:: with SMTP id 1mr16507578ple.177.1583773535780;
        Mon, 09 Mar 2020 10:05:35 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id i187sm5032740pfg.33.2020.03.09.10.05.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2020 10:05:34 -0700 (PDT)
Date:   Mon, 9 Mar 2020 10:05:32 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        robdclark@gmail.com, seanpaul@chromium.org, sean@poorly.run
Subject: Re: [PATCH v5 2/2] drm/panel: add support for rm69299 visionox panel
 driver
Message-ID: <20200309170532.GW24720@google.com>
References: <20200309052304.23427-1-harigovi@codeaurora.org>
 <20200309052304.23427-3-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200309052304.23427-3-harigovi@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Mon, Mar 09, 2020 at 10:53:04AM +0530, Harigovindan P wrote:
> Add support for Visionox panel driver.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
> 
> Changes in v2:
> 	- Dropping redundant space in Kconfig(Sam Ravnborg).
> 	- Changing structure for include files(Sam Ravnborg).
> 	- Removing backlight related code and functions(Sam Ravnborg).
> 	- Removing repeated printing of error message(Sam Ravnborg).
> 	- Adding drm_connector as an argument for get_modes function.
> Changes in v3:
> 	- Adding arguments for drm_panel_init to support against mainline.
> Changes in v4:
> 	- Removing error messages from regulator_set_load.
> 	- Removing dev struct entry.
> 	- Removing checks.
> 	- Dropping empty comment lines.
> Changes in v5:
> 	- Removing unused struct member variables.
> 	- Removing blank lines.
> 	- Fixed indentation.
> 	- Invoking dsi_detach and panel_remove while early exiting from probe.
> 
>  drivers/gpu/drm/panel/Kconfig                 |   8 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-visionox-rm69299.c    | 315 ++++++++++++++++++
>  3 files changed, 324 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-visionox-rm69299.c
>
> ...
>
> diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> new file mode 100644
> index 000000000000..2bd3af46d933
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
>
> ...
>
> +static int visionox_35597_power_on(struct visionox_rm69299 *ctx)
> +{

s/35597/rm69299/ ?

> +static const struct rm69299_config rm69299_dir = {
> +	.width_mm = 74,
> +	.height_mm = 131,
> +	.dm = &visionox_rm69299_1080x2248_60hz,
> +};

Are there actually variants of the panel with different sizes? So far the
driver supports a single type of panel, so I would say struct rm69299_config
is not needed. It can be added later if the driver ever gets support for
other panel variants. For now just assign the values directly in
'visionox_rm69299_get_modes'.

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
> +								ctx->supplies);

nit: alignment is odd, either align with a tab after 'devm_regulator_bulk_get'
or with 'ctx->panel.dev'.

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
> +		drm_panel_remove(&ctx->panel);

that's technically correct, but since you have the 'goto' above and do the
same unwinding for the other 'regulator_set_load' call below it would be
better to use a 'goto' here (and below) too. Actually the 'goto' above only
makes sense if 'goto' is also used for the other cases.

> +		return ret;
> +	}
> +
> +	ret = regulator_set_load(ctx->supplies[1].consumer, 13200);
> +	if (ret) {
> +		mipi_dsi_detach(dsi);
> +		drm_panel_remove(&ctx->panel);
> +		return ret;
> +	}
> +
> +	return 0;
> +
> +err_dsi_attach:
> +	drm_panel_remove(&ctx->panel);
> +	return ret;
> +}
> +
> +static int visionox_rm69299_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct visionox_rm69299 *ctx = mipi_dsi_get_drvdata(dsi);
> +
> +	mipi_dsi_detach(ctx->dsi);
> +	mipi_dsi_device_unregister(ctx->dsi);
> +
> +	drm_panel_remove(&ctx->panel);
> +	return 0;
> +}
> +
> +static const struct of_device_id visionox_rm69299_of_match[] = {
> +	{
> +		.compatible = "visionox,rm69299-1080p-display",
> +		.data = &rm69299_dir,
> +	},
> +};
> +MODULE_DEVICE_TABLE(of, visionox_rm69299_of_match);
> +
> +static struct mipi_dsi_driver visionox_rm69299_driver = {
> +	.driver = {
> +		.name = "panel-visionox-rm69299",
> +		.of_match_table = visionox_rm69299_of_match,
> +	},
> +	.probe = visionox_rm69299_probe,
> +	.remove = visionox_rm69299_remove,
> +};
> +module_mipi_dsi_driver(visionox_rm69299_driver);
> +
> +MODULE_DESCRIPTION("VISIONOX RM69299 DSI Panel Driver");

As commented on v4, this should be 'Visionox'.
