Return-Path: <SRS0=8UcW=CC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46ADDC433E3
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 23:59:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00F45206EB
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 23:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598313553;
	bh=7d8WMLdODpJNkIccXAg6ivHrSuBGOipL/H+ZTpnhSlw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=rsV2gQjEHvsJ22MF60jmxkMKgHGjrAoEqKMiSz8GNAa9Ygw7mzkJ57U30UcX/+nly
	 VoKFx/7GePkg3tjBMXdc9Imf62azs53bVhQDnIR/BgJspnJRR1HIda96zz2NupjCGw
	 2aH618g+jgKlg2gKR1VFNzjEqwscg9s6+tkVjdRg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbgHXX7M (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 24 Aug 2020 19:59:12 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:44729 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726113AbgHXX7L (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 24 Aug 2020 19:59:11 -0400
Received: by mail-il1-f193.google.com with SMTP id j9so8871522ilc.11
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2020 16:59:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QWRCgizJKKL/2uZPzhKI1Q4OtzQpPo/3bVjEjcjzVBk=;
        b=ek4j6B+2HBTMThhyA/HPP+AifiAMuYRW86/+RB7K9q6e/VA8GGGAzQ1JL460aWDcHn
         ugDCT2OGOmrz20ZVwfthJDNnOrsKE/MBDBCe3Vnl/JCZ4D1cMIZLZ6O7AG/YnYqvJdwK
         cETdRUNwC3Xj5G7N8ZWeMYkxcicx3aZgrh97uHwYjgqG8c8C28GAh55VP9CLmdvENTTx
         CzlOi4zlS2L1HkcX7cKZjOcCFBphuPD6jSB2xpQ1olN1x8CJeB1H/9dlXtAa+P8f0Glh
         lM8noPdnpv4FeMqzPwsJnJ4TgOUdOfQ4UnyqhM4OptOiu/zoTUTQeUXHufl+DLptFDxp
         +Gyw==
X-Gm-Message-State: AOAM531MsSS+ZIsY/NYmeZ6E7gt0DJ3hclKO/wjku5teYPohaier0F7O
        uPsLxP6guBHZX77Ome1nCA==
X-Google-Smtp-Source: ABdhPJzBQZNc4oS7FJptwvx6rym4kg7JJWpKb28yBiw39tWuAvgQsLAA9wQ1ArK6XdryTZ7Tn0ixPA==
X-Received: by 2002:a92:9151:: with SMTP id t78mr6615103ild.65.1598313550166;
        Mon, 24 Aug 2020 16:59:10 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id q19sm8173858ilj.85.2020.08.24.16.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 16:59:09 -0700 (PDT)
Received: (nullmailer pid 3584196 invoked by uid 1000);
        Mon, 24 Aug 2020 23:59:07 -0000
Date:   Mon, 24 Aug 2020 17:59:07 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH 1/8] dt-bindings: display: mxsfb: Convert binding to YAML
Message-ID: <20200824235907.GB3579749@bogus>
References: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
 <20200813012910.13576-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200813012910.13576-2-laurent.pinchart@ideasonboard.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Aug 13, 2020 at 04:29:03AM +0300, Laurent Pinchart wrote:
> Convert the mxsfb binding to YAML. The deprecated binding is dropped, as
> neither the DT sources nor the driver support it anymore.

Ah, the first display controller I worked on...

> 
> The compatible strings are messy, and DT sources use different kinds of
> combination of documented and undocumented values. Keep it simple for
> now, and update the example to make it valid. Aligning the binding with
> the existing DT sources will be performed separately.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

Don't need quotes here.

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
