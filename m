Return-Path: <SRS0=+REJ=2V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67286C2D0DD
	for <linux-devicetree@archiver.kernel.org>; Tue, 31 Dec 2019 17:34:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 325522072A
	for <linux-devicetree@archiver.kernel.org>; Tue, 31 Dec 2019 17:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1577813662;
	bh=Ubol+ZGU8I4XwjYgID2dzkX13k4qieKCPvZKaGiNPk8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=qgYLrWC0NLBPe3gwZeAlC63mTBi3RbdYKqJuLBKbjYsTgrw0kDzIkfvmoBX5cuwcW
	 ELM75O4Xa3zZxu37LjiBAWpRKtEoVm4HEY6H6SoWczbmVvBIiazPIdedv9CGpNpYs1
	 1Teto9+uOb8GH+H0lmjul9du7dal0cLpZaHu0Q70=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbfLaReV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 31 Dec 2019 12:34:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:35812 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726060AbfLaReV (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 31 Dec 2019 12:34:21 -0500
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DB79820718
        for <devicetree@vger.kernel.org>; Tue, 31 Dec 2019 17:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577813660;
        bh=Ubol+ZGU8I4XwjYgID2dzkX13k4qieKCPvZKaGiNPk8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=TlpWPubXziGZTlzh6vZ8vAHgxyk+pmzNan+cIz7d2+X3ZGCfuwKcP3oov9j61O+9v
         J5TeTgeeBYE+ZW6PzcHgH3nYgIKP9/fEJvg/C840KOFDofHCEcnVMrbkxn/t5qs189
         3YqryjVxvDPo/VagOAaj1U5zSD30K+K3k/IvBwi8=
Received: by mail-qk1-f182.google.com with SMTP id c16so28659582qko.6
        for <devicetree@vger.kernel.org>; Tue, 31 Dec 2019 09:34:19 -0800 (PST)
X-Gm-Message-State: APjAAAVnw0rQKX7rWVdQlf4eVGUCEUyVY6YsDyO9wicBqS5q+bjS+JlG
        tvCppg+u6/x+hH4hAClZjU+eIoRs8Klq7oGdYg==
X-Google-Smtp-Source: APXvYqylznp1w41TRmEbV6098m/uRQMYL2IrzKtJTBmuX+S4z65S6oayY8srI9hmWTHPYp3Vxpg73ZSg3+I9IIYm53I=
X-Received: by 2002:a37:a70b:: with SMTP id q11mr59234429qke.393.1577813658959;
 Tue, 31 Dec 2019 09:34:18 -0800 (PST)
MIME-Version: 1.0
References: <20191231132126.GA13365@ravnborg.org>
In-Reply-To: <20191231132126.GA13365@ravnborg.org>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 31 Dec 2019 10:34:07 -0700
X-Gmail-Original-Message-ID: <CAL_Jsq+Agt6dOkq_E_ky7c0x-QtsWgi4os+NXZV73gtNHCAo3w@mail.gmail.com>
Message-ID: <CAL_Jsq+Agt6dOkq_E_ky7c0x-QtsWgi4os+NXZV73gtNHCAo3w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] dt-bindings: one binding file for all simple panels
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Yannick Fertre <yannick.fertre@st.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Dec 31, 2019 at 6:21 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Thierry - I would appreciate feedback from you on this approach!

For the record, I'm in favor of this.

>
> There is an increasing number of new simple panels.
> Common for all simple panels are that they have a
> mandatory power-supply and some of them have backlight and / or
> an enable gpio.

This is the key part I think. It must be clear that only panels with a
single supply meet the definition of 'simple panel'. The main
variation for current bindings are what properties are required or
not. Both backlight and enable gpio could be tied off on any given
platform so they can never really be required.

We'll also probably want to do a version for DSI panels which add 'reg'.

