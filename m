Return-Path: <SRS0=Uhz2=4B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC57C352A3
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Feb 2020 20:24:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 77BF124685
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Feb 2020 20:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581625452;
	bh=N9a+BVoiRLAWlMQYqOvNOgYl0ZU8s6znAZLOX+gpEAg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=PGqz8/5WcLDmhEEVrHcAfKuy2+jzBS2er3BKilTf9YDZQ+jbNApdYIYidEG8scv7v
	 V2S8MU/ua0N5o51/gRcexzoFZgbnFHlaTxlrSZ5mRoWuUAH9gM7X9sSgcVqqTIY0ag
	 YuncQ6jQBg9vhoHcgJrZZe+VunCEecIBdFgVmRr4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbgBMUYM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 13 Feb 2020 15:24:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:39676 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727772AbgBMUYL (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 13 Feb 2020 15:24:11 -0500
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 520D924684
        for <devicetree@vger.kernel.org>; Thu, 13 Feb 2020 20:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581625450;
        bh=N9a+BVoiRLAWlMQYqOvNOgYl0ZU8s6znAZLOX+gpEAg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=YdPh3EGw+QWQVVqHsMg9hNFXHacHaK7sr+Dmdv7j3MlHW9CT23s9m93H6F6SOwCoL
         6IDaXzP3wkNbSOdyhe0j4uWmYZAKOrCOKKJJRJUTRUV5R1u6sXYUPhhgRb1F5OBHk3
         j5THtWcKp7FsxhB45Ro9yIAR3vjQS20IQm0sJIyE=
Received: by mail-qv1-f41.google.com with SMTP id g6so3251529qvy.5
        for <devicetree@vger.kernel.org>; Thu, 13 Feb 2020 12:24:10 -0800 (PST)
X-Gm-Message-State: APjAAAUiwyUl06UgVuSHcVSWmU9ia33HTFZeAD5cyOxlrgq4IGj9drk8
        RvnMYay1zs8ZqM2MnFB8E0gicahf5Rtf0TCxTw==
X-Google-Smtp-Source: APXvYqzySaRcn1yJ5/y7FYHk+Er01trcCUflqTCPJ+GCFdvM7asA/lZD7VyTokV1bgOliI+T0Zf5Vgc8A/I7WGsIK8o=
X-Received: by 2002:ad4:4511:: with SMTP id k17mr12491088qvu.135.1581625449440;
 Thu, 13 Feb 2020 12:24:09 -0800 (PST)
MIME-Version: 1.0
References: <20200210092713.279105-1-linus.walleij@linaro.org> <20200210092713.279105-4-linus.walleij@linaro.org>
In-Reply-To: <20200210092713.279105-4-linus.walleij@linaro.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 13 Feb 2020 14:23:58 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+4bx=sOmexqBC-+Yv6-KwoS_0uLqVTLuiL+hLh+G03bA@mail.gmail.com>
Message-ID: <CAL_Jsq+4bx=sOmexqBC-+Yv6-KwoS_0uLqVTLuiL+hLh+G03bA@mail.gmail.com>
Subject: Re: [PATCH 3/7] dt-bindings: arm: Add Integrator YAML schema
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     devicetree@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Feb 10, 2020 at 3:27 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This implements the top-level schema for the ARM Integrator
> platforms.
>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../bindings/arm/arm,integrator.yaml          | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/arm,integrator.yaml
>
> diff --git a/Documentation/devicetree/bindings/arm/arm,integrator.yaml b/Documentation/devicetree/bindings/arm/arm,integrator.yaml
> new file mode 100644
> index 000000000000..39aa3e31f934
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/arm,integrator.yaml
> @@ -0,0 +1,85 @@
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
> +  syscon:

Given there's a 'reg' property here, this should have a unit-address.

> +    description: All Integrator boards must provide a system controller as a
> +      node in the root of the device tree.
> +    type: object
> +    properties:
> +      compatible:
> +        oneOf:
> +          - items:
> +            - const: arm,integrator-ap-syscon
> +            - const: syscon
> +          - items:
> +            - const: arm,integrator-cp-syscon
> +            - const: syscon
> +          - items:
> +            - const: arm,integrator-sp-syscon
> +            - const: syscon

No need for oneOf:

items:
  - enum:
      - arm,integrator-ap-syscon
      - arm,integrator-cp-syscon
      - arm,integrator-sp-syscon
  - const: syscon

> +    required:
> +      - compatible
> +      - reg

'reg' should be listed as property too. How many entries?

> +
> +patternProperties:
> +  "^core-module@[0-9a-f]+$":
> +    type: object
> +    description: the root node in the Integrator platforms must contain
> +      a core module child node. They are always at physical address
> +      0x10000000 in all the Integrator variants.

Then do 'core-module@10000000' for the property name.

> +    properties:
> +      compatible:
> +        contains:
> +          const: arm,core-module-integrator
> +        description: this node is the core module node, it can be compatible
> +          with syscon and simple-bus as well

Those compatibles should be listed, too.

> +
> +    required:
> +      - compatible
> +      - reg
> +
> +required:
> +  - compatible
> +  - syscon
> +  - core-module@10000000
> +
> +...
> --
> 2.23.0
>
