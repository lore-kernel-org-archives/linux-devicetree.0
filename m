Return-Path: <SRS0=5/ta=3R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CACEC33C9E
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jan 2020 08:51:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EA92B24681
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jan 2020 08:51:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XzcInhmf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726027AbgA1IvC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Jan 2020 03:51:02 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:39475 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgA1IvC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 Jan 2020 03:51:02 -0500
Received: by mail-qk1-f195.google.com with SMTP id w15so10865646qkf.6
        for <devicetree@vger.kernel.org>; Tue, 28 Jan 2020 00:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/WsRKHldMpCwTEFKPjmrexo3PGEcKeefPjdNpGWW4t8=;
        b=XzcInhmfqayMdJkHnwbjbOflTTIgCo7L7di3qTeVyMDXBeTg0gzI+ZZ8REL7vPnTMn
         QCDUSY0JwqJhZKZ8tsOcFTngK/WEMa8YICtOJqX3QvToENci4CfvwcLtWwXv4XfnD0Pi
         AvjudvotnaRmv8A9Bnqot1heD0+5T2sry3YmgaIZyC0BYPrGHSV9ijIRIUAr+8KeRA6y
         NBk0oKr+6a6ELEh11aLz93poydkdRU8D3f3ur72U92MoW5goRpK0sCShw2EOyyp31/9w
         R2R47aQc/7cahM27zkQ1skX2QQ7f+4y8AV01XFUj0VsrQXRCTi/FDyNyqvDVy29J7ROW
         vw5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/WsRKHldMpCwTEFKPjmrexo3PGEcKeefPjdNpGWW4t8=;
        b=ni2i+A5hXwNBu4zVNokF8kqCXSi0cYyOAplogrsSm+4wD1BVz4Tu7BWyagD7YqA8IF
         4SyJrpoHAjGNQAFv5AuiX5PwL1u2GmiXRAd0qNmn/hZg/+fzBotONF04A7b09Iu6LDPA
         QGQqq0AVFts6Zny8DZc7QJaSrszFDADGOSYfal/BtcdNWBv+jv1HUV4qaL4EiJvsoHmg
         AIaj82Q37DoCzSm3VGwZwvMTd8tu9xFSjLTbF3pDaEjYXUuRFdhAyK8ZmoL1ihzKQN9T
         2fcjY9GWNmKCpoNS0EQgZWJLYihXpYOx7pplUg3jLmqVbShD+toAkMJl8K9jlZGhqPVe
         r9Hw==
X-Gm-Message-State: APjAAAUg/nFMtLLPDIub28lrL5Qi2y5VPCeCJvrNhhgvQpaFFmqBRwTu
        rU4GW7fWF+DTEbUU+FmUWyEunTw9cpLNK5Duqh0UiQ==
X-Google-Smtp-Source: APXvYqzkGb1tOVEHhm/PyVYblsW34hrAfT6ZiJruHpr2brNe1hxy69AdoINffw8apNkC+GJtxmXRJ1zorFG78znzl8U=
X-Received: by 2002:a05:620a:16d3:: with SMTP id a19mr9280008qkn.427.1580201460651;
 Tue, 28 Jan 2020 00:51:00 -0800 (PST)
MIME-Version: 1.0
References: <20200102101712.5085-1-sam@ravnborg.org> <20200102101712.5085-3-sam@ravnborg.org>
 <CA+M3ks5Zs5j0FMD4SQiva2soW62tSnu14qiq3kErhLvCMxrxAA@mail.gmail.com>
 <CAL_Jsq+g8mVdC=aOZDpMGMt3j1Y=Lgku-OcfoBP_V7PGabq5Lg@mail.gmail.com> <CA+M3ks4sD971mCUQRJO+9gXaAWcwgzy2iNtMNVBRov5JSJk=HQ@mail.gmail.com>
