Return-Path: <SRS0=yifd=B2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFE04C433E1
	for <linux-devicetree@archiver.kernel.org>; Sun, 16 Aug 2020 07:28:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93FB42067C
	for <linux-devicetree@archiver.kernel.org>; Sun, 16 Aug 2020 07:28:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727798AbgHPH23 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 16 Aug 2020 03:28:29 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:43094 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726850AbgHPH22 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 16 Aug 2020 03:28:28 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 78847804D0;
        Sun, 16 Aug 2020 09:28:26 +0200 (CEST)
Date:   Sun, 16 Aug 2020 09:28:25 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>,
        devicetree@vger.kernel.org,
        Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
        Rob Herring <robh+dt@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/8] arm64: dts: imx8mq: Fix LCDIF compatible strings
Message-ID: <20200816072825.GG1201814@ravnborg.org>
References: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
 <20200813012910.13576-7-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200813012910.13576-7-laurent.pinchart@ideasonboard.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
        a=2Qux6yqyLjLJBOxPyS8A:9 a=CjuIK1q_8ugA:10 a=D0XLA9XvdZm18NrgonBM:22
        a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Aug 13, 2020 at 04:29:08AM +0300, Laurent Pinchart wrote:
> The LCDIF in the i.MX8 SoCs has additional features compared to the
> i.MX28. Replace the fsl,imx28-lcdif fallback compatible string with
> fsl,imx6sx-lcdif to reflect that.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> index 978f8122c0d2..4731c3992179 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -506,7 +506,7 @@ sdma2: sdma@302c0000 {
>  			};
>  
>  			lcdif: lcd-controller@30320000 {
> -				compatible = "fsl,imx8mq-lcdif", "fsl,imx28-lcdif";
> +				compatible = "fsl,imx8mq-lcdif", "fsl,imx6sx-lcdif";
>  				reg = <0x30320000 0x10000>;
>  				interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&clk IMX8MQ_CLK_LCDIF_PIXEL>;
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
