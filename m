Return-Path: <SRS0=MYDa=M6=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:49561 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726424AbeJSDTR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 18 Oct 2018 23:19:17 -0400
Date: Thu, 18 Oct 2018 21:16:46 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: SV: [PATCH RFC] gpio: new driver for a gpio simulator
Message-ID: <20181018191646.np2mdkcjtrzen65z@pengutronix.de>
References: <CACRpkdYnHGWwOA=KUNRe4VP_jxO8TXG3v4vEJfV58OB6z99JFQ@mail.gmail.com>
 <20181011081646.np2pte7eeohuyhh6@pengutronix.de>
 <20181011094905.47onipkrzdp25psq@axis.com>
 <1539331329658.80509@axis.com>
 <20181012090612.63f2p45d24gpilsm@pengutronix.de>
 <20181012092718.dpu6w6rqzknt2cm3@lnxeinarv1.se.axis.com>
 <20181012094704.mow2nfm7xwdi2a4t@pengutronix.de>
 <CAMRc=McH7taDJXaVTLYZ-1E+hkwxKon6RwjuKzBSgB9LZq7H1w@mail.gmail.com>
 <20181015200331.ux5pb5cohtbjskc6@pengutronix.de>
 <CAMRc=Mf+PAvG=gb339GNBCQ1yE1+sGyG5zkM86u3im82f-t+Gw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mf+PAvG=gb339GNBCQ1yE1+sGyG5zkM86u3im82f-t+Gw@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Rabin Vincent <rabinv@axis.com>, Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Einar Vading <einar.vading@axis.com>, Sascha Hauer <kernel@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

Hello Bartosz,

On Thu, Oct 18, 2018 at 05:03:42PM +0200, Bartosz Golaszewski wrote:
> > > Please note that libgpiod extensively uses gpio-mockup for testing so
> > > there's now way we're getting rid of it anytime soon.
> >
> > From my POV in order of preference, we'd do the following:
> >
> > a) take gpio-simulator in parallel to gpio-mockup
> > b) take gpio-simulator and drop gpio-mockup

I'd like to add here between b) and c):

    don't mainline gpio-simulator

> > c) merge the two
> >
> > I think c) is ugly because it complicates the combined driver which
> > takes away much of the beauty and simplicity I see in at least the
> > gpio-simulator. (I don't know the mockup driver good enough to judge
> > here, but on my few looks it looked more complicated which might be
> > subjective.)
> 
> Every single developer likes to start from scratch and implement his
> own ideal solution but that's usually the worst decision[1]. Also:
> it's harder to read code than to write it. The mockup driver works
> fine. It's also reasonably clean as far as code goes. I didn't write
> it from scratch either -  it had existed for some time before I took
> it over and made it into something I could use with libgpiod. Check
> git blame.

I don't agree completely to what you (and Joel) say here. Sometimes it's
sensible to adapt stuff, but if it's already clear from the start that
in the end the result isn't recognizable or the merged work is more
ugly or harder to maintain than the two unmerged ones, I'd say having
two is just fine. Maybe it's doable, but it won't be me who does it.

> > Also there are a few issues I see in the mockup driver (which are not
> > implied by the architecture and so are fixable):
> >
> >  - I think it's racy because there is no locking (ditto for the irq
> >    simulator).
> 
> Yes, it's fixable - I didn't need locking since usually there's only
> one user at any given time. For irq_sim - I don't think we need any
> locking here but I may take a second look at the irq subsystem.

If two CPUs call irq_sim_fire() with different offsets they fight for
assigning sim->work_ctx.irq. One looses and the respective irq doesn't
fire and maybe the winning one fires twice. The thing here is: Yes, it
works most of the time. But only most.

And if your libgpiod isn't tested with quick sequences that might race
against each other, I'd call that a gap in your test setup.

> >  - Each write to the event file generates an irq, so there is no way to
> >    test level sensitive irqs.
> 
> Can't it be fixed by extending the driver with your solution?

Not really. The debugfs interface would need fixing, too. Otherwise you
can trigger a GPIO that is supposed to trigger an irq on a falling edge
by writing a 1 to its debugfs file.

Probably it's easier to add the debugfs interface to the gpio-simulator
than to add the gpio-interface to the gpio-mockup driver. Then opening
the debugfs file could request the GPIO, writing a value would result in
gpio_set_value() and closing in gpio_free(). But then you have a changed
behaviour compared to gpio-mockup and there will be three interfaces to
the GPIOs (/dev/gpiochip, /sys/class/gpio/ and the debugfs) which is
IMHO worse than having gpio-simulator and gpio-mockup side by side.

> > Of course there is no *need* to have two virtual gpio devices, but I
> > don't see a big reason not to have two anyhow.
> 
> I do believe that having a single driver will cause less confusion in
> the future and make it less likely that someone needing another
> testing future will try to get merged a third separate driver. Linus
> will have the last word of course but personally I'd like to work
> towards extending gpio-mockup.

I won't argue here. Iff you think gpio-simulator is good to take without
merging with gpio-mockup I'm willing to work on the (other) identified
weaknesses.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-K�nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
