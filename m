Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 765D0C43603
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 17:40:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4B87A208C3
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 17:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575913209;
	bh=fO3QVAlG1OLh/os2egcINJgc4sXwb3ey4tuBeS0INII=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=zqE2NQpoyXTZ5G07j7odfQWxscOS6hOro7n3TCwEMyGU0vgs3LzWuQ2LsWn0OSRfz
	 zZRK8sLX4lZXwoqTBOmnbCzw9A2tNP+39CurXrgQpcDsUF+SBd33v6YJatscEYfVqB
	 7eCuGwmtvecLAkasOuzjQbBe4GhjWlSRRJWk5wy4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbfLIRkI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Dec 2019 12:40:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:44428 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725904AbfLIRkI (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 9 Dec 2019 12:40:08 -0500
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8D19F2077B
        for <devicetree@vger.kernel.org>; Mon,  9 Dec 2019 17:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575913207;
        bh=fO3QVAlG1OLh/os2egcINJgc4sXwb3ey4tuBeS0INII=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Ng3lSjJf+epVuaGapV72kMeYLodPePvBoaKwd7DE+sSQ39qfvTilm0XWDyD0u3Xoy
         6HNyoShzOJmue9fj93r3FYYmpWZ3fpOIuYzaet0wU9yP24ZxRHxRyXyD2joeR27WIW
         xNqsoiQ8r8rRj8ss9abTkE1dpe1xpYD5rJ9IcS4s=
Received: by mail-qk1-f181.google.com with SMTP id l124so1851145qkf.8
        for <devicetree@vger.kernel.org>; Mon, 09 Dec 2019 09:40:07 -0800 (PST)
X-Gm-Message-State: APjAAAWvbCzYDjMO98PAaYzgtXYNNiqnzO4ukG92hi/cy3KeksrVjbkU
        VgMXASSmmsW7WeBUNZOLf8oy/4rz0gGcD6kLOA==
X-Google-Smtp-Source: APXvYqxUoG+SqrXR5LgshSdUQVxR9MZHP7wICmocF4ZQqNRo+pC+tQchnEKozzNnRSx1Sn8VF/Z6htjHpAHJ5wwKXeo=
X-Received: by 2002:a37:4904:: with SMTP id w4mr26432322qka.119.1575913206702;
 Mon, 09 Dec 2019 09:40:06 -0800 (PST)
MIME-Version: 1.0
References: <20191119231309.18295-1-robh@kernel.org> <20191130194337.GE24722@ravnborg.org>
 <CAL_Jsq+AsCOQh89t1foJjDFFoQzfx5NythgdcbQGYNxRHRjB2A@mail.gmail.com> <20191204201452.GA30193@ravnborg.org>
In-Reply-To: <20191204201452.GA30193@ravnborg.org>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 9 Dec 2019 11:39:55 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLNSF3j9q49SVTpg=742dgt-60BRhXUxEVUXyYtroAqOQ@mail.gmail.com>
Message-ID: <CAL_JsqLNSF3j9q49SVTpg=742dgt-60BRhXUxEVUXyYtroAqOQ@mail.gmail.com>
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

On Wed, Dec 4, 2019 at 2:15 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Rob.
>
> On Mon, Dec 02, 2019 at 08:38:39AM -0600, Rob Herring wrote:
> > On Sat, Nov 30, 2019 at 1:43 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > >
> > > Hi Rob.
> > >
> > > Thanks for doing this boring, trivial and tiresome task.
> >
> > It was somewhat scripted at least...
> >
> > > On Tue, Nov 19, 2019 at 05:13:09PM -0600, Rob Herring wrote:
> > > > Convert all the 'simple' panels which either use the single
> > > > 'power-supply' property or don't say and just reference
> > > > simple-panel.txt. In the later case, bindings are clear as to which
> > > > properties are required or unused.
> > > >
> > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > Cc: Chen-Yu Tsai <wens@csie.org>
> > > > Cc: Thierry Reding <thierry.reding@gmail.com>
> > > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > > Signed-off-by: Rob Herring <robh@kernel.org>
> > >
> > > So Thierry and I ended up as Maintianes for them all.
> > > I gues thats OK as we look after the panel stuff anyway.
> > >
> > > > ---
> > > > We could perhaps consolidate a bunch of these, but I have no idea how
> > > > accurate some of these are WRT what's required or not. Seems strange
> > > > that 'backlight' is optional unless the backlight is tied full on for
> > > > example. If that's the case, then should backlight ever be required?
> > > I do not really follow you here.
> > > Looking through the patch set things looks normal to me.
> > >
> > > What do I miss here?
> >
> > I'm saying a bunch of these could just be a single schema doc with a
> > long list of compatibles. The variation is in what properties are
> > required or not.
>
> It would be just wonderful if we could have only a few
> dt-bindings for the simple panels.
> Like you I cannot see why enable-gpios should be required.
>
> We could end up with something like three classes of bindings:
>
> +required:
> +  - compatible
> +  - power-supply
>
> +required:
> +  - compatible
> +  - port
> +  - power-supply
>
> +required:
> +  - backlight
> +  - compatible
> +  - port
> +  - power-supply
>
> The port part is to my best understanding a way to
> connect the panel to the display driver.
> So it should be more how the connect in the binding
> that decides if port is used or not.

Yes, though it's also initially panels were just the child of the
controller before 'port' came along. We still allow both ways though
'port' is preferred.

> And the panel should not require it.
>
> I may use it with display drivers that do not support it
> in their binding.
>
> And then we have backlight - which can hardly be mandatory.
> The panel could hard-wire it to provide backligt if it wanted
> and the binding should continue to work.
> I think you had the same argument.
>
> So we are down to two required properties:
> +required:
> +  - compatible
> +  - power-supply
>
> Could we put all simple panels in one binding file
> with only this - that would be great.
> Hopefully scripted somehow...
>
> Then adding new simple panels would be a matter of
> adding a new compatible.

Yes. The issue would be enforcing the big disclaimer of "Do not add
your panel here unless it has a single power rail." (And anything else
we think of). Between a single line add vs. a whole new doc, you know
what people will pick. I guess panels could still be moved out of the
common doc later on. We'd also have to be fighting off the "let me add
just one new property for my panel".

> And if they are sorted this should not cause many merge issues either.
>
> I hope I understood you correct.

You did. I'd like to hear Thierry's thoughts on this before going down
this path.

Rob
