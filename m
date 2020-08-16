Return-Path: <SRS0=yifd=B2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D7DC433E3
	for <linux-devicetree@archiver.kernel.org>; Sun, 16 Aug 2020 06:22:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EDF622078D
	for <linux-devicetree@archiver.kernel.org>; Sun, 16 Aug 2020 06:22:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729600AbgHPGWu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 16 Aug 2020 02:22:50 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:34808 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727957AbgHPGWu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 16 Aug 2020 02:22:50 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 9543720021;
        Sun, 16 Aug 2020 08:22:43 +0200 (CEST)
Date:   Sun, 16 Aug 2020 08:22:42 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>,
        devicetree@vger.kernel.org,
        Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
        Rob Herring <robh+dt@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/8] dt-bindings: display: mxsfb: Convert binding to YAML
Message-ID: <20200816062242.GB1201814@ravnborg.org>
References: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
 <20200813012910.13576-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200813012910.13576-2-laurent.pinchart@ideasonboard.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8 a=7gkXJVJtAAAA:8 a=gEfo2CItAAAA:8
        a=e5mUnYsNAAAA:8 a=EqItBs2jIxw7kIzKjyAA:9 a=MZayykPKA34tcy_T:21
        a=t4RRL-1p8-KQFa2t:21 a=CjuIK1q_8ugA:10 a=D0XLA9XvdZm18NrgonBM:22
        a=E9Po1WZjFZOl8hwRPBS3:22 a=sptkURWiP4Gy88Gu7hUp:22
        a=Vxmtnl_E_bksehYqCbjh:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Laurent.

Good to see one of the imx bindings migrating to yaml.

On Thu, Aug 13, 2020 at 04:29:03AM +0300, Laurent Pinchart wrote:
> Convert the mxsfb binding to YAML. The deprecated binding is dropped, as
> neither the DT sources nor the driver support it anymore.
> 
> The compatible strings are messy, and DT sources use different kinds of
> combination of documented and undocumented values. Keep it simple for
> now, and update the example to make it valid. Aligning the binding with
> the existing DT sources will be performed separately.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
But see below for a few nits

