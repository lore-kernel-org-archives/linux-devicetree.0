Return-Path: <SRS0=VR/D=2D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B73C79DC6
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 20:39:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ABE3B246B3
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 20:39:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wn0wp5tC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728194AbfLMRKu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Dec 2019 12:10:50 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:57346 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728379AbfLMRKu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Dec 2019 12:10:50 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A61B7E1D;
        Fri, 13 Dec 2019 18:10:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576257047;
        bh=zn9I2+W9n9yW37O2l/bdOIDUCOKYH46nzAWKSfMmVvY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wn0wp5tCAQBmrc56Ik8TmVWk61nc4RX1gJmKqw8lmCyCVW+KVYoSLrShHab6Xt4dC
         uqbqZALEMxZVX2t/yhcWTbEfZ/jk/9cZcOTbmApylU5oZJ/wf+QHSfA6AUmqeKwpFq
         3CQSiQyMdpPGSgke/7BeNf2TEVR0W1cHhj8ZZs+o=
Date:   Fri, 13 Dec 2019 19:10:38 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v4 06/13] drm/bridge: lvds-codec: Add "lvds-decoder"
 support
Message-ID: <20191213171038.GH4860@pendragon.ideasonboard.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-7-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1573660292-10629-7-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Fabrizio,

On Wed, Nov 13, 2019 at 03:51:25PM +0000, Fabrizio Castro wrote:
> Add support for transparent LVDS decoders by adding a new
> compatible string ("lvds-decoder") to the driver.
> This patch also adds member connector_type to struct lvds_codec,
> and that's because LVDS decoders have a different connector type
> from LVDS encoders. We fill this new member up with the data
> matching the compatible string.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> ---
> v3->v4:
> * New patch
> ---
>  drivers/gpu/drm/bridge/lvds-codec.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
> index b5801a2..c32e125 100644
> --- a/drivers/gpu/drm/bridge/lvds-codec.c
> +++ b/drivers/gpu/drm/bridge/lvds-codec.c
> @@ -7,6 +7,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  
> @@ -17,6 +18,7 @@ struct lvds_codec {
>  	struct drm_bridge bridge;
>  	struct drm_bridge *panel_bridge;
>  	struct gpio_desc *powerdown_gpio;
> +	u32 connector_type;
>  };
>  
>  static int lvds_codec_attach(struct drm_bridge *bridge)
> @@ -65,6 +67,7 @@ static int lvds_codec_probe(struct platform_device *pdev)
>  	if (!lvds_codec)
>  		return -ENOMEM;
>  
> +	lvds_codec->connector_type = (u32)of_device_get_match_data(&pdev->dev);

I'm now getting a compilation failure here:

drivers/gpu/drm/bridge/lvds-codec.c: In function ‘lvds_codec_probe’:
drivers/gpu/drm/bridge/lvds-codec.c:68:31: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
  lvds_codec->connector_type = (u32)of_device_get_match_data(&pdev->dev);
                               ^

The fix should be simple:

	lvds_codec->connector_type = (uintptr_t)of_device_get_match_data(dev);

I'm bothered by the fact that I've compiled this before without any
issue, so this really puzzles me. Do you get the same warning ?

>  	lvds_codec->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown",
>  							     GPIOD_OUT_HIGH);
>  	if (IS_ERR(lvds_codec->powerdown_gpio)) {
> @@ -105,7 +108,7 @@ static int lvds_codec_probe(struct platform_device *pdev)
>  
>  	lvds_codec->panel_bridge =
>  		devm_drm_panel_bridge_add_typed(dev, panel,
> -						DRM_MODE_CONNECTOR_LVDS);
> +						lvds_codec->connector_type);
>  	if (IS_ERR(lvds_codec->panel_bridge))
>  		return PTR_ERR(lvds_codec->panel_bridge);
>  
> @@ -133,8 +136,18 @@ static int lvds_codec_remove(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id lvds_codec_match[] = {
> -	{ .compatible = "lvds-encoder" },
> -	{ .compatible = "thine,thc63lvdm83d" },
> +	{
> +		.compatible = "lvds-decoder",
> +		.data = (void *)DRM_MODE_CONNECTOR_DPI,
> +	},
> +	{
> +		.compatible = "lvds-encoder",
> +		.data = (void *)DRM_MODE_CONNECTOR_LVDS,
> +	},
> +	{
> +		.compatible = "thine,thc63lvdm83d",
> +		.data = (void *)DRM_MODE_CONNECTOR_LVDS,
> +	},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, lvds_codec_match);

-- 
Regards,

Laurent Pinchart
