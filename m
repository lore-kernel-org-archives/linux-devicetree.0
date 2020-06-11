Return-Path: <SRS0=a2/f=7Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D1D2C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 11 Jun 2020 14:38:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3288720823
	for <linux-devicetree@archiver.kernel.org>; Thu, 11 Jun 2020 14:38:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="cI+OX7Xo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728387AbgFKOig (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 11 Jun 2020 10:38:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728380AbgFKOig (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 11 Jun 2020 10:38:36 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7C17C08C5C2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2020 07:38:35 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id l26so5190827wme.3
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2020 07:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OkSwpbu3nanzuKZFRobLrpEC9ZCDno96sQzcjNj/eXY=;
        b=cI+OX7XoTGzmSDSsWCBAgUmvoYrhcn7OEtY/zt2TxdrMTXMKh0GXYchPkoZT+khQPD
         nV8rBtdgwRtq55gdiZYS/FgVPKwGH5TEAiw5PDtJxEU2mA//8hWvWFd+9XHNZIPQqwJt
         +O1X0H1P7QlKx+hbQ8bZ/P1XCLh3vXtzV68e4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OkSwpbu3nanzuKZFRobLrpEC9ZCDno96sQzcjNj/eXY=;
        b=FsedYpIhJfo0zDLfqu4y1MjE6Jwm7MXdkubR4khjVHn+N8Ogo8+NgMrWJZ0juTgCgM
         Oip2/ZFKnD5jnAJ8C9K95j94eQ1pZ20BfcFYR8XlFoa6DdnvUojZ3d4SMK6BMCmBub5r
         OKx5Oo+yCTWmexjDTuMNIJTbrp6wYHyfOIvAOQbRthEG/fJJKsKV87vFuyA1wvWs3djZ
         zsKGsH2nJNzOCbF+E5MQUmgi4r8ZRSRW8TVryaIjTLO9CZqB1JemVp5gp/dr+l8DK+vH
         dM8Z7VnXtcY1LfbFaM1JeGXnECmC/1QFXoh0l45eO9Ho/ZHzUWTpjGrI5vjLeo5+6wqg
         PYwA==
X-Gm-Message-State: AOAM5322diH+z8M8xHmZRnq+QPC4+4QC5lxd0ZmyjipfIFkiDY2lutf1
        Lq6r6r4pbDYKEZxfFy0V9aEBZ7vmp62PCBCgYH3upA==
X-Google-Smtp-Source: ABdhPJym84e7SJjEkEqSAakLhjhByUtudobqIP49Z3U2O/dZpWA1dZ+0tNVwVesl3Gq55GaV+1O9IkNIEKJMiPotclk=
X-Received: by 2002:a7b:c3c6:: with SMTP id t6mr8182714wmj.159.1591886314439;
 Thu, 11 Jun 2020 07:38:34 -0700 (PDT)
MIME-Version: 1.0
References: <20191014061617.10296-2-daniel@0x0f.com> <20200610090421.3428945-6-daniel@0x0f.com>
 <a626d8a5-16c2-8f0a-b131-c124c06b0317@suse.de>
In-Reply-To: <a626d8a5-16c2-8f0a-b131-c124c06b0317@suse.de>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Thu, 11 Jun 2020 23:38:18 +0900
Message-ID: <CAFr9PX=Q+xeQvZD3diV5bTb7+T4oWJiq2kS6cFwv0=no5KxCLg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] ARM: mstar: Add dts for 70mai midrive d08
To:     =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc:     Krzysztof Adamski <k@japko.eu>, tim.bird@sony.com,
        devicetree@vger.kernel.org, Daniel Palmer <daniel@thingy.jp>,
        Rob Herring <robh+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
        Maxime Ripard <mripard@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Mark Brown <broonie@kernel.org>, allen <allen.chen@ite.com.tw>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Doug Anderson <armlinux@m.disordat.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Gregory Fong <gregory.0xf0@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Will Deacon <will@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Marc Zyngier <maz@kernel.org>,
        Christian Lamparter <chunkeey@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nathan Huckleberry <nhuck15@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Andreas,

On Thu, 11 Jun 2020 at 22:54, Andreas F=C3=A4rber <afaerber@suse.de> wrote:
>
> BTW I think the subject convention has been "ARM: dts: ...", with "ARM:
> mstar: ..." more for mach-mstar.

I noticed this after sending out this series. I've fixed up the
subjects in line with convention for the next try.

> > diff --git a/arch/arm/boot/dts/mercury5-ssc8336n-midrive08.dts b/arch/a=
rm/boot/dts/mercury5-ssc8336n-midrive08.dts
> > new file mode 100644
> > index 000000000000..4ee50ecf6ab1
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/mercury5-ssc8336n-midrive08.dts
> > @@ -0,0 +1,25 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2019 thingy.jp.
> > + * Author: Daniel Palmer <daniel@thingy.jp>
> > + */
> > +
> > +/dts-v1/;
> > +#include "mercury5-ssc8336n.dtsi"
> > +
> > +/ {
> > +     model =3D "midrive d08";
>
> Couldn't find this on their website. Should this be "70mai midrive ..."
> or is "midrive" a different brand?

I think it should be 70mai Midrive D08 based on your comments on the
other model names.
On their site this camera is now called "Dash Cam Lite".
Midrive D08 is the name I bought it under and the name that was used
for it's FCC approval (https://fccid.io/2AOK9-MIDRIVED08) so that's
what I went
with.

> > +     compatible =3D "70mai,midrived08", "mstar,mercury5";
>
> Have you considered naming it "70mai,midrive-d08" for better
> readability? (affects 1/5)

I went with midrived08 as that's what was used for the FCC and from
what I remember was written on the casing.

Thanks,

Daniel
