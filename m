Return-Path: <SRS0=ng1M=2Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0695C32767
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 22:13:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BBB2321734
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 22:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578176004;
	bh=uO2iHYl7qI6TJdVGpj4E3d7EURpXaAd5n97LSblJlqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=sxZOVwz2HJSm0qgrlSMHzm0GJoMnb/l/zHYiqjG9aMVYpkCVEN04Vpb+h1XPjsZsJ
	 /3uT7UoswGpUoXqj+wVQfqjbpdKg2AWmoC/KfrOy7ck5yyscT/Qxnu4PptDvfZjPNR
	 NodfP60VFCNymMTGKKkphEwvQ4S5iZQwOQ0qzAE4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbgADWNY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 4 Jan 2020 17:13:24 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:37521 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbgADWNY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 4 Jan 2020 17:13:24 -0500
Received: by mail-io1-f68.google.com with SMTP id k24so14467535ioc.4
        for <devicetree@vger.kernel.org>; Sat, 04 Jan 2020 14:13:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=piCpHMpGOc3zZFTtDC6S/ozVwfI/lrfpfgNnjWzwyC8=;
        b=lh++PE6k4jVCJLyGaOioAlNhHhC2zTCGGC1SEEmaZm3X991iUiG6gsEp94VwPZvqfZ
         5u/yQxSMvoLOjSSwbJv76909k2OFbreka56qoVjDVGJ28sebJuvO90D1crDjlioLngtp
         I+aryeVR4RqG8pndvutK6Sp7Zv1lZH21Zx6s6+GL901FQV8hZtKT2Gqs3S2nj2pzJ8GI
         6E43bggcl1WxlJspFyLedR+nHlZ5JjLPRvwCIFaUUFYr0ew5dFqXTtWEotU/3Mg6eA4r
         efAlrvTTJmxa9jS5KgmCLfjHBLVRvR6pgU8LmMo3Mp39syxlqT+t8YAoMR5HCUUXYZ03
         VZ5A==
X-Gm-Message-State: APjAAAXmjzeukm8nLuwXZNbqdPzB4bVnaZ8ldWKRalhi9oX0AgmJf6gh
        EIAkhE2QK0vKsSjMNGoDtBAD6as=
X-Google-Smtp-Source: APXvYqymaM9nyMjUWX9yrT4joNWTsICjNxp+n0rKSX96MD3PplGqNPpkCf4TfXAoZ2DlNQ/3Z2FYzw==
X-Received: by 2002:a6b:e506:: with SMTP id y6mr61338039ioc.209.1578176003064;
        Sat, 04 Jan 2020 14:13:23 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id v64sm22472870ila.36.2020.01.04.14.13.22
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2020 14:13:22 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219b7
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Sat, 04 Jan 2020 15:13:21 -0700
Date:   Sat, 4 Jan 2020 15:13:21 -0700
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     kishon@ti.com, Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: usb: Convert Allwinner A80 USB PHY
 controller to a schema
Message-ID: <20200104221321.GA11672@bogus>
References: <20200103152824.47383-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200103152824.47383-1-maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jan 03, 2020 at 04:28:24PM +0100, Maxime Ripard wrote:
> The Allwinner A80 SoCs have a USB PHY controller that is used by Linux,
> with a matching Device Tree binding.
> 
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
> 
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> ---
> 
> Changes from v1:
>   - Added r-b tag from chen-yu
> ---
>  .../phy/allwinner,sun9i-a80-usb-phy.yaml      | 135 ++++++++++++++++++
>  .../devicetree/bindings/phy/sun9i-usb-phy.txt |  37 -----
>  2 files changed, 135 insertions(+), 37 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/allwinner,sun9i-a80-usb-phy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/sun9i-usb-phy.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun9i-a80-usb-phy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun9i-a80-usb-phy.yaml
> new file mode 100644
> index 000000000000..ded7d6f0a119
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/allwinner,sun9i-a80-usb-phy.yaml
> @@ -0,0 +1,135 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/allwinner,sun9i-a80-usb-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner A80 USB PHY Device Tree Bindings
> +
> +maintainers:
> +  - Chen-Yu Tsai <wens@csie.org>
> +  - Maxime Ripard <mripard@kernel.org>
> +
> +properties:
> +  "#phy-cells":
> +    const: 0
> +
> +  compatible:
> +    const: allwinner,sun9i-a80-usb-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    anyOf:
> +      - description: Main PHY Clock
> +
> +      - items:
> +          - description: Main PHY clock
> +          - description: HSIC 12MHz clock
> +          - description: HSIC 480MHz clock

Rather than anyOf, just 'minItems: 1' would work here. Though I guess 
this disallows 2 items.

> +
> +  clock-names:
> +    oneOf:
> +      - const: phy
> +
> +      - items:
> +          - const: phy
> +          - const: hsic_12M
> +          - const: hsic_480M
> +
> +  resets:
> +    anyOf:
> +      - description: Normal USB PHY reset
> +
> +      - items:
> +          - description: Normal USB PHY reset
> +          - description: HSIC Reset
> +
> +  reset-names:
> +    oneOf:
> +      - const: phy
> +
> +      - items:
> +          - const: phy
> +          - const: hsic
> +
> +  phy_type:
> +    const: hsic
> +    description:
> +      When absent, the PHY type will be assumed to be normal USB.
> +
> +  phy-supply:
> +    description:
> +      Regulator that powers VBUS
> +
> +required:
> +  - "#phy-cells"
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +
> +additionalProperties: false
> +
> +if:
> +  properties:
> +    phy_type:
> +      const: hsic
> +
> +  required:
> +    - phy_type
> +
> +then:
> +  properties:
> +    clocks:
> +      maxItems: 3
> +
> +    clock-names:
> +      maxItems: 3
> +
> +    resets:
> +      maxItems: 2
> +
> +    reset-names:
> +      maxItems: 2

Do you intend that only a single item is allowed when not HSIC? If so, 
that's not what is happening.

Rob
