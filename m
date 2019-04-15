From: Sylvain Lemieux <slemieux.tyco@gmail.com>
Subject: Re: [PATCH 2/3] gpio: lpc32xx: enable interrupt lookup for port 3
Date: Mon, 15 Apr 2019 09:12:00 -0400
Message-ID: <CA+rxa6o9+MJBJy4hTkPukXhkCSvqnRokjT5FNsdm_hbdUjPJQw@mail.gmail.com>
References: <20190410103926.8781-1-alexandre.belloni@bootlin.com>
 <20190410103926.8781-3-alexandre.belloni@bootlin.com> <CACRpkdY2Znvf0h5KiMqqq7J9r3uKU+Uss2Rteaw8a687BetV6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdY2Znvf0h5KiMqqq7J9r3uKU+Uss2Rteaw8a687BetV6A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 11, 2019 at 9:55 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, Apr 10, 2019 at 12:39 PM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
>
> > Interrupt support was disabled "temporarily" in commit 320a6480ef24 ("gpio:
> > lpc32xx: disable broken to_irq support").
> >
> > Reenable to_irq for port 3 as they are directly connected to an interrupt
> > controller and a simple lookup is working.
> >
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
>
> Unfortunately this seems to be one of these hacks for
> hierarchical interrupts that does not quite cut it.
>
> > +static int lpc32xx_gpio_to_irq_p3(struct gpio_chip *chip, unsigned int offset)
> > +       return of_irq_get_byname(chip->of_node, chip->names[offset]);
>
> This works as long as consuming drivers pick a GPIO first
> using gpiod_get() (and variants) and then convert it to an
> IRQ using gpiod_to_irq().
>
> But it doesn't work when some consumer is just picking an
> IRQ off of the node without picking the GPIO first.
> And in DT that is OK, this DT node is definately an interrupt
> controller. (Leaving out the attribute for interrupt controller
> as is currently the case doesn't really fix the issue, it is
> just inconsistent.)
>
> Look at Brian Masney's series for the qualcomm pin controller
> chips for inspiration on how to do things right, see:
> commit 9d2b563bc23acfa93e7716b3396fd2f79fa8f0cd
> and down.
>
> Also:
> https://marc.info/?l=linux-gpio&m=154959228527643&w=2
>
> Especially note how he removes the kind of hack you are
> adding in e.g.
> commit a796fab2c605d6340512c51c6c3fa1c581357993
>
> Yours,
> Linus Walleij
>

Hi Alexandre,

you can also look at the original attempt, in 2015, to replace
this driver by a new version:
http://lists.infradead.org/pipermail/linux-arm-kernel/2015-November/386708.html

Regards,
Sylvain

> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
