Return-Path: <SRS0=49W1=4N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D0A4C35E01
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 18:27:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 349532082F
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 18:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582655239;
	bh=i1yg1xPJBmlch6h7zTLYvs8nZ9w2RgI0yT9/1+6BSO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=kDAaXI04MUnuXqN8Fd7c1zbu33wOEq5LoTYewq4I8POGFPiR6bvsu7ZWRoii4lqz4
	 PWvXRtG5a04Lt48ElXT0gxE+xDC357MKudgFx/CGLNAL+JTfmwKXg/MV/m7BbOSW5o
	 VNmSt3tCWpv8FhxKxlYbc1IM01NERt7eweemHjaA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731550AbgBYS1S (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Feb 2020 13:27:18 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37745 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731549AbgBYS1S (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Feb 2020 13:27:18 -0500
Received: by mail-ot1-f68.google.com with SMTP id b3so450092otp.4
        for <devicetree@vger.kernel.org>; Tue, 25 Feb 2020 10:27:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=016DmzNNKDwWzCKl+kLxw6qleocdBsFXd77n9wh8My4=;
        b=LnpkJcNytN0vBD5J2/q5KezJaOTKDOiBfOYGLys1a0bTn3AcYegm4QReqfhHEwRfBw
         7GqYnAvrOBVZ7WXUA9auGvOc5jRWgWXyyi1/4nV+HDCCp08gXQNgaFfo/MVNxzIg9jLV
         pgnbsziXCgC9R/WuJkb2np1w93JFJJ/7I4mWzL8XGAV+ux5/id98REnjydKp9GCKyaWO
         j+Us+3IoQ3FwNzSyJSzY1nUXFmNLOkZ2rliJh42wk/FwIXtx77VtKWCpBZHMJ+1n1kVE
         AriBShD7q7kFXOuDs1Nt8ckSeuA+57EgXzrrj9VDc+/FkKUSguqY2oi+y00PLS12IBR3
         fxJw==
X-Gm-Message-State: APjAAAVj4ejVnGQIF8dZo3iTqkM3B5IGmfAEGo4ZFvJW3DvaAF8ZSjYc
        yWMSd5fVRr+ITfLULffLzQ==
X-Google-Smtp-Source: APXvYqwxZLzRKtNOKmCbw6lHWxLrCECB+yaLs8zN+D/tIPlJctyrFDXB3ZDuMnBN7k5zJ4Dd1iJvMA==
X-Received: by 2002:a9d:66d1:: with SMTP id t17mr47730503otm.233.1582655237357;
        Tue, 25 Feb 2020 10:27:17 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q9sm1063197otl.53.2020.02.25.10.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 10:27:16 -0800 (PST)
Received: (nullmailer pid 19009 invoked by uid 1000);
        Tue, 25 Feb 2020 18:27:15 -0000
Date:   Tue, 25 Feb 2020 12:27:15 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
        Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 1/5 v2] dt-bindings: arm: Add Integrator YAML schema
Message-ID: <20200225182715.GA15214@bogus>
References: <20200225084627.24825-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200225084627.24825-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Feb 25, 2020 at 09:46:23AM +0100, Linus Walleij wrote:
> This implements the top-level schema for the ARM Integrator
> platforms.
> 
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Collapse the compatible three items with two const in each to an
>   enum with three possible values and a const syscon
> - Add reg with maxItems: 1 for syscon
> - Add reg as a required property of syscon
> - Make syscon a patternProperty and make sure it has a unit address
> - Add reg with maxItems: 1 for the core module
> - Require core module to be @10000000 and have all three compatibles.
> ---
>  .../bindings/arm/arm,integrator.yaml          | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/arm,integrator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,integrator.yaml b/Documentation/devicetree/bindings/arm/arm,integrator.yaml
> new file mode 100644
> index 000000000000..2690491c1294
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/arm,integrator.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/arm,integrator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM Integrator Boards Device Tree Bindings
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +description: |+
> +  These were the first ARM platforms officially supported by ARM Ltd.
> +  They are ARMv4, ARMv5 and ARMv6-capable using different core tiles,
> +  so the system is modular and can host a variety of CPU tiles called
> +  "core tiles" and referred to in the device tree as "core modules".
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - description: ARM Integrator Application Platform, this board has a PCI
> +          host and several PCI slots, as well as a number of slots for logical
> +          expansion modules, it is referred to as an "ASIC Development
> +          Motherboard" and is extended with custom FPGA and is intended for
> +          rapid prototyping. See ARM DUI 0098B. This board can physically come
> +          pre-packaged in a PC Tower form factor called Integrator/PP1 or a
> +          special metal fixture called Integrator/PP2, see ARM DUI 0169A.
> +        items:
> +          - const: arm,integrator-ap
> +      - description: ARM Integrator Compact Platform (HBI-0086), this board has
> +          a compact form factor and mainly consists of the bare minimum
> +          peripherals to make use of the core module. See ARM DUI 0159B.
> +        items:
> +          - const: arm,integrator-cp
> +      - description: ARM Integrator Standard Development Board (SDB) Platform,
> +          this board is a PCI-based board conforming to the Microsoft SDB
> +          (HARP) specification. See ARM DUI 0099A.
> +        items:
> +          - const: arm,integrator-sp
> +
> +  core-module@10000000:
> +    type: object
> +    description: the root node in the Integrator platforms must contain
> +      a core module child node. They are always at physical address
> +      0x10000000 in all the Integrator variants.
> +    properties:
> +      compatible:
> +        items:
> +          - const: arm,core-module-integrator
> +          - const: syscon
> +          - const: simple-mfd
> +      reg:
> +        maxItems: 1
> +
> +    required:
> +      - compatible
> +      - reg
> +
> +patternProperties:
> +  "^syscon@[0-9a-f]+$":
> +    description: All Integrator boards must provide a system controller as a
> +      node in the root of the device tree.
> +    type: object
> +    properties:
> +      compatible:
> +        items:
> +          - enum:
> +            - arm,integrator-ap-syscon
> +            - arm,integrator-cp-syscon
> +            - arm,integrator-sp-syscon
> +          - const: syscon
> +      reg:
> +        maxItems: 1
> +
> +    required:
> +      - compatible
> +      - reg
> +
> +
> +required:
> +  - compatible
> +  - syscon

This will fail to match anything if you have 'syscon@...' Unfortunately, 
not yet any way to have required patterns in json-schema, though that is 
being discussed.

With that dropped,

Reviewed-by: Rob Herring <robh@kernel.org>

> +  - core-module@10000000
> +
> +...
> -- 
> 2.24.1
> 
