Return-Path: <SRS0=YUp6=BH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A93DAC433E3
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 17:24:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 896B220786
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 17:24:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731922AbgG1RYb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Jul 2020 13:24:31 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:44020 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731684AbgG1RYb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 Jul 2020 13:24:31 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 0FCD4804F6;
        Tue, 28 Jul 2020 19:24:26 +0200 (CEST)
Date:   Tue, 28 Jul 2020 19:24:25 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Marek Vasut <marex@denx.de>
Cc:     dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH V2 3/3] drm/panel: simple: Add DT bindings for Powertip
 PH800480T013
Message-ID: <20200728172425.GA1114934@ravnborg.org>
References: <20200728121246.23304-1-marex@denx.de>
 <20200728121246.23304-3-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200728121246.23304-3-marex@denx.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8 a=-VAfIpHNAAAA:8 a=VwQbUJbxAAAA:8
        a=7gkXJVJtAAAA:8 a=KoOJ8eiH_lwS9MUCcoAA:9 a=CjuIK1q_8ugA:10
        a=Vxmtnl_E_bksehYqCbjh:22 a=srlwD-8ojaedGGhPAyx8:22
        a=AjGcO6oz07-iQ99wixmX:22 a=E9Po1WZjFZOl8hwRPBS3:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jul 28, 2020 at 02:12:46PM +0200, Marek Vasut wrote:
> Add support for Powertip PH800480T013 800x480 parallel LCD, this
> one is used in the Raspberry Pi 7" touchscreen display unit.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> To: dri-devel@lists.freedesktop.org
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: devicetree@vger.kernel.org
> ---
> V2: Add bus_flags and connector_type

Hi Marek.

Applied the 3 patches to drm-misc-next.
Fixed subject while applying this patch.

	Sam

> ---
>  drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index cb6550d37e85..298e3a26d9ee 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3000,6 +3000,31 @@ static const struct panel_desc pda_91_00156_a0  = {
>  	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
>  };
>  
> +static const struct drm_display_mode powertip_ph800480t013_idf02_mode = {
> +	.clock = 24750,
> +	.hdisplay = 800,
> +	.hsync_start = 800 + 54,
> +	.hsync_end = 800 + 54 + 2,
> +	.htotal = 800 + 54 + 2 + 44,
> +	.vdisplay = 480,
> +	.vsync_start = 480 + 49,
> +	.vsync_end = 480 + 49 + 2,
> +	.vtotal = 480 + 49 + 2 + 22,
> +};
> +
> +static const struct panel_desc powertip_ph800480t013_idf02  = {
> +	.modes = &powertip_ph800480t013_idf02_mode,
> +	.num_modes = 1,
> +	.size = {
> +		.width = 152,
> +		.height = 91,
> +	},
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH |
> +		     DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
> +		     DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE,
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
> +};
>  
>  static const struct drm_display_mode qd43003c0_40_mode = {
>  	.clock = 9000,
> @@ -4012,6 +4037,9 @@ static const struct of_device_id platform_of_match[] = {
>  	}, {
>  		.compatible = "pda,91-00156-a0",
>  		.data = &pda_91_00156_a0,
> +	}, {
> +		.compatible = "powertip,ph800480t013-idf02",
> +		.data = &powertip_ph800480t013_idf02,
>  	}, {
>  		.compatible = "qiaodian,qd43003c0-40",
>  		.data = &qd43003c0_40,
> -- 
> 2.27.0
