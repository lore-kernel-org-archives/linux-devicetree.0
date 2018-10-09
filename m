Return-Path: <SRS0=mAdS=MV=pengutronix.de=ukl@kernel.org>
Date: Tue, 9 Oct 2018 21:11:21 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH RFC] gpio: new driver for a gpio simulator
Message-ID: <20181009191121.r2tgc2oslwcwfhyn@pengutronix.de>
References: <20181008101356.5672-1-uwe@kleine-koenig.org>
 <CACRpkdbxJ4htb=Fk+UUo4Vm7HsFCXhJoAbJdfF1sx=QMKX_=8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbxJ4htb=Fk+UUo4Vm7HsFCXhJoAbJdfF1sx=QMKX_=8A@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, vincent.whitchurch@axis.com, Mark Rutland <mark.rutland@arm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hello Linus,

On Tue, Oct 09, 2018 at 02:51:37PM +0200, Linus Walleij wrote:
> On Mon, Oct 8, 2018 at 12:14 PM Uwe Kleine-K�nig <uwe@kleine-koenig.org> wrote:
> 
> > A gpio simulator device provides 2x 32 virtual GPIOs that are pairwise
> > connected.
> >
> > That is, if both GPIOs are configured as input both read a zero. If one
> > is an output the other reads the first's output value.
> >
> > This can for example be used to add a push button device on one side and
> > "push" it by driving the other side via gpioctl.
> >
> > Signed-off-by: Uwe Kleine-K�nig <uwe@kleine-koenig.org>
> > ---
> > Hello,
> >
> > this is a patch that I intend to use to test a few patches that are
> > still on my todo list.
> >
> > Do you consider it interesting enough to be suitable for mainline?
> >
> > There is one issue (that I'm aware of): If the driver is unbound (via
> > sysfs) I get warnings that the gpios and/or irqs are still in use. Not
> > sure how to fix this properly.
> 
> I would run this by Bartosz who maintains the gpio-mockup.c
> driver.

Oh, I wasn't aware of that driver.

> I have basically two questions:
> 
> 1. When compared to gpio-mockup.c, what features does this
>   simulator offer that gpio-mockup doesn't already have?

I like my driver better because the interface to drive (or read) a
simulated gpio is more natural (but of course I'm not objective here). I
only read through the mockup driver quickly but I wonder if/how it
supports different irq sensitivities.

I saw there are some tools to work with such a mockup device. For my
gpio-simulator the tools used to interact with gpios are directly
suitable which is a nice result of the simulator design. A nice property
of the symmetry of gpio-simulator is that both ends are available in the
kernel. So you could even use it to connect an i2c-gpio instance to a
i2c-slave-gpio instance (though this would need to add support for
pullups instead of the currently hard-coded pull-down).

It already offers device tree probing and I successfully added a rotary
encoder device to it.

Currently it is not yet supported, but with the API of gpio-simulator it
should be trivially possible, to atomically set gpios from userspace
which won't work with the debugfs files used by gpio-mockup.

An advantage of gpio-mockup over gpio-simulator I noticed by reading is
that it already supports atomic setting in the direction to userspace.
Also the number of gpios isn't fixed. (But 64 GPIOs should be enough for
everybody :-)

A bit unrelated: I would probably have noticed the mockup driver if it
were not hidden in the section "Memory mapped GPIO drivers".

> 2. Would it be possible to extend gpio-mockup.c to cover your
>   usecases instead of introducing another unreal GPIO device?

Sure, I could change the interface from debugfs to two gpio ports that
behave like gpio-simulator :-) The motivation to create gpio-simulator
was to have a nice test case for the rotary-encoder driver and for that
it is crucial to be able to set gpios atomically (in the direction that
isn't possible for mockup) to test quick turning.

> Vincent recently posted patches to even enable device tree
> probing of the mockup device, indicating that there is already
> some industrial use of that driver for prototyping.

My gpio-simulator has dt support, too, but it's more a private project
of me without industrial use (yet).

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-K�nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
