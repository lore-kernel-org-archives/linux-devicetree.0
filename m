Return-Path: <SRS0=aHhJ=M3=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:34625 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726802AbeJPDuT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 15 Oct 2018 23:50:19 -0400
Date: Mon, 15 Oct 2018 22:03:31 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: SV: [PATCH RFC] gpio: new driver for a gpio simulator
Message-ID: <20181015200331.ux5pb5cohtbjskc6@pengutronix.de>
References: <CACRpkdbxJ4htb=Fk+UUo4Vm7HsFCXhJoAbJdfF1sx=QMKX_=8A@mail.gmail.com>
 <20181009191121.r2tgc2oslwcwfhyn@pengutronix.de>
 <CACRpkdYnHGWwOA=KUNRe4VP_jxO8TXG3v4vEJfV58OB6z99JFQ@mail.gmail.com>
 <20181011081646.np2pte7eeohuyhh6@pengutronix.de>
 <20181011094905.47onipkrzdp25psq@axis.com>
 <1539331329658.80509@axis.com>
 <20181012090612.63f2p45d24gpilsm@pengutronix.de>
 <20181012092718.dpu6w6rqzknt2cm3@lnxeinarv1.se.axis.com>
 <20181012094704.mow2nfm7xwdi2a4t@pengutronix.de>
 <CAMRc=McH7taDJXaVTLYZ-1E+hkwxKon6RwjuKzBSgB9LZq7H1w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McH7taDJXaVTLYZ-1E+hkwxKon6RwjuKzBSgB9LZq7H1w@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Rabin Vincent <rabinv@axis.com>, Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Einar Vading <einar.vading@axis.com>, Sascha Hauer <kernel@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

On Mon, Oct 15, 2018 at 11:54:22AM +0200, Bartosz Golaszewski wrote:
> pt., 12 paź 2018 o 11:47 Uwe Kleine-König
> <u.kleine-koenig@pengutronix.de> napisał(a):
> >
> > On Fri, Oct 12, 2018 at 11:27:18AM +0200, Einar Vading wrote:
> > > On Fri, Oct 12, 2018 at 11:06:12AM +0200, Uwe Kleine-König wrote:
> > > > Would it help to instanciate more than one gpio-simulator?
> > >
> > > Hmm, I don't think that would pose a problem. With DT it would be easy to name
> > > the GPIOs and get then get them by name. What gpiochip they are on should not
> > > matter... I think.
> >
> > The only downside is that you cannot atomically set GPIOs on different
> > chips. I didn't try to use naming, but maybe the gpio framework is good
> > enough that it just works.
>
> If I understand correctly the main difference between gpio-mockup and
> gpio-simulator is that simulating interrupts on input lines would
> happen by changing the value of connected output GPIO lines.

Not only for input lines. What is done with gpio-mockup via debugfs is
done for gpio-simulator with the gpio functions on the other side.

> I started using gpio-mockup for testing of both libgpiod and GPIO user
> API some time ago. I initially thought about doing the exact same
> thing with interrupts but figured that if we want to test the user API
> then we'd better not be actually using it since we won't know where
> the eventual bugs will actually come from - i.e. when testing reading
> line events, let's not be using the output API from the other side,
> but rather something not linked to GPIO in any way - debugfs in this
> case.

I wouldn't take this as a reason to not use GPIO stuff for the "other
side". On the contrary, I'd see it as an advantage as this way you test
setting an output on one side and generating an event on the other side
in a single test. And if it's broken and needs debugging there are the
normal trace mechanisms.

> That being said: I have nothing against extending gpio-mockup with
> this feature - I actually like it. I guess having a single module
> param that would create a second corresponding gpiochip for every
> standard one would be enough? I could have the numbering starting
> right after the standard chips and a special label too. However I
> don't really see a need to have two separate testing drivers for a
> single subsystem. Is there anything in the way mockup is implemented
> that stops you from reusing it?

An advantage of my simulator over gpio-mockup (as mentioned already
earlier) is that both sides are available as GPIOs in the kernel. So I
could connect a rotary-encoder input device to an device that mimics a
rotary-encoder.

> Please note that libgpiod extensively uses gpio-mockup for testing so
> there's now way we're getting rid of it anytime soon.

>From my POV in order of preference, we'd do the following:

a) take gpio-simulator in parallel to gpio-mockup
b) take gpio-simulator and drop gpio-mockup
c) merge the two

I think c) is ugly because it complicates the combined driver which
takes away much of the beauty and simplicity I see in at least the
gpio-simulator. (I don't know the mockup driver good enough to judge
here, but on my few looks it looked more complicated which might be
subjective.)

Also there are a few issues I see in the mockup driver (which are not
implied by the architecture and so are fixable):

 - I think it's racy because there is no locking (ditto for the irq
   simulator).
 - Each write to the event file generates an irq, so there is no way to
   test level sensitive irqs.
 - SPDX header claims GPL-2.0+, MODULE_LICENCE claims GPL-v2 only.
 - The debugfs interface doesn't give complete control over the gpios.

Of course there is no *need* to have two virtual gpio devices, but I
don't see a big reason not to have two anyhow.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
