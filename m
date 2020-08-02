Return-Path: <SRS0=9TIE=BM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A278C433DF
	for <linux-devicetree@archiver.kernel.org>; Sun,  2 Aug 2020 07:11:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5BD762076B
	for <linux-devicetree@archiver.kernel.org>; Sun,  2 Aug 2020 07:11:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbgHBHLs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 2 Aug 2020 03:11:48 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:55644 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725850AbgHBHLs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 2 Aug 2020 03:11:48 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id E5E1120020;
        Sun,  2 Aug 2020 09:11:45 +0200 (CEST)
Date:   Sun, 2 Aug 2020 09:11:44 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Marek Vasut <marex@denx.de>
Cc:     dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/panel: simple: Add Chefree CH101OLHLWH-002 panel
Message-ID: <20200802071144.GB822300@ravnborg.org>
References: <20200728201242.4336-1-marex@denx.de>
 <20200728201242.4336-3-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200728201242.4336-3-marex@denx.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=7gkXJVJtAAAA:8
        a=k28S8m6lIBomCeKSdDwA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
        a=AjGcO6oz07-iQ99wixmX:22 a=E9Po1WZjFZOl8hwRPBS3:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Marek.

On Tue, Jul 28, 2020 at 10:12:42PM +0200, Marek Vasut wrote:
> Add support for the Chefree CH101OLHLWH-002 10.1" (1280x800)
> color TFT LCD panel, connected over LVDS.
> 
> Timings are taken from the datasheet version P0.5.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> To: dri-devel@lists.freedesktop.org
I do not think "To:" is a valid syntax here.
So I changed to "Cc:" in all patches while applying.

Will be pushed out as soon as my builds pass.

	Sam

> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: devicetree@vger.kernel.org
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 33 ++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 298e3a26d9ee..a8e1f6306923 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1414,6 +1414,36 @@ static const struct panel_desc cdtech_s070wv95_ct16 = {
>  	},
>  };
>  
> +static const struct display_timing chefree_ch101olhlwh_002_timing = {
> +	.pixelclock = { 68900000, 71100000, 73400000 },
> +	.hactive = { 1280, 1280, 1280 },
> +	.hfront_porch = { 65, 80, 95 },
> +	.hback_porch = { 64, 79, 94 },
> +	.hsync_len = { 1, 1, 1 },
> +	.vactive = { 800, 800, 800 },
> +	.vfront_porch = { 7, 11, 14 },
> +	.vback_porch = { 7, 11, 14 },
> +	.vsync_len = { 1, 1, 1 },
> +	.flags = DISPLAY_FLAGS_DE_HIGH,
> +};
> +
> +static const struct panel_desc chefree_ch101olhlwh_002 = {
> +	.timings = &chefree_ch101olhlwh_002_timing,
> +	.num_timings = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 217,
> +		.height = 135,
> +	},
> +	.delay = {
> +		.enable = 200,
> +		.disable = 200,
> +	},
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>  static const struct drm_display_mode chunghwa_claa070wp03xg_mode = {
>  	.clock = 66770,
>  	.hdisplay = 800,
> @@ -3845,6 +3875,9 @@ static const struct of_device_id platform_of_match[] = {
>  	}, {
>  		.compatible = "cdtech,s070wv95-ct16",
>  		.data = &cdtech_s070wv95_ct16,
> +	}, {
> +		.compatible = "chefree,ch101olhlwh-002",
> +		.data = &chefree_ch101olhlwh_002,
>  	}, {
>  		.compatible = "chunghwa,claa070wp03xg",
>  		.data = &chunghwa_claa070wp03xg,
> -- 
> 2.27.0
