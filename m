Return-Path: <SRS0=83Av=24=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FA3CC33C8C
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 15:41:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 644B02081E
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 15:41:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UyJCsYn7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727994AbgAGPl1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Jan 2020 10:41:27 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:37989 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727559AbgAGPl1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Jan 2020 10:41:27 -0500
Received: by mail-qk1-f195.google.com with SMTP id k6so43019693qki.5
        for <devicetree@vger.kernel.org>; Tue, 07 Jan 2020 07:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LGgTET/mQ+BQRq2YpjHXtJkj1SpWAwe/cmMnJ4k3kFk=;
        b=UyJCsYn7+6NIErK/D0MTwbj7pWmKOeR39+gxmJfRkbxji5ujsEy/gFQ358VacSAA+E
         lY4VWw8jg/a8wKU36JVrTnZoFLxj34yMZnzxJR5VQ1fIAAkjw/iVIvy82CTazStGTEwB
         iBZtom5W59o/iyla+9cC4FXNXzAGDP+2eYd+Re7q9MddAZRZcuej6VVjxzy+cCiLa1sH
         X8Zzd5rXASOQdZFUEA56qF1X/DGdQ9EKaQpRsTrWhAZjdpjAmEC2rp1QCUFC7a8gHr5z
         /HuM+w2gc6qA6BxqXVikjmLrdAEpkXdGS6aBDbN7EnS4TVm5rngY+sflIjvQSHLLZnxE
         O+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LGgTET/mQ+BQRq2YpjHXtJkj1SpWAwe/cmMnJ4k3kFk=;
        b=tJoBGmel0MBK/WGKeuxQhh4++sByAjhle3wdb1jACF7UhXA0eZZPoQW6E6uEktNcEc
         Jx/nBF/XdO+UlLBB33bZKxjj/OjS9CgW53Ad/lMWXkHjIxETiDMuaIXqGyUtrckrRlbT
         iqIVu7LMf42i/xjqarVMX/N7P4CfTJNqebRmBjVcjjI16qnIfR6ltI3yJF6imeR+nP7J
         5Oj2TQDXsPK4yCqXHyXiW1EdKCDWvTXcHCijwqdAT7t/0K6N5gcY2Uz/chI+gADx0Yl3
         /xBCzCuJ90FpwRXelJnNiL/DB5+FLNa/6nEMpwhauwZOPlqrQs41JL8pjd2dWaKPGSXE
         G3mQ==
X-Gm-Message-State: APjAAAUDtOih1rKnfgHNVhzKD3og7zV+n/0LDQn5Zzz2RnVuyXf5zw5D
        ky5tUOodIpTpuqmf83ue274ojIGY0ELTuHjZY4z5jA==
X-Google-Smtp-Source: APXvYqxQVQLtTp5i1Sqih0sWcwsCL51KS/gxOBHo2eRvfS5iLJb09nd6Ixt72/6fAmAs3CSkFEiR8aa6RhzW5Hs01zA=
X-Received: by 2002:a37:4ac6:: with SMTP id x189mr86160417qka.219.1578411686063;
 Tue, 07 Jan 2020 07:41:26 -0800 (PST)
