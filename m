Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E20C00523
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 09:41:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 88CF22070E
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 09:41:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="okYH2Iap"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgAHJlY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 04:41:24 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:35588 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726098AbgAHJlX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 04:41:23 -0500
Received: by mail-qk1-f194.google.com with SMTP id z76so2074483qka.2
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 01:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3k6KL6OW1KuD898Wo+SDCSL7TZFSrXg9GJsYynsrAdM=;
        b=okYH2IapmjevC5ti+PTUU3rDgJnZbZhkOFFP5/HMzw3t1VcZyMsKGQdtxXCzMGoe02
         WojLrMbu17kYro+jjp3Rmim2CnbXH3uS2MO7JBir6PHFg9U69der0jw6adFENPjLflIq
         zxtGDVyKIkkS08xrxFMFQnKYye0r0cJo6+sXyLUOBtv5H0w//MCznhmoqcGVd/wVzgY3
         3M/k4/d8p3TAMefDrxzrIFFm77j0U7A+Ny+1iHJDuVmlFykct7vmExVd0d4WNy/FTiJz
         WnI3+HLDB79CSwQAC/tQVJf9KjuwQefZVLUYHbkLqWlrE1UP0mj/Hf8F8jx4N8JBBEUT
         Wc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3k6KL6OW1KuD898Wo+SDCSL7TZFSrXg9GJsYynsrAdM=;
        b=nmP8e+OCYOIVScO8YZmbL2QbFzPmgmVjCNvHG+OSa2UFl6AcFVBlkzySknX4SDVCLt
         q7KaFtWR7TA4EgWDGkyWE62d/jlZ5Kl6DxP+XInv1vHGmy8KsGyVF0oXvUO6+L4AaBud
         CaJI8Idz0NgI99ZzMiW2knqIMcM/mQM90pha6p3jm7qMZxzR7oYUz1KgzQ871qdz722g
         8nAyJkBoxaF9rkBN+dNhAYFuN75bVjzZUSFrGJjhudQdorS60PDgEk9p00MnbX0JOVT9
         TJ+Oy6v4HvoheOlj/fiHybDwhY6H9aygZUtrad8sIaILLYMPywRq7Cymi4NAKspntni0
         Mq7w==
X-Gm-Message-State: APjAAAVNbr7w8qR+rBlORHpoZ8ADzt6Zbs5c2UFEXMNvE/zw25RY+OTK
        JljV9QgubUbN9L+x7nA+B1PhO+fi4DDsVbZmfn++cw==
X-Google-Smtp-Source: APXvYqy2/LpK3ufvjtvR9X+/rFP3P9INLibytATp5NFmROxu1EyOEfLgKPVYeRJln5R2ecUpmMXB1RsyhjuzaypjjWI=
X-Received: by 2002:a05:620a:cd1:: with SMTP id b17mr3073346qkj.427.1578476482847;
 Wed, 08 Jan 2020 01:41:22 -0800 (PST)
MIME-Version: 1.0
References: <20200102101712.5085-1-sam@ravnborg.org> <20200102101712.5085-3-sam@ravnborg.org>
 <CA+M3ks5Zs5j0FMD4SQiva2soW62tSnu14qiq3kErhLvCMxrxAA@mail.gmail.com> <CAL_Jsq+g8mVdC=aOZDpMGMt3j1Y=Lgku-OcfoBP_V7PGabq5Lg@mail.gmail.com>
In-Reply-To: <CAL_Jsq+g8mVdC=aOZDpMGMt3j1Y=Lgku-OcfoBP_V7PGabq5Lg@mail.gmail.com>
From:   Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date:   Wed, 8 Jan 2020 10:41:12 +0100
Message-ID: <CA+M3ks4sD971mCUQRJO+9gXaAWcwgzy2iNtMNVBRov5JSJk=HQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: one file of all simple DSI panels
To:     Rob Herring <robh@kernel.org>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
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

