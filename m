Return-Path: <SRS0=rjyW=3U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B705C35240
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jan 2020 17:41:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 30E512173E
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jan 2020 17:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1580492469;
	bh=xszzaaEpbbEax08VU5xvCuq9Bsf/JjNpN40JCLkc/ss=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=xP2Bot32tZO8tDk0WTMrGai+SciXAL6MHczCWkoMhDvD2TQKu9WAcUAwgsJoU2PFa
	 o8TBnqp8cIsaIdzpJU66N31z2H+F993v/sig4LiuGaY6CBUZuuMEkmE+zqS5zBsmyy
	 BEV1nOhjWOdNUz2BZ6yhVQvuZhMwCpBnYIS0c7x8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbgAaRlI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 31 Jan 2020 12:41:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:50442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726749AbgAaRlI (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 31 Jan 2020 12:41:08 -0500
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D32072173E
        for <devicetree@vger.kernel.org>; Fri, 31 Jan 2020 17:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580492467;
        bh=xszzaaEpbbEax08VU5xvCuq9Bsf/JjNpN40JCLkc/ss=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=zFJ50GvvgGvwOd4S131/LAWEV5D59UCMMcy57VtdUrH4vyDwsdwQF50mukUDrAe8k
         44Qm9aUry4G4qVscxUQtOvuzIuvZWbTKcId4qRNN3PBpt8fpGHhtwSakLOARGU8ang
         NV0izsQ/GlBeB8amLbHa0sPuw+GX3eLGLugIw+Uc=
Received: by mail-qt1-f173.google.com with SMTP id e25so5984152qtr.13
        for <devicetree@vger.kernel.org>; Fri, 31 Jan 2020 09:41:06 -0800 (PST)
X-Gm-Message-State: APjAAAWpk2KTWo8yt7nD+9Ie/Jxu24tTl7+p4i5RYLZWGXDUD+6wSTH9
        OhWljho+dlDtft0lWqVtDx/7j8fqBlgXk04p2Q==
X-Google-Smtp-Source: APXvYqxjrrfRA36fdNqYp2gGKshUBhzz5J2P7CvcW484UyPS5Uj9LBhdDLwrtMPg8pFT8K7FzHjA1iCSpTCU2LcBqsA=
X-Received: by 2002:ac8:1415:: with SMTP id k21mr12050220qtj.300.1580492466005;
 Fri, 31 Jan 2020 09:41:06 -0800 (PST)
MIME-Version: 1.0
References: <20200125203454.7450-1-sam@ravnborg.org> <20200125203454.7450-4-sam@ravnborg.org>
In-Reply-To: <20200125203454.7450-4-sam@ravnborg.org>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 31 Jan 2020 11:40:53 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+JsEk1qz7NQc0ybO0xgmTB+YcmUL_d=u7_Y0A56v18nw@mail.gmail.com>
Message-ID: <CAL_Jsq+JsEk1qz7NQc0ybO0xgmTB+YcmUL_d=u7_Y0A56v18nw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: display: convert panel-dpi to DT schema
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree@vger.kernel.org,
        Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        Maxime Ripard <mripard@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Steffen Trumtrar <s.trumtrar@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, Jan 25, 2020 at 2:35 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> With panel-timing converted, now convert the single
> remaining .txt user in panel/ of panel-timing to DT schema.
>
> v2:
>   - Drop Thierry as maintainer, as this is not a general panel binding
>     and I have no acks.
>   - Drop requirement for a panel- specific binding - "panel-dpi" is enough
>   - Updated example
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> ---
>  .../bindings/display/panel/panel-dpi.txt      | 50 -------------
>  .../bindings/display/panel/panel-dpi.yaml     | 71 +++++++++++++++++++
>  2 files changed, 71 insertions(+), 50 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/panel-dpi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.txt b/Documentation/devicetree/bindings/display/panel/panel-dpi.txt
> deleted file mode 100644
> index 6b203bc4d932..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/panel-dpi.txt
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -Generic MIPI DPI Panel
> -======================
> -
> -Required properties:
> -- compatible: "panel-dpi"
> -
> -Optional properties:
> -- label: a symbolic name for the panel
> -- enable-gpios: panel enable gpio
> -- reset-gpios: GPIO to control the RESET pin
> -- vcc-supply: phandle of regulator that will be used to enable power to the display
> -- backlight: phandle of the backlight device
> -
> -Required nodes:
> -- "panel-timing" containing video timings
> -  (Documentation/devicetree/bindings/display/panel/display-timing.txt)
> -- Video port for DPI input
> -
> -Example
> --------
> -
> -lcd0: display@0 {
> -        compatible = "samsung,lte430wq-f0c", "panel-dpi";
> -        label = "lcd";
> -
> -        backlight = <&backlight>;
> -
> -        port {
> -            lcd_in: endpoint {
> -                    remote-endpoint = <&dpi_out>;
> -            };
> -        };
> -
> -        panel-timing {
> -                clock-frequency = <9200000>;
> -                hactive = <480>;
> -                vactive = <272>;
> -                hfront-porch = <8>;
> -                hback-porch = <4>;
> -                hsync-len = <41>;
> -                vback-porch = <2>;
> -                vfront-porch = <4>;
> -                vsync-len = <10>;
> -
> -                hsync-active = <0>;
> -                vsync-active = <0>;
> -                de-active = <1>;
> -                pixelclk-active = <1>;
> -        };
> -};
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> new file mode 100644
> index 000000000000..a8e37318ec05
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-dpi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic MIPI DPI Panel
> +
> +maintainers:
> +  - Sam Ravnborg <sam@ravnborg.org>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    contains:
> +      const: panel-dpi
> +    description:
> +      Shall contain "panel-dpi" in addition to an optional panel-specific
> +      compatible string defined in individual panel bindings.
> +      "panel-dpi" can be used alone, thus no dedicated binding file
> +      is required for each and every panel.

While this has occurred, I don't think the schema should allow it. I
think a 'minItems: 2' should be added here.

AFAIK, MIPI DPI just defines a spec for what already existed. Maybe it
constrains things somewhat, but to the extent why we require a panel
specific compatible in the first place? Doubtful...

Rob

> +  port: true
> +
> +required:
> +  - panel-timing
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    panel@0 {
> +      compatible = "panel-dpi";
> +      label = "lcd";
> +      vcc-supply = <&vcc_supply>;
> +
> +      backlight = <&backlight>;
> +
> +      port {
> +        lcd_in: endpoint {
> +          remote-endpoint = <&dpi_out>;
> +        };
> +      };
> +      panel-timing {
> +        clock-frequency = <9200000>;
> +        hactive = <800>;
> +        vactive = <480>;
> +        hfront-porch = <8>;
> +        hback-porch = <4>;
> +        hsync-len = <41>;
> +        vback-porch = <2>;
> +        vfront-porch = <4>;
> +        vsync-len = <10>;
> +
> +        hsync-active = <0>;
> +        vsync-active = <0>;
> +        de-active = <1>;
> +        pixelclk-active = <1>;
> +      };
> +    };
> --
> 2.20.1
>
