Return-Path: <SRS0=Uhz2=4B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3DCAC2BA83
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Feb 2020 13:21:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D06FD20873
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Feb 2020 13:21:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729588AbgBMNVp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 13 Feb 2020 08:21:45 -0500
Received: from foss.arm.com ([217.140.110.172]:46530 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729557AbgBMNVp (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 13 Feb 2020 08:21:45 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 958BA1FB;
        Thu, 13 Feb 2020 05:21:44 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 20A203F6CF;
        Thu, 13 Feb 2020 05:21:44 -0800 (PST)
Subject: Re: [PATCH 1/2] bus: Add DT bindings for Integrator/AP logical
 modules
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org
Cc:     devicetree@vger.kernel.org
References: <20200213124620.34982-1-linus.walleij@linaro.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <8dc141ce-d866-6a4b-48af-68c259461b5b@arm.com>
Date:   Thu, 13 Feb 2020 13:21:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200213124620.34982-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Linus,

On 13/02/2020 12:46 pm, Linus Walleij wrote:
> This adds YAML device tree bindings for the Integrator/AP
> logical modules. These are plug-in tiles used typically for
> FPGA prototyping.

Linguistic nit: s/logical/logic/g (for both patches)

> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>   .../bindings/bus/arm,integrator-ap-lm.yaml    | 89 +++++++++++++++++++
>   1 file changed, 89 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.yaml b/Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.yaml
> new file mode 100644
> index 000000000000..dfabfa466c05
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/arm,integrator-ap-lm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Integrator/AP Logical Module extension bus
> +
> +maintainers:
> +  - Linus Walleij <linusw@kernel.org>
> +
> +description: The Integrator/AP is a prototyping platform and as such has a
> +  site for stacking up to four logical modules (LM) designed specifically for
> +  use with this platform. A special system controller register can be read to
> +  determine if a logical module is connected at index 0, 1, 2 or 3. The logical
> +  module connector is described in this binding. The logical modules per se
> +  then have their own specific per-module bindings and they will be described
> +  as subnodes under this logical module extension bus.
> +
> +properties:
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 1
> +
> +  compatible:
> +    items:
> +      - const: arm,integrator-ap-lm
> +
> +  ranges: true
> +  dma-ranges: true
> +
> +patternProperties:
> +  "^.*@[0-3],[0-9a-f]+$":
> +    description: Nodes on the Logical Module bus represent logical modules
> +      and are named with index,relative-address. The first module is at
> +      0x00000000, the second at 0x10000000 and so on until the top of the
> +      memory of the system at 0xffffffff.
> +    type: object
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +    required:
> +      - compatible
> +
> +required:
> +  - compatible
> +
> +examples:
> +  - |
> +    external-bus@c0000000 {
> +      compatible = "arm,integrator-ap-lm";
> +      #address-cells = <2>;
> +      #size-cells = <1>;
> +      ranges = <0 0x0 0xc0000000 0x10000000>,
> +               <1 0x0 0xd0000000 0x10000000>,
> +               <2 0x0 0xe0000000 0x10000000>,
> +               <3 0x0 0xf0000000 0x10000000>;
> +      dma-ranges = <0 0x0 0xc0000000 0x10000000>,
> +               <1 0x0 0xd0000000 0x10000000>,
> +               <2 0x0 0xe0000000 0x10000000>,
> +               <3 0x0 0xf0000000 0x10000000>;

Is that dma-ranges mapping definitely appropriate? My impression from 
skimming the AP manual is that logic module masters would all see SDRAM 
through the 2GB-3GB alias region, independent of how their slaves are 
decoding incoming accesses. Even in the case of peer-to-peer accesses 
between logic modules, I'd imagine that the process of obtaining the 
target address to program would inherently go through the "ranges" 
translation and result in an 'absolute' PA anyway.

Robin.

> +      im-pd1@0,0 {
> +        compatible = "simple-bus";
> +        ranges = <0 0 0 0x10000000>;
> +        dma-ranges = <0 0 0 0x10000000>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        uart@c0100000 {
> +          compatible = "arm,pl011", "arm,primecell";
> +          reg = <0x00100000 0x1000>;
> +          interrupts-extended = <&impd1_vic 1>;
> +        };
> +
> +        impd1_vic: interrupt-controller@c3000000 {
> +          compatible = "arm,pl192-vic";
> +          interrupt-controller;
> +          #interrupt-cells = <1>;
> +          reg = <0x03000000 0x1000>;
> +          valid-mask = <0x00000bff>;
> +          interrupts-extended = <&pic 9>;
> +        };
> +      };
> +    };
> +
> +additionalProperties: false
> 
