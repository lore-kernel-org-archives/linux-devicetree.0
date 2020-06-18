Return-Path: <SRS0=Lhmw=77=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2840C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 02:35:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C8C3E2085B
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 02:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592447715;
	bh=XVlau0BFOcKXVQ8hsUype7E8ftBzR99xBYvStqDA4Fw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=mb6kr34zFInAQJ3KVj/Gr7g0kCCPAfokNd8Hf3LXwKQM4FTx2ioaDaQHvQKnv8EA8
	 CtEIwY4hO5oSM7JH+XsW+/jLO3YIehvnIXJvAvwJYYnVkj5EenIh5pmO4mv0I4oD0w
	 75gqAGaCOhH2rhDfHMpSujDcdguAdfR/1ofGPBxQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727081AbgFRCfJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 17 Jun 2020 22:35:09 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:44651 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729419AbgFRCfB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 17 Jun 2020 22:35:01 -0400
Received: by mail-il1-f193.google.com with SMTP id i1so4306271ils.11;
        Wed, 17 Jun 2020 19:34:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=W0o7TEPLneBy9q/r27uMK+EYtZX44bMAT8JgvN5uh5g=;
        b=rUy6Qf5aBePXlRKbZM7FHkyTUB5V0UgiTFDbpPhUa+SFVbxIYf96DBOMZwfAUT8gFm
         o4K7kM7F07X/cWtOfmPVWYvyQXI95W0ZzqJAFz5Yypz+4ktV3UK5+Ou7U1zA9EzjrpYZ
         BoEIz2+4tJcBkXGiSDYWdsEimFZrcucDBVQWmhNxsnJtu3PkB4dhHbmQwbW3vewDXaGK
         RgwwhkJ0e/+57R4jVdGSgBRnuaCVYuALYrEcptvnlbUdT4WpmSgwyNJSAineg5ih0Rif
         uYL3P5YtBkYhF8wl5sNvAd6WJU+9hzu24qwgbDjc4jre+pRkqAVMT67WgsI5gtGHUghM
         4Kbw==
X-Gm-Message-State: AOAM530W/JnuWyqMqi95A+o9HPOiLYVBJY79dCeRR5clh1RfZd2yGaZf
        vuZ749UR39rU0h0nVqTOOA==
X-Google-Smtp-Source: ABdhPJx5LO9OyII9A8YLQue3bWKw632k8xpzFfoN99Bwa5eG5GJd8NoBsTYbhoynyeBY/x0vc+hL6w==
X-Received: by 2002:a92:40dc:: with SMTP id d89mr2152716ill.170.1592447699049;
        Wed, 17 Jun 2020 19:34:59 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id n17sm711831iom.22.2020.06.17.19.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 19:34:58 -0700 (PDT)
Received: (nullmailer pid 3355569 invoked by uid 1000);
        Thu, 18 Jun 2020 02:34:57 -0000
Date:   Wed, 17 Jun 2020 20:34:57 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 26/38] dt-bindings: pci: iommu: Convert to json-schema
Message-ID: <20200618023457.GA3343853@bogus>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-27-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200612141903.2391044-27-thierry.reding@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jun 12, 2020 at 04:18:51PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the PCI IOMMU device tree bindings from free-form text format to
> json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/pci/pci-iommu.txt     | 171 ------------------
>  .../devicetree/bindings/pci/pci-iommu.yaml    | 168 +++++++++++++++++
>  2 files changed, 168 insertions(+), 171 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pci/pci-iommu.txt
>  create mode 100644 Documentation/devicetree/bindings/pci/pci-iommu.yaml

This needs to come before you use it.

