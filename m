Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B721BC352BE
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:25:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 999D820575
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586888754;
	bh=FZPL14b1yiEMIDs4CMNxzLb0Vx7g6SmbDN9RlHQh9iA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=kOUY3YQaj2g9KDfbKuDzwxT/2+TObrhRFIa+7d6w9D3qRah45qzW2lGFgT7Qlrolv
	 7jfylW4NZw56oFuPAyPFRxn2vzl+dtj/Gu9D7QPNnnsAN7VCpQFXkAxavMw1kwrhJg
	 NCaIta2vZ0rOEVap2PL/W5cokmAzMDOsgxi2PX0c=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729690AbgDNSZx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 14:25:53 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41321 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727959AbgDNSZw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 14:25:52 -0400
Received: by mail-ot1-f68.google.com with SMTP id f52so650378otf.8
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 11:25:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dD0ZWW42NAG1gRumaqOnEXSg/sKXKfXPIbvoNmXY8HM=;
        b=cJU7HglaFQ76kZF+6Q5Fr1k+wnp4doiQtP/kSFh5z13PaoXjTt77h/7n0HehsY1UIx
         gf6t8w0sCZA4FKbmDlTg5JDirSwmNPa/czL3vINeii8deTcXA5SygKnBD6HyuhrLsXih
         B4NyUbOQbDMlbb03GfhhxkQAO+ISYgj0Yb3ojYJgdiAdLA+WZEUQ+sxAjrueao/Oars5
         YR3lA1eJA6M98Ro2OBPf+XnYXhD3lVktGcj8GoUE21OM5ht8U5s5YnGV4HE1phWBZ1gk
         g5IxHb0ahtgDO2CTX3YVkQcfBcQD8AdX3KEvS4UgWx7zmzJrgvHPNGHvOz87NKGdZQ4L
         p5dg==
X-Gm-Message-State: AGi0PuZXrhhV6vCxXOn/AftlRDtUromaENCDs5jkfPn1eT3BIgbs4lIN
        jMp10CYeOa9Y8ysjRzgPRhXkSJg=
X-Google-Smtp-Source: APiQypLTQ+JWMb4O8WO7JeWbNb15oh1VRbQbgkZtfsEiWTGIDqZ+ppH/wFL7hXDLjdW1jt2onHjj1g==
X-Received: by 2002:a9d:6413:: with SMTP id h19mr17984845otl.203.1586888751210;
        Tue, 14 Apr 2020 11:25:51 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n184sm1183752oia.40.2020.04.14.11.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 11:25:50 -0700 (PDT)
Received: (nullmailer pid 16456 invoked by uid 1000);
        Tue, 14 Apr 2020 18:25:49 -0000
Date:   Tue, 14 Apr 2020 13:25:49 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org,
        Jerry Han <hanxu5@huaqin.corp-partner.google.com>
Subject: Re: [PATCH v2 06/36] dt-bindings: display: convert boe,himax8279d to
 DT Schema
Message-ID: <20200414182549.GA11086@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-7-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-7-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Apr 08, 2020 at 09:50:39PM +0200, Sam Ravnborg wrote:
> v2:
>   - Fix entry in MAINTAINERS
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Jerry Han <hanxu5@huaqin.corp-partner.google.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../bindings/display/panel/boe,himax8279d.txt | 24 --------
>  .../display/panel/boe,himax8279d.yaml         | 59 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 60 insertions(+), 25 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/boe,himax8279d.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/boe,himax8279d.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/boe,himax8279d.txt b/Documentation/devicetree/bindings/display/panel/boe,himax8279d.txt
> deleted file mode 100644
> index 3caea2172b1b..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/boe,himax8279d.txt
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -Boe Himax8279d 1200x1920 TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "boe,himax8279d8p" and one of: "boe,himax8279d10p"
> -- reg: DSI virtual channel of the peripheral
> -- enable-gpios: panel enable gpio
> -- pp33-gpios: a GPIO phandle for the 3.3v pin that provides the supply voltage
> -- pp18-gpios: a GPIO phandle for the 1.8v pin that provides the supply voltage
> -
> -Optional properties:
> -- backlight: phandle of the backlight device attached to the panel
> -
> -Example:
> -
> -	&mipi_dsi {
> -		panel {
> -			compatible = "boe,himax8279d8p", "boe,himax8279d10p";
> -			reg = <0>;
> -			backlight = <&backlight>;
> -			enable-gpios = <&gpio 45 GPIO_ACTIVE_HIGH>;
> -			pp33-gpios = <&gpio 35 GPIO_ACTIVE_HIGH>;
> -			pp18-gpios = <&gpio 36 GPIO_ACTIVE_HIGH>;
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/display/panel/boe,himax8279d.yaml b/Documentation/devicetree/bindings/display/panel/boe,himax8279d.yaml
> new file mode 100644
> index 000000000000..e42b6a8ae176
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/boe,himax8279d.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/boe,himax8279d.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Boe Himax8279d 1200x1920 TFT LCD panel
> +
> +maintainers:
> +  - Jerry Han <jerry.han.hq@gmail.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: boe,himax8279d8p
> +      - const: boe,himax8279d10p
> +
> +  backlight: true
> +  enable-gpios: true
> +  reg: true
> +
> +  pp33-gpios:
> +    maxItems: 1
> +    description: GPIO for the 3.3v pin that provides the supply voltage
> +
> +  pp18-gpios:
> +    maxItems: 1
> +    description: GPIO for the 1.8v pin that provides the supply voltage
> +
> +required:
> +  - compatible
> +  - reg
> +  - enable-gpios
> +  - pp33-gpios
> +  - pp18-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        panel {

panel@0

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

Double check the others. I won't repeat myself.

> +            compatible = "boe,himax8279d8p", "boe,himax8279d10p";
> +            reg = <0>;
> +            backlight = <&backlight>;
> +            enable-gpios = <&gpio 45 GPIO_ACTIVE_HIGH>;
> +            pp33-gpios = <&gpio 35 GPIO_ACTIVE_HIGH>;
> +            pp18-gpios = <&gpio 36 GPIO_ACTIVE_HIGH>;
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2b99fa16ba08..dba84e7726b7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5255,7 +5255,7 @@ DRM DRIVER FOR BOE HIMAX8279D PANELS
>  M:	Jerry Han <hanxu5@huaqin.corp-partner.google.com>
>  S:	Maintained
>  F:	drivers/gpu/drm/panel/panel-boe-himax8279d.c
> -F:	Documentation/devicetree/bindings/display/panel/boe,himax8279d.txt
> +F:	Documentation/devicetree/bindings/display/panel/boe,himax8279d.yaml
>  
>  DRM DRIVER FOR FARADAY TVE200 TV ENCODER
>  M:	Linus Walleij <linus.walleij@linaro.org>
> -- 
> 2.20.1
> 
