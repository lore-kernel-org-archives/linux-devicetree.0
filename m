Return-Path: <SRS0=2ZKK=7K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1539BC433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 19:25:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF703208A7
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 19:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590693908;
	bh=n6panmiw+ByhRJ7nfJLEci3zYFnM/ituGlwHRh1C7WA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=G3/vt5B+osIQ5CSlZ0u0s510wsAP8FexC4iQv1qiUwq6T1MmWXbcgiSIqyVQLr012
	 1/bhBKA5QSIvtuAydrrRWZzlcJqSL1JnuX35m9fnOx4TXpqnfEF+UmfvyFrlAZwBpj
	 gSPV3M6czJlMw1pIxckXZY4Fse9TuBdXiIvGKf6A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406437AbgE1TZF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 May 2020 15:25:05 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:37616 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406527AbgE1TZB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 May 2020 15:25:01 -0400
Received: by mail-io1-f65.google.com with SMTP id r2so21073296ioo.4
        for <devicetree@vger.kernel.org>; Thu, 28 May 2020 12:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TkZODRFhG/vtCIkYEEg+m3Z3IgA6shYK4yQMJAp6c+k=;
        b=noQ0NxxjgraZBiwjKIpjBTvzQIHJ1Ik3GiUxt3C9biErN7s1drisLM4a9HGmGI6lcV
         03yEIwcSTntWpALXwS1Q58ktBjyMc/KyQ1Ci4ykE6YmGzVfB6z3vdypH7tpo9h7mjQjP
         N/6q8ZpA3raftUex/5J1kjDQxTq9ibAMvVpZhBRQ1L18oXuLdOGCH4UUDM8BtZa4LtKV
         wegc/S3ncDG2fbCzDth2Zce+A7DXO0wXDrH67M8Er4dn5lzA/UxuYvgbsv0e+C1KPzip
         udzsOdvvhIygXaprJ9wQv/P2P66Cpxb4jjHziTG/2wG7DSHcAXy6UEx64/LNab0HMlWv
         rlLg==
X-Gm-Message-State: AOAM531mpa5I/S30UF8Yy9P1eBJq2z0JpU/GQz1yFyyH2htWgTLusD8F
        9pfJoTu/EvyH7SB6WISDo/3ZJgQ=
X-Google-Smtp-Source: ABdhPJw4u4bBP8D6GR7WS2iHYLGA8Ltd5PgiVX2YlVSX+bTbfOvcvw0Ltwi12joC8uWswxnHTBBoJw==
X-Received: by 2002:a5e:a80f:: with SMTP id c15mr3587070ioa.71.1590693899474;
        Thu, 28 May 2020 12:24:59 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id n17sm3250829ili.1.2020.05.28.12.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 12:24:58 -0700 (PDT)
Received: (nullmailer pid 536942 invoked by uid 1000);
        Thu, 28 May 2020 19:24:58 -0000
Date:   Thu, 28 May 2020 13:24:58 -0600
From:   Rob Herring <robh@kernel.org>
To:     Roger Quadros <rogerq@ti.com>
Cc:     kishon@ti.com, b-liu@ti.com, devicetree@vger.kernel.org,
        vigneshr@ti.com, nsekhar@ti.com
Subject: Re: [PATCH 2/4] dt-binding: phy: convert ti,omap-usb2 to YAML
Message-ID: <20200528192458.GA531030@bogus>
References: <20200515080518.26870-1-rogerq@ti.com>
 <20200515080518.26870-3-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200515080518.26870-3-rogerq@ti.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, May 15, 2020 at 11:05:16AM +0300, Roger Quadros wrote:
> Move ti,omap-usb2 to its own YAML schema.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> ---
>  .../devicetree/bindings/phy/ti,omap-usb2.yaml | 73 +++++++++++++++++++
>  .../devicetree/bindings/phy/ti-phy.txt        | 37 ----------
>  2 files changed, 73 insertions(+), 37 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml b/Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
> new file mode 100644
> index 000000000000..ecfb28f714ea
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/ti,omap-usb2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OMAP USB2 PHY
> +
> +maintainers:
> + - Kishon Vijay Abraham I <kishon@ti.com>
> + - Roger Quadros <rogerq@ti.com>
> +
> +properties:
> +  compatible:
> +    anyOf:

