Return-Path: <SRS0=yifd=B2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC62C433E1
	for <linux-devicetree@archiver.kernel.org>; Sun, 16 Aug 2020 07:29:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 94F3A2067C
	for <linux-devicetree@archiver.kernel.org>; Sun, 16 Aug 2020 07:29:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727790AbgHPH3D (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 16 Aug 2020 03:29:03 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:43150 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726850AbgHPH3D (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 16 Aug 2020 03:29:03 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 04B14804D0;
        Sun, 16 Aug 2020 09:28:59 +0200 (CEST)
Date:   Sun, 16 Aug 2020 09:28:58 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>,
        devicetree@vger.kernel.org,
        Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
        Rob Herring <robh+dt@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 7/8] ARM: dts: imx: Remove unneeded LCDIF disp_axi clock
Message-ID: <20200816072858.GH1201814@ravnborg.org>
References: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
 <20200813012910.13576-8-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200813012910.13576-8-laurent.pinchart@ideasonboard.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
        a=88s_QdpzCVE-xM_6oXoA:9 a=CjuIK1q_8ugA:10 a=D0XLA9XvdZm18NrgonBM:22
        a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Aug 13, 2020 at 04:29:09AM +0300, Laurent Pinchart wrote:
> The LCDIF disp_axi clock is not mandatory in the DT binding and not
> required by the driver. Remove it when it points to a dummy clock.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  arch/arm/boot/dts/imx6sl.dtsi  | 5 ++---
>  arch/arm/boot/dts/imx6sll.dtsi | 5 ++---
>  arch/arm/boot/dts/imx6ul.dtsi  | 5 ++---
>  3 files changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx6sl.dtsi b/arch/arm/boot/dts/imx6sl.dtsi
> index deeb647ffc3f..a4d74216c9f4 100644
> --- a/arch/arm/boot/dts/imx6sl.dtsi
> +++ b/arch/arm/boot/dts/imx6sl.dtsi
> @@ -773,9 +773,8 @@ lcdif: lcdif@20f8000 {
>  				reg = <0x020f8000 0x4000>;
>  				interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&clks IMX6SL_CLK_LCDIF_PIX>,
> -					 <&clks IMX6SL_CLK_LCDIF_AXI>,
> -					 <&clks IMX6SL_CLK_DUMMY>;
> -				clock-names = "pix", "axi", "disp_axi";
> +					 <&clks IMX6SL_CLK_LCDIF_AXI>;
> +				clock-names = "pix", "axi";
>  				status = "disabled";
>  				power-domains = <&pd_disp>;
>  			};
> diff --git a/arch/arm/boot/dts/imx6sll.dtsi b/arch/arm/boot/dts/imx6sll.dtsi
> index c51072bb43ba..55775318559b 100644
> --- a/arch/arm/boot/dts/imx6sll.dtsi
> +++ b/arch/arm/boot/dts/imx6sll.dtsi
> @@ -648,9 +648,8 @@ lcdif: lcd-controller@20f8000 {
>  				reg = <0x020f8000 0x4000>;
>  				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&clks IMX6SLL_CLK_LCDIF_PIX>,
> -					 <&clks IMX6SLL_CLK_LCDIF_APB>,
> -					 <&clks IMX6SLL_CLK_DUMMY>;
> -				clock-names = "pix", "axi", "disp_axi";
> +					 <&clks IMX6SLL_CLK_LCDIF_APB>;
> +				clock-names = "pix", "axi";
>  				status = "disabled";
>  			};
>  
> diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
> index b16cce1680a9..35df39cc85a4 100644
> --- a/arch/arm/boot/dts/imx6ul.dtsi
> +++ b/arch/arm/boot/dts/imx6ul.dtsi
> @@ -982,9 +982,8 @@ lcdif: lcdif@21c8000 {
>  				reg = <0x021c8000 0x4000>;
>  				interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&clks IMX6UL_CLK_LCDIF_PIX>,
> -					 <&clks IMX6UL_CLK_LCDIF_APB>,
> -					 <&clks IMX6UL_CLK_DUMMY>;
> -				clock-names = "pix", "axi", "disp_axi";
> +					 <&clks IMX6UL_CLK_LCDIF_APB>;
> +				clock-names = "pix", "axi";
>  				status = "disabled";
>  			};
>  
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
