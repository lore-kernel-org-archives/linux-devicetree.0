Return-Path: <SRS0=UIXH=76=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F8BC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 22:49:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1DDD621556
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 22:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592434159;
	bh=10R855twqRbX1ngbQpDBDNZ15Uv2qmPA3BwbhhubiTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=OxtxxRck4kK9XRfYPor6D5SmF52ynGH3Q1Lrgw4Jsu8+rJ7tKS7rDPyLF+UZEMCZn
	 v5ZO0GZ+qWN/Yo0Uoo/RTPBiSw1n6pVf4zdbEV1+01UbX5qDb/hWqo8uUFC6je0ifM
	 kIyOlLRNYCYZ7ALAZANdJQXDuSXcE79BXdMedggA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726868AbgFQWtS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 17 Jun 2020 18:49:18 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:37575 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726840AbgFQWtS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 17 Jun 2020 18:49:18 -0400
Received: by mail-io1-f68.google.com with SMTP id r2so4908812ioo.4;
        Wed, 17 Jun 2020 15:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QigeAS457+5JbnKyqceb7A/VSpOK6TigkkKcUHNI7RU=;
        b=DpcV1XfHRE8FNkZW1F6rFycRzfHH+DKRTNlAlIK34OENXK7KGQdYJ3nvoE+VSpSS14
         pgwfOzX1J2EO9eRLtK2USh06DYbxb8g5UH3/t1/sGOGnooGdwrlTTT7T8g5QYejRLNU7
         IDmMbvaqGMSruxII0rVkfKsRbRXVRito36lAnGWzPlA4lrxnINEC+31KfJqoQU7fQv24
         FZj5c3bUGXZv1cQvj7zH7+/fkFbqgyvMQZVXY/KiqTz1FKG5D/w2fN0v7u5JnTArVTz2
         pIPNEdqWA1IyVqb9D1jtTktJ2uYGMksNDevgOP+LOtUHujgGqWgeczSULQ9eA6KTwLTD
         XVmg==
X-Gm-Message-State: AOAM531/PKrlr4f8X4Qn9bT0KWK8FuP2XgBPoKuuccSLPP7iceFzhkBs
        YQNAXHwgIq9q4kj2YNJuD8MLKWHb7Q==
X-Google-Smtp-Source: ABdhPJxp/kUq578hjZ8jpF4g0Ohrm7M+mUGBKyktg3sr7kFOnp4Sef1IpZfcDehXG06I4taEMZIK6g==
X-Received: by 2002:a6b:1745:: with SMTP id 66mr1855119iox.151.1592434156635;
        Wed, 17 Jun 2020 15:49:16 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id v14sm665937ioj.46.2020.06.17.15.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 15:49:15 -0700 (PDT)
Received: (nullmailer pid 2984170 invoked by uid 1000);
        Wed, 17 Jun 2020 22:49:15 -0000
Date:   Wed, 17 Jun 2020 16:49:15 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 04/38] dt-bindings: firmware: Convert Tegra186 BPMP
 bindings to json-schema
Message-ID: <20200617224915.GA2975260@bogus>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-5-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200612141903.2391044-5-thierry.reding@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jun 12, 2020 at 04:18:29PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the Tegra186 BPMP bindings from the free-form text format to a
> json-schema and fix things up so that existing device trees properly
> validate.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../firmware/nvidia,tegra186-bpmp.txt         | 107 -----------
>  .../firmware/nvidia,tegra186-bpmp.yaml        | 180 ++++++++++++++++++
>  2 files changed, 180 insertions(+), 107 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt
>  create mode 100644 Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml

[...]

