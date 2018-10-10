Return-Path: <SRS0=3nKo=MW=linaro.org=linus.walleij@kernel.org>
MIME-Version: 1.0
References: <20181008101356.5672-1-uwe@kleine-koenig.org> <CACRpkdbxJ4htb=Fk+UUo4Vm7HsFCXhJoAbJdfF1sx=QMKX_=8A@mail.gmail.com>
 <20181009191121.r2tgc2oslwcwfhyn@pengutronix.de>
In-Reply-To: <20181009191121.r2tgc2oslwcwfhyn@pengutronix.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 10 Oct 2018 13:47:42 +0200
Message-ID: <CACRpkdYnHGWwOA=KUNRe4VP_jxO8TXG3v4vEJfV58OB6z99JFQ@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: new driver for a gpio simulator
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: vincent.whitchurch@axis.com, Mark Rutland <mark.rutland@arm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Oct 9, 2018 at 9:11 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> Currently it is not yet supported, but with the API of gpio-simulator it
> should be trivially possible, to atomically set gpios from userspace
> which won't work with the debugfs files used by gpio-mockup.

Hm. That seems like a feature we might want in the mockup
driver then.

> An advantage of gpio-mockup over gpio-simulator I noticed by reading is
> that it already supports atomic setting in the direction to userspace.
> Also the number of gpios isn't fixed. (But 64 GPIOs should be enough for
> everybody :-)
>
> A bit unrelated: I would probably have noticed the mockup driver if it
> were not hidden in the section "Memory mapped GPIO drivers".

This should be fixed.

> > 2. Would it be possible to extend gpio-mockup.c to cover your
> >   usecases instead of introducing another unreal GPIO device?
>
> Sure, I could change the interface from debugfs to two gpio ports that
> behave like gpio-simulator :-)

Can't we do both... maybe I just don't get it here.

Certainly gpio-mockup will give you the B side, there is
a gpiochip that appears after all as a result of probing the
driver. What you want is to add a second gpiochip that can
be used to stimulate it.

Maybe that is as simple as a module parameter or
Kconfig option to also create a controlling port.

I would prefer to have one GPIO-mockup/fake/simulator
thing instead of several, so we can focus efforts.

It's good for prototyping and testing alike.

> The motivation to create gpio-simulator
> was to have a nice test case for the rotary-encoder driver and for that
> it is crucial to be able to set gpios atomically (in the direction that
> isn't possible for mockup) to test quick turning.

This is a valid prototyping usecase. As is Vincent's.

> > Vincent recently posted patches to even enable device tree
> > probing of the mockup device, indicating that there is already
> > some industrial use of that driver for prototyping.
>
> My gpio-simulator has dt support, too, but it's more a private project
> of me without industrial use (yet).

It's pretty easy for me to see the general utility, so I would
ideally like to incorporate these things into one and the same
simulator/mockup driver.

Yours,
Linus Walleij