Le mar. 7 janv. 2020 =C3=A0 18:05, Rob Herring <robh@kernel.org> a =C3=A9cr=
it :
>
> On Tue, Jan 7, 2020 at 9:44 AM Benjamin Gaignard
> <benjamin.gaignard@linaro.org> wrote:
> >
> > Le jeu. 2 janv. 2020 =C3=A0 11:17, Sam Ravnborg <sam@ravnborg.org> a =
=C3=A9crit :
> > >
> > > To complement panel-simple.yaml, create panel-simple-dsi.yaml.
> > > panel-simple-dsi-yaml are for all simple DSP panels with a single
> > > power-supply and optional backlight / enable GPIO.
> > >
> > > Migrate panasonic,vvx10f034n00 over to the new file.
> > >
> > > The objectives with one file for all the simple DSI panels are:
> > >     - Make it simpler to add bindings for simple DSI panels
> > >     - Keep the number of bindings file lower
> > >     - Keep the binding documentation for simple DSI panels more consi=
stent
> > >
> > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Thierry Reding <thierry.reding@gmail.com>
> > > Cc: Rob Herring <robh@kernel.org>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Yannick Fertre <yannick.fertre@st.com>
> > > Cc: Mark Rutland <mark.rutland@arm.com>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: devicetree@vger.kernel.org
> > > ---
> > >  .../display/panel/panasonic,vvx10f034n00.txt  | 20 ------
> > >  .../display/panel/panel-simple-dsi.yaml       | 67 +++++++++++++++++=
++
> > >  2 files changed, 67 insertions(+), 20 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/display/panel/p=
anasonic,vvx10f034n00.txt
> > >  create mode 100644 Documentation/devicetree/bindings/display/panel/p=
anel-simple-dsi.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/panel/panasoni=
c,vvx10f034n00.txt b/Documentation/devicetree/bindings/display/panel/panaso=
nic,vvx10f034n00.txt
> > > deleted file mode 100644
> > > index 37dedf6a6702..000000000000
> > > --- a/Documentation/devicetree/bindings/display/panel/panasonic,vvx10=
f034n00.txt
> > > +++ /dev/null
> > > @@ -1,20 +0,0 @@
> > > -Panasonic 10" WUXGA TFT LCD panel
> > > -
> > > -Required properties:
> > > -- compatible: should be "panasonic,vvx10f034n00"
> > > -- reg: DSI virtual channel of the peripheral
> > > -- power-supply: phandle of the regulator that provides the supply vo=
ltage
> > > -
> > > -Optional properties:
> > > -- backlight: phandle of the backlight device attached to the panel
> > > -
> > > -Example:
> > > -
> > > -       mdss_dsi@fd922800 {
> > > -               panel@0 {
> > > -                       compatible =3D "panasonic,vvx10f034n00";
> > > -                       reg =3D <0>;
> > > -                       power-supply =3D <&vreg_vsp>;
> > > -                       backlight =3D <&lp8566_wled>;
> > > -               };
> > > -       };
> > > diff --git a/Documentation/devicetree/bindings/display/panel/panel-si=
mple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simpl=
e-dsi.yaml
> > > new file mode 100644
> > > index 000000000000..05c52390269e
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-ds=
i.yaml
> > > @@ -0,0 +1,67 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/panel/panel-simple-dsi.ya=
ml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Simple DSI panels with a single power-supply
> > > +
> > > +maintainers:
> > > +  - Thierry Reding <thierry.reding@gmail.com>
> > > +  - Sam Ravnborg <sam@ravnborg.org>
> > > +
> > > +description: |
> > > +  This binding file is a collection of the DSI panels that
> > > +  requires only a single power-supply.
> > > +  There are optionally a backlight and an enable GPIO.
> > > +  The panel may use an OF graph binding for the association to the d=
isplay,
> > > +  or it may be a direct child node of the display.
> > > +
> > > +  If the panel is more advanced a dedicated binding file is required=
.
> > > +
> > > +allOf:
> > > +  - $ref: panel-common.yaml#
> > > +
> > > +properties:
> > > +
> > > +  compatible:
> > > +    enum:
> > > +    # compatible must be listed in alphabetical order, ordered by co=
mpatible.
> > > +    # The description in the comment is mandatory for each compatibl=
e.
> > > +
> > > +    # Panasonic 10" WUXGA TFT LCD panel
> > > +    - panasonic,vvx10f034n00
> >
> > Hi Sam,
> >
> > I have tested your patch with these 2 dsi panels:
> > # Orise Tech OTM8009A is a 3.97" 480x800 TFT LCD
> >   - orisetech,otm8009a
> >  # Raydium Semiconductor Corporation RM68200 is a 5.5" 720x1280 TFT LCD
> >    - raydium,rm68200
> >
> > It is close to be fine for me but I have minors comments below.
> >
> > Benjamin
> >
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +    description: DSI virtual channel
> > > +
> > > +  backlight: true
> > > +  enable-gpios: true
> > > +  port: true
> > > +  power-supply: true
> >
> > add reset-gpios: true to support orisetech panel
>
> Nope. If not a single GPIO and single supply, not a simple panel.
>
> Maybe reset could be allowed, but we have to draw the line somewhere.
>
> > > +
> > > +additionalProperties: false
> > > +
> > > +required:
> > > +  - compatible
> > > +  - power-supply
> >
> > power-supply should optional
>
> The panel works without power? The dts should have a fixed supply if
> not controllable.
>
> Here's the problem. If it is not required, then panels with multiple
> supplies will get added here because they didn't care to begin with.
> Then when someone decides to think about the supplies it will have to
> be moved. Bindings need to be complete from the start.

Fair enough, I will add fixed supply in dts files.
If reset-gpios could be added in this schema then we could include
oristech panel here.

Benjamin

>
> Rob