> The binding file to describe these panels adds overhead
> that really do not add value.
> The binding are known and there is nothing gained from a specific
> example as they all look alike.
>
> The following patch introduces a single panel-simple.yaml
> and converts two ampire bindings over to the new file.
>
> The conversion - if applied will have following effects:
>
> - The maintainer for the individual file will change
>     There is no need for many different maintainers for a simple binding.
>     We have the same situation with the panel-simple driver in the kernel.
>
> - The license will change to (GPL-2.0-only OR BSD-2-Clause)
>     There is usually only a single line copied from the original
>     file, a line that is often copied from a datasheet.
>     This license change should be acceptable considered what little
>     is copied.
>     If the license change is not OK we can use a dedicated binding
>     file in these cases.
>
> This is a follow-up on Rob's big patch converting a lot of panel bindings
> to individual files:
>
> "dt-bindings: display: Convert a bunch of panels to DT schema"
> https://patchwork.ozlabs.org/patch/1197683/
>
> The objectives with one file for all the simple panles are:
> - Make it simpler to add bindings for simple panels
> - Keep the number of bindings file lower and thus easier to find a
>   relevant file to copy from when adding new panels.
> - Keep the binding documentation for simple panels more consistent
> - Make it simpler to add support for new panels
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Yannick Fertre <yannick.fertre@st.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: devicetree@vger.kernel.org
> ---
>  .../panel/ampire,am-480272h3tmqw-t01h.yaml    | 42 --------------
>  .../panel/ampire,am800480r3tmqwa1h.txt        |  7 ---
>  .../bindings/display/panel/panel-simple.yaml  | 56 +++++++++++++++++++
>  3 files changed, 56 insertions(+), 49 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/ampire,am-480272h3tmqw-t01h.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/ampire,am800480r3tmqwa1h.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-simple.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/panel/ampire,am-480272h3tmqw-t01h.yaml b/Documentation/devicetree/bindings/display/panel/ampire,am-480272h3tmqw-t01h.yaml
> deleted file mode 100644
> index c6e33e7f36d0..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/ampire,am-480272h3tmqw-t01h.yaml
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0
> -%YAML 1.2
> ----
> -$id: http://devicetree.org/schemas/display/panel/ampire,am-480272h3tmqw-t01h.yaml#
> -$schema: http://devicetree.org/meta-schemas/core.yaml#
> -
> -title: Ampire AM-480272H3TMQW-T01H 4.3" WQVGA TFT LCD panel
> -
> -maintainers:
> -  - Yannick Fertre <yannick.fertre@st.com>
> -  - Thierry Reding <treding@nvidia.com>
> -
> -allOf:
> -  - $ref: panel-common.yaml#
> -
> -properties:
> -  compatible:
> -    const: ampire,am-480272h3tmqw-t01h
> -
> -  power-supply: true
> -  enable-gpios: true
> -  backlight: true
> -  port: true
> -
> -required:
> -  - compatible
> -
> -additionalProperties: false
> -
> -examples:
> -  - |
> -    panel_rgb: panel {
> -      compatible = "ampire,am-480272h3tmqw-t01h";
> -      enable-gpios = <&gpioa 8 1>;
> -      port {
> -        panel_in_rgb: endpoint {
> -          remote-endpoint = <&controller_out_rgb>;
> -        };
> -      };
> -    };
> -
> -...
> diff --git a/Documentation/devicetree/bindings/display/panel/ampire,am800480r3tmqwa1h.txt b/Documentation/devicetree/bindings/display/panel/ampire,am800480r3tmqwa1h.txt
> deleted file mode 100644
> index 83e2cae1cc1b..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/ampire,am800480r3tmqwa1h.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -Ampire AM-800480R3TMQW-A1H 7.0" WVGA TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "ampire,am800480r3tmqwa1h"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> new file mode 100644
> index 000000000000..711fac0a4d12
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Simple panels
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Sam Ravnborg <sam@ravnborg.org>
> +
> +description: |
> +  This binding file is a collection of the simple (dump) panels that

s/dump/dumb/

> +  requires only a power-supply.
> +  There are optionally a backlight and an enable GPIO.
> +  If the panel is more andvanced a dedicated binding file is required.

typo.

I'd move this sentence down and be its own paragraph. We want it to be
very clear to not add new properties here.

> +  The panel may use a port binding for the association to the display,

s/port/OF graph/

> +  or it may be a direct child node of the display.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +
> +  compatible:
> +    enum:
> +    # compatible must be listed in alphabetical order, ordered by compatible.
> +    # The description in the comment is mandatory for each compatible.
> +
> +    # Ampire AM-480272H3TMQW-T01H 4.3" WQVGA TFT LCD panel
> +    - ampire,am-480272h3tmqw-t01h
> +    # Ampire AM-800480R3TMQW-A1H 7.0" WVGA TFT LCD panel
> +    - ampire,am800480r3tmqwa1h
> +
> +  backlight: true
> +  enable-gpios: true
> +  power-supply: true
> +  port: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - power-supply
> +
> +examples:
> +  - |
> +    panel_rgb: panel-rgb {
> +      compatible = "ampire,am-480272h3tmqw-t01h";

This will fail validation as power-supply is missing. :) I suspect we
will have some real failures too and those will need to add
fixed-regulator to fix.

> +      port {
> +        panel_in_rgb: endpoint {
> +          remote-endpoint = <&ltdc_out_rgb>;
> +        };
> +      };
> +    };
> --
> 2.20.1
>
