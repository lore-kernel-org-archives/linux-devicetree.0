Return-Path: <SRS0=KHEV=2G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15A1DC43603
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 12:11:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D1F5C206CB
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 12:10:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727495AbfLPMK6 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Dec 2019 07:10:58 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:42793 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727558AbfLPMK5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Dec 2019 07:10:57 -0500
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 04911200004;
        Mon, 16 Dec 2019 12:10:45 +0000 (UTC)
Date:   Mon, 16 Dec 2019 13:10:44 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Andy Yan <andy.yan@rock-chips.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Sandy Huang <hjc@rock-chips.com>,
        dri-devel@lists.freedesktop.org,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 09/12] drm/rockchip: lvds: Add PX30 =?UTF-8?B?c3VwcG9y?=
 =?UTF-8?B?dOOAkOivt+azqOaEj++8jOmCruS7tueUsWxpbnV4LXJvY2tjaGlwLWJvdW5j?=
 =?UTF-8?B?ZXMrYW5keS55YW49cm9jay1jaGlwcy5jb21AbGlzdHMuaW5mcmFkZWFkLm9y?=
 =?UTF-8?B?Z+S7o+WPkeOAkQ==?=
Message-ID: <20191216131044.38582a49@xps13>
In-Reply-To: <02b3373e-790b-5f0c-40a0-7cc423a0dac5@rock-chips.com>
References: <20191213181051.25983-1-miquel.raynal@bootlin.com>
        <20191213181051.25983-10-miquel.raynal@bootlin.com>
        <02b3373e-790b-5f0c-40a0-7cc423a0dac5@rock-chips.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Andy,

Andy Yan <andy.yan@rock-chips.com> wrote on Mon, 16 Dec 2019 20:00:31
+0800:

