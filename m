Return-Path: <SRS0=83Av=24=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9E0FC33C8C
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 15:44:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B354E24672
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 15:44:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iu1SPelD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728346AbgAGPol (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Jan 2020 10:44:41 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:37384 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727559AbgAGPok (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Jan 2020 10:44:40 -0500
Received: by mail-qk1-f196.google.com with SMTP id 21so43074580qky.4
        for <devicetree@vger.kernel.org>; Tue, 07 Jan 2020 07:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=brSHC3syQNpberHSG1jKdg9VM+aSTdImHwfdjmty0fE=;
        b=iu1SPelD7YO/cb7pKP/SP/x96tZBAafFuA7UuBH7DMFY4hr7s+VO8bCU3zO29gpSpn
         RiDqylnwajy423Sj2t+PF8EyPNtrKJdyfFRJPQ9LQNIgvS9+euX8GdNQFqyo1QuDqr22
         a6+TEY97EJivcJsJ2vY2nS00w3VPLc9uj4GcfVgET6gRfVO1tdviXGUlNGoS46+3ZM6b
         iU6nVpCoXqlps1L1DfvgYvQWIow1Mv4NpxoJJp73wzQBzfoU6JwiLXGQiKman7lD6YTj
         SqLbADD6O0DObocvtWXHMPnnth5ZAIjcYu3vRpO4ulSsDxgjEfECKdOVCumDis4BL/9C
         JRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=brSHC3syQNpberHSG1jKdg9VM+aSTdImHwfdjmty0fE=;
        b=htSnZmDZSYfyE8qLs7Wupg3RTxjqUcvali5N2FHO7VMIwzzN42x6CKo9Iv7B8zmBRJ
         r6PvzTLl0Gpcu25IZbwNqAXx+e5zVcqsNIhCa6o2fibvsvHB33JiYp6BZveRfFjGY+9b
         3MqC7aeI5SUS6zebvls1xs730yOhvVL6eQWd9pxUKGgwekZEjkbjD51YCl+rOKaKZKe9
         0nBEG3KZT1QSQsbfGw3QcZdekteA8/ItMwG05Fgh7xczqvahybn2ieiklUSISvUBHgCJ
         TOvahgCzq3WBBCLFvd5DVUjF+MPKyVHKdlQ3iYUrhsvAO/dpfR6VSpHlMmggzDi76qO6
         AH0g==
X-Gm-Message-State: APjAAAUXRM5ruoryMEkSeKD3hhcxZPJDAZbDhApriRyCpUVU2Xr6L741
        yhtvNHWrkKW6+qlNOl/ixO4vK+xbtjlP/CfGvCorBA==
X-Google-Smtp-Source: APXvYqxIKBRtVJeuT8e/AYWBgalw8NkOw8MG9WUQNF2mVxBbqEPuUgdbpXAUsPSPio1TFQfJD9TOq5l6lwknApQJAnI=
X-Received: by 2002:a37:454d:: with SMTP id s74mr88697089qka.104.1578411879532;
 Tue, 07 Jan 2020 07:44:39 -0800 (PST)
MIME-Version: 1.0
References: <20200102101712.5085-1-sam@ravnborg.org> <20200102101712.5085-3-sam@ravnborg.org>
In-Reply-To: <20200102101712.5085-3-sam@ravnborg.org>
From:   Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date:   Tue, 7 Jan 2020 16:44:28 +0100
Message-ID: <CA+M3ks5Zs5j0FMD4SQiva2soW62tSnu14qiq3kErhLvCMxrxAA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: one file of all simple DSI panels
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
> To complement panel-simple.yaml, create panel-simple-dsi.yaml.
> panel-simple-dsi-yaml are for all simple DSP panels with a single
> power-supply and optional backlight / enable GPIO.
>
> Migrate panasonic,vvx10f034n00 over to the new file.
>
> The objectives with one file for all the simple DSI panels are:
>     - Make it simpler to add bindings for simple DSI panels
>     - Keep the number of bindings file lower
>     - Keep the binding documentation for simple DSI panels more consisten=
t
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
>  .../display/panel/panasonic,vvx10f034n00.txt  | 20 ------
>  .../display/panel/panel-simple-dsi.yaml       | 67 +++++++++++++++++++
>  2 files changed, 67 insertions(+), 20 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/panas=
onic,vvx10f034n00.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel=
-simple-dsi.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/panel/panasonic,vv=
x10f034n00.txt b/Documentation/devicetree/bindings/display/panel/panasonic,=
vvx10f034n00.txt
> deleted file mode 100644
> index 37dedf6a6702..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034=
n00.txt
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -Panasonic 10" WUXGA TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "panasonic,vvx10f034n00"
> -- reg: DSI virtual channel of the peripheral
> -- power-supply: phandle of the regulator that provides the supply voltag=
e
> -
> -Optional properties:
> -- backlight: phandle of the backlight device attached to the panel
> -
> -Example:
> -
> -       mdss_dsi@fd922800 {
> -               panel@0 {
> -                       compatible =3D "panasonic,vvx10f034n00";
> -                       reg =3D <0>;
> -                       power-supply =3D <&vreg_vsp>;
> -                       backlight =3D <&lp8566_wled>;
> -               };
> -       };
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple=
-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-ds=
i.yaml
> new file mode 100644
> index 000000000000..05c52390269e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.ya=
ml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-simple-dsi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Simple DSI panels with a single power-supply
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Sam Ravnborg <sam@ravnborg.org>
> +
> +description: |
> +  This binding file is a collection of the DSI panels that
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
> +    # Panasonic 10" WUXGA TFT LCD panel
> +    - panasonic,vvx10f034n00

Hi Sam,

I have tested your patch with these 2 dsi panels:
# Orise Tech OTM8009A is a 3.97" 480x800 TFT LCD
  - orisetech,otm8009a
 # Raydium Semiconductor Corporation RM68200 is a 5.5" 720x1280 TFT LCD
   - raydium,rm68200

It is close to be fine for me but I have minors comments below.

Benjamin

> +
> +  reg:
> +    maxItems: 1
> +    description: DSI virtual channel
> +
> +  backlight: true
> +  enable-gpios: true
> +  port: true
> +  power-supply: true

add reset-gpios: true to support orisetech panel

> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - power-supply

power-supply should optional

> +  - reg
> +
> +examples:
> +  - |
> +    mdss_dsi@fd922800 {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +      panel@0 {
> +        compatible =3D "panasonic,vvx10f034n00";
> +        reg =3D <0>;
> +        power-supply =3D <&vcc_lcd_reg>;
> +
> +        port {
> +          panel: endpoint {
> +            remote-endpoint =3D <&ltdc_out>;
> +          };
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
