Return-Path: <SRS0=WWXW=5F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C0BDC4332D
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Mar 2020 15:32:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EBEA720752
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Mar 2020 15:32:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0eW+4oX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbgCTPcb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Mar 2020 11:32:31 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36643 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726847AbgCTPcb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 20 Mar 2020 11:32:31 -0400
Received: by mail-wr1-f65.google.com with SMTP id 31so2004098wrs.3
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2020 08:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qI/ekdQ6NTichE/0bKB1Vdtlur7rri+ctDd3zV+FIfo=;
        b=C0eW+4oXk9jMixKjJqNYE67jbhCwvTa4xW5hkvSdPdhlRJXZWVToo+RexnVeIytMbP
         pIC4eEFNz6Rk40YlzT3e4xgxw8si4L4WUlDUmQ7a3ZQ93fbu0XSH9prtaNNNhnHFZ23P
         uAAUtWvqvi8iNbMnw9NHcXec+QHUiRmrmOxHK7LMXYls79wCkSFfiTb6paIep5s1UnCs
         19/EylMcXuF28iTHHz1RK4XZR+hQAL/FUfv4u+46cuSQenadDfyjd7c1MM16EdEy4jz1
         v1Db8X+lwMn1av7BSFhl4ursrk6ST0cvEyENIMiVcw66CWpRFVcQ6gNeOFnmC6TuyqV6
         zWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qI/ekdQ6NTichE/0bKB1Vdtlur7rri+ctDd3zV+FIfo=;
        b=RV3NTrjHw/IE5W1IkF5yjXVbgQzZkmCk9dl8DFZeYpYmx5iqLH562+iRhlCLuNlWbU
         jECZMsWaYt23HhFwAA4U77uQw/c7pZJ7UVUNXH9XCEGn5LNaxazVvQ/yfj06wzgFv2q3
         oVEvLVtYsTjJF12zkNKjVDbIh7swh9DQviHrVKrjFEP8VNPAD+1m+TRwrtxe9Z48g3Er
         iKuVbdHcttz4oBVth/CQMs+8ZPsdaByE0iWUXLmZScxROlwcAzchmKt+/rP7fYbcpcQm
         eEUGsgh9eZWbMKihNAf+VipK+6Pnk/kpCEc/wGGtI9bVq5TvTOFqhMS6pzp837O9Cb0I
         Xu2w==
X-Gm-Message-State: ANhLgQ3+GloWzthixv2gMFBm2CcR28P0yaJdtZfGTJOpPOZECWic4BJH
        Z8HPQZxT2iQEOpRDaYs1MV1uPnov
X-Google-Smtp-Source: ADFU+vu8yLS6TGTVOmF+EOqWYa35tmQ5sLhPHUdj4QgcnYPcd0D6HZKHb0jhGTV1cyG9yEo6HMUj8A==
X-Received: by 2002:adf:dc4f:: with SMTP id m15mr12438120wrj.219.1584718348812;
        Fri, 20 Mar 2020 08:32:28 -0700 (PDT)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id b15sm8612688wru.70.2020.03.20.08.32.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2020 08:32:28 -0700 (PDT)
Subject: Re: [PATCH v4 2/3] dt-bindings: mtd: Describe Rockchip RK3xxx NAND
 flash controller
To:     Yifeng Zhao <yifeng.zhao@rock-chips.com>,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        heiko@sntech.de, linux-rockchip@lists.infradead.org
References: <20200320093342.15470-1-yifeng.zhao@rock-chips.com>
 <20200320093342.15470-3-yifeng.zhao@rock-chips.com>
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <3352edf3-7951-8760-7ee2-0cffa77a8bf8@gmail.com>
Date:   Fri, 20 Mar 2020 16:32:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200320093342.15470-3-yifeng.zhao@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Yifeng,

Déjà vu.

The Documentation/ portion of the patch should come in the series before
the code implementing the binding.

cover letter
binding
driver
dts patches

Test with linux-next for MAINTAINER patch. It has changed.

git clone -- depth 1
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

Also include all mail lists found with:
./scripts/get_maintainer.pl --nogit-fallback --nogit

On 3/20/20 10:33 AM, Yifeng Zhao wrote:
> Documentation support for Rockchip RK3xxx NAND flash controllers
>
> Signed-off-by: Yifeng Zhao <yifeng.zhao@rock-chips.com>
> ---
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
>  .../bindings/mtd/rockchip,nand.yaml           | 101 ++++++++++++++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644
Documentation/devicetree/bindings/mtd/rockchip,nand.yaml
>