> ---
>  .../devicetree/bindings/display/mxsfb.txt     |  87 -------------
>  .../devicetree/bindings/display/mxsfb.yaml    | 115 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 116 insertions(+), 88 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/mxsfb.txt
>  create mode 100644 Documentation/devicetree/bindings/display/mxsfb.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mxsfb.txt b/Documentation/devicetree/bindings/display/mxsfb.txt
> deleted file mode 100644
> index c985871c46b3..000000000000
> --- a/Documentation/devicetree/bindings/display/mxsfb.txt
> +++ /dev/null
> @@ -1,87 +0,0 @@
> -* Freescale MXS LCD Interface (LCDIF)
> -
> -New bindings:
> -=============
> -Required properties:
> -- compatible:	Should be "fsl,imx23-lcdif" for i.MX23.
> -		Should be "fsl,imx28-lcdif" for i.MX28.
> -		Should be "fsl,imx6sx-lcdif" for i.MX6SX.
> -		Should be "fsl,imx8mq-lcdif" for i.MX8MQ.
> -- reg:		Address and length of the register set for LCDIF
> -- interrupts:	Should contain LCDIF interrupt
> -- clocks:	A list of phandle + clock-specifier pairs, one for each
> -		entry in 'clock-names'.
> -- clock-names:	A list of clock names. For MXSFB it should contain:
> -    - "pix" for the LCDIF block clock
> -    - (MX6SX-only) "axi", "disp_axi" for the bus interface clock
> -
> -Required sub-nodes:
> -  - port: The connection to an encoder chip.
> -
> -Example:
> -
> -	lcdif1: display-controller@2220000 {
> -		compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
> -		reg = <0x02220000 0x4000>;
> -		interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks = <&clks IMX6SX_CLK_LCDIF1_PIX>,
> -			 <&clks IMX6SX_CLK_LCDIF_APB>,
> -			 <&clks IMX6SX_CLK_DISPLAY_AXI>;
> -		clock-names = "pix", "axi", "disp_axi";
> -
> -		port {
> -			parallel_out: endpoint {
> -				remote-endpoint = <&panel_in_parallel>;
> -			};
> -		};
> -	};
> -
> -Deprecated bindings:
> -====================
> -Required properties:
> -- compatible:	Should be "fsl,imx23-lcdif" for i.MX23.
> -		Should be "fsl,imx28-lcdif" for i.MX28.
> -- reg:		Address and length of the register set for LCDIF
> -- interrupts:	Should contain LCDIF interrupts
> -- display:	phandle to display node (see below for details)
> -
> -* display node
> -
> -Required properties:
> -- bits-per-pixel:	<16> for RGB565, <32> for RGB888/666.
> -- bus-width:		number of data lines.  Could be <8>, <16>, <18> or <24>.
> -
> -Required sub-node:
> -- display-timings:	Refer to binding doc display-timing.txt for details.
> -
> -Examples:
> -
> -lcdif@80030000 {
> -	compatible = "fsl,imx28-lcdif";
> -	reg = <0x80030000 2000>;
> -	interrupts = <38 86>;
> -
> -	display: display {
> -		bits-per-pixel = <32>;
> -		bus-width = <24>;
> -
> -		display-timings {
> -			native-mode = <&timing0>;
> -			timing0: timing0 {
> -				clock-frequency = <33500000>;
> -				hactive = <800>;
> -				vactive = <480>;
> -				hfront-porch = <164>;
> -				hback-porch = <89>;
> -				hsync-len = <10>;
> -				vback-porch = <23>;
> -				vfront-porch = <10>;
> -				vsync-len = <10>;
> -				hsync-active = <0>;
> -				vsync-active = <0>;
> -				de-active = <1>;
> -				pixelclk-active = <0>;
> -			};
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/display/mxsfb.yaml b/Documentation/devicetree/bindings/display/mxsfb.yaml
> new file mode 100644
> index 000000000000..202381ec5bb7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mxsfb.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mxsfb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale/NXP i.MX LCD Interface (LCDIF)
> +
> +maintainers:
> +  - Marek Vasut <marex@denx.de>
> +  - Stefan Agner <stefan@agner.ch>
> +
> +description: |
> +  (e)LCDIF display controller found in the Freescale/NXP i.MX SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx23-lcdif
> +      - fsl,imx28-lcdif
> +      - fsl,imx6sx-lcdif
> +      - fsl,imx8mq-lcdif
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Pixel clock
> +      - description: Bus clock
> +      - description: Display AXI clock
> +    minItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: "pix"
> +      - const: "axi"
> +      - const: "disp_axi"
> +    minItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  port:
> +    description: The LCDIF output port
> +    type: object
> +
> +    properties:
> +      endpoint:
> +        type: object
> +
> +        properties:
> +          remote-endpoint:
> +            $ref: /schemas/types.yaml#/definitions/phandle
> +
> +        required:
> +          - remote-endpoint
> +
> +        additionalProperties: false
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +  - port
> +
> +additionalProperties: false
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx6sx-lcdif
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 3
> +        clock-names:
> +          minItems: 2
> +          maxItems: 3
> +      required:
> +        - clock-names
> +    else:
> +      properties:
> +        clocks:
> +          minItems: 1
> +        clock-names:
> +          minItems: 1
The else parts looks like it is not needed.
The clock, clock-names properties has minItems: 1 already from above.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx6sx-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    display-controller@2220000 {
> +        compatible = "fsl,imx6sx-lcdif";
> +        reg = <0x02220000 0x4000>;
> +        interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&clks IMX6SX_CLK_LCDIF1_PIX>,
> +                 <&clks IMX6SX_CLK_LCDIF_APB>,
> +                 <&clks IMX6SX_CLK_DISPLAY_AXI>;
> +        clock-names = "pix", "axi", "disp_axi";
> +
> +        port {
> +            endpoint {
> +                remote-endpoint = <&panel_in>;
> +            };
> +        };
> +    };
empty line before "..." - at least most files have it
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e3467e88714f..e3fac23383d2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11757,7 +11757,7 @@ M:	Stefan Agner <stefan@agner.ch>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Supported
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
> -F:	Documentation/devicetree/bindings/display/mxsfb.txt
> +F:	Documentation/devicetree/bindings/display/mxsfb.yaml
>  F:	drivers/gpu/drm/mxsfb/
>  
>  MYLEX DAC960 PCI RAID Controller
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
