Return-Path: <SRS0=DK2V=2X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C41BC3276C
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jan 2020 15:40:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4FC812084D
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jan 2020 15:40:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="CsMdcshB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728748AbgABPko (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Jan 2020 10:40:44 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:39030 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728734AbgABPkn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 2 Jan 2020 10:40:43 -0500
Received: by mail-il1-f193.google.com with SMTP id x5so34362648ila.6
        for <devicetree@vger.kernel.org>; Thu, 02 Jan 2020 07:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3572HIPczR9cTuPFxrESBoTgrX4d6H7x5Q/kXXuy428=;
        b=CsMdcshBDPMrQufZIZxdudBJtg7H5PXirvxIzG5GX86qw5BbrHfL3WRLl1u9msmugU
         4nlFujipIJd3har00SH658ONwyUzVLsynUhsbUkj7VjUYMY7VSo+tJ+VQS+oXCOGBFNH
         WPaOFGHhMYzcCPVHv/6ulHwsoyYUumKyKR21c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3572HIPczR9cTuPFxrESBoTgrX4d6H7x5Q/kXXuy428=;
        b=juf9jjoVyL7kRoBGyJe+jZU8pLE/hSDzjvlYhey2r25CCJnrZXJ+s1fzijd15/wKeG
         jihHxdMz/RfubPD9mszEDl85s6svfPpID9AAYWw39qkk6zc2+Vv/Er3qrYaLpwm/lC/Y
         qzGar1vl55IpN+dyKYqhxT5rBX8pBu92ijZ55jN1jxavgEfztHJEy0H+9Min/TptvuM3
         WCI1xIT+s1ToMv/ooYk1/O2sW8aXZSziJy3Lr6m5hjNfVqYrvj1MX1vn2TmkjiPki7e4
         z4u8rnVb8LCd8R4J/p2NBD0E7zGocW5zM9On5rcN160mRKCJ+cYZ3tTwmJ95rCpd5R8S
         IvZw==
X-Gm-Message-State: APjAAAXCbwOPN2KmG0WAgL9NqDmJTWuNJdV9kNYWDFUTfnwkqyADS0Dz
        5EWWJfUMG/cF2VITqHV4/gZyaelLddW7gxb7z8Ox8g==
X-Google-Smtp-Source: APXvYqyktr3CqCCGml7EeAho4GJqaINKtZEGl5yX5r/Y5VF4lK9Mx3hwHRBbOa/ZWlGpatq+4kooSat9lPiBhJb0M/8=
X-Received: by 2002:a92:c647:: with SMTP id 7mr71931846ill.28.1577979642064;
 Thu, 02 Jan 2020 07:40:42 -0800 (PST)
MIME-Version: 1.0
References: <20191231130528.20669-1-jagan@amarulasolutions.com>
 <20191231130528.20669-3-jagan@amarulasolutions.com> <20200102105424.kmte7aooh2gkrcnu@gilmour.lan>
In-Reply-To: <20200102105424.kmte7aooh2gkrcnu@gilmour.lan>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Thu, 2 Jan 2020 21:10:31 +0530
Message-ID: <CAMty3ZA0e8eJZWvAh0x=KGAZVL3apdao3COvR6j3-ckv0cdvcg@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] drm/sun4i: tcon: Add TCON LCD support for R40
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jan 2, 2020 at 4:24 PM Maxime Ripard <mripard@kernel.org> wrote:
>
> On Tue, Dec 31, 2019 at 06:35:21PM +0530, Jagan Teki wrote:
> > TCON LCD0, LCD1 in allwinner R40, are used for managing
> > LCD interfaces like RGB, LVDS and DSI.
> >
> > Like TCON TV0, TV1 these LCD0, LCD1 are also managed via
> > tcon top.
> >
> > Add support for it, in tcon driver.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v3:
> > - none
> >
> >  drivers/gpu/drm/sun4i/sun4i_tcon.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > index fad72799b8df..69611d38c844 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > @@ -1470,6 +1470,13 @@ static const struct sun4i_tcon_quirks sun8i_a83t_tv_quirks = {
> >       .has_channel_1          = true,
> >  };
> >
> > +static const struct sun4i_tcon_quirks sun8i_r40_lcd_quirks = {
> > +     .supports_lvds          = true,
> > +     .has_channel_0          = true,
> > +     /* TODO Need to support TCON output muxing via GPIO pins */
> > +     .set_mux                = sun8i_r40_tcon_tv_set_mux,
>
> What is this muking about? And why is it a TODO?

Muxing similar like how TCON TOP handle TV0, TV1 I have reused the
same so-that it would configure de port selection via
sun8i_tcon_top_de_config

TCON output muxing have gpio with GPIOD and GPIOH bits, which select
which of LCD or TV TCON outputs to the LCD function pins. I have
marked these has TODO for further support as mentioned by Chen-Yu in
v1[1].

[1] https://patchwork.freedesktop.org/patch/310210/?series=62062&rev=1