MIME-Version: 1.0
References: <20200102101712.5085-1-sam@ravnborg.org> <20200102101712.5085-2-sam@ravnborg.org>
In-Reply-To: <20200102101712.5085-2-sam@ravnborg.org>
From:   Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date:   Tue, 7 Jan 2020 16:41:15 +0100
Message-ID: <CA+M3ks7_5To5r+PgUdg_4RrUpxHwVNuzTWGmn-cNXcfrgTq5Vg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: one binding file for all simple panels
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        Yannick Fertre <yannick.fertre@st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Le jeu. 2 janv. 2020 =C3=A0 11:17, Sam Ravnborg <sam@ravnborg.org> a =C3=A9=
crit :
>
> There is an increasing number of new simple panels.
> Common for many of these simple panels are that they have one
> mandatory power-supply and some of them have backlight and / or
> an enable gpio.
>
> The binding file to describe these panels adds overhead
> that really do not add value.
> The binding are known and there is nothing gained from a
> dedicated binding file nor for any dedicated example.
>
> The following patch introduces a single panel-simple.yaml
> and converts two ampire bindings over to the new file.
>
> The conversion - if applied will have following effects:
>
> - The maintainer for the individual file will change
>     There is no need for many different maintainers for a simple binding.
>     We have the same situation with the panel-simple driver in the kernel=
.
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
> The objectives with one file for the relevant simple panels are:
> - Make it simpler to add bindings for simple panels
> - Keep the number of bindings file lower and thus easier to find a
>   relevant file to copy from when adding new panels.
> - Keep the binding documentation for simple panels more consistent
> - Make it simpler to add support for new panels
>
> v2:
>   - spelling fixes (imirkin via irc, Rob)
>   - updated description (Rob)
>   - list properires in alphabetical order
>   - added power-supply to example (Rob)
>   - updated title
>   - reworded changelog a little
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
>  .../panel/ampire,am-480272h3tmqw-t01h.yaml    | 42 -------------
>  .../panel/ampire,am800480r3tmqwa1h.txt        |  7 ---
>  .../bindings/display/panel/panel-simple.yaml  | 59 +++++++++++++++++++
>  3 files changed, 59 insertions(+), 49 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/ampir=
e,am-480272h3tmqw-t01h.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/ampir=
e,am800480r3tmqwa1h.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel=
-simple.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/panel/ampire,am-48=
0272h3tmqw-t01h.yaml b/Documentation/devicetree/bindings/display/panel/ampi=
re,am-480272h3tmqw-t01h.yaml
> deleted file mode 100644
> index c6e33e7f36d0..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/ampire,am-480272h3t=
mqw-t01h.yaml
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0
> -%YAML 1.2
> ----
> -$id: http://devicetree.org/schemas/display/panel/ampire,am-480272h3tmqw-=
t01h.yaml#
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
> -      compatible =3D "ampire,am-480272h3tmqw-t01h";
> -      enable-gpios =3D <&gpioa 8 1>;
> -      port {
> -        panel_in_rgb: endpoint {
> -          remote-endpoint =3D <&controller_out_rgb>;
> -        };
> -      };
> -    };
> -
> -...
> diff --git a/Documentation/devicetree/bindings/display/panel/ampire,am800=
480r3tmqwa1h.txt b/Documentation/devicetree/bindings/display/panel/ampire,a=
m800480r3tmqwa1h.txt
> deleted file mode 100644
> index 83e2cae1cc1b..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/ampire,am800480r3tm=
qwa1h.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -Ampire AM-800480R3TMQW-A1H 7.0" WVGA TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "ampire,am800480r3tmqwa1h"
> -
> -This binding is compatible with the simple-panel binding, which is speci=
fied
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple=
.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> new file mode 100644
> index 000000000000..51ca50201182
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Simple panels with one power supply
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Sam Ravnborg <sam@ravnborg.org>
> +
> +description: |
> +  This binding file is a collection of the simple (dumb) panels that
> +  requires only a single power-supply.
> +  There are optionally a backlight and an enable GPIO.
> +  The panel may use an OF graph binding for the association to the displ=
ay,
> +  or it may be a direct child node of the display.
> +
> +  If the panel is more advanced a dedicated binding file is required.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +
> +  compatible:
> +    enum:
> +    # compatible must be listed in alphabetical order, ordered by compat=
ible.
> +    # The description in the comment is mandatory for each compatible.
> +
> +    # Ampire AM-480272H3TMQW-T01H 4.3" WQVGA TFT LCD panel
> +    - ampire,am-480272h3tmqw-t01h
> +    # Ampire AM-800480R3TMQW-A1H 7.0" WVGA TFT LCD panel
> +    - ampire,am800480r3tmqwa1h
> +
> +  backlight: true
> +  enable-gpios: true
> +  port: true
> +  power-supply: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - power-supply

Hi Sam,

power-supply property should be optional like it was in
ampire,am-480272h3tmqw-t01h.yaml
else it looks good for me.

Benjamin

> +
> +examples:
> +  - |
> +    panel_rgb: panel-rgb {
> +      compatible =3D "ampire,am-480272h3tmqw-t01h";
> +      power-supply =3D <&vcc_lcd_reg>;
> +
> +      port {
> +        panel_in_rgb: endpoint {
> +          remote-endpoint =3D <&ltdc_out_rgb>;
> +        };
> +      };
> +    };
> --
> 2.20.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