> diff --git a/Documentation/devicetree/bindings/mtd/rockchip,nand.yaml
b/Documentation/devicetree/bindings/mtd/rockchip,nand.yaml

I think rockchip,nand-controller.yaml is preferred.
A driver named rockchip-nand-controller.c would be nice!
See comments on my previous series by Miquel Raynal.

> new file mode 100644
> index 000000000000..907af0d52b6b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/rockchip,nand.yaml
> @@ -0,0 +1,101 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/rockchip,nand.yaml#

rockchip,nand-controller.yaml#

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +

> +title: Rockchip SoCs NAND FLASH Controller (NFC) Device Tree Bindings

Maybe change to:

title: Rockchip SoCs NAND FLASH Controller (NFC)

> +
> +allOf:
> +  - $ref: "nand-controller.yaml"

Add #

  - $ref: "nand-controller.yaml#"

> +
> +maintainers:

> +  - Yifeng Zhao <yifeng.zhao@rock-chips.com>

Add only people with maintainers rights.

- Heiko Stuebner <heiko@sntech.de>

> +
> +properties:

> +  "#address-cells": true
> +  "#size-cells": true

Already in nand-controller.yaml

> +
> +  compatible:
> +    enum:

> +      - rockchip,px30_nfc
> +      - rockchip,rk3308_nfc
> +      - rockchip,rv1108_nfc
> +      - rockchip,rk3066_nfc
> +      - rockchip,rk3188_nfc
> +      - rockchip,rk3288_nfc
> +      - rockchip,rk3368_nfc
> +      - rockchip,rk2928_nfc
> +      - rockchip,rk3036_nfc
> +      - rockchip,rk3128_nfc
> +      - rockchip,rk3228_nfc

sort/format
Ask robh for exact format.

- rockchip,rk3066-nand-controller


Also add dtsi patches in this serie for supported SoCs in main kernel,
so we can check them with yaml

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:

minItems: 1

> +    items:

> +      - description: Module Clock
> +      - description: Bus Clock

swap
rk3066 only has ahb
Change this also in source!

- description: Bus Clock
- description: Module Clock

> +
> +  clock-names:

minItems: 1

> +    items:

> +      - const: nfc
> +      - const: ahb

swap
rk3066 only has ahb

- const: ahb
- const: nfc

> +
> +patternProperties:

> +  "^nand@[0-3]$":

Use same name as in nand-controller.yaml for inheritance?

  "^nand@[a-f0-9]$":

> +    type: object
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 3
> +

nand-ecc-mode?

> +      nand-ecc-step-size:
> +        const: 1024
> +
> +      nand-ecc-strength:
> +        enum: [16, 24 , 40, 60, 70]

remove space            ^

> +
> +      nand-bus-width:
> +        const: 8

rk3066 needs lower bch for r/w idb
add info about idb blocks used as variable instead of fixed to 8.
Change this also in source!
For example:

+
+      nand-is-boot-medium: true
+

+      rockchip,boot-blks:

suggestion from robh.
See comments on my previous series.

+        minimum: 2
+        default: 16
+        allOf:
+        - $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          For legacy devices where the bootrom can only handle 24 bit
BCH/ECC.
+          If specified it indicates the number of erase blocks in use by
+          the bootloader that need a lower BCH/ECC setting.
+          Only used in combination with 'nand-is-boot-medium'.

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

sort
    #include <dt-bindings/clock/rk3308-cru.h>
    #include <dt-bindings/interrupt-controller/arm-gic.h>

> +    nfc: nand-controller@ff4b0000 {
> +      compatible = "rockchip,nfc";

use real compatible else no check

> +      reg = <0x0 0xff4b0000 0x0 0x4000>;
> +      interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;

> +      clocks = <&cru SCLK_NANDC>, <&cru HCLK_NANDC>;

swap

> +      clock-names = "nfc", "ahb";

swap

> +      assigned-clocks = <&clks SCLK_NANDC>;
> +      assigned-clock-rates = <150000000>;
> +

> +      pinctrl-names = "default";

pinctrl-names below pinctrl-0

> +      pinctrl-0 = <&flash_csn0 &flash_rdy &flash_ale &flash_cle
> +                  &flash_wrn &flash_rdn &flash_bus8>;

sort/align

> +
> +      #address-cells = <1>;
> +      #size-cells = <0>;

space

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
