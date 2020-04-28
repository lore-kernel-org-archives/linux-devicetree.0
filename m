Return-Path: <SRS0=DpSr=6M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC85CC83000
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 15:02:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4B78206D8
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 15:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588086122;
	bh=6x+UZ6V/SdIgIn+9vHHlwHC1qPYIDnNB0VnY5WyUnaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=qW3BA1YS00arar+FCm2k3X7COv/3aSr3OGfLWvAOgXJIKEzMArJJuxt+Z0iffHb17
	 EajPEjtQILWk5is/W9FkIVo6E0l0BbQA+qRzr2AYp7dblJnVsdwNRlFh8Fc7wTGuRK
	 9AZNcXn9htUU4Q270MC6cA7CVdimFOt8x90YxsDg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727909AbgD1PCC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Apr 2020 11:02:02 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45836 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727775AbgD1PCC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 Apr 2020 11:02:02 -0400
Received: by mail-ot1-f65.google.com with SMTP id e20so33099525otk.12
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2020 08:02:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wOI9PIo4Vv58y4bLuibA+NO+boXaHkpAOHjuVZfrPc0=;
        b=qxSrD8qlJf9Icm1nrXHGsp1ZPSVWLzvwGSEWpEGqVC/8m8/+oe1VuUnQKtteKVZ7kq
         y7Nl/TOWk7DvyZpVP1jV2hikrXbr1L4i2tqAHdJmmfIRR3VMS7cZIdGakS8rsGRvgca/
         RbryVxanCYSjpQIYXnatXsj5wBJ340vrVCm4EPLwHoSkEMc4WIfWMDMhf3AxhzWxPjH4
         A3NwXOsLbpnKUopsx5Jyk2+lSKU1l+oceOHJE15Dd7PCDS956bsUtctagm1NSXUdAeT4
         DzPqjFBotPQ95HWalIi6KtZIo/CXjP12/498M/282FzJt+BQlUCC6cisbdjhZ46StaVw
         nD2Q==
X-Gm-Message-State: AGi0PuandeKuqJixWhmECyDpeBb8OwR3felYibJqDkfk3bueUYYyQIYw
        VJZvZB0ae88fCfFknjE1RfVoxWI=
X-Google-Smtp-Source: APiQypJK7qFctMTLFR8DSjEYZq7y7xzYxXBG62Fek7g2Ha9ba/gioZYH8A5qLU9mePcqJJgbr3yD1w==
X-Received: by 2002:aca:4a4c:: with SMTP id x73mr3328980oia.162.1588086120621;
        Tue, 28 Apr 2020 08:02:00 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v8sm2648797otb.50.2020.04.28.08.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 08:02:00 -0700 (PDT)
Received: (nullmailer pid 19290 invoked by uid 1000);
        Tue, 28 Apr 2020 15:01:58 -0000
Date:   Tue, 28 Apr 2020 10:01:58 -0500
From:   Rob Herring <robh@kernel.org>
To:     Yifeng Zhao <yifeng.zhao@rock-chips.com>
Cc:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        heiko@sntech.de, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 1/7] dt-bindings: mtd: Describe Rockchip RK3xxx NAND
 flash controller
Message-ID: <20200428150158.GA12189@bogus>
References: <20200426100250.14678-1-yifeng.zhao@rock-chips.com>
 <20200426100250.14678-2-yifeng.zhao@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200426100250.14678-2-yifeng.zhao@rock-chips.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Apr 26, 2020 at 06:02:44PM +0800, Yifeng Zhao wrote:
> Documentation support for Rockchip RK3xxx NAND flash controllers
> 
> Signed-off-by: Yifeng Zhao <yifeng.zhao@rock-chips.com>
> ---
> 
> Changes in v5:
> - Fix some wrong define
> - Add boot-medium define
> - Remove some compatible define
> 
> Changes in v4:
> - The compatible define with rkxx_nfc
> - Add assigned-clocks
> - Fix some wrong define
> 
> Changes in v3:
> - Change the title for the dt-bindings
> 
> Changes in v2: None
> 
>  .../mtd/rockchip,nand-controller.yaml         | 124 ++++++++++++++++++
>  1 file changed, 124 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
> new file mode 100644
> index 000000000000..12354c79d275
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
> @@ -0,0 +1,124 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/rockchip,nand-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip SoCs NAND FLASH Controller (NFC)
> +
> +allOf:
> +  - $ref: "nand-controller.yaml#"
> +
> +maintainers:
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - rockchip,px30_nfc
> +      - rockchip,rk3xxx_nfc
> +      - rockchip,rk3308_nfc
> +      - rockchip,rv1108_nfc

Use '-', not '_'.

> +
> +  reg:
> +    minItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    items:
> +      - description: Bus Clock
> +      - description: Module Clock
> +
> +  clock-names:
> +    minItems: 1

So 'ahb' is required and 'nfc' is optional? That's what you defined, but 
that seems backwards.

> +    items:
> +      - const: ahb
> +      - const: nfc
> +
> +patternProperties:
> +  "^nand@[0-3]$":
> +    type: object
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 3
> +
> +      nand-ecc-mode:
> +        const: hw
> +
> +      nand-ecc-step-size:
> +        const: 1024
> +
> +      nand-ecc-strength:
> +        enum: [16,24,40,60,70]
> +
> +      nand-bus-width:
> +        const: 8
> +
> +      nand-is-boot-medium: true
> +
> +      rockchip-boot-blks:

rockchip,boot-blks

> +        minimum: 2
> +        default: 16
> +        allOf:
> +        - $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          For legacy devices where the bootrom can only handle 16/24 bit
> +          BCH/ECC, and for some other devices where the bootrom can support
> +          60/70 bit BCH/ECC.
> +          In addition, when programming the loader, a linked list needs to
> +          be written in oob for Bootrom to read the correct data sequence.
> +          If specified it indicates the number of erase blocks in use by
> +          the bootloader that need a different BCH/ECC setting.
> +          Only used in combination with 'nand-is-boot-medium'.
> +
> +      rockchip-boot-ecc-strength:

rockchip,boot-ecc-strength

> +        enum: [16,24,40,60,70]
> +        description:
> +          If specified it indicates that use a different BCH/ECC setting for
> +          bootrom.
> +          Only used in combination with 'nand-is-boot-medium'.
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
> +    #include <dt-bindings/clock/rk3308-cru.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    nfc: nand-controller@ff4b0000 {
> +      compatible = "rockchip,rk3308_nfc";
> +      reg = <0x0 0xff4b0000 0x0 0x4000>;
> +      interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
> +      clocks = <&cru HCLK_NANDC>, <&cru SCLK_NANDC>;
> +      clock-names = "ahb", "nfc";
> +      assigned-clocks = <&clks SCLK_NANDC>;
> +      assigned-clock-rates = <150000000>;
> +
> +      pinctrl-0 = <&flash_ale &flash_bus8 &flash_cle &flash_csn0
> +                   &flash_rdn &flash_rdy &flash_wrn>;
> +      pinctrl-names = "default";
> +
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      nand@0 {
> +        reg = <0>;
> +        nand-bus-width = <8>;
> +        nand-ecc-mode = "hw";
> +        nand-ecc-strength = <16>;
> +        nand-ecc-step-size = <1024>;
> +        nand-is-boot-medium;
> +        rockchip-boot-blks = <8>;
> +        rockchip-boot-ecc-strength = <16>;
> +      };
> +    };
> +
> +...
> -- 
> 2.17.1
> 
> 
> 
