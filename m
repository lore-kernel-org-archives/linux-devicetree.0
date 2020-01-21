Return-Path: <SRS0=tTw7=3K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A15C3F68F
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jan 2020 14:36:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D21F924125
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jan 2020 14:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579617359;
	bh=qz4XrhVRI7BCBH03PSlzK4CteBe1Akkcx6DDbcgTrjk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=DD950iVgqeKpBhy88cblEMrXZaHGollp/w0OhsIzD+n+7XGTMG6kQrfk0vjsRvKVY
	 c9PI96S7a5GX/bFId5ni6+LDNQia76xS6oFoZTDkZQTRd++jEBSiLLZiqpsmcgrv70
	 aaVHDTg610RD7zULv/bixPxbkoXDBAufn0ZxnChI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727508AbgAUOf7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Jan 2020 09:35:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:53472 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726968AbgAUOf7 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 21 Jan 2020 09:35:59 -0500
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 598CF2070C
        for <devicetree@vger.kernel.org>; Tue, 21 Jan 2020 14:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579617357;
        bh=qz4XrhVRI7BCBH03PSlzK4CteBe1Akkcx6DDbcgTrjk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=sRWMXgtatScU+x2PqeY4zmccYL580EbDEb5TwFNvWo4GGocoeTy0er/SvgT8sA3I2
         OpKhDkcPBqoT7PTOF7lAkWFymhZumpKA+aML0gsmeI/9wi9Xx2+DoJupPhCy7FD129
         dm+rr/6tJL4DncWM7TF7rFS5dZfOdV0AunkpM3wE=
Received: by mail-qt1-f169.google.com with SMTP id w47so2756459qtk.4
        for <devicetree@vger.kernel.org>; Tue, 21 Jan 2020 06:35:57 -0800 (PST)
X-Gm-Message-State: APjAAAVYhv1aLhwvHBk7d5mDCYIDcY7O2X0wjpxgklNTPPfUpot6WvAz
        Y3OmUQ/XbPTCycZNlh/XrpCsdHQaNj1HGrwf8A==
X-Google-Smtp-Source: APXvYqwD85PmWH51to8pPggXXCakaSbtpO2dsSBTJ0wbPbfLpvD073XEXFTnXIEqjozzFKalPXY2zX/Ed4Qcr6AVuO0=
X-Received: by 2002:ac8:59:: with SMTP id i25mr4749434qtg.110.1579617356483;
 Tue, 21 Jan 2020 06:35:56 -0800 (PST)
MIME-Version: 1.0
References: <20200120200641.15047-1-sam@ravnborg.org> <20200120200641.15047-2-sam@ravnborg.org>
In-Reply-To: <20200120200641.15047-2-sam@ravnborg.org>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 21 Jan 2020 08:35:45 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKPYEWkcq5iDKOcJdSMkG=LpxJdxVi_fM_JbEymsm-SCw@mail.gmail.com>
Message-ID: <CAL_JsqKPYEWkcq5iDKOcJdSMkG=LpxJdxVi_fM_JbEymsm-SCw@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: display: add panel-timing.yaml
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
> Add meta-schema variant of panel-timing and
> reference it from panel-common.yaml.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> Cc: devicetree@vger.kernel.org
> ---
>  .../bindings/display/panel/panel-common.yaml  |   7 +-
>  .../bindings/display/panel/panel-timing.yaml  | 253 ++++++++++++++++++
>  2 files changed, 256 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-timing.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> index ef8d8cdfcede..8070c439adbd 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> @@ -54,13 +54,12 @@ properties:
>
>    # Display Timings
>    panel-timing:
> -    type: object
>      description:
>        Most display panels are restricted to a single resolution and
>        require specific display timings. The panel-timing subnode expresses those
> -      timings as specified in the timing subnode section of the display timing
> -      bindings defined in
> -      Documentation/devicetree/bindings/display/panel/display-timing.txt.
> +      timings.
> +    allOf:
> +      - $ref: panel-timing.yaml#
>
>    # Connectivity
>    port:
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-timing.yaml b/Documentation/devicetree/bindings/display/panel/panel-timing.yaml
> new file mode 100644
> index 000000000000..59891c7a58ee
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-timing.yaml
> @@ -0,0 +1,253 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)

