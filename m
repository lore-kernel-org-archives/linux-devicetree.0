Return-Path: <SRS0=tTw7=3K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5DFFC2D0DB
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jan 2020 14:50:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7667C2253D
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jan 2020 14:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579618240;
	bh=yO6sUVHo2vU1aW9UvYMYYgFFa3kduqTRNq2WhJs/f7w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=wPoOTGBzCH07sAlee9qaWoaZqgArXWIVUUpNtgFoSH0JCHprZhnZKa+NXcQiq3Yli
	 gb9pePP4ZdZ8NO6bFKItNJqPrCsy0pqb/KARh4ZZOSdlR/Ky5sv70bWAb+1Dbhrz5O
	 3Mf1ePsfIeC9wLMK5pHUXSuYkEJO6KyJFtyRxAw4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729253AbgAUOuk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Jan 2020 09:50:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:33742 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726968AbgAUOuj (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 21 Jan 2020 09:50:39 -0500
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4A3D024673
        for <devicetree@vger.kernel.org>; Tue, 21 Jan 2020 14:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579618238;
        bh=yO6sUVHo2vU1aW9UvYMYYgFFa3kduqTRNq2WhJs/f7w=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=0bAVEUXFaBptbX8oe3Qx7Iw8+IPHTaMLTFzMzCcFhBVjekc5zukwVQt+HIeFN5Wrp
         Um07NxeXZfSt8YBPgwywiBk/Leywv7vOmFZ2QBUUzBGkMVTyuRAfTIDhSeIHCyCxll
         3g/6m+MJ+kVsNCVMFNS2DZdI9QAHIMb1fDcUvbgw=
Received: by mail-qv1-f47.google.com with SMTP id t6so1551884qvs.5
        for <devicetree@vger.kernel.org>; Tue, 21 Jan 2020 06:50:38 -0800 (PST)
X-Gm-Message-State: APjAAAVpdxkLfNBcFor8fd9+rZ53YhHhqmiF/sPHZuh9jDiZCm9TU+cv
        k579NpEA4EQpDEH6BpXdgtNxLCZKOlBWgJlYcg==
X-Google-Smtp-Source: APXvYqxj87HMN2l0CyGSQN+7ptpxwA3E/+UsVwD68COpFzal3MfAO7QKvxeUwQoJrGu05cxZn82c1lYPqPN6wHk4az4=
X-Received: by 2002:a0c:f68f:: with SMTP id p15mr4955671qvn.79.1579618237414;
 Tue, 21 Jan 2020 06:50:37 -0800 (PST)
MIME-Version: 1.0
References: <20200120200641.15047-1-sam@ravnborg.org> <20200120200641.15047-4-sam@ravnborg.org>
In-Reply-To: <20200120200641.15047-4-sam@ravnborg.org>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 21 Jan 2020 08:50:25 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJz+aG-_AkY2nOn3mSMowhAHHHGGxYSvZyxzevkpjhRjw@mail.gmail.com>
Message-ID: <CAL_JsqJz+aG-_AkY2nOn3mSMowhAHHHGGxYSvZyxzevkpjhRjw@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] dt-bindings: display: convert panel-dpi to DT schema
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree@vger.kernel.org,
        Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        Maxime Ripard <mripard@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Jan 20, 2020 at 2:07 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> With panel-timing converted, now convert the single
> remaining .txt user in panel/ of panel-timing to DT schema.
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

[...]

> diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> new file mode 100644
> index 000000000000..4e19c1fd52c3
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
> +  - Thierry Reding <thierry.reding@gmail.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    contains:
> +      const: panel-dpi
> +    description:
> +      Shall contain "panel-dpi" in addition to a mandatory panel-specific
> +      compatible string defined in individual panel bindings. The "panel-dpi"
> +      value shall never be used on its own.

Yet we have 3 cases where it is...

A 'minItems: 2' should be enough to catch these. Or do:

items:
  - {}
  - const: panel-dpi

Or list the panel compatible that's in the example. That way we'll get
errors for all the undocumented panel compatibles (that's most of
them).

> +
> +  vcc-supply:
> +    description: |
> +      Regulator that will be used to enable power to the display
> +
> +  label: true
> +  enable-gpios: true
> +  reset-gpios: true
> +  backlight: true
> +  panel-timing: true
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
> +      compatible = "samsung,lte430wq-f0c", "panel-dpi";
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
> +        hactive = <480>;
> +        vactive = <272>;
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
