Return-Path: <SRS0=c2W6=4V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFCB8C3F2D1
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Mar 2020 16:56:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B2B0320674
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Mar 2020 16:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583340987;
	bh=IDuwultc5UnTGYzdw6ahwuogLsiUryQThMDeD6nOTaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=zfgDoAO6czhTKQUG4Kmnjzh3g6n8zK7EDHD+hxXImJvENUNASdhtK3sSD9TPhpnkF
	 RnfwEcYFfBBE+u3z8H89fPtPi2zqd3+GgxoFT99Lt9WNmAKMestEKbUqyhZpwi4Alz
	 6V0DhMIvN9c8O+gx0YC36VoNcVr57oNl04yjpNsY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbgCDQ41 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 4 Mar 2020 11:56:27 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:39306 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbgCDQ41 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 4 Mar 2020 11:56:27 -0500
Received: by mail-oi1-f196.google.com with SMTP id r16so2776962oie.6
        for <devicetree@vger.kernel.org>; Wed, 04 Mar 2020 08:56:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1x6Tl4FkquqbFK2U7e561blQbQkLtLaOfZkxuV3Uifk=;
        b=PRkkbTcmDSjnPW3rWJDqE5v+Ei0eFMLCWJVjV5pg3c3oce612WqptRkwZezeSvfeVl
         4k8FJKpLSokIMm4VR1efLWk/qSEGwUiXzZDaODYyPNjtCWdH/8zZjHSEuJVYK5gfHQvs
         odA0kV20LE567y68pGRjfQCPCpzf4F/AfJovEEytlVi5jG4gxTRzKAU31Jx7uwCyqw27
         u7o7JMqkrHL4NtyFw9nB03bQD6AdsXuOw57ydbe8N3OXmd7NWONS6pzBQ4Lw1IBVSVkB
         V6Xe8JLbSdJ2nlYc3S2PI4d+WgmrnVTXIy75bPquk9wbeNLkKgPdDXnMQORmjeAmpKbD
         Pgxw==
X-Gm-Message-State: ANhLgQ0tifkk5DB5T3oKnlOAonl1dtOlPsJraWOlt07sNidyPeCGFoUW
        Sth7snXdJ2/aRnNNJtrrfA1QhXI=
X-Google-Smtp-Source: ADFU+vvN0s8xtsegXAsk83hpqJfBSA3bQkx7dF0MVL1rhBScQPKr6TdRvIrDvNFvUBC3bmvtUvwhqg==
X-Received: by 2002:aca:c0c5:: with SMTP id q188mr2299956oif.169.1583340986232;
        Wed, 04 Mar 2020 08:56:26 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y14sm8992584oih.23.2020.03.04.08.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 08:56:25 -0800 (PST)
Received: (nullmailer pid 18755 invoked by uid 1000);
        Wed, 04 Mar 2020 16:56:24 -0000
Date:   Wed, 4 Mar 2020 10:56:24 -0600
From:   Rob Herring <robh@kernel.org>
To:     Yifeng Zhao <yifeng.zhao@rock-chips.com>
Cc:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        heiko@sntech.de, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 2/3] dt-bindings: mtd: Describe Rockchip RK3xxx NAND
 flash controller
Message-ID: <20200304165624.GA2630@bogus>
References: <20200303094736.7490-1-yifeng.zhao@rock-chips.com>
 <20200303094736.7490-3-yifeng.zhao@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200303094736.7490-3-yifeng.zhao@rock-chips.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Mar 03, 2020 at 05:47:35PM +0800, Yifeng Zhao wrote:
> Documentation support for Rockchip RK3xxx NAND flash controllers
> 
> Signed-off-by: Yifeng Zhao <yifeng.zhao@rock-chips.com>
> ---
> 
> Changes in v3:
> -change the title for the dt-bindings
> 
> Changes in v2: None
> 
>  .../bindings/mtd/rockchip,nand.yaml           | 95 +++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/rockchip,nand.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/rockchip,nand.yaml b/Documentation/devicetree/bindings/mtd/rockchip,nand.yaml
> new file mode 100644
> index 000000000000..9a81f682ac01
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/rockchip,nand.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license new bindings:

(GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/rockchip,nand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip SoCs NAND FLASH Controller (NFC) Device Tree Bindings
> +
> +allOf:
> +  - $ref: "nand-controller.yaml"
> +
> +maintainers:
> +  - Yifeng Zhao <yifeng.zhao@rock-chips.com>
> +
> +properties:
> +  "#address-cells": true
> +  "#size-cells": true
> +
> +  compatible:
> +    const: rockchip,nfc

Should be SoC specific.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Module Clock
> +      - description: Bus Clock
> +
> +  clock-names:
> +    items:
> +      - const: clk_nfc
> +      - const: clk_ahb

'clk_' is redundant.

> +
> +  clock-rates:
> +      maximum: 150000000

Not a standard property. Should be implied by the compatible string.

> +
> +  pinctrl-names: true

No need to specify this, pinctrl properties are allowed on any node and 
added by the tool.

> +
> +patternProperties:
> +  "^pinctrl-[0-9]+$": true

Same here.

> +
> +  "^nand@[a-f0-9]$":

Based on reg, should be only '[0-3]'

> +    type: object
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 3
> +
> +      nand-ecc-step-size:
> +        const: 1024
> +
> +      nand-ecc-strength:
> +        enum: [16, 24 , 40, 60, 70]
> +
> +      nand-bus-width:
> +        const: 8
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/rk3308-cru.h>
> +    nfc: nand-controller@ff4b0000 {
> +      compatible = "rockchip,nfc";
> +      reg = <0x0 0xff4b0000 0x0 0x4000>;
> +      interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
> +      clocks = <&cru SCLK_NANDC>, <&cru HCLK_NANDC>;
> +      clock-names = "clk_nfc", "clk_ahb";
> +      clock-rates = <150000000>;
> +      pinctrl-names = "default";
> +      pinctrl-0 = <&flash_csn0 &flash_rdy &flash_ale &flash_cle
> +                  &flash_wrn &flash_rdn &flash_bus8>;
> +
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      nand@0 {
> +        reg = <0>;
> +        nand-ecc-mode = "hw";
> +        nand-ecc-strength = <16>;
> +        nand-ecc-step-size = <1024>;
> +        nand-bus-width = <8>;
> +      };
> +    };
> +
> +...
> -- 
> 2.17.1
> 
> 
> 
