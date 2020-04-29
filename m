Return-Path: <SRS0=VloT=6N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D1D8C83003
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Apr 2020 08:53:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E08720775
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Apr 2020 08:53:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ukQXkZ1W"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726355AbgD2Ixf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Apr 2020 04:53:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726345AbgD2Ixf (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 29 Apr 2020 04:53:35 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A31C5C03C1AD
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2020 01:53:34 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id j2so1482603wrs.9
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2020 01:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MIh2ncJiTZhfe64QhwPMePJs/eQD84MVUzEErJCAjiA=;
        b=ukQXkZ1W6Y2M6mH1m2+aUdQA5J0SUy0PsWuRa0wektx13MB/62XG0d4PTieYldfCzh
         SfND5fo25WbH8JpkD39CWm7iclX2vg6Q8J5oh6Z3mAPcf+TNWIOkkE4VRoR3zuW0iZNO
         Oy16u/STlaTs6UqtpP8obGCiQ5NYi0roe81e23epdF5zSq84WdbUlfWscdNPgOLcW0Ji
         beiCh/FIPzTE47urFlLSoOyGhfA/20BSQGpVKmJVoxUzp6a6+yN3RRDMQ9KwhiCieEWq
         18UMOlkx641gYXz0KV3nzClb7iW3iPMk9rzJzZ10kvVtsq+bmSOFAq+QzRnflx3kOPUG
         SDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MIh2ncJiTZhfe64QhwPMePJs/eQD84MVUzEErJCAjiA=;
        b=iXValU6iFNPSSNH+zWGNBInMQQemX4hMfE6w6FipvWWLhCoUdQF7fkwOiFw6OX8W/R
         oU66kNJluIdjbahqGfcjGqY8F46qX9tY6KEir9w6ipt8caYqMuxBvsDLZ4716LJB0znB
         Am0wdwA1nNicnt2ahGLGcWnNr2oPuxS4VWUJdYCc65RSitsI3ozQ4yAmKy66AvzdEDbj
         rl/ROJoGslM/MYQ+msAEHuddEcSDW0G6GQ3LDwoRt7Sq+b6vpqnAtzPHPP9IXgLzXlK7
         GjLezUSVLE611Kbg/b7ciISPEQVFzJ+0Qt7wv7ozhDgsA4zHqZv1bNLPSmf4nk4HTvgY
         IERA==
X-Gm-Message-State: AGi0PuaI8x2NAFo9mBAz6dhaJjhO3QGo9cQZ0l8BNKY1CysPwj3kuGGz
        E0HjkgXb7vBj8XMe490NmOI=
X-Google-Smtp-Source: APiQypLUT1pkgcsuIiAPKNC1PvSAyJ/ek0HeKIDtu81ArgNglkqPdz7ylEH4zdRzcuS8Xj5mijy7qA==
X-Received: by 2002:adf:bb94:: with SMTP id q20mr41054561wrg.105.1588150413129;
        Wed, 29 Apr 2020 01:53:33 -0700 (PDT)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id e21sm30356499wrc.1.2020.04.29.01.53.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2020 01:53:32 -0700 (PDT)
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
Message-ID: <4a83e5d2-90cc-1db7-cdfd-47b7ceb4fcef@gmail.com>
Date:   Wed, 29 Apr 2020 10:53:30 +0200
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

Hi Yifeng,

> On Sun, Apr 26, 2020 at 06:02:44PM +0800, Yifeng Zhao wrote:
>> Documentation support for Rockchip RK3xxx NAND flash controllers
>> 
>> Signed-off-by: Yifeng Zhao <yifeng.zhao@rock-chips.com>
>> ---
>> 
>> Changes in v5:
>> - Fix some wrong define
>> - Add boot-medium define
>> - Remove some compatible define
>> 
>> Changes in v4:
>> - The compatible define with rkxx_nfc
>> - Add assigned-clocks
>> - Fix some wrong define
>> 
>> Changes in v3:
>> - Change the title for the dt-bindings
>> 
>> Changes in v2: None
>> 
>>  .../mtd/rockchip,nand-controller.yaml         | 124 ++++++++++++++++++
>>  1 file changed, 124 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml

The name of this file is based on Miquel's opinion, but the
compatibility strings, (for which robh has given a 'reviewed by' tag) in
version 4 don't fit with this format.

>> new file mode 100644
>> index 000000000000..12354c79d275
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
>> @@ -0,0 +1,124 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mtd/rockchip,nand-controller.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Rockchip SoCs NAND FLASH Controller (NFC)
>> +

>> +allOf:
>> +  - $ref: "nand-controller.yaml#"

The idea of a common file is that you add additional properties that are
not already included. This document has a more restricting character.
Therefore you must the same property names and patterns to be effective.
See comment about "^nand@[0-3]$".

>> +
>> +maintainers:
>> +  - Heiko Stuebner <heiko@sntech.de>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - rockchip,px30_nfc
>> +      - rockchip,rk3xxx_nfc

As told before the binding strings are SoC orientated.
Use the Soc first in line for V600 and replace
'rockchip,rk3xxx_nfc' by 'rockchip,rk3066-nfc'

>> +      - rockchip,rk3308_nfc
>> +      - rockchip,rv1108_nfc
> 
> Use '-', not '_'.
> 

In your driver there are currently 3 data sets:
V622, V800, V900
Each additional SoC will then use a fallback string.

properties:
  compatible:
    oneOf:
      - const: rockchip,px30-nfc
      - const: rockchip,rk3066-nfc
      - const: rockchip,rk3308-nfc
      - Item:
          - enum:
              - rockchip,rv1108-nfc
          - const: rockchip,rk3308-nfc

I propose to also include a V600 data set in the driver and an extra dts
entry for rk3288 to this serie. Add support for CS 8 to your driver.

