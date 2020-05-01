Return-Path: <SRS0=mas4=6P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09530C4724C
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 May 2020 11:47:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C75A5208C3
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 May 2020 11:47:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TqZeZSiO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728585AbgEALrQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 1 May 2020 07:47:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728575AbgEALrP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 1 May 2020 07:47:15 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28BF9C061A0C
        for <devicetree@vger.kernel.org>; Fri,  1 May 2020 04:47:15 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id o27so5931691wra.12
        for <devicetree@vger.kernel.org>; Fri, 01 May 2020 04:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xo1dT02hGRiPFzY3eBXdVCxmAoUqM5/6Yn1Y8PrP+Ww=;
        b=TqZeZSiOAsHc5FLDPNSpJsPHo9EQYQvO8INJw1wWzkHrWiQtbjW8afI8wkeec7yrEg
         G54ovWDnCM3NtMr6eWoIAnycIdcGiXhxRFZ/o3lnz7h3l5KlV7YfagzPPggSDEKIJM5g
         6yWmQs9KrXYoecKJ0ZBFqu7LiRQd/fAuZzQzIHTrtf60Efjw0ZBtWdE4OB3drn8TmQct
         QDj1t9xRnhDJjJW9KjZ5s/XKZ/giVaTnKyDRagmRcVxI6pJq+UDPIMlH4/vs/w6kshIk
         XnxeAj/o0dMRgXG7vKQcQJqHOSdhw5c05Lz0fwtP0dTkiEU6L3S53J8RiXU2ImdDNjGO
         UV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xo1dT02hGRiPFzY3eBXdVCxmAoUqM5/6Yn1Y8PrP+Ww=;
        b=LTRJRGTeGHICLEa0p87R+puKcXslCkuqbSdDOV7i+iBCJ1qlhNQG7UGRImYzHkgtvN
         qd0uyr+YHc3ZvDB14SuySIHjUUld1WFGsIrQ6BLG7WRf0r6eCzjqjAmb4Jfts8/kE4lS
         b/NWKDB9+wd6CmXoZu10SgW1C6bdw/xzdy5NNBLB2545/D525uGVsGV4Lb01hnUTo9wO
         9HrVyrRpp+M0PNc691dIAiOqfoX4cOzrORFeHGHExNzkB49liuIoQbystSI31uC0koZF
         egRQTmb90acTf+ndH1HXB55DCqd5THxJ3yIpYayF+v5hmA7d94q+VLdaU/axmPSx7mtk
         FVOA==
X-Gm-Message-State: AGi0Pualm8II4lxzinC1/a1M9ifdGf91Ps+WPBusg15EnN2XeJ0tIq+1
        qoOw9udZuqEH6Af/rSyBevU=
X-Google-Smtp-Source: APiQypKQbDlmTK/R8L0A3VTFGCrv8t738DJ/qpLciws+3N4cLRpdshoQuOeLg/kNqSWJTKy3UU5mpg==
X-Received: by 2002:adf:bd83:: with SMTP id l3mr2298586wrh.317.1588333633707;
        Fri, 01 May 2020 04:47:13 -0700 (PDT)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id j13sm4028374wrx.5.2020.05.01.04.47.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2020 04:47:13 -0700 (PDT)
Subject: Re: [PATCH v5 1/7] dt-bindings: mtd: Describe Rockchip RK3xxx NAND
 flash controller
To:     Yifeng Zhao <yifeng.zhao@rock-chips.com>,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        heiko@sntech.de, linux-rockchip@lists.infradead.org
References: <20200426100250.14678-1-yifeng.zhao@rock-chips.com>
 <20200426100250.14678-2-yifeng.zhao@rock-chips.com>
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <6e5fefa2-1f19-a425-b696-e6e72e25c2d9@gmail.com>
Date:   Fri, 1 May 2020 13:47:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200426100250.14678-2-yifeng.zhao@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Yifeng, Heiko,

