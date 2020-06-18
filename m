Return-Path: <SRS0=Lhmw=77=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8344AC433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 02:29:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 65134214DB
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 02:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592447391;
	bh=Ql8ueXxwKGjULho/5xt7i6CcuTwXMfglJmbgJole2ME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=FkiQdTJyJXvaVKBEE90iYLRngKHLEHodV5wkvs6q/hljNTyFheJAyYBRe7qCCJSx1
	 o+sEgyFJFBzbYiYSLui49E49x/8mh4nJ5t7aSuUZiPhq/ehOA6hzgQsiRlajF6avzM
	 BF6O8Ec+/dkX/bQsHq0npBRsCSfuqa4qQHkeZgug=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729845AbgFRC3u (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 17 Jun 2020 22:29:50 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:44199 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728582AbgFRC3l (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 17 Jun 2020 22:29:41 -0400
Received: by mail-il1-f194.google.com with SMTP id i1so4298337ils.11;
        Wed, 17 Jun 2020 19:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZCBQcBw8kdOpNWXzPJKGBx0MRsMpwr5qi1B/q8rYLmQ=;
        b=sN/CGXXnUvfh+zNRHmNgjKIQNk4tOSyFQePA73hcy4avXMsJkhSLVOpaUpHHDMGOI8
         fz0qK++l2IUFmkMNu6N0mDj7kJL9Ey4imVf6lEiYyv2swrrblqhi3H7HK7h+d5fyQbr/
         HJ6vbNc202LqNzuSDt0l96HvVXvgxJ4xQzdD67pcDDr5A4WpVJyGDD6vGcGFjPclbkrR
         htYd6Hc5MT5zQbJvbg105DBHaIrR3iL4RaYElF/672sYINfQ+kdZvINvLvjhEKD0Gkjw
         Td6cEEX7x3YuJdKaPHrTqiGwWIeBBuWMKri22cmFTFo8f17lRe9t8cxjxMjrtLGBarJy
         7VFA==
X-Gm-Message-State: AOAM531XlA0mRAyKJkCinYSV1vA3RejMfKSLkmMlcP1+bFgL1/WgNBsV
        p0hcwJpLdhGNzhrXxEvHpw==
X-Google-Smtp-Source: ABdhPJwA2PH0XSJtNxsqwZvDt/8xctPTcytV7u+9Nk0sLiz7V5s2yYDRwNPfaTvYT7rBZMh1g+BEcg==
X-Received: by 2002:a92:280b:: with SMTP id l11mr1894740ilf.179.1592447380108;
        Wed, 17 Jun 2020 19:29:40 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id p11sm930798ioo.26.2020.06.17.19.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 19:29:39 -0700 (PDT)
Received: (nullmailer pid 3343731 invoked by uid 1000);
        Thu, 18 Jun 2020 02:29:38 -0000
Date:   Wed, 17 Jun 2020 20:29:38 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 09/38] dt-bindings: gpu: tegra: Convert to json-schema
Message-ID: <20200618022938.GA3333151@bogus>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-10-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200612141903.2391044-10-thierry.reding@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jun 12, 2020 at 04:18:34PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the NVIDIA Tegra GPU bindings from the previous free-form text
> format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/gpu/nvidia,gk20a.txt  |  90 ---------
>  .../devicetree/bindings/gpu/nvidia,gk20a.yaml | 189 ++++++++++++++++++
>  2 files changed, 189 insertions(+), 90 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
>  create mode 100644 Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml


> diff --git a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml
> new file mode 100644
> index 000000000000..726ef39b2221
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml
> @@ -0,0 +1,189 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/nvidia,gk20a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra Graphics Processing Units
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - nvidia,gk20a
> +          - nvidia,gm20b
> +          - nvidia,gp10b
> +
> +  reg:
> +    items:
> +      - description: base address and size for BAR0
> +      - description: base address and size for BAR1
> +
> +  interrupts:
> +    items:
> +      - description: stalling interrupt
> +      - description: non-stalling interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: stall
> +      - const: nonstall
> +
> +  clocks:
> +    minItems: 2
> +    maxItems: 3
> +    items:
> +      - description: GPU clock
> +      - description: PWR clock
> +      - description: REF clock
> +
> +  clock-names:
> +    minItems: 2
> +    maxItems: 3
> +    items:
> +      - const: gpu
> +      - const: pwr
> +      - const: ref
> +
> +  resets:
> +    items:
> +      - description: GPU reset
> +
> +  reset-names:
> +    minItems: 1
> +    maxItems: 1

You can drop minItems/maxItems. The tooling will add them based on 
'items' length if not specified.

> +    items:
> +      - const: gpu
> +
> +  power-domains:
> +    description: GPUs that make use of power domains can define this property
> +      instead of vdd-supply. Currently "nvidia,gp10b" makes use of this.

How many?

> +
> +  vdd-supply:
> +    description: GPU power supply.
> +
> +  iommus:
> +    description: The phandle of the IOMMU and the IOMMU specifier. See
> +      ../iommu/iommu.txt for details.
> +    $ref: "/schemas/types.yaml#/definitions/phandle-array"

Again, just need to define how many.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nvidia,gm20b
> +    then:
> +      required:
> +        - vdd-supply
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nvidia,gm20b
> +    then:
> +      properties:
> +        clock-names:
> +          minItems: 3
> +
> +      required:
> +        - vdd-supply
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: nvidia,gp10b
> +    then:
> +      required:
> +        - power-domains
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/tegra124-car.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/memory/tegra124-mc.h>
> +
> +    gpu@57000000 {
> +        compatible = "nvidia,gk20a";
> +        reg = <0x0 0x57000000 0x0 0x01000000>,
> +              <0x0 0x58000000 0x0 0x01000000>;

The default size is 1 cell each for examples. So either use that or add 
a parent node defining 2 cells.

> +        interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "stall", "nonstall";
> +        vdd-supply = <&vdd_gpu>;
> +        clocks = <&tegra_car TEGRA124_CLK_GPU>,
> +                 <&tegra_car TEGRA124_CLK_PLL_P_OUT5>;
> +        clock-names = "gpu", "pwr";
> +        resets = <&tegra_car 184>;
> +        reset-names = "gpu";
> +        iommus = <&mc TEGRA_SWGROUP_GPU>;
> +    };
> +
> +  - |
> +    #include <dt-bindings/clock/tegra210-car.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    /*
> +     * XXX can't include this because it conflicts with the tegra124-mc.h
> +     * include from the Tegra124 example above.
> +     */
> +    /*
> +    #include <dt-bindings/memory/tegra210-mc.h>
> +    */
> +
> +    gpu@57000000 {
> +        compatible = "nvidia,gm20b";
> +        reg = <0x0 0x57000000 0x0 0x01000000>,
> +              <0x0 0x58000000 0x0 0x01000000>;
> +        interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "stall", "nonstall";
> +        vdd-supply = <&vdd_gpu>;
> +        clocks = <&tegra_car TEGRA210_CLK_GPU>,
> +                 <&tegra_car TEGRA210_CLK_PLL_P_OUT5>,
> +                 <&tegra_car TEGRA210_CLK_PLL_G_REF>;
> +        clock-names = "gpu", "pwr", "ref";
> +        resets = <&tegra_car 184>;
> +        reset-names = "gpu";
> +        iommus = <&mc TEGRA_SWGROUP_GPU>;
> +    };
> +
> +  - |
> +    #include <dt-bindings/clock/tegra186-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/memory/tegra186-mc.h>
> +    #include <dt-bindings/power/tegra186-powergate.h>
> +    #include <dt-bindings/reset/tegra186-reset.h>
> +
> +    gpu@17000000 {
> +        compatible = "nvidia,gp10b";
> +        reg = <0x0 0x17000000 0x0 0x1000000>,
> +              <0x0 0x18000000 0x0 0x1000000>;
> +        interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "stall", "nonstall";
> +        clocks = <&bpmp TEGRA186_CLK_GPCCLK>,
> +                 <&bpmp TEGRA186_CLK_GPU>;
> +        clock-names = "gpu", "pwr";
> +        resets = <&bpmp TEGRA186_RESET_GPU>;
> +        reset-names = "gpu";
> +        power-domains = <&bpmp TEGRA186_POWER_DOMAIN_GPU>;
> +        iommus = <&smmu TEGRA186_SID_GPU>;
> +    };
> -- 
> 2.24.1
> 