Some of this comes from the existing binding files, do you have rights
to change the license (it would be nice to get it).

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-timing.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: panel timing bindings
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Sam Ravnborg <sam@ravnborg.org>
> +
> +description: |
> +  There are different ways of describing the timing data data of a panel. The
> +  devicetree representation corresponds to the one commonly found in datasheets
> +  for panels. If a panel supports multiple signal timings, the native-mode
> +  can be specified.
> +
> +  The parameters are defined as seen in the following illustration.
> +
> +  +----------+-------------------------------------+----------+-------+
> +  |          |        ^                            |          |       |
> +  |          |        |vback_porch                 |          |       |
> +  |          |        v                            |          |       |
> +  +----------#######################################----------+-------+
> +  |          #        ^                            #          |       |
> +  |          #        |                            #          |       |
> +  |  hback   #        |                            #  hfront  | hsync |
> +  |   porch  #        |       hactive              #  porch   |  len  |
> +  |<-------->#<-------+--------------------------->#<-------->|<----->|
> +  |          #        |                            #          |       |
> +  |          #        |vactive                     #          |       |
> +  |          #        |                            #          |       |
> +  |          #        v                            #          |       |
> +  +----------#######################################----------+-------+
> +  |          |        ^                            |          |       |
> +  |          |        |vfront_porch                |          |       |
> +  |          |        v                            |          |       |
> +  +----------+-------------------------------------+----------+-------+
> +  |          |        ^                            |          |       |
> +  |          |        |vsync_len                   |          |       |
> +  |          |        v                            |          |       |
> +  +----------+-------------------------------------+----------+-------+
> +
> +
> +  The following is the panel timings shown with time on the x-axis.
> +  This matches the timing diagrams often found in data sheets.
> +
> +              Active                 Front           Sync           Back
> +              Region                 Porch                          Porch
> +  <-----------------------><----------------><-------------><-------------->
> +    //////////////////////|
> +   ////////////////////// |
> +  //////////////////////  |..................               ................
> +                                             _______________
> +
> +  Timing can be specified either as a typical value or as a tuple
> +  of min, typ, max values.
> +
> +properties:
> +
> +  clock-frequency:
> +   $ref: /schemas/types.yaml#/definitions/uint32

There's already a type definition for this.

> +   description: |

Drop '|' unless you have multiple paragraphs or need to maintain formatting.

> +     Panel clock in Hz
> +
> +  hactive:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +       Horizontal panel resolution in pixels
> +
> +  vactive:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Verical panel resolution in pixels

typo

> +
> +  hfront-porch:
> +    description: |
> +      Horizontal front porch panel timing
> +    oneOf:
> +      - allOf:
> +        - $ref: /schemas/types.yaml#/definitions/uint32-array
> +        - maxItems: 1
> +          items:
> +            description: typical number of pixels
> +      - allOf:
> +        - $ref: /schemas/types.yaml#/definitions/uint32-array
> +        - minItems: 3
> +          maxItems: 3
> +          items:
> +            description: min, typ, max number of pixels

I think you can describe it like this (test with 2 items though):

allOf:
  - $ref: /schemas/types.yaml#/definitions/uint32-array
not:
  maxItems: 2
items:
  - description: ...
  - description: ...
  - description: ...

