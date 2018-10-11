Return-Path: <SRS0=Kjxg=MX=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:60591 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbeJKPnB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 11 Oct 2018 11:43:01 -0400
Date: Thu, 11 Oct 2018 10:16:46 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH RFC] gpio: new driver for a gpio simulator
Message-ID: <20181011081646.np2pte7eeohuyhh6@pengutronix.de>
References: <20181008101356.5672-1-uwe@kleine-koenig.org>
 <CACRpkdbxJ4htb=Fk+UUo4Vm7HsFCXhJoAbJdfF1sx=QMKX_=8A@mail.gmail.com>
 <20181009191121.r2tgc2oslwcwfhyn@pengutronix.de>
 <CACRpkdYnHGWwOA=KUNRe4VP_jxO8TXG3v4vEJfV58OB6z99JFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYnHGWwOA=KUNRe4VP_jxO8TXG3v4vEJfV58OB6z99JFQ@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, vincent.whitchurch@axis.com, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

On Wed, Oct 10, 2018 at 01:47:42PM +0200, Linus Walleij wrote:
> On Tue, Oct 9, 2018 at 9:11 PM Uwe Kleine-K�nig
> <u.kleine-koenig@pengutronix.de> wrote:
> 
> > Currently it is not yet supported, but with the API of gpio-simulator it
> > should be trivially possible, to atomically set gpios from userspace
> > which won't work with the debugfs files used by gpio-mockup.
> 
> Hm. That seems like a feature we might want in the mockup
> driver then.
> 
> > An advantage of gpio-mockup over gpio-simulator I noticed by reading is
> > that it already supports atomic setting in the direction to userspace.
> > Also the number of gpios isn't fixed. (But 64 GPIOs should be enough for
> > everybody :-)
> >
> > A bit unrelated: I would probably have noticed the mockup driver if it
> > were not hidden in the section "Memory mapped GPIO drivers".
> 
> This should be fixed.
> 
> > > 2. Would it be possible to extend gpio-mockup.c to cover your
> > >   usecases instead of introducing another unreal GPIO device?
> >
> > Sure, I could change the interface from debugfs to two gpio ports that
> > behave like gpio-simulator :-)
> 
> Can't we do both... maybe I just don't get it here.

This would complicate things because then there are two controllers of
the same resource with all the resulting effects. We'd need to make sure
that only one of the two controllers can be active. It's not hard, but I
see little use.

> Certainly gpio-mockup will give you the B side, there is
> a gpiochip that appears after all as a result of probing the
> driver. What you want is to add a second gpiochip that can
> be used to stimulate it.
> 
> Maybe that is as simple as a module parameter or
> Kconfig option to also create a controlling port.
> 
> I would prefer to have one GPIO-mockup/fake/simulator
> thing instead of several, so we can focus efforts.
> 
> It's good for prototyping and testing alike.
> 
> > The motivation to create gpio-simulator
> > was to have a nice test case for the rotary-encoder driver and for that
> > it is crucial to be able to set gpios atomically (in the direction that
> > isn't possible for mockup) to test quick turning.
> 
> This is a valid prototyping usecase. As is Vincent's.

@Vincent: What is your usecase? I currently cannot imagine a use case
that can be done with the mockup driver but not with the simulator.

The conceptual difference is just that mockup uses files in debugfs to
control the "inner side" while the simulator uses another set of gpios.
The advantages of the latter are that you could wire both sides to
otherwise unaware drivers (though this is a bit theoretical as there is
currently no use case I'm aware of that already exists) and it works
with the tools that might already exist to work on real hardware. Also
it is dogfooding which is nice.

So if you ask me the conceptually right solution is to use the
gpio-simulator and throw away the mockup driver. The only downside I see
here is that users of mockup have to adapt. I didn't look into the tool
for mockup yet, but probably they can be easily adapted to work with the
simulator. But maybe I missed the killer feature of the mockup driver
so feel free to prove me wrong.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-K�nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
