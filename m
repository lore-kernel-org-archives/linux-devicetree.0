Return-Path: <SRS0=yifd=B2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F819C433E1
	for <linux-devicetree@archiver.kernel.org>; Sun, 16 Aug 2020 07:28:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2830A206DA
	for <linux-devicetree@archiver.kernel.org>; Sun, 16 Aug 2020 07:28:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbgHPH2I (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 16 Aug 2020 03:28:08 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:43050 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726850AbgHPH2I (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 16 Aug 2020 03:28:08 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 1526E804D0;
        Sun, 16 Aug 2020 09:28:05 +0200 (CEST)
Date:   Sun, 16 Aug 2020 09:28:03 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>,
        devicetree@vger.kernel.org,
        Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
        Rob Herring <robh+dt@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/8] ARM: dts: imx: Fix LCDIF compatible strings
Message-ID: <20200816072803.GF1201814@ravnborg.org>
References: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
 <20200813012910.13576-6-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200813012910.13576-6-laurent.pinchart@ideasonboard.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
        a=vAfjA9iV6H3j0_Dc_b4A:9 a=CjuIK1q_8ugA:10 a=D0XLA9XvdZm18NrgonBM:22
        a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Aug 13, 2020 at 04:29:07AM +0300, Laurent Pinchart wrote:
> The LCDIF in the i.MX6 SoCs has additional features compared to the
> i.MX28. Replace the fsl,imx28-lcdif fallback compatible string with
> fsl,imx6sx-lcdif to reflect that.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  arch/arm/boot/dts/imx6sl.dtsi  | 2 +-
>  arch/arm/boot/dts/imx6sll.dtsi | 2 +-
>  arch/arm/boot/dts/imx6sx.dtsi  | 4 ++--
>  arch/arm/boot/dts/imx6ul.dtsi  | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx6sl.dtsi b/arch/arm/boot/dts/imx6sl.dtsi
> index 911d8cf77f2c..deeb647ffc3f 100644
> --- a/arch/arm/boot/dts/imx6sl.dtsi
> +++ b/arch/arm/boot/dts/imx6sl.dtsi
> @@ -769,7 +769,7 @@ epdc: epdc@20f4000 {
>  			};
>  
>  			lcdif: lcdif@20f8000 {
> -				compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";
> +				compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif";
>  				reg = <0x020f8000 0x4000>;
>  				interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&clks IMX6SL_CLK_LCDIF_PIX>,
> diff --git a/arch/arm/boot/dts/imx6sll.dtsi b/arch/arm/boot/dts/imx6sll.dtsi
> index edd3abb9a9f1..c51072bb43ba 100644
> --- a/arch/arm/boot/dts/imx6sll.dtsi
> +++ b/arch/arm/boot/dts/imx6sll.dtsi
> @@ -644,7 +644,7 @@ pxp: pxp@20f0000 {
>  			};
>  
>  			lcdif: lcd-controller@20f8000 {
> -				compatible = "fsl,imx6sll-lcdif", "fsl,imx28-lcdif";
> +				compatible = "fsl,imx6sll-lcdif", "fsl,imx6sx-lcdif";
>  				reg = <0x020f8000 0x4000>;
>  				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&clks IMX6SLL_CLK_LCDIF_PIX>,
> diff --git a/arch/arm/boot/dts/imx6sx.dtsi b/arch/arm/boot/dts/imx6sx.dtsi
> index 94e3df47d1ad..67da3a2d48ec 100644
> --- a/arch/arm/boot/dts/imx6sx.dtsi
> +++ b/arch/arm/boot/dts/imx6sx.dtsi
> @@ -1241,7 +1241,7 @@ csi2: csi@221c000 {
>  				};
>  
>  				lcdif1: lcdif@2220000 {
> -					compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
> +					compatible = "fsl,imx6sx-lcdif";
>  					reg = <0x02220000 0x4000>;
>  					interrupts = <GIC_SPI 5 IRQ_TYPE_EDGE_RISING>;
>  					clocks = <&clks IMX6SX_CLK_LCDIF1_PIX>,
> @@ -1253,7 +1253,7 @@ lcdif1: lcdif@2220000 {
>  				};
>  
>  				lcdif2: lcdif@2224000 {
> -					compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
> +					compatible = "fsl,imx6sx-lcdif";
>  					reg = <0x02224000 0x4000>;
>  					interrupts = <GIC_SPI 6 IRQ_TYPE_EDGE_RISING>;
>  					clocks = <&clks IMX6SX_CLK_LCDIF2_PIX>,
> diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
> index 5379a03391bd..b16cce1680a9 100644
> --- a/arch/arm/boot/dts/imx6ul.dtsi
> +++ b/arch/arm/boot/dts/imx6ul.dtsi
> @@ -978,7 +978,7 @@ csi: csi@21c4000 {
>  			};
>  
>  			lcdif: lcdif@21c8000 {
> -				compatible = "fsl,imx6ul-lcdif", "fsl,imx28-lcdif";
> +				compatible = "fsl,imx6ul-lcdif", "fsl,imx6sx-lcdif";
>  				reg = <0x021c8000 0x4000>;
>  				interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&clks IMX6UL_CLK_LCDIF_PIX>,
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
