Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02503C2BB85
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:47:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5AD42074D
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586890042;
	bh=LcE3RGuCSunw+py+nCGGgB4fBglRu6aFcGze8ske8L4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=BA5lqgIh+mKsD85+u6HzaDNLrLM2EXZ9jQQj1mhCi5FJbPYDrRTzZyMf/ClPO6aEO
	 TTnNsRLIOsAhRxdRKFTxXcfDWJmOWmAc9YW/2qNclnVSSKZsIf80rirYe0WhmUDc+J
	 lGx1IGZ/wMuRQItUNp93qFT5UxV4jL77Lgm5VfHM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504335AbgDNSrV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 14:47:21 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:37243 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504332AbgDNSrT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 14:47:19 -0400
Received: by mail-ot1-f67.google.com with SMTP id z17so757802oto.4
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 11:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jI5GQiLVOxKQgJGoRbru3LLxPgI3+K1oaKOVEty/3Gc=;
        b=pswBn2hOyCQIYXYQ2dRcr93pIiWKvys8+tzUnGJ1+A8ngd1kXx2+AuqaDkkeYwCkci
         9QznLA9hyCVU2mI0twBUSiQUXuw0zXlr9vMc3ok6DBLRANigUXK8WUJYU1S55/M5RR3h
         29fAWKNTG7EA4BxAAYdp4tcbnp0uWAQl+xpgdls4EDQ7xCZUCxhp3CC6T20Dx1eWXIpc
         nekDHku/YXNNRxodhrCf7RN49EfVMTXjZ3Qfa2VVTIHZsEu5nbXKAt11nGdCsDCE1+/X
         HonLIvKNQl0adM8nlpeVT1beIcneF5UI6exHEBIPZyq1c5U1a0MudaDwnVz8lk1YnfiU
         Wjag==
X-Gm-Message-State: AGi0PuYPakc874HrhNeQtupewrZaKq84NwOghl4wKv1rFRdDwnI6VCyu
        oIH4iqPEaheYSekQd2hwfw==
X-Google-Smtp-Source: APiQypICVMAJ3rUfhOIX9QOG379C3kowOxUgsspLa6RJ13MfZvbl1Khu/1vpylQacO61qM/Cgu56jg==
X-Received: by 2002:a05:6830:1d98:: with SMTP id y24mr19609176oti.76.1586890038231;
        Tue, 14 Apr 2020 11:47:18 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h14sm2009616oov.11.2020.04.14.11.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 11:47:17 -0700 (PDT)
Received: (nullmailer pid 31211 invoked by uid 1000);
        Tue, 14 Apr 2020 18:47:16 -0000
Date:   Tue, 14 Apr 2020 13:47:16 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 23/36] dt-bindings: display: convert samsung,s6e8aa0
 to DT Schema