Only 1 entry, don't need anyOf.

> +      - items:
> +        - enum:
> +          - "ti,dra7x-usb2"
> +          - "ti,dra7x-usb2-phy2"
> +          - "ti,am654-usb2"
> +        - enum:
> +          - "ti,omap-usb2"
> +
> +  reg:
> +    maxItems: 1
> +    description: address and length of the register set for the device.

Drop. That's every 'reg'.

> +
> +  '#phy-cells':
> +    description:
> +      Number of cells in a PHY specifier.  The meaning of all those
> +      cells is defined by the binding for the phy node. The PHY
> +      provider can use the values in cells to find the appropriate PHY.

Yes, and this is a phy bindings, so you need to define the value.

> +    $ref: /schemas/types.yaml#/definitions/uint32

#*-cells already has a type.

> +
> +  clocks:
> +    minItems: 1
> +    items:
> +      - description: wakeup clock
> +      - description: reference clock
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: "wkupclk"
> +      - const: "refclk"

Don't need quotes.

> +
> +  syscon-phy-power:
> +    description:
> +      phandle/offset pair. Phandle to the system control module
> +      register offset to power on/off the PHY.
> +
> +  ctrl-module:
> +    description:
> +      (deprecated) phandle of the control module used by PHY driver
> +      to power on the PHY. Use syscon-phy-power instead.

These 2 need a type reference.

> +
> +required:
> +  - compatible
> +  - reg
> +  - '#phy-cells'
> +  - clocks
> +  - clock-names
> +
> +examples:
> +  - |
> +    usb0_phy: phy@4100000 {
> +      compatible = "ti,am654-usb2", "ti,omap-usb2";
> +      reg = <0x0 0x4100000 0x0 0x54>;
> +      syscon-phy-power = <&scm_conf 0x4000>;
> +      clocks = <&k3_clks 151 0>, <&k3_clks 151 1>;
> +      clock-names = "wkupclk", "refclk";
> +      #phy-cells = <0>;
> +    };
> diff --git a/Documentation/devicetree/bindings/phy/ti-phy.txt b/Documentation/devicetree/bindings/phy/ti-phy.txt
> index 8f93c3b694a7..60c9d0ac75e6 100644
> --- a/Documentation/devicetree/bindings/phy/ti-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/ti-phy.txt
> @@ -27,43 +27,6 @@ omap_control_usb: omap-control-usb@4a002300 {
>          reg-names = "otghs_control";
>  };
>  
> -OMAP USB2 PHY
> -
> -Required properties:
> - - compatible: Should be "ti,omap-usb2"
> -	       Should be "ti,dra7x-usb2" for the 1st instance of USB2 PHY on
> -	       DRA7x
> -	       Should be "ti,dra7x-usb2-phy2" for the 2nd instance of USB2 PHY
> -	       in DRA7x
> -	       Should be "ti,am654-usb2" for the USB2 PHYs on AM654.
> - - reg : Address and length of the register set for the device.
> - - #phy-cells: determine the number of cells that should be given in the
> -   phandle while referencing this phy.
> - - clocks: a list of phandles and clock-specifier pairs, one for each entry in
> -   clock-names.
> - - clock-names: should include:
> -   * "wkupclk" - wakeup clock.
> -   * "refclk" - reference clock (optional).
> -
> -Deprecated properties:
> - - ctrl-module : phandle of the control module used by PHY driver to power on
> -   the PHY.
> -
> -Recommended properies:
> -- syscon-phy-power : phandle/offset pair. Phandle to the system control
> -  module and the register offset to power on/off the PHY.
> -
> -This is usually a subnode of ocp2scp to which it is connected.
> -
> -usb2phy@4a0ad080 {
> -	compatible = "ti,omap-usb2";
> -	reg = <0x4a0ad080 0x58>;
> -	ctrl-module = <&omap_control_usb>;
> -	#phy-cells = <0>;
> -	clocks = <&usb_phy_cm_clk32k>, <&usb_otg_ss_refclk960m>;
> -	clock-names = "wkupclk", "refclk";
> -};
> -
>  TI PIPE3 PHY
>  
>  Required properties:
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 
