Return-Path: <SRS0=Muqj=PT=linaro.org=linus.walleij@kernel.org>
MIME-Version: 1.0
References: <20190103164102.31437-1-thomas.petazzoni@bootlin.com>
 <20190103164102.31437-4-thomas.petazzoni@bootlin.com> <d0e6a519-fb38-4aa0-81d0-b1781129055d@cesnet.cz>
 <20190108150455.60b03b02@windsurf>
In-Reply-To: <20190108150455.60b03b02@windsurf>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jan 2019 11:11:14 +0100
Message-ID: <CACRpkdZGzDzW7Mh-r0RJB3Mc0PadXJ98ZaO3oz6qw5YeprHPXw@mail.gmail.com>
Subject: Re: [PATCH 3/4] gpio: add core support for pull-up/pull-down configuration
Content-Type: text/plain; charset="UTF-8"
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Jan 8, 2019 at 3:04 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:

> > > +/* Bit 4 express pull up */
> > > +#define GPIO_PULL_UP 16
> > > +
> > > +/* Bit 5 express pull down */
> > > +#define GPIO_PULL_DOWN 32
> > > +
> >
> > > +   GPIO_PULL_UP = (1 << 4),
> > > +   GPIO_PULL_DOWN = (1 << 5),
> >
> > > +   OF_GPIO_PULL_UP = 0x10,
> > > +   OF_GPIO_PULL_DOWN = 0x20,
> >
> > I understand that it's already there, but I wonder if this duplication can
> > be removed. Am I missing something, perhaps a reason why
> > include/linux/of_gpio.h and include/dt-bindings/gpio/gpio.h are separate
> > files?
>
> I also wondered why there was such duplication when writing the
> patches. I've assumed it was done so that
> include/dt-bindings/gpio/gpio.h is "clean" enough to be included in DT,
> while include/linux/of_gpio.h some more elaborate definitions. But
> indeed <linux/of_gpio.h> could include <dt-bindings/gpio/gpio.h>.
> Perhaps there's a good reason for this duplication? Let's see the
> feedback of GPIO maintainers about this.

There is a good reason for this.

The reason is that DT ABI is written in clay, userspace ABI is
written in stone and kernel internal API is written in water.

For the last one see Documentation/process/stable-api-nonsense.rst

For the DT the clay tablet hardens when devices are mass produced
and shipped with a DT in flash.

For the userspace ABI, that will never change until the chardevice
disappears.

So these ABIs are essentially versioned according to completely
different rules and for this reason they are kept separate.

They overlap considerably, but for this reason we are keeping the
definitions separately and also explicitly translating between them
so that we can still change the internal kernel representation of
these flags if we need.

Yours,
Linus Walleij
