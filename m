Return-Path: <SRS0=49W1=4N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A09AC35E04
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 18:11:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 19EF220CC7
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 18:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582654277;
	bh=tEJS1m9BrK4aNMQ076SuSdVUaSVPfb+7PVuvHZl1Erg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=XgG10rxYYU+SEsaQxPqo2wpkh+gIgpzhUzQsECDpY9SIpB9yup2ZbcSCvR0M1h9JK
	 6HhoQ9h3YYclfavyBMTRWlrSvXLL056AoZWbAdGow1GtLd9Esm1EMT5G+Oavwe1dha
	 3Svz+8HrO3pmpb9uGFvxmCd6s20fGX7wuAqmK8C8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728476AbgBYSLQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Feb 2020 13:11:16 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:42537 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728367AbgBYSLQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Feb 2020 13:11:16 -0500
Received: by mail-ot1-f65.google.com with SMTP id 66so375902otd.9
        for <devicetree@vger.kernel.org>; Tue, 25 Feb 2020 10:11:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kLYxrjCSIrvwr8R9F0r9sUCzkoOdlkpR4nvrMhQsxSk=;
        b=M8AbAX5WG0ESWTw8JOBDnAtW4NXa3JkYQg/HmpGz0V6uvW+X4GKtV6QtBXDUCiTmwR
         Lwa494nduEhPSC6U1jpw5+1McpYVh0ws+4ufqWuJr+YBQGLUW5y0/kOw5W65Lk+7462E
         4/HLKnU9au8NRdiijrQ9+fPmdavcp10BnADx+t/q5Zue8yLXdGzCJctV7lPvlVIp23bI
         RJ3gu/Xeb66lRc88xerQ6vzW5RWOuCUh1EZPp2RJJntopTvO4n0aYqn/mbczONUMTign
         bwU3iISjxlLf5vdzuvyThQ+UVL1dx/0bxIEctEpMdY593T6SSe5mNBZBIWcE5ykhd/bF
         I6Ng==
X-Gm-Message-State: APjAAAUhROsjNnnGmkDia00jcYR0zvURnpC1Qg+NIeVHaUeTVjW0g1PI
        nh4I9dm2B1F4WKoMo0g1Iw==
X-Google-Smtp-Source: APXvYqyc+26w8sK7Uzc0BxJvFH3kWVvKtOCAA09eVdjhDvUtHWVC6pi5Gw40zaZKtvYwrirh3AJMjA==
X-Received: by 2002:a9d:7410:: with SMTP id n16mr47046974otk.23.1582654275254;
        Tue, 25 Feb 2020 10:11:15 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 32sm5906620ott.38.2020.02.25.10.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 10:11:14 -0800 (PST)
Received: (nullmailer pid 26920 invoked by uid 1000);
        Tue, 25 Feb 2020 18:11:14 -0000
Date:   Tue, 25 Feb 2020 12:11:14 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/2 v2] bus: Add DT bindings for Integrator/AP logic
 modules
Message-ID: <20200225181114.GA16296@bogus>
References: <20200219150833.126058-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200219150833.126058-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Feb 19, 2020 at 04:08:33PM +0100, Linus Walleij wrote:
> This adds YAML device tree bindings for the Integrator/AP
> logic modules. These are plug-in tiles used typically for
> FPGA prototyping.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Fix Logical->Logic spelling error
> - Set generic names for bus and serial
> - Just map the addresses 1:1 and use empty ranges, as the
>   LM's don't really translate the address.
> - Provide proper DMA ranges: the LM modules see the RAM at
>   the system-wide alias @80000000 rather than 1:1.
> - Drop the reg from the bus node (we just need the ranges)
> - Make the regexp for the bus node such that @address is
>   optional, as we don't require any reg on the node
> ---
>  .../bindings/bus/arm,integrator-ap-lm.yaml    | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.yaml b/Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.yaml
> new file mode 100644
> index 000000000000..5db5267410a6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/arm,integrator-ap-lm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Integrator/AP Logic Module extension bus
> +
> +maintainers:
> +  - Linus Walleij <linusw@kernel.org>
> +
> +description: The Integrator/AP is a prototyping platform and as such has a
> +  site for stacking up to four logic modules (LM) designed specifically for
> +  use with this platform. A special system controller register can be read to
> +  determine if a logic module is connected at index 0, 1, 2 or 3. The logic
> +  module connector is described in this binding. The logic modules per se
> +  then have their own specific per-module bindings and they will be described
> +  as subnodes under this logic module extension bus.
> +
> +properties:
> +  "#address-cells":
> +    const: 1
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
> +  "^bus(@[0-9a-f]*)?$":
> +    description: Nodes on the Logic Module bus represent logic modules
> +      and are named with bus. The first module is at 0xc0000000, the second
> +      at 0xd0000000 and so on until the top of the memory of the system at
> +      0xffffffff. All information about the memory used by the module is
> +      in ranges and dma-ranges.
> +    type: object
> +
> +    required:
> +      - compatible
> +
> +required:
> +  - compatible
> +
> +examples:
> +  - |
> +    bus@c0000000 {
> +      compatible = "arm,integrator-ap-lm";
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      ranges;

ranges = <0xc0000000 0xc0000000 0x10000000>;

Because you have a unit-address.

> +      dma-ranges;
> +
> +      bus {

bus@c0000000

Though, now I'm wondering this shouldn't just be 1 level with:

compatible = "arm,integrator-ap-lm", "simple-bus";

> +        compatible = "simple-bus";
> +        ranges = <0x00000000 0xc0000000 0x10000000>;
> +        /* The Logic Modules sees the Core Module 0 RAM @80000000 */
> +        dma-ranges = <0x00000000 0x80000000 0x10000000>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        serial@00100000 {

Drop leading 0s.

> +          compatible = "arm,pl011", "arm,primecell";
> +          reg = <0x00100000 0x1000>;
> +          interrupts-extended = <&impd1_vic 1>;
> +        };
> +
> +        impd1_vic: interrupt-controller@03000000 {

Drop leading 0s.

Try 'make W=1 dt_binding_check' as that will warn on all these things.

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
> -- 
> 2.24.1
> 