> Hi Miquel:
> 
> Thanks for your work here.
> 
> A discussion about the grf write macro bellow.
> 
> On 12/14/19 2:10 AM, Miquel Raynal wrote:
> > Introduce PX30 LVDS support. This means adding the relevant helper
> > functions, a specific probe and also the initialization of a specific
> > PHY.
> >
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >   drivers/gpu/drm/rockchip/rockchip_lvds.c | 173 +++++++++++++++++++++++
> >   drivers/gpu/drm/rockchip/rockchip_lvds.h |  14 ++
> >   2 files changed, 187 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> > index a0c203dcd66f..e550c2f102e0 100644
> > --- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
> > +++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> > @@ -10,6 +10,7 @@
> >   #include <linux/component.h>
> >   #include <linux/mfd/syscon.h>
> >   #include <linux/of_graph.h>
> > +#include <linux/phy/phy.h>
> >   #include <linux/pinctrl/devinfo.h>
> >   #include <linux/platform_device.h>
> >   #include <linux/pm_runtime.h>
> > @@ -54,6 +55,7 @@ struct rockchip_lvds {
> >   	void __iomem *regs;
> >   	struct regmap *grf;
> >   	struct clk *pclk;
> > +	struct phy *dphy;
> >   	const struct rockchip_lvds_soc_data *soc_data;
> >   	int output; /* rgb lvds or dual lvds output */
> >   	int format; /* vesa or jeida format */
> > @@ -322,6 +324,133 @@ static void rk3288_lvds_encoder_disable(struct drm_encoder *encoder)
> >   	drm_panel_unprepare(lvds->panel);
> >   }  
> >   > +static int px30_lvds_poweron(struct rockchip_lvds *lvds)  
> > +{
> > +	int ret;
> > +
> > +	ret = pm_runtime_get_sync(lvds->dev);
> > +	if (ret < 0) {
> > +		DRM_DEV_ERROR(lvds->dev, "failed to get pm runtime: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	/* Enable LVDS mode */
> > +	return regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON1,
> > +				  PX30_LVDS_MODE_EN(1) | PX30_LVDS_P2S_EN(1),
> > +				  PX30_LVDS_MODE_EN(1) | PX30_LVDS_P2S_EN(1));
> > +}
> > +
> > +static void px30_lvds_poweroff(struct rockchip_lvds *lvds)
> > +{
> > +	regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON1,
> > +			   PX30_LVDS_MODE_EN(1) | PX30_LVDS_P2S_EN(1),
> > +			   PX30_LVDS_MODE_EN(0) | PX30_LVDS_P2S_EN(0));
> > +
> > +	pm_runtime_put(lvds->dev);
> > +}
> > +
> > +static int px30_lvds_grf_config(struct drm_encoder *encoder,
> > +				struct drm_display_mode *mode)
> > +{
> > +	struct rockchip_lvds *lvds = encoder_to_lvds(encoder);
> > +	u8 nhsync = !(mode->flags & DRM_MODE_FLAG_PHSYNC);
> > +	u8 nvsync = !(mode->flags & DRM_MODE_FLAG_PVSYNC);
> > +	u8 ndclk = !(mode->flags & DRM_MODE_FLAG_PCSYNC);
> > +	int ret;
> > +
> > +	if (lvds->output != DISPLAY_OUTPUT_LVDS) {
> > +		DRM_DEV_ERROR(lvds->dev, "Unsupported display output %d\n",
> > +			      lvds->output);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (nhsync ^ nvsync) {
> > +		DRM_DEV_ERROR(lvds->dev, "Unsupported Hsync/Vsync polarity\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* Set format */
> > +	ret = regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON1,
> > +				 PX30_LVDS_FORMAT(lvds->format),
> > +				 PX30_LVDS_FORMAT(lvds->format));
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Control Hsync/Vsync polarity */
> > +	ret = regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON0,
> > +				 PX30_LVDS_TIE_CLKS(1),
> > +				 PX30_LVDS_TIE_CLKS(1));
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Set Hsync/Vsync polarity */
> > +	ret = regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON0,
> > +				 PX30_LVDS_INVERT_CLKS(1),
> > +				 PX30_LVDS_INVERT_CLKS(nhsync));
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Set dclk polarity */
> > +	return regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON0,
> > +				  PX30_LVDS_INVERT_DCLK(1),
> > +				  PX30_LVDS_INVERT_DCLK(ndclk));
> > +}
> > +
> > +static int px30_lvds_set_vop_source(struct rockchip_lvds *lvds,
> > +				    struct drm_encoder *encoder)
> > +{
> > +	int vop;
> > +
> > +	vop = drm_of_encoder_active_endpoint_id(lvds->dev->of_node, encoder);
> > +	if (vop < 0)
> > +		return vop;
> > +
> > +	return regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON1,
> > +				  PX30_LVDS_VOP_SEL(1),
> > +				  PX30_LVDS_VOP_SEL(vop));
> > +}
> > +
> > +static void px30_lvds_encoder_enable(struct drm_encoder *encoder)
> > +{
> > +	struct rockchip_lvds *lvds = encoder_to_lvds(encoder);
> > +	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
> > +	int ret;
> > +
> > +	drm_panel_prepare(lvds->panel);
> > +
> > +	ret = px30_lvds_poweron(lvds);
> > +	if (ret) {
> > +		DRM_DEV_ERROR(lvds->dev, "failed to power on LVDS: %d\n", ret);
> > +		drm_panel_unprepare(lvds->panel);
> > +		return;
> > +	}
> > +
> > +	ret = px30_lvds_grf_config(encoder, mode);
> > +	if (ret) {
> > +		DRM_DEV_ERROR(lvds->dev, "failed to configure LVDS: %d\n", ret);
> > +		drm_panel_unprepare(lvds->panel);
> > +		return;
> > +	}
> > +
> > +	ret = px30_lvds_set_vop_source(lvds, encoder);
> > +	if (ret) {
> > +		DRM_DEV_ERROR(lvds->dev, "failed to set VOP source: %d\n", ret);
> > +		drm_panel_unprepare(lvds->panel);
> > +		return;
> > +	}
> > +
> > +	drm_panel_enable(lvds->panel);
> > +}
> > +
> > +static void px30_lvds_encoder_disable(struct drm_encoder *encoder)
> > +{
> > +	struct rockchip_lvds *lvds = encoder_to_lvds(encoder);
> > +
> > +	drm_panel_disable(lvds->panel);
> > +	px30_lvds_poweroff(lvds);
> > +	drm_panel_unprepare(lvds->panel);
> > +}
> > +
> >   static const
> >   struct drm_encoder_helper_funcs rk3288_lvds_encoder_helper_funcs = {
> >   	.enable = rk3288_lvds_encoder_enable,
> > @@ -329,6 +458,13 @@ struct drm_encoder_helper_funcs rk3288_lvds_encoder_helper_funcs = {
> >   	.atomic_check = rockchip_lvds_encoder_atomic_check,
> >   };  
> >   > +static const  
> > +struct drm_encoder_helper_funcs px30_lvds_encoder_helper_funcs = {
> > +	.enable = px30_lvds_encoder_enable,
> > +	.disable = px30_lvds_encoder_disable,
> > +	.atomic_check = rockchip_lvds_encoder_atomic_check,
> > +};
> > +
> >   static const struct drm_encoder_funcs rockchip_lvds_encoder_funcs = {
> >   	.destroy = drm_encoder_cleanup,
> >   };
> > @@ -379,16 +515,53 @@ static int rk3288_lvds_probe(struct platform_device *pdev,
> >   	return 0;
> >   }  
> >   > +static int px30_lvds_probe(struct platform_device *pdev,  
> > +			   struct rockchip_lvds *lvds)
> > +{
> > +	int ret;
> > +
> > +	/* MSB */
> > +	ret =  regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON1,
> > +				  PX30_LVDS_MSBSEL(1),
> > +				  PX30_LVDS_MSBSEL(1));
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* PHY */
> > +	lvds->dphy = devm_phy_get(&pdev->dev, "dphy");
> > +	if (IS_ERR(lvds->dphy))
> > +		return PTR_ERR(lvds->dphy);
> > +
> > +	phy_init(lvds->dphy);
> > +	if (ret)
> > +		return ret;
> > +
> > +	phy_set_mode(lvds->dphy, PHY_MODE_LVDS);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return phy_power_on(lvds->dphy);
> > +}
> > +
> >   static const struct rockchip_lvds_soc_data rk3288_lvds_data = {
> >   	.probe = rk3288_lvds_probe,
> >   	.helper_funcs = &rk3288_lvds_encoder_helper_funcs,
> >   };  
> >   > +static const struct rockchip_lvds_soc_data px30_lvds_data = {  
> > +	.probe = px30_lvds_probe,
> > +	.helper_funcs = &px30_lvds_encoder_helper_funcs,
> > +};
> > +
> >   static const struct of_device_id rockchip_lvds_dt_ids[] = {
> >   	{
> >   		.compatible = "rockchip,rk3288-lvds",
> >   		.data = &rk3288_lvds_data
> >   	},
> > +	{
> > +		.compatible = "rockchip,px30-lvds",
> > +		.data = &px30_lvds_data
> > +	},
> >   	{}
> >   };
> >   MODULE_DEVICE_TABLE(of, rockchip_lvds_dt_ids);
> > diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.h b/drivers/gpu/drm/rockchip/rockchip_lvds.h
> > index e41e9ab3c306..7cfb102b4854 100644
> > --- a/drivers/gpu/drm/rockchip/rockchip_lvds.h
> > +++ b/drivers/gpu/drm/rockchip/rockchip_lvds.h
> > @@ -106,4 +106,18 @@
> >   #define LVDS_VESA_18				2
> >   #define LVDS_JEIDA_18				3  
> >   > +#define WRITE_EN(v, h, l)  ((GENMASK(h, l) << 16) | (v << l))  
> 
> 
> How about rename WRITE_EN to HIWORD_UPDATE to keep align with other modules that write grf: such as dwmac-rk.c/dw-mipi-dsi-rockhip.c/dw-hdmi-rockchip.c

Sure. It is also the name of this macro in the BSP but I found it so
undescriptive that I changed it. I don't like very much its new name
neither so I'll go back to the original one.

Thanks,
Miquèl