In-Reply-To: <CA+M3ks4sD971mCUQRJO+9gXaAWcwgzy2iNtMNVBRov5JSJk=HQ@mail.gmail.com>
From:   Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date:   Tue, 28 Jan 2020 09:50:49 +0100
Message-ID: <CA+M3ks7GkVSi2WcwpK+tkoBx=EpJLfFVAp=qs2ygZyW114hWfw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: one file of all simple DSI panels
To:     Rob Herring <robh@kernel.org>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        Yannick Fertre <yannick.fertre@st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Le mer. 8 janv. 2020 =C3=A0 10:41, Benjamin Gaignard
<benjamin.gaignard@linaro.org> a =C3=A9crit :
>
> Le mar. 7 janv. 2020 =C3=A0 18:05, Rob Herring <robh@kernel.org> a =C3=A9=
crit :
> >
> > On Tue, Jan 7, 2020 at 9:44 AM Benjamin Gaignard
> > <benjamin.gaignard@linaro.org> wrote:
> > >
> > > Le jeu. 2 janv. 2020 =C3=A0 11:17, Sam Ravnborg <sam@ravnborg.org> a =
=C3=A9crit :
> > > >
> > > > To complement panel-simple.yaml, create panel-simple-dsi.yaml.
> > > > panel-simple-dsi-yaml are for all simple DSP panels with a single
> > > > power-supply and optional backlight / enable GPIO.
> > > >
> > > > Migrate panasonic,vvx10f034n00 over to the new file.
> > > >
> > > > The objectives with one file for all the simple DSI panels are:
> > > >     - Make it simpler to add bindings for simple DSI panels
> > > >     - Keep the number of bindings file lower
> > > >     - Keep the binding documentation for simple DSI panels more con=
sistent
> > > >
> > > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > > > Cc: Thierry Reding <thierry.reding@gmail.com>
> > > > Cc: Rob Herring <robh@kernel.org>
> > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > Cc: Yannick Fertre <yannick.fertre@st.com>
> > > > Cc: Mark Rutland <mark.rutland@arm.com>
> > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > Cc: dri-devel@lists.freedesktop.org
> > > > Cc: devicetree@vger.kernel.org
> > > > ---
> > > >  .../display/panel/panasonic,vvx10f034n00.txt  | 20 ------
> > > >  .../display/panel/panel-simple-dsi.yaml       | 67 +++++++++++++++=
++++
> > > >  2 files changed, 67 insertions(+), 20 deletions(-)
> > > >  delete mode 100644 Documentation/devicetree/bindings/display/panel=
/panasonic,vvx10f034n00.txt
> > > >  create mode 100644 Documentation/devicetree/bindings/display/panel=
/panel-simple-dsi.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/panel/panaso=
nic,vvx10f034n00.txt b/Documentation/devicetree/bindings/display/panel/pana=
sonic,vvx10f034n00.txt
> > > > deleted file mode 100644
> > > > index 37dedf6a6702..000000000000
> > > > --- a/Documentation/devicetree/bindings/display/panel/panasonic,vvx=
10f034n00.txt
> > > > +++ /dev/null
> > > > @@ -1,20 +0,0 @@
> > > > -Panasonic 10" WUXGA TFT LCD panel
> > > > -
> > > > -Required properties:
> > > > -- compatible: should be "panasonic,vvx10f034n00"
> > > > -- reg: DSI virtual channel of the peripheral
> > > > -- power-supply: phandle of the regulator that provides the supply =
voltage
> > > > -
> > > > -Optional properties:
> > > > -- backlight: phandle of the backlight device attached to the panel
> > > > -
> > > > -Example:
> > > > -
> > > > -       mdss_dsi@fd922800 {
> > > > -               panel@0 {
> > > > -                       compatible =3D "panasonic,vvx10f034n00";
> > > > -                       reg =3D <0>;
> > > > -                       power-supply =3D <&vreg_vsp>;
> > > > -                       backlight =3D <&lp8566_wled>;
> > > > -               };
> > > > -       };
> > > > diff --git a/Documentation/devicetree/bindings/display/panel/panel-=
simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-sim=
ple-dsi.yaml
> > > > new file mode 100644
> > > > index 000000000000..05c52390269e
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-=
dsi.yaml
> > > > @@ -0,0 +1,67 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/display/panel/panel-simple-dsi.=
yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Simple DSI panels with a single power-supply
> > > > +
> > > > +maintainers:
> > > > +  - Thierry Reding <thierry.reding@gmail.com>
> > > > +  - Sam Ravnborg <sam@ravnborg.org>
> > > > +
> > > > +description: |
> > > > +  This binding file is a collection of the DSI panels that
> > > > +  requires only a single power-supply.
> > > > +  There are optionally a backlight and an enable GPIO.
> > > > +  The panel may use an OF graph binding for the association to the=
 display,
> > > > +  or it may be a direct child node of the display.
> > > > +
> > > > +  If the panel is more advanced a dedicated binding file is requir=
ed.
> > > > +
> > > > +allOf:
> > > > +  - $ref: panel-common.yaml#
> > > > +
> > > > +properties:
> > > > +
> > > > +  compatible:
> > > > +    enum:
> > > > +    # compatible must be listed in alphabetical order, ordered by =
compatible.
> > > > +    # The description in the comment is mandatory for each compati=
ble.
> > > > +
> > > > +    # Panasonic 10" WUXGA TFT LCD panel
> > > > +    - panasonic,vvx10f034n00
> > >
> > > Hi Sam,
> > >
> > > I have tested your patch with these 2 dsi panels:
> > > # Orise Tech OTM8009A is a 3.97" 480x800 TFT LCD
> > >   - orisetech,otm8009a
> > >  # Raydium Semiconductor Corporation RM68200 is a 5.5" 720x1280 TFT L=
CD
> > >    - raydium,rm68200
> > >
> > > It is close to be fine for me but I have minors comments below.
> > >
> > > Benjamin
> > >
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +    description: DSI virtual channel
> > > > +
> > > > +  backlight: true
> > > > +  enable-gpios: true
> > > > +  port: true
> > > > +  power-supply: true
> > >
> > > add reset-gpios: true to support orisetech panel
> >
> > Nope. If not a single GPIO and single supply, not a simple panel.
> >
> > Maybe reset could be allowed, but we have to draw the line somewhere.
> >
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - power-supply
> > >
> > > power-supply should optional
> >
> > The panel works without power? The dts should have a fixed supply if
> > not controllable.
> >
> > Here's the problem. If it is not required, then panels with multiple
> > supplies will get added here because they didn't care to begin with.
> > Then when someone decides to think about the supplies it will have to
> > be moved. Bindings need to be complete from the start.
>
> Fair enough, I will add fixed supply in dts files.
> If reset-gpios could be added in this schema then we could include
> oristech panel here.

Does this patch has been merged ?

Regards,
Benjamin

>
> Benjamin
>
> >
> > Rob