properties:
  compatible:
    oneOf:
      - const: rockchip,px30-nfc
      - const: rockchip,rk3066-nfc
      - const: rockchip,rk3288-nfc
      - const: rockchip,rk3308-nfc
      - Item:
          - enum:
              - rockchip,rk3368-nfc
          - const: rockchip,rk3288-nfc
      - Item:
          - enum:
              - rockchip,rv1108-nfc
          - const: rockchip,rk3308-nfc


>> +
>> +  reg:

>> +    minItems: 1

Change this back to version 4:

    maxItems: 1

>> +
>> +  interrupts:

>> +    minItems: 1

Change this back to version 4:

    maxItems: 1

>> +
>> +  clocks:
>> +    minItems: 1
>> +    items:
>> +      - description: Bus Clock
>> +      - description: Module Clock
>> +
>> +  clock-names:
>> +    minItems: 1
> 
> So 'ahb' is required and 'nfc' is optional? That's what you defined, but 
> that seems backwards.

This is needed for rk3066 V600.

> 
>> +    items:
>> +      - const: ahb
>> +      - const: nfc
>> +

Also the use of allOf doesn't check for bogus properties without the use
of: 'additionalProperties: false'. Check this document by combining it
into a single file and add additionalProperties.

  assigned-clocks:
    maxItems: 1

  assigned-clock-rates:
    maxItems: 1

  pinctrl-0:
    maxItems: 1

  pinctrl-names:
    const: default

>> +patternProperties:

>> +  "^nand@[0-3]$":

In combination with $ref: "nand-controller.yaml#" you create 2 reg-exes.
One with:
"^nand@[0-3]$" + minimum 0 and maximum 3

A second with:
"^nand@[a-f0-9]$" + no restrictions

Result all pass, so use the same regex as in the common file.
Don't try to restrict both in the regex and in the reg properties.

>> +    type: object
>> +    properties:
>> +      reg:
>> +        minimum: 0
>> +        maximum: 3

V600 has CS 8.
Maybe use this if a V600 data set is included:

if:
  properties:
    compatible:
      contains:
        const: rockchip,rk3066-nfc

then:
      reg:
        minimum: 0
        maximum: 7

else:
      reg:
        minimum: 0
        maximum: 3

>> +
>> +      nand-ecc-mode:
>> +        const: hw
>> +
>> +      nand-ecc-step-size:
>> +        const: 1024
>> +
>> +      nand-ecc-strength:

>> +        enum: [16,24,40,60,70]

Add space             ^  ^  ^  ^

        enum: [16, 24, 40, 60, 70]

>> +
>> +      nand-bus-width:
>> +        const: 8
>> +

>> +      nand-is-boot-medium: true

Nothing changed. Already in nand-controller.yaml => remove

>> +
>> +      rockchip-boot-blks:
> 
> rockchip,boot-blks
> 
>> +        minimum: 2
>> +        default: 16
>> +        allOf:
>> +        - $ref: /schemas/types.yaml#/definitions/uint32
>> +        description:
>> +          For legacy devices where the bootrom can only handle 16/24 bit
>> +          BCH/ECC, and for some other devices where the bootrom can support
>> +          60/70 bit BCH/ECC.
>> +          In addition, when programming the loader, a linked list needs to

Could you use a better description?                          ^
Is this a bit, byte, word, pointer or custom and at what position?

>> +          be written in oob for Bootrom to read the correct data sequence.
>> +          If specified it indicates the number of erase blocks in use by
>> +          the bootloader that need a different BCH/ECC setting.
>> +          Only used in combination with 'nand-is-boot-medium'.

Could you disclose the flow/response of the bootrom if we hit a bad
block? Does it mark that block bad?

Describe why we have a minimum of 2 (1 standard + 1 spare block).
Does the bootrom for V600, V622 have a maximum from the software point
of view?

>> +
>> +      rockchip-boot-ecc-strength:
> 
> rockchip,boot-ecc-strength
> 
>> +        enum: [16,24,40,60,70]

Add space             ^  ^  ^  ^

        enum: [16, 24, 40, 60, 70]

>> +        description:
>> +          If specified it indicates that use a different BCH/ECC setting for
>> +          bootrom.

The phrase above is in need for some improvement.
Could an English speaker help here?

If specified it indicates that a different BCH/ECC setting is used by
the bootrom.

If specified it describes the BCH/ECC setting used by the bootrom.

>> +          Only used in combination with 'nand-is-boot-medium'.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/rk3308-cru.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    nfc: nand-controller@ff4b0000 {
>> +      compatible = "rockchip,rk3308_nfc";
>> +      reg = <0x0 0xff4b0000 0x0 0x4000>;
>> +      interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
>> +      clocks = <&cru HCLK_NANDC>, <&cru SCLK_NANDC>;
>> +      clock-names = "ahb", "nfc";
>> +      assigned-clocks = <&clks SCLK_NANDC>;
>> +      assigned-clock-rates = <150000000>;
>> +
>> +      pinctrl-0 = <&flash_ale &flash_bus8 &flash_cle &flash_csn0
>> +                   &flash_rdn &flash_rdy &flash_wrn>;
>> +      pinctrl-names = "default";
>> +
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
>> +
>> +      nand@0 {
>> +        reg = <0>;
>> +        nand-bus-width = <8>;
>> +        nand-ecc-mode = "hw";

>> +        nand-ecc-strength = <16>;
>> +        nand-ecc-step-size = <1024>;

sort

>> +        nand-is-boot-medium;
>> +        rockchip-boot-blks = <8>;
>> +        rockchip-boot-ecc-strength = <16>;
>> +      };
>> +    };
>> +
>> +...
>> -- 
>> 2.17.1
>> 
>> 
>>

