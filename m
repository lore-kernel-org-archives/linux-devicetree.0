Return-Path: <SRS0=3xx/=MV=linaro.org=linus.walleij@kernel.org>
MIME-Version: 1.0
References: <20181008101356.5672-1-uwe@kleine-koenig.org>
In-Reply-To: <20181008101356.5672-1-uwe@kleine-koenig.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 9 Oct 2018 14:51:37 +0200
Message-ID: <CACRpkdbxJ4htb=Fk+UUo4Vm7HsFCXhJoAbJdfF1sx=QMKX_=8A@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: new driver for a gpio simulator
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>, Bartosz Golaszewski <brgl@bgdev.pl>, vincent.whitchurch@axis.com
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

Hi Uwe,

thanks for this interesting patch!

On Mon, Oct 8, 2018 at 12:14 PM Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.or=
g> wrote:

> A gpio simulator device provides 2x 32 virtual GPIOs that are pairwise
> connected.
>
> That is, if both GPIOs are configured as input both read a zero. If one
> is an output the other reads the first's output value.
>
> This can for example be used to add a push button device on one side and
> "push" it by driving the other side via gpioctl.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org>
> ---
> Hello,
>
> this is a patch that I intend to use to test a few patches that are
> still on my todo list.
>
> Do you consider it interesting enough to be suitable for mainline?
>
> There is one issue (that I'm aware of): If the driver is unbound (via
> sysfs) I get warnings that the gpios and/or irqs are still in use. Not
> sure how to fix this properly.

I would run this by Bartosz who maintains the gpio-mockup.c
driver.

I have basically two questions:

1. When compared to gpio-mockup.c, what features does this
  simulator offer that gpio-mockup doesn't already have?

2. Would it be possible to extend gpio-mockup.c to cover your
  usecases instead of introducing another unreal GPIO device?

Vincent recently posted patches to even enable device tree
probing of the mockup device, indicating that there is already
some industrial use of that driver for prototyping.

Yours,
Linus Walleij
