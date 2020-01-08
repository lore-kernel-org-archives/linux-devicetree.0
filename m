Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C75CDC282DD
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 16:19:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 906DC20678
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 16:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578500385;
	bh=/39izkODKBo26z3TEC3WYKBvZOZjcdYAwjKa6J8z5Eg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=YlBRz9lz1wQUmQhWCrsjL5LU7ceyfPy2Y9gf2vmoU8FKhd41Kx73IWZHFxK/G4Odb
	 vjcfY01P2lSEpNemqtnnPtHtILH5+dWD82Vj1mAupK67bfd/0y5fGx9O0xBiCsUjl3
	 DbSpPaOznVxC20F7ROv3EbHR0QcLI2+qUuqvoeH4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727370AbgAHQTp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 11:19:45 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:44551 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727275AbgAHQTp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 11:19:45 -0500
Received: by mail-oi1-f193.google.com with SMTP id d62so3080399oia.11
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 08:19:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GYY2CiFdIkACfo5Jd98wndqawL1c3UoSR/a/rU3NP9U=;
        b=Ae/fXQM+gKmNK98xUPBbTRixm/9M5Yrtyw4ZhkdeuRfIhnJbHL6jkmxNfiCTNDTHpC
         Kz2Mzpu/Jx3G2RgetGYapIMRooE7PyvprwLhhbVrOqSL2jwHJtOwCUvwhcjVOu8vAWZ/
         yR71bAVgYd8YPppF8QlL7MVsjXOyf16N/iMDbFnCWMqynzajFjzOmKTSnSbUIuEuyKwp
         89WTgOjEnFrGY1zVISfRSHAK3HcyPsW7ei3f1AkIYlnbgIGix3gWUX/iKCMZwzlFdDLy
         pHepDvlCUm8hqLPM7Amyovb8VB5EUKYrj9VQOh1KmZVyO0cW31gmlsPKwFvKthDyQDuC
         jzZQ==
X-Gm-Message-State: APjAAAV4Ypuro9Q61eCob7OsZrHu6I7CL1kxk7+QKd1Uphzh9FKeTEUs
        8oar05K4PBAJVwrfZXvX/+s66Wk=
X-Google-Smtp-Source: APXvYqyhxeyb8gufihqmHd/6heKn2vBuB+CpcWvA/Z6zmttwF0MGgnWZ1Ri8V/ffbJNk33ePCbQGQw==
X-Received: by 2002:aca:3255:: with SMTP id y82mr3517308oiy.41.1578500383430;
        Wed, 08 Jan 2020 08:19:43 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f142sm1200395oig.48.2020.01.08.08.19.42
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 08:19:42 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22001a
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 10:19:41 -0600
Date:   Wed, 8 Jan 2020 10:19:41 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 03/13] dt-bindings: memory: Add Tegra186 memory subsystem
Message-ID: <20200108161941.GA10276@bogus>
References: <20191222141035.1649937-1-thierry.reding@gmail.com>
 <20191222141035.1649937-4-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191222141035.1649937-4-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Dec 22, 2019 at 03:10:25PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The NVIDIA Tegra186 SoC contains a memory subsystem composed of the
> memory controller and the external memory controller. The memory
> controller provides interfaces for the memory clients to access the
> memory. Accesses can be either bounced through the SMMU for IOVA
> translation or directly to the EMC.
> 
> The bulk of the programming of the external memory controller happens
> through interfaces exposed by the BPMP. Describe this relationship by
> adding a phandle reference to the BPMP to the EMC node.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../nvidia,tegra186-mc.yaml                   | 130 ++++++++++++++++++
>  1 file changed, 130 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
> new file mode 100644
> index 000000000000..b98a1d03410b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
> @@ -0,0 +1,130 @@
> +# SPDX-License-Identifier: (GPL-2.0)

Dual license new bindings:

(GPL-2.0-only OR BSD-2-Clause)

Though maybe this is a copy-n-paste of the other Tegra MC bindings?

With that sorted,

Reviewed-by: Rob Herring <robh@kernel.org>

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra186-mc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra186 (and later) SoC Memory Controller
> +
> +maintainers:
> +  - Jon Hunter <jonathanh@nvidia.com>
> +  - Thierry Reding <thierry.reding@gmail.com>
> +
> +description: |
> +  The NVIDIA Tegra186 SoC features a 128 bit memory controller that is split
> +  into four 32 bit channels to support LPDDR4 with x16 subpartitions. The MC
> +  handles memory requests for 40-bit virtual addresses from internal clients
> +  and arbitrates among them to allocate memory bandwidth.
> +
> +  Up to 15 GiB of physical memory can be supported. Security features such as
> +  encryption of traffic to and from DRAM via general security apertures are
> +  available for video and other secure applications, as well as DRAM ECC for
> +  automotive safety applications (single bit error correction and double bit
> +  error detection).
> +
> +properties:
> +  $nodename:
> +    pattern: "^memory-controller@[0-9a-f]+$"
> +
> +  compatible:
> +    items:
> +      - enum:
> +          - nvidia,tegra186-mc
> +          - nvidia,tegra194-mc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2
> +
> +  ranges: true
> +
> +  dma-ranges: true
> +
> +patternProperties:
> +  "^external-memory-controller@[0-9a-f]+$":
> +    description:
> +      The bulk of the work involved in controlling the external memory
> +      controller on NVIDIA Tegra186 and later is performed on the BPMP. This
> +      coprocessor exposes the EMC clock that is used to set the frequency at
> +      which the external memory is clocked and a remote procedure call that
> +      can be used to obtain the set of available frequencies.
> +    type: object
> +    properties:
> +      compatible:
> +        items:
> +          - enum:
> +              - nvidia,tegra186-emc
> +              - nvidia,tegra194-emc
> +
> +      reg:
> +        maxItems: 1
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      clocks:
> +        items:
> +          - description: external memory clock
> +
> +      clock-names:
> +        items:
> +          - const: emc
> +
> +      nvidia,bpmp:
> +        $ref: /schemas/types.yaml#/definitions/phandle
> +        description:
> +          phandle of the node representing the BPMP
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/tegra186-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    memory-controller@2c00000 {
> +        compatible = "nvidia,tegra186-mc";
> +        reg = <0x0 0x02c00000 0x0 0xb0000>;
> +        interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        ranges = <0x0 0x02c00000 0x02c00000 0x0 0xb0000>;
> +
> +        /*
> +         * Memory clients have access to all 40 bits that the memory
> +         * controller can address.
> +         */
> +        dma-ranges = <0x0 0x0 0x0 0x0 0x100 0x0>;
> +
> +        external-memory-controller@2c60000 {
> +            compatible = "nvidia,tegra186-emc";
> +            reg = <0x0 0x02c60000 0x0 0x50000>;
> +            interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&bpmp TEGRA186_CLK_EMC>;
> +            clock-names = "emc";
> +
> +            nvidia,bpmp = <&bpmp>;
> +        };
> +    };
> +
> +    bpmp: bpmp {
> +        compatible = "nvidia,tegra186-bpmp";
> +        #clock-cells = <1>;
> +    };
> -- 
> 2.24.1
> 