> diff --git a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
> new file mode 100644
> index 000000000000..0e4d51ba7aa1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
> @@ -0,0 +1,180 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/firmware/nvidia,tegra186-bpmp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra186 (and later) Boot and Power Management Processor (BPMP)
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +description: |
> +  The BPMP is a specific processor in Tegra chip, which is designed for
> +  booting process handling and offloading the power management, clock
> +  management, and reset control tasks from the CPU. The binding document
> +  defines the resources that would be used by the BPMP firmware driver,
> +  which can create the interprocessor communication (IPC) between the
> +  CPU and BPMP.
> +
> +  The BPMP implements some services which must be represented by separate
> +  nodes. For example, it can provide access to certain I2C controllers, and
> +  the I2C bindings represent each I2C controller as a device tree node. Such
> +  nodes should be nested directly inside the main BPMP node.
> +
> +  Software can determine whether a child node of the BPMP node represents a
> +  device by checking for a compatible property. Any node with a compatible
> +  property represents a device that can be instantiated. Nodes without a
> +  compatible property may be used to provide configuration information
> +  regarding the BPMP itself, although no such configuration nodes are
> +  currently defined by this binding.
> +
> +  The BPMP firmware defines no single global name-/numbering-space for such
> +  services. Put another way, the numbering scheme for I2C buses is distinct
> +  from the numbering scheme for any other service the BPMP may provide (e.g.
> +  a future hypothetical SPI bus service). As such, child device nodes will
> +  have no "reg" property, and the BPMP node will have no "#address-cells" or
> +  "#size-cells" property.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - nvidia,tegra186-bpmp
> +
> +  iommus:
> +    description: |
> +      The phandle of the IOMMU and the IOMMU specifier. See ../iommu/iommu.txt
> +      for details.
> +    $ref: "/schemas/types.yaml#/definitions/phandle-array"

Standard property, don't need a type. Just 'maxItems: 1' if 1 entry or 
an 'items' list if more than 1.

> +
> +  mboxes:
> +    description: |
> +      The phandle of the mailbox controller and the mailbox specifier. See
> +      ../mailbox/mailbox.txt and ../mailbox/nvidia,tegra186-hsp.txt for
> +      details.
> +    $ref: "/schemas/types.yaml#/definitions/phandle-array"

Same here.

> +
> +  shmem:
> +    description: |
> +      List of phandles for the TX and RX shared memory areas used for
> +      interprocess communication between the CPU and the BPMP.
> +
> +      The shared memory area for the IPC TX and RX between CPU and BPMP are
> +      predefined and work on top of sysram, which is an SRAM inside the chip.
> +
> +      See ../sram/sram.yaml for the bindings.
> +    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  "#power-domain-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +  i2c:
> +    type: object
> +    description: |
> +      The BPMP can provide serialized access to I2C controllers that have
> +      been assigned to it.

Should have a $ref to i2c-controller.yaml

> +
> +    properties:
> +      compatible:
> +        items:
> +          - enum:
> +              - nvidia,tegra186-bpmp-i2c
> +
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      nvidia,bpmp-bus-id:
> +        description: The bus ID of the I2C controller.
> +        $ref: "/schemas/types.yaml#/definitions/uint32"
> +
> +    required:
> +      - compatible
> +      - "#address-cells"
> +      - "#size-cells"
> +      - nvidia,bpmp-bus-id
> +
> +    patternProperties:
> +      "^.*@[0-9a-f]+$":
> +        type: object
> +        description: I2C slave
> +        properties:
> +          reg:
> +            maxItems: 1
> +            description: I2C address of the slave
> +
> +        required:
> +          - reg

And child node schema can be dropped.

> +
> +    additionalProperties: false
> +
> +  thermal:
> +    type: object
> +    description:
> +      The BPMP provides functionality that exposes system temperature sensors
> +      and which can be used to trigger a system shutdown if the temperature
> +      for a given zone exceeds the specified thresholds.
> +
> +    properties:
> +      compatible:
> +        items:
> +          - enum:
> +              - nvidia,tegra186-bpmp-thermal
> +
> +      "#thermal-sensor-cells":
> +        description: The ID of the thermal zone.
> +        const: 1
> +
> +    required:
> +      - compatible
> +      - "#thermal-sensor-cells"
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - mboxes
> +  - shmem
> +  - "#clock-cells"
> +  - "#power-domain-cells"
> +  - "#reset-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/mailbox/tegra186-hsp.h>
> +    #include <dt-bindings/memory/tegra186-mc.h>
> +
> +    bpmp {
> +        compatible = "nvidia,tegra186-bpmp";
> +        iommus = <&smmu TEGRA186_SID_BPMP>;
> +        mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_DB TEGRA_HSP_DB_MASTER_BPMP>;
> +        shmem = <&cpu_bpmp_tx &cpu_bpmp_rx>;
> +        #clock-cells = <1>;
> +        #power-domain-cells = <1>;
> +        #reset-cells = <1>;
> +
> +        i2c {
> +            compatible = "nvidia,tegra186-bpmp-i2c";
> +            nvidia,bpmp-bus-id = <5>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            status = "disabled";

Don't show status in examples.

> +        };
> +
> +        thermal {
> +            compatible = "nvidia,tegra186-bpmp-thermal";
> +            #thermal-sensor-cells = <1>;
> +        };
> +    };
> -- 
> 2.24.1
> 