> +
> +  hback-porch:
> +    description: |
> +      Horizontal back porch timing
> +    oneOf:
> +      - allOf:
> +        - $ref: /schemas/types.yaml#/definitions/uint32-array
> +        - maxItems: 1
> +          items:
> +            description: typical number of pixels
> +      - allOf:
> +        - $ref: /schemas/types.yaml#/definitions/uint32-array
> +        - minItems: 3
> +          maxItems: 3
> +          items:
> +            description: min, typ, max number of pixels
> +
> +  hsync-len:
> +    description: |
> +      Horizontal sync length panel timing
> +    oneOf:
> +      - allOf:
> +        - $ref: /schemas/types.yaml#/definitions/uint32-array
> +        - maxItems: 1
> +          items:
> +            description: typical number of pixels
> +      - allOf:
> +        - $ref: /schemas/types.yaml#/definitions/uint32-array
> +        - minItems: 3
> +          maxItems: 3
> +          items:
> +            description: min, typ, max number of pixels
> +
> +  vfront-porch:
> +    description: |
> +      Vertical front porch panel timing
> +    oneOf:
> +      - allOf:
> +        - $ref: /schemas/types.yaml#/definitions/uint32-array
> +        - maxItems: 1
> +          items:
> +            description: typical number of lines
> +      - allOf:
> +        - $ref: /schemas/types.yaml#/definitions/uint32-array
> +        - minItems: 3
> +          maxItems: 3
> +          items:
> +            description: min, typ, max number of lines
> +
> +  vback-porch:
> +    description: |
> +      Vertical back porch panel timing
> +    oneOf:
> +      - allOf:
> +        - $ref: /schemas/types.yaml#/definitions/uint32-array
> +        - maxItems: 1
> +          items:
> +            description: typical number of lines
> +      - allOf:
> +        - $ref: /schemas/types.yaml#/definitions/uint32-array
> +        - minItems: 3
> +          maxItems: 3
> +          items:
> +            description: min, typ, max number of lines
> +
> +  vsync-len:
> +    description: |
> +      Vertical sync length panel timing
> +    oneOf:
> +      - allOf:
> +        - $ref: /schemas/types.yaml#/definitions/uint32-array
> +        - maxItems: 1
> +          items:
> +            description: typical number of lines
> +      - allOf:
> +        - $ref: /schemas/types.yaml#/definitions/uint32-array
> +        - minItems: 3
> +          maxItems: 3
> +          items:
> +            description: min, typ, max number of lines
> +
> +  hsync-active:
> +    description: |
> +      Horizontal sync pulse.
> +      If omitted then it is not used by the hardware
> +    oneOf:
> +      - const: 0
> +        description: active low
> +      - const: 1
> +        description: active high
> +
> +  vsync-active:
> +    description: |
> +      Vertical sync pulse.
> +      If omitted then it is not used by the hardware
> +    oneOf:
> +      - const: 0
> +        description: active low
> +      - const: 1
> +        description: active high
> +
> +  de-active:
> +    description: |
> +      Data enable.
> +      If omitted then it is not used by the hardware
> +    oneOf:
> +      - const: 0
> +        description: active low
> +      - const: 1
> +        description: active high
> +
> +  pixelclk-active:
> +    description: |
> +      Data driving on rising or falling edge
> +    oneOf:
> +      - const: 0
> +        description: |
> +          Drive pixel data on falling edge and
> +          sample data on rising edge
> +      - const: 1
> +        description: |
> +          Drive pixel data on rising edge and
> +          sample data on falling edge
> +
> +  syncclk-active:
> +    description: |
> +      Drive sync on rising or sample sync on falling edge.
> +      If not specified then the same as pixelclk-active
> +    oneOf:
> +      - const: 0
> +        description: |
> +          Drive sync on falling edge and
> +          sample sync on rising edge of pixel clock
> +      - const: 1
> +        description: |
> +          Drive sync on rising edge and
> +          sample sync on falling edge of pixel clock
> +
> +  interlaced:
> +    type: boolean
> +    description: Enable interlaced mode
> +
> +  doublescan:
> +    type: boolean
> +    description: Enable double scan mode
> +
> +  doubleclk:
> +    type: boolean
> +    description: Enable double clock mode
> +
> +required:
> + - clock-frequency
> + - hactive
> + - vactive
> + - hfront-porch
> + - hback-porch
> + - hsync-len
> + - vfront-porch
> + - vback-porch
> + - vsync-len
> +
> +additionalProperties: false
> --
> 2.20.1
>
