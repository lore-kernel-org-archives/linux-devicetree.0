Return-Path: <SRS0=yifd=B2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E94EC433DF
	for <linux-devicetree@archiver.kernel.org>; Sun, 16 Aug 2020 06:39:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D56C207FB
	for <linux-devicetree@archiver.kernel.org>; Sun, 16 Aug 2020 06:39:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbgHPGji (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 16 Aug 2020 02:39:38 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:36544 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbgHPGji (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 16 Aug 2020 02:39:38 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 29D2C20021;
        Sun, 16 Aug 2020 08:39:35 +0200 (CEST)
Date:   Sun, 16 Aug 2020 08:39:33 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>,
        devicetree@vger.kernel.org,
        Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
        Rob Herring <robh+dt@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/8] dt-bindings: display: mxsfb: Add and fix compatible
 strings
Message-ID: <20200816063933.GC1201814@ravnborg.org>
References: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
 <20200813012910.13576-3-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200813012910.13576-3-laurent.pinchart@ideasonboard.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
        a=61xgh838un-h8gKOHdQA:9 a=CjuIK1q_8ugA:10 a=D0XLA9XvdZm18NrgonBM:22
        a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Aug 13, 2020 at 04:29:04AM +0300, Laurent Pinchart wrote:
> Additional compatible strings have been added in DT source for the
> i.MX6SL, i.MX6SLL, i.MX6UL and i.MX7D without updating the bindings.
> Most of the upstream DT sources use the fsl,imx28-lcdif compatible
> string, which mostly predates the realization that the LCDIF in the
> i.MX6 and newer SoCs have extra features compared to the i.MX28.
> 
> Update the bindings to add the missing compatible strings, with the
> correct fallback values. This fails to validate some of the upstream DT
> sources. Instead of adding the incorrect compatible fallback to the
> binding, the sources should be updated separately.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../devicetree/bindings/display/mxsfb.yaml     | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mxsfb.yaml b/Documentation/devicetree/bindings/display/mxsfb.yaml
> index 202381ec5bb7..ec6533b1d4a3 100644
> --- a/Documentation/devicetree/bindings/display/mxsfb.yaml
> +++ b/Documentation/devicetree/bindings/display/mxsfb.yaml
> @@ -15,11 +15,19 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - fsl,imx23-lcdif
> -      - fsl,imx28-lcdif
> -      - fsl,imx6sx-lcdif
> -      - fsl,imx8mq-lcdif
> +    oneOf:
> +      - enum:
> +          - fsl,imx23-lcdif
> +          - fsl,imx28-lcdif
> +          - fsl,imx6sx-lcdif
Indent correct.

> +      - items:
> +        - enum:
> +          - fsl,imx6sl-lcdif
> +          - fsl,imx6sll-lcdif
> +          - fsl,imx6ul-lcdif
> +          - fsl,imx7d-lcdif
> +          - fsl,imx8mq-lcdif
Indent shall be two more spaces like above.
(This is at least my best uderstanding)

> +        - const: fsl,imx6sx-lcdif

With the above the following compatibles are supported:

	"fsl,imx23-lcdif"
	"fsl,imx28-lcdif"
	"fsl,imx6sx-lcdif"
	"fsl,imx8mq-lcdif"

	"fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif"
	"fsl,imx6sll-lcdif", "fsl,imx6sx-lcdif"
	"fsl,imx6ul-lcdif", "fsl,imx6sx-lcdif"
	"fsl,imx7d-lcdif", "fsl,imx6sx-lcdif"
	"fsl,imx8mq-lcdif", "fsl,imx6sx-lcdif"

So the fallback value is the later "fsl,imx6sx-lcdif" which looks ok.

With indent fixed (or explained why I am wrong):
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>


>  
>    reg:
>      maxItems: 1
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
