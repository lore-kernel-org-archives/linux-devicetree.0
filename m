Return-Path: <SRS0=pYa2=ZY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4095C432C3
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 14:38:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BED1F20718
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 14:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575297533;
	bh=h8JiGsGaEIwVdY2uUy92J9gHhOywwMu3KYAP30i2tXc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=jK8phmb90x1D2H5Th5PoSk0v9LJBltz7uKabSmV4dpjpJPsxAVFTNZVCo+GzI9zr2
	 xza7qGii+Hy2tbTNU6pSf3FsyqwC39p9zLYSq5P4IPOHdjykT5txntLgtcITEr3S6o
	 7VTRp3HJPZk3uIHcvFRDo9ChxGLLsc6iebqPzL8w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727487AbfLBOix (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 09:38:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:37546 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727477AbfLBOix (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 2 Dec 2019 09:38:53 -0500
Received: from mail-yw1-f43.google.com (mail-yw1-f43.google.com [209.85.161.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 84FA320881
        for <devicetree@vger.kernel.org>; Mon,  2 Dec 2019 14:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575297531;
        bh=h8JiGsGaEIwVdY2uUy92J9gHhOywwMu3KYAP30i2tXc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ByMOPHSDMxPUUNOiiTREsT42/vXzWIYvu92yNkkYL1O5fRJLKYvOmUwByXlpS2H/G
         +Nb2Mz3XPYpOZa1N2LG4rILcVBiJo4x1X4jurP5SW/QuVgxeLOh/q6Er4fwSrXrWJ3
         GChyLbFtmX7oJ7RUUklamBaHgISSqTeTEBralT28=
Received: by mail-yw1-f43.google.com with SMTP id i126so4456730ywe.7
        for <devicetree@vger.kernel.org>; Mon, 02 Dec 2019 06:38:51 -0800 (PST)
X-Gm-Message-State: APjAAAUuWmkRM3PsW5VXNXIkocoZhtjFCSXRqIRZGJiWTKahdZp/9X2F
        DT7hSY4YJoJHyh4PX2d6GD/cBBy2noT5TWRAMw==
X-Google-Smtp-Source: APXvYqyw3vvwyU8BaX3mDCjhDGZORiHLahzCRE6U74IPkDiUjX8el9XjgpqUswmIFsc7sdDh81q9UM+tAA9pGeuk3uo=
X-Received: by 2002:a0d:f483:: with SMTP id d125mr6729713ywf.368.1575297530672;
 Mon, 02 Dec 2019 06:38:50 -0800 (PST)
MIME-Version: 1.0
References: <20191119231309.18295-1-robh@kernel.org> <20191130194337.GE24722@ravnborg.org>
In-Reply-To: <20191130194337.GE24722@ravnborg.org>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 2 Dec 2019 08:38:39 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+AsCOQh89t1foJjDFFoQzfx5NythgdcbQGYNxRHRjB2A@mail.gmail.com>
Message-ID: <CAL_Jsq+AsCOQh89t1foJjDFFoQzfx5NythgdcbQGYNxRHRjB2A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: Convert a bunch of panels to DT schema
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, Nov 30, 2019 at 1:43 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Rob.
>
> Thanks for doing this boring, trivial and tiresome task.

It was somewhat scripted at least...

> On Tue, Nov 19, 2019 at 05:13:09PM -0600, Rob Herring wrote:
> > Convert all the 'simple' panels which either use the single
> > 'power-supply' property or don't say and just reference
> > simple-panel.txt. In the later case, bindings are clear as to which
> > properties are required or unused.
> >
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Chen-Yu Tsai <wens@csie.org>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Signed-off-by: Rob Herring <robh@kernel.org>
>
> So Thierry and I ended up as Maintianes for them all.
> I gues thats OK as we look after the panel stuff anyway.
>
> > ---
> > We could perhaps consolidate a bunch of these, but I have no idea how
> > accurate some of these are WRT what's required or not. Seems strange
> > that 'backlight' is optional unless the backlight is tied full on for
> > example. If that's the case, then should backlight ever be required?
> I do not really follow you here.
> Looking through the patch set things looks normal to me.
>
> What do I miss here?

I'm saying a bunch of these could just be a single schema doc with a
long list of compatibles. The variation is in what properties are
required or not.

> I did not find anything I consider bugs. It is mostly small
> inconsistencies.
>
> - Almost all new .yaml files ends with "..."
>   Except one file: nec,nl12880b20-05.yaml
>
>
> - When there is more than one compatible the extra compatible is specified
>   in two ways:

They are different meanings.

>
>   Like this with consts:
>     properties:
>     +  compatible:
>     +    items:
>     +      - const: bananapi,lhr050h41
>     +      - const: ilitek,ili9881c
>     +

This means 'compatible' must have 2 strings in the order specified.

>
>   Link this with enum:
>     +properties:
>     +  compatible:
>     +    enum:
>     +      - urt,umsh-8596md-t
>     +      - urt,umsh-8596md-1t
>     +      - urt,umsh-8596md-7t
>     +      - urt,umsh-8596md-11t
>     +      - urt,umsh-8596md-19t
>     +      - urt,umsh-8596md-20t

This means 'compatible' is a single string of one of the above.

>
> - My OCD prefer only one method to list more than
>   one compatible. Using "enum" syntax above seems to be the common
>   case - and the simple syntax.
>
> - In several cases the original binding provided an example
>   which is now dropped. Is this on purpose?
>   This is very simple examples - so I am happy to see them go.
>   They really did not provide anything extra.

Exactly.

>   I have mentioned it for some - but I stopped as I think
>   they are left out on purpose.
>   The changelog should mention this.

Okay.

>
> - There are some bindings that list a reg property.
>   I have noted that their comment is not keept.

These are all DSI panels. Linus' DSI controller binding defines what
'reg' is, so I prefer not duplicating that everywhere.

> - It seems inconsistent what is listed as properties and mandatory.

That's partly what my comment above on 'backlight' was about. I don't
really know what's just copy-n-paste inconsistencies vs. actual h/w
differences.

>   Most, but not all, include "enable-gpios: true" in properties.
>   And the listed mandatory properties sometimes
>   differ even when the description does not give a hint why.
>   Maybe this was needed to verify existing bindings?

I just maintained what was documented before and haven't checked each
one against usage in in-tree dts files. This is why I've tried to
enforce that folks list which 'simple panel' properties they use.

For example, there's 3 cases for a panel with 'enable-gpios':
- No enable input
- Enable input line is tied off to active state
- Enable input line is connected to GPIO

What's written for the binding probably depends on the board design
the person writing the binding is using. Arguably, 'enable-gpios'
should always be optional because of the 2nd case unless the h/w
always needs s/w control of the enable line.

>
> See a few comments in the following.
>
>         Sam
>
>
> > diff --git a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
> > index 47950fced28d..a5e6735fe34b 100644
> > --- a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
> > +++ b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
> > @@ -85,7 +85,7 @@ examples:
> >          panel@0 {
> >                  compatible = "bananapi,lhr050h41", "ilitek,ili9881c";
> >                  reg = <0>;
> > -                power-gpios = <&pio 1 7 0>; /* PB07 */
> > +                power-supply = <&reg>;
> >                  reset-gpios = <&r_pio 0 5 1>; /* PL05 */
> >                  backlight = <&pwm_bl>;
> >          };
>
> This looks like an unrelated change - drop?

It's not because the example starts failing when the schema validates
it. I can split it out though if you prefer.

[...]

> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 8d711f764dfb..ff8e38b269d7 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -5431,7 +5431,6 @@ S:      Supported
> >  F:   drivers/gpu/drm/fsl-dcu/
> >  F:   Documentation/devicetree/bindings/display/fsl,dcu.txt
> >  F:   Documentation/devicetree/bindings/display/fsl,tcon.txt
> > -F:   Documentation/devicetree/bindings/display/panel/nec,nl4827hc19-05b.txt
> >  T:   git git://anongit.freedesktop.org/drm/drm-misc
> >
> >  DRM DRIVERS FOR FREESCALE IMX
>
> The binding for nec,nl4827hc19-05b.txt should list the original
> maintainers:
> M:      Stefan Agner <stefan@agner.ch>
> M:      Alison Wang <alison.wang@nxp.com>
>
>
> I did not check all - but the files I checked did not have an explicit
> maintainer in MAINTAINERS.

Will double check.

Rob