> diff --git a/Documentation/devicetree/bindings/pci/pci-iommu.yaml b/Documentation/devicetree/bindings/pci/pci-iommu.yaml
> new file mode 100644
> index 000000000000..8aaa8e657559
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/pci-iommu.yaml
> @@ -0,0 +1,168 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/pci-iommu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: PCI IOMMU bindings
> +
> +maintainers:
> +  - Rob Herring <robh+dt@kernel.org>
> +
> +description: |
> +  This document describes the generic device tree binding for describing the
> +  relationship between PCI(e) devices and IOMMU(s).
> +
> +  Each PCI(e) device under a root complex is uniquely identified by its
> +  Requester ID (AKA RID). A Requester ID is a triplet of a Bus number, Device
> +  number, and Function number.
> +
> +  For the purpose of this document, when treated as a numeric value, a RID is
> +  formatted such that:
> +
> +    * Bits [15:8] are the Bus number.
> +    * Bits [7:3] are the Device number.
> +    * Bits [2:0] are the Function number.
> +    * Any other bits required for padding must be zero.
> +
> +  IOMMUs may distinguish PCI devices through sideband data derived from the
> +  Requester ID. While a given PCI device can only master through one IOMMU, a
> +  root complex may split masters across a set of IOMMUs (e.g. with one IOMMU
> +  per bus).
> +
> +  The generic 'iommus' property is insufficient to describe this relationship,
> +  and a mechanism is required to map from a PCI device to its IOMMU and
> +  sideband data.
> +
> +  For generic IOMMU bindings, see
> +  Documentation/devicetree/bindings/iommu/iommu.txt.
> +
> +properties:
> +  iommu-map:
> +    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> +    description: |
> +      Maps a Requester ID to an IOMMU and associated IOMMU specifier data.
> +
> +      The property is an arbitrary number of tuples of (rid-base, iommu,
> +      iommu-base, length).
> +
> +      Any RID r in the interval [rid-base, rid-base + length) is associated
> +      with the listed IOMMU, with the IOMMU specifier (r - rid-base +
> +      iommu-base).
> +
> +  iommu-map-mask:
> +    $ref: "/schemas/types.yaml#/definitions/uint32"
> +    description:
> +      A mask to be applied to each Requester ID prior to being mapped to an
> +      IOMMU specifier per the iommu-map property.
> +
> +examples:
> +  - |
> +    iommu0: iommu@a {
> +        reg = <0xa 0x1>;
> +        compatible = "vendor,some-iommu";
> +        #iommu-cells = <1>;
> +    };
> +
> +    pci@f {
> +        reg = <0xf 0x1>;
> +        compatible = "vendor,pcie-root-complex";
> +        device_type = "pci";
> +
> +        #address-cells = <3>;
> +        #size-cells = <2>;
> +        ranges = <0x02000000 0 0x00000000 0x00000000 0 0x00000000>;
> +
> +        /*
> +         * The sideband data provided to the IOMMU is the RID,
> +         * identity-mapped.
> +         */
> +        iommu-map = <0x0 &iommu0 0x0 0x10000>;
> +    };
> +
> +  - |
> +    iommu1: iommu@a {
> +        reg = <0xa 0x1>;
> +        compatible = "vendor,some-iommu";
> +        #iommu-cells = <1>;
> +    };
> +
> +    pci@f {
> +        reg = <0xf 0x1>;
> +        compatible = "vendor,pcie-root-complex";
> +        device_type = "pci";
> +
> +        #address-cells = <3>;
> +        #size-cells = <2>;
> +        ranges = <0x02000000 0 0x00000000 0x00000000 0 0x00000000>;
> +
> +        /*
> +         * The sideband data provided to the IOMMU is the RID with the
> +         * function bits masked out.
> +         */
> +        iommu-map = <0x0 &iommu 0x0 0x10000>;
> +        iommu-map-mask = <0xfff8>;
> +    };
> +
> +  - |
> +    iommu2: iommu@a {
> +        reg = <0xa 0x1>;
> +        compatible = "vendor,some-iommu";
> +        #iommu-cells = <1>;
> +    };
> +
> +    pci@f {
> +        reg = <0xf 0x1>;
> +        compatible = "vendor,pcie-root-complex";
> +        device_type = "pci";
> +
> +        #address-cells = <3>;
> +        #size-cells = <2>;
> +        ranges = <0x02000000 0 0x00000000 0x00000000 0 0x00000000>;
> +
> +        /*
> +         * The sideband data provided to the IOMMU is the RID,
> +         * but the high bits of the bus number are flipped.
> +         */
> +        iommu-map = <0x0000 &iommu2 0x8000 0x8000>,
> +                    <0x8000 &iommu2 0x0000 0x8000>;
> +    };
> +
> +  - |
> +    iommu_a: iommu@a {
> +        reg = <0xa 0x1>;
> +        compatible = "vendor,some-iommu";
> +        #iommu-cells = <1>;
> +    };
> +
> +    iommu_b: iommu@b {
> +        reg = <0xb 0x1>;
> +        compatible = "vendor,some-iommu";
> +        #iommu-cells = <1>;
> +    };
> +
> +    iommu_c: iommu@c {
> +        reg = <0xc 0x1>;
> +        compatible = "vendor,some-iommu";
> +        #iommu-cells = <1>;
> +    };
> +
> +    pci@f {
> +        reg = <0xf 0x1>;
> +        compatible = "vendor,pcie-root-complex";
> +        device_type = "pci";
> +
> +        #address-cells = <3>;
> +        #size-cells = <2>;
> +        ranges = <0x02000000 0 0x00000000 0x00000000 0 0x00000000>;
> +
> +        /*
> +         * Devices with bus number 0-127 are mastered via IOMMU
> +         * a, with sideband data being RID[14:0].
> +         * Devices with bus number 128-255 are mastered via
> +         * IOMMU b, with sideband data being RID[14:0].
> +         * No devices master via IOMMU c.
> +         */
> +        iommu-map = <0x0000 &iommu_a 0x0000 0x8000>,
> +                    <0x8000 &iommu_b 0x0000 0x8000>;
> +    };
> -- 
> 2.24.1
> 
