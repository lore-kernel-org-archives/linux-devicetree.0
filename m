Return-Path: <SRS0=TSDT=YW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECE27CA9EAE
	for <linux-devicetree@archiver.kernel.org>; Tue, 29 Oct 2019 17:10:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BF9E32067D
	for <linux-devicetree@archiver.kernel.org>; Tue, 29 Oct 2019 17:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572369036;
	bh=ewiJLrKEwwS6CUtAliUE7kzO3oMqbwX8sgAZkuVxq2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=dzfmGr9QFeUUsaniEZwdWBoTMvxmhDwUVfwpW7Roa4cZXda6oHAslvVDAjYlV6ZVr
	 4FVBR0/mZaYYIyLRLVYqJwQc22eY/moJevDOjczUhIz/WroRbIr8vD2bGYAXVAxs1l
	 gkX/A820w7dYN4lDsyxOFGdVzU22sZlyDOd/GsGs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390672AbfJ2RKg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 29 Oct 2019 13:10:36 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:41313 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390639AbfJ2RKg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 29 Oct 2019 13:10:36 -0400
Received: by mail-oi1-f193.google.com with SMTP id g81so9567888oib.8;
        Tue, 29 Oct 2019 10:10:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xTORcAVGGotokS03E5KBBwWhY7+0pNKbT792zrXJzuE=;
        b=pEgXzaRYcx8FHMv+aZTpDuUzHDIQkIvmOQiDcIemVmOLSpUwth6GklvMdEkV2RaD7V
         6AXldgPk/QV2vP4fTI/Lg+tDA9371QJBmSxVvI6jvnHCV0qerfBQRaFmSoZd4SfAcL+j
         XtF2jRPVGvQl+3t+lyt/1ixD6sz43AldAUsScitlfTqrC0vZJTEM/hJtYmf1iSSsInO4
         T5mkJ1YYwHY/hNoHIYLYvD0ch6XRIl56WfkGgwBYXgAoSJWjHcgtXIQo+m6oAEPaats7
         /PJIlNW6pUI/eibgCukNGprVeZTif0ZixpbcJctVcpVgph71NnNwmrO09b3mrSYvewo0
         EVAQ==
X-Gm-Message-State: APjAAAUKgnCaBDElEqbHh71sqkkVrgrNioTO4yrAPiKAw5BPQIBRUhhp
        v/f3BYKg8/i/BrlYBscMfky157k=
X-Google-Smtp-Source: APXvYqwhf9erp+knV+GYq4o8z2jRx3QPFwBGjz6heFMEd1H0LxUvvtsWOZlDhpjmAZfu2wttiHcfvA==
X-Received: by 2002:a05:6808:317:: with SMTP id i23mr5049536oie.17.1572369034538;
        Tue, 29 Oct 2019 10:10:34 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y4sm4084204oie.42.2019.10.29.10.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 10:10:32 -0700 (PDT)
Date:   Tue, 29 Oct 2019 12:10:32 -0500
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: Convert Allwinner A10 mUSB controller
 to a schema
Message-ID: <20191029171032.GA23536@bogus>
References: <20191022161951.43567-1-mripard@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191022161951.43567-1-mripard@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Oct 22, 2019 at 06:19:51PM +0200, Maxime Ripard wrote:
> The Allwinner SoCs have an mUSB controller that is supported in Linux, with
> a matching Device Tree binding.
> 
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  .../bindings/usb/allwinner,sun4i-a10-musb.txt |  28 -----
>  .../usb/allwinner,sun4i-a10-musb.yaml         | 101 ++++++++++++++++++
>  2 files changed, 101 insertions(+), 28 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.txt b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.txt
> deleted file mode 100644
> index 50abb20fe319..000000000000
> --- a/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.txt
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -Allwinner sun4i A10 musb DRC/OTG controller
> --------------------------------------------
> -
> -Required properties:
> - - compatible      : "allwinner,sun4i-a10-musb", "allwinner,sun6i-a31-musb",
> -                     "allwinner,sun8i-a33-musb" or "allwinner,sun8i-h3-musb"
> - - reg             : mmio address range of the musb controller
> - - clocks          : clock specifier for the musb controller ahb gate clock
> - - reset           : reset specifier for the ahb reset (A31 and newer only)
> - - interrupts      : interrupt to which the musb controller is connected
> - - interrupt-names : must be "mc"
> - - phys            : phy specifier for the otg phy
> - - phy-names       : must be "usb"
> - - dr_mode         : Dual-Role mode must be "host" or "otg"
> - - extcon          : extcon specifier for the otg phy
> -
> -Example:
> -
> -	usb_otg: usb@1c13000 {
> -		compatible = "allwinner,sun4i-a10-musb";
> -		reg = <0x01c13000 0x0400>;
> -		clocks = <&ahb_gates 0>;
> -		interrupts = <38>;
> -		interrupt-names = "mc";
> -		phys = <&usbphy 0>;
> -		phy-names = "usb";
> -		extcon = <&usbphy 0>;
> -	};
> diff --git a/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
> new file mode 100644
> index 000000000000..81d0189ed5c8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
> @@ -0,0 +1,101 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/allwinner,sun4i-a10-musb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner A10 mUSB OTG Controller Device Tree Bindings
> +
> +maintainers:
> +  - Chen-Yu Tsai <wens@csie.org>
> +  - Maxime Ripard <maxime.ripard@bootlin.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: allwinner,sun4i-a10-musb
> +      - const: allwinner,sun6i-a31-musb
> +      - const: allwinner,sun8i-a33-musb
> +      - items:
> +          - const: allwinner,sun8i-a83t-musb
> +          - const: allwinner,sun8i-a33-musb
> +      - const: allwinner,sun8i-h3-musb
> +      - items:
> +          - const: allwinner,sun50i-h6-musb
> +          - const: allwinner,sun8i-a33-musb

This could be 2 oneOf entries instead. Or just combine the 2 2 items 
entries.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-names:
> +    const: mc
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  phys:
> +    description: PHY specifier for the OTG PHY
> +
> +  phy-names:
> +    const: usb
> +
> +  extcon:
> +    description: Extcon specifier for the OTG PHY
> +
> +  dr_mode:
> +    enum:
> +      - host
> +      - otg
> +      - peripheral

3rd definition I've seen in the past day...

> +
> +  allwinner,sram:
> +    description: Phandle to the device SRAM
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - phys
> +  - phy-names
> +  - dr_mode
> +  - extcon
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - allwinner,sun6i-a31-musb
> +          - allwinner,sun8i-a33-musb
> +          - allwinner,sun8i-h3-musb
> +
> +then:
> +  required:
> +    - resets
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    usb_otg: usb@1c13000 {
> +      compatible = "allwinner,sun4i-a10-musb";
> +      reg = <0x01c13000 0x0400>;
> +      clocks = <&ahb_gates 0>;
> +      interrupts = <38>;
> +      interrupt-names = "mc";
> +      phys = <&usbphy 0>;
> +      phy-names = "usb";
> +      extcon = <&usbphy 0>;
> +      dr_mode = "peripheral";
> +    };
> +
> +...
> -- 
> 2.23.0
> 