A few more comments based on version 5 (part 2).

On 4/26/20 12:02 PM, Yifeng Zhao wrote:
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

Based on what's available in mainline and your info.
For Heiko? Is this correct?

  compatible:
    oneOf:
      - const: rockchip,px30-nfc
      - const: rockchip,rk2928-nfc
      - const: rockchip,rk3308-nfc
      - items:
          - const: rockchip,rk3326-nfc
          - const: rockchip,px30-nfc
      - items:
          - enum:
              - rockchip,rk3036-nfc
              - rockchip,rk3228-nfc
              - rockchip,rk3288-nfc
          - const: rockchip,rk2928-nfc
      - items:
          - const: rockchip,rv1108-nfc
          - const: rockchip,rk3308-nfc

static const struct of_device_id rk_nfc_id_table[] = {
	{.compatible = "rockchip,px30_nfc",   .data = &nfc_v9_cfg },
	{.compatible = "rockchip,rk2928-nfc", .data = &nfc_v6_cfg },
	{.compatible = "rockchip,rk3308_nfc", .data = &nfc_v8_cfg },
	{ /* sentinel */ },
};

> +
> +  reg:
> +    minItems: 1

    maxItems: 1

> +
> +  interrupts:
> +    minItems: 1

    maxItems: 1

> +
> +  clocks:
> +    minItems: 1
> +    items:
> +      - description: Bus Clock
> +      - description: Module Clock
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: ahb
> +      - const: nfc

  assigned-clocks:
    maxItems: 1

  assigned-clock-rates:
    maxItems: 1

  pinctrl-0:
    maxItems: 1

  pinctrl-names:
    const: default

  power-domains:
     maxItems: 1

'power-domains' is needed for px30.

> +
> +patternProperties:
> +  "^nand@[0-3]$":

        "^nand@[0-7]$":
or?
        "^nand@[a-f0-9]$":

> +    type: object
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 3

           maximum: 7

> +
> +      nand-ecc-mode:
> +        const: hw
> +
> +      nand-ecc-step-size:
> +        const: 1024
> +
> +      nand-ecc-strength:
> +        enum: [16,24,40,60,70]

Not every SoC has the same array. Add description maybe.

> +
> +      nand-bus-width:
> +        const: 8
> +

> +      nand-is-boot-medium: true
> +

?
With 2 regexes nand-is-boot-medium is maybe needed, but I'm not able to
successful test that with a common file? Keep or not?
?
          dependencies:
            rockchip,boot-blks: [ nand-is-boot-medium ]
            rockchip,boot-ecc-strength: [ nand-is-boot-medium ]

> +      rockchip-boot-blks:

rockchip,boot-blks:

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
> +        enum: [16,24,40,60,70]

Not every SoC has the same array. Add description maybe.

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

      compatible = "rockchip,rk3308-nfc";

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

TEST1:

Change this in the example:

      nand@4 {
        reg = <4>;

make ARCH=arm64 dt_binding_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml

Result: nothing

TEST2:

Change "^nand@[0-3]$" to "^nand@[a-f0-9]$"

make ARCH=arm64 dt_binding_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml

Result:

Documentation/devicetree/bindings/mtd/rockchip,nand-controller.example.dt.yaml:
nand-controller@ff4b0000: nand@4:reg:0:0: 4 is greater than the maximum of 3
  SCHEMA  Documentation/devicetree/bindings/processed-schema.yaml

Conclusion:

?

> +        nand-bus-width = <8>;
> +        nand-ecc-mode = "hw";
> +        nand-ecc-strength = <16>;
> +        nand-ecc-step-size = <1024>;
> +        nand-is-boot-medium;

> +        rockchip-boot-blks = <8>;
> +        rockchip-boot-ecc-strength = <16>;

        rockchip,boot-blks = <8>;
        rockchip,boot-ecc-strength = <16>;

> +      };
> +    };
> +
> +...
> 

