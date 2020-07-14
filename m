Return-Path: <SRS0=HudI=AZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5605C433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 03:00:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8FF54208FE
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 03:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594695605;
	bh=iTE6ogOHaz8ANSqAECwjkGMmvl5yaZcvRk4m3Gsf51I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ocRpBaxRrb+ymCz5dPDGiR3wNULmStSbDPBzDKu3ZHMXFu+aV/QGtQOwPGWhVU+d2
	 vxEE0f8pUt93dsQlUzb0bwbE4vW8jiP1idu+JcHZsiHHAbFpBfhNstxtbx+pOqHmal
	 D3VOCHZKI3GAnWif6wTXzYGERxKn7UY1XrI+KZRc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbgGNDAF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jul 2020 23:00:05 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:34627 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbgGNDAE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jul 2020 23:00:04 -0400
Received: by mail-io1-f66.google.com with SMTP id q74so15820875iod.1;
        Mon, 13 Jul 2020 20:00:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wSXghTdlLAieEFZ39iyyxrFmCFgGzVBzq1RNCvrRwsw=;
        b=Dxopd11xoF+60OsIl/Ybc7YNMFS7CfEkuZxnmHccrBqfsiOGgjUXRljMek7ya2Abpk
         gvVm+ZZcCWXis7LmdW8pHm1jZzSGaiwradCyCjBhR3Yj/MLzhA9PIuvISFaW2rvDS7BP
         zMsMb7PQatWh0GTBCWq1Hi8k1mB0rF5uvFN2Bp10wMp9oFmTuqCmrI9vMA2Mf+pX8YPA
         wa6qPdRfd4xHbxsJoWIOgcza5Xaf7DhIQqg/DTovjZ3OpFMuqgt5fIUxOXvs5/fokvZW
         uA2D457Oy2PoRS8cCuRSUh53+BQ9iXez2Te7KriepNkugmOAB2qou9F8QXoDs6HS4+zW
         R1+A==
X-Gm-Message-State: AOAM533hs+BCKPR+Uyfl4LJ03MNqGSzdJri9xJu4gyiukqzMdtnVBabN
        qyGMAs2L1M9/h9CDAOCvKlwiCGs39jwi
X-Google-Smtp-Source: ABdhPJyYgsLrR7GdjWOSNztbmbu/GfZF0NPf4tc2WGYT9ElsoeWfIqN7HC5bGrGWEOd8HcW+Cgvzew==
X-Received: by 2002:a02:6514:: with SMTP id u20mr3442335jab.94.1594695603704;
        Mon, 13 Jul 2020 20:00:03 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id u62sm9418029ilc.87.2020.07.13.20.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 20:00:03 -0700 (PDT)
Received: (nullmailer pid 1201871 invoked by uid 1000);
        Tue, 14 Jul 2020 03:00:01 -0000
Date:   Mon, 13 Jul 2020 21:00:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     Li Jun <jun.li@nxp.com>
Cc:     balbi@kernel.org, shawnguo@kernel.org, gregkh@linuxfoundation.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        peter.chen@nxp.com, Anson.Huang@nxp.com, peng.fan@nxp.com,
        horia.geanta@nxp.com
Subject: Re: [PATCH v2 5/5] dt-bindings: usb: dwc3-imx8mp: add imx8mp dwc3
 glue bindings
Message-ID: <20200714030001.GA1196828@bogus>
References: <1594028699-1055-1-git-send-email-jun.li@nxp.com>
 <1594028699-1055-6-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594028699-1055-6-git-send-email-jun.li@nxp.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Jul 06, 2020 at 05:44:59PM +0800, Li Jun wrote:
> NXP imx8mp integrates 2 dwc3 3.30b IP and add some wakeup logic
> to support low power mode, the glue layer is for this wakeup
> functionality, which has a separated interrupt, can support
> wakeup from U3 and connect events for host, and vbus wakeup for
> device.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  .../devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml   | 87 ++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
> new file mode 100644
> index 0000000..823db058
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2020 NXP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/fsl,imx8mp-dwc3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP iMX8MP Soc USB Controller
> +
> +maintainers:
> +  - Li Jun <jun.li@nxp.com>
> +
> +properties:
> +  compatible:
> +    items:
> +    - const: fsl,imx8mp-dwc3
> +
> +  reg:
> +    maxItems: 1
> +    description: Address and length of the register set for the wrapper of
> +      dwc3 core on the SOC.
> +
> +  "#address-cells":
> +    enum: [ 1, 2 ]
> +
> +  "#size-cells":
> +    enum: [ 1, 2 ]
> +
> +  interrupts:
> +    maxItems: 1
> +    description: The interrupt that is asserted when a wakeup event is
> +      received.
> +
> +  clocks:
> +    description:
> +      A list of phandle and clock-specifier pairs for the clocks
> +      listed in clock-names.
> +    items:
> +      - description: system hsio root clock.
> +      - description: system bus AXI clock.
> +      - description: suspend clock, used for wakeup logic.
> +
> +  clock-names:
> +    items:
> +      - const: hsio
> +      - const: bus
> +      - const: suspend
> +
> +# Required child node:
> +
> +  dwc3:

Needs to be a pattern with the unit-address.

> +    description: This is the node representing the DWC3 controller instance
> +      Documentation/devicetree/bindings/usb/dwc3.txt
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks

Pretty sure you need a few more properties here...

Add:

additionalProperties: false

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mp-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    usb3_0: usb@32f10100 {
> +      compatible = "fsl,imx8mp-dwc3";
> +      reg = <0x32f10100 0x8>;
> +      clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
> +               <&clk IMX8MP_CLK_HSIO_AXI_DIV>,
> +               <&clk IMX8MP_CLK_USB_ROOT>;
> +      clock-names = "hsio", "bus", "suspend";
> +      assigned-clocks = <&clk IMX8MP_CLK_HSIO_AXI_SRC>;
> +      assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_500M>;
> +      assigned-clock-rates = <500000000>;
> +      interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      ranges;
> +
> +      dwc3@38100000 {
> +        compatible = "snps,dwc3";
> +        reg = <0x38100000 0x10000>;
> +        interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> +        phys = <&usb3_phy0>, <&usb3_phy0>;
> +        phy-names = "usb2-phy", "usb3-phy";
> +      };
> +    };
> -- 
> 2.7.4
> 
