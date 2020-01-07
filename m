Return-Path: <SRS0=83Av=24=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92CFDC33C9E
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 17:05:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5FE3E21744
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 17:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578416714;
	bh=J6BqPSsSE2eXxOlq7LYlp5ingg3TOAQEjyJ/3iGGFXs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=1k/f+zuWMRUu0RwUWJKarUBlEJ+uLMcEiNGGUxi25EYximZnHYFSEyZU4ydzlVUJZ
	 hz7/CAPiv9wflFrDvlYN9qYWp4GBfz9NdzbupwMcUd5HOypNzs0Xj4M/WYtrp10tQ8
	 7/DmCPAK5MmgUJWOtS4z3avjNg7RYXJwxXgnZ2+8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728409AbgAGRFN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Jan 2020 12:05:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:55982 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728236AbgAGRFN (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 7 Jan 2020 12:05:13 -0500
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9D89C24681
        for <devicetree@vger.kernel.org>; Tue,  7 Jan 2020 17:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578416712;
        bh=J6BqPSsSE2eXxOlq7LYlp5ingg3TOAQEjyJ/3iGGFXs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jE1/2+1eih3ugzFR9S+F/A9jRVp6VIgrpXgE4AM7eWm+5iWrXJ7aRYYNt2r8hP/oE
         VEjBouNmVktOqpEmfdm82eqC5T5dl0dulPiy4FaZJbyzml1pzH1Sv6qAQhCLHV5Xfc
         NOtCanXcDCP6vR/2+mN4FA5Hk0iXcbCGm7nW5eu8=
Received: by mail-qk1-f171.google.com with SMTP id r14so43255102qke.13
        for <devicetree@vger.kernel.org>; Tue, 07 Jan 2020 09:05:12 -0800 (PST)
X-Gm-Message-State: APjAAAXW0J7MTPc6NW6qwrxRYlf+BWQiXL0GvGVhmw7bM/H70wx0sjKB
        /GztkTWFmVQcqPLrYEIZtf86Do+J5lYeP1dNLw==
X-Google-Smtp-Source: APXvYqxYRHKy7vIl847tGiOp0O8qJ1+rty30QDUa6ALTxWxi9LY5p3+/MyeaxxThoZtLm+5RIbCfY7QemrzbNEQLmsE=
X-Received: by 2002:a37:85c4:: with SMTP id h187mr273529qkd.223.1578416711761;
 Tue, 07 Jan 2020 09:05:11 -0800 (PST)
MIME-Version: 1.0
References: <20200102101712.5085-1-sam@ravnborg.org> <20200102101712.5085-3-sam@ravnborg.org>
 <CA+M3ks5Zs5j0FMD4SQiva2soW62tSnu14qiq3kErhLvCMxrxAA@mail.gmail.com>
In-Reply-To: <CA+M3ks5Zs5j0FMD4SQiva2soW62tSnu14qiq3kErhLvCMxrxAA@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 7 Jan 2020 11:04:59 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+g8mVdC=aOZDpMGMt3j1Y=Lgku-OcfoBP_V7PGabq5Lg@mail.gmail.com>
Message-ID: <CAL_Jsq+g8mVdC=aOZDpMGMt3j1Y=Lgku-OcfoBP_V7PGabq5Lg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: one file of all simple DSI panels
To:     Benjamin Gaignard <benjamin.gaignard@linaro.org>
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

On Tue, Jan 7, 2020 at 9:44 AM Benjamin Gaignard
<benjamin.gaignard@linaro.org> wrote:
>
> Le jeu. 2 janv. 2020 =C3=A0 11:17, Sam Ravnborg <sam@ravnborg.org> a =C3=
=A9crit :
> >
> > To complement panel-simple.yaml, create panel-simple-dsi.yaml.
> > panel-simple-dsi-yaml are for all simple DSP panels with a single
> > power-supply and optional backlight / enable GPIO.
> >
> > Migrate panasonic,vvx10f034n00 over to the new file.
> >
> > The objectives with one file for all the simple DSI panels are:
> >     - Make it simpler to add bindings for simple DSI panels
> >     - Keep the number of bindings file lower
> >     - Keep the binding documentation for simple DSI panels more consist=
ent
> >
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Yannick Fertre <yannick.fertre@st.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: devicetree@vger.kernel.org
> > ---
> >  .../display/panel/panasonic,vvx10f034n00.txt  | 20 ------
> >  .../display/panel/panel-simple-dsi.yaml       | 67 +++++++++++++++++++
> >  2 files changed, 67 insertions(+), 20 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/display/panel/pan=
asonic,vvx10f034n00.txt
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/pan=
el-simple-dsi.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/panasonic,=
vvx10f034n00.txt b/Documentation/devicetree/bindings/display/panel/panasoni=
c,vvx10f034n00.txt
> > deleted file mode 100644
> > index 37dedf6a6702..000000000000
> > --- a/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f0=
34n00.txt
> > +++ /dev/null
> > @@ -1,20 +0,0 @@
> > -Panasonic 10" WUXGA TFT LCD panel
> > -
> > -Required properties:
> > -- compatible: should be "panasonic,vvx10f034n00"
> > -- reg: DSI virtual channel of the peripheral
> > -- power-supply: phandle of the regulator that provides the supply volt=
age
> > -
> > -Optional properties:
> > -- backlight: phandle of the backlight device attached to the panel
> > -
> > -Example:
> > -
> > -       mdss_dsi@fd922800 {
> > -               panel@0 {
> > -                       compatible =3D "panasonic,vvx10f034n00";
> > -                       reg =3D <0>;
> > -                       power-supply =3D <&vreg_vsp>;
> > -                       backlight =3D <&lp8566_wled>;
> > -               };
> > -       };
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-simp=
le-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-=
dsi.yaml
> > new file mode 100644
> > index 000000000000..05c52390269e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.=
yaml
> > @@ -0,0 +1,67 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/panel-simple-dsi.yaml=
#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Simple DSI panels with a single power-supply
> > +
> > +maintainers:
> > +  - Thierry Reding <thierry.reding@gmail.com>
> > +  - Sam Ravnborg <sam@ravnborg.org>
> > +
> > +description: |
> > +  This binding file is a collection of the DSI panels that
> > +  requires only a single power-supply.
> > +  There are optionally a backlight and an enable GPIO.
> > +  The panel may use an OF graph binding for the association to the dis=
play,
> > +  or it may be a direct child node of the display.
> > +
> > +  If the panel is more advanced a dedicated binding file is required.
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +
> > +  compatible:
> > +    enum:
> > +    # compatible must be listed in alphabetical order, ordered by comp=
atible.
> > +    # The description in the comment is mandatory for each compatible.
> > +
> > +    # Panasonic 10" WUXGA TFT LCD panel
> > +    - panasonic,vvx10f034n00
>
> Hi Sam,
>
> I have tested your patch with these 2 dsi panels:
> # Orise Tech OTM8009A is a 3.97" 480x800 TFT LCD
>   - orisetech,otm8009a
>  # Raydium Semiconductor Corporation RM68200 is a 5.5" 720x1280 TFT LCD
>    - raydium,rm68200
>
> It is close to be fine for me but I have minors comments below.
>
> Benjamin
>
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: DSI virtual channel
> > +
> > +  backlight: true
> > +  enable-gpios: true
> > +  port: true
> > +  power-supply: true
>
> add reset-gpios: true to support orisetech panel

Nope. If not a single GPIO and single supply, not a simple panel.

Maybe reset could be allowed, but we have to draw the line somewhere.

> > +
> > +additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - power-supply
>
> power-supply should optional

The panel works without power? The dts should have a fixed supply if
not controllable.

Here's the problem. If it is not required, then panels with multiple
supplies will get added here because they didn't care to begin with.
Then when someone decides to think about the supplies it will have to
be moved. Bindings need to be complete from the start.

Rob