Message-ID: <20200414184716.GA22496@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-24-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-24-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Apr 08, 2020 at 09:50:56PM +0200, Sam Ravnborg wrote:
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/samsung,s6e8aa0.txt         | 56 -----------
>  .../display/panel/samsung,s6e8aa0.yaml        | 96 +++++++++++++++++++
>  2 files changed, 96 insertions(+), 56 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.txt b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.txt
> deleted file mode 100644
> index 9e766c5f86da..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.txt
> +++ /dev/null
> @@ -1,56 +0,0 @@
> -Samsung S6E8AA0 AMOLED LCD 5.3 inch panel
> -
> -Required properties:
> -  - compatible: "samsung,s6e8aa0"
> -  - reg: the virtual channel number of a DSI peripheral
> -  - vdd3-supply: core voltage supply
> -  - vci-supply: voltage supply for analog circuits
> -  - reset-gpios: a GPIO spec for the reset pin
> -  - display-timings: timings for the connected panel as described by [1]
> -
> -Optional properties:
> -  - power-on-delay: delay after turning regulators on [ms]
> -  - reset-delay: delay after reset sequence [ms]
> -  - init-delay: delay after initialization sequence [ms]
> -  - panel-width-mm: physical panel width [mm]
> -  - panel-height-mm: physical panel height [mm]
> -  - flip-horizontal: boolean to flip image horizontally
> -  - flip-vertical: boolean to flip image vertically
> -
> -The device node can contain one 'port' child node with one child
> -'endpoint' node, according to the bindings defined in [2]. This
> -node should describe panel's video bus.
> -
> -[1]: Documentation/devicetree/bindings/display/panel/display-timing.txt
> -[2]: Documentation/devicetree/bindings/media/video-interfaces.txt
> -
> -Example:
> -
> -	panel {
> -		compatible = "samsung,s6e8aa0";
> -		reg = <0>;
> -		vdd3-supply = <&vcclcd_reg>;
> -		vci-supply = <&vlcd_reg>;
> -		reset-gpios = <&gpy4 5 0>;
> -		power-on-delay= <50>;
> -		reset-delay = <100>;
> -		init-delay = <100>;
> -		panel-width-mm = <58>;
> -		panel-height-mm = <103>;
> -		flip-horizontal;
> -		flip-vertical;
> -
> -		display-timings {
> -			timing0: timing-0 {
> -				clock-frequency = <57153600>;
> -				hactive = <720>;
> -				vactive = <1280>;
> -				hfront-porch = <5>;
> -				hback-porch = <5>;
> -				hsync-len = <5>;
> -				vfront-porch = <13>;
> -				vback-porch = <1>;
> -				vsync-len = <2>;
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml
> new file mode 100644
> index 000000000000..67c99b0492e5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml
> @@ -0,0 +1,96 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/samsung,s6e8aa0.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung S6E8AA0 AMOLED LCD 5.3 inch panel
> +
> +maintainers:
> +  - Andrzej Hajda <a.hajda@samsung.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: samsung,s6e8aa0
> +
> +  reg: true
> +  reset-gpios: true
> +  display-timings: true
> +
> +  vdd3-supply:
> +    description: core voltage supply
> +
> +  vci-supply:
> +    description: voltage supply for analog circuits
> + 
> +  power-on-delay:
> +    description: delay after turning regulators on [ms]
> +
> +  reset-delay:
> +    description: delay after reset sequence [ms]

Needs a type ref.

> +
> +  init-delay:
> +    description: delay after initialization sequence [ms]

Same here.

> +
> +  panel-width-mm:
> +    description: physical panel width [mm]
> +
> +  panel-height-mm:
> +    description: physical panel height [mm]
> +
> +  flip-horizontal:
> +    description: boolean to flip image horizontally

type: boolean

> +
> +  flip-vertical:
> +    description: boolean to flip image vertically

type: boolean

> +
> +required:
> +  - compatible
> +  - reg
> +  - vdd3-supply 
> +  - vci-supply
> +  - reset-gpios
> +  - display-timings
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel {

panel@0

> +            compatible = "samsung,s6e8aa0";
> +            reg = <0>;
> +            vdd3-supply = <&vcclcd_reg>;
> +            vci-supply = <&vlcd_reg>;
> +            reset-gpios = <&gpy4 5 0>;
> +            power-on-delay= <50>;
> +            reset-delay = <100>;
> +            init-delay = <100>;
> +            panel-width-mm = <58>;
> +            panel-height-mm = <103>;
> +            flip-horizontal;
> +            flip-vertical;
> +
> +            display-timings {
> +                timing0: timing-0 {
> +                    clock-frequency = <57153600>;
> +                    hactive = <720>;
> +                    vactive = <1280>;
> +                    hfront-porch = <5>;
> +                    hback-porch = <5>;
> +                    hsync-len = <5>;
> +                    vfront-porch = <13>;
> +                    vback-porch = <1>;
> +                    vsync-len = <2>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.20.1
> 
