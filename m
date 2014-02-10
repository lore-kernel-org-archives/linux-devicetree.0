From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v11] gpio: add a driver for the Synopsys DesignWare APB
 GPIO block
Date: Mon, 10 Feb 2014 12:06:44 +0100
Message-ID: <CACRpkdYiC=nzVG4_nQuRVSNP9TB4W=3VL9QhBQjmqvLvmP6McA@mail.gmail.com>
References: <1391724370-30589-1-git-send-email-delicious.quinoa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1391724370-30589-1-git-send-email-delicious.quinoa@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Alan Tull <delicious.quinoa@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Jamie Iles <jamie@jamieiles.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Alan Tull <atull@altera.com>, Dinh Nguyen <dinguyen@altera.com>, Yves Vandervennet <rocket.yvanderv@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Alan, this is starting to look good. I's like an ACK from a DT
maintainer on the bindings but can't see anything really controversial
about them.

On Thu, Feb 6, 2014 at 11:06 PM, Alan Tull <delicious.quinoa@gmail.com> wrote:

> +static int dwapb_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
> +{
> +       struct bgpio_chip *bgc = to_bgpio_chip(gc);
> +       struct dwapb_gpio_port *port = container_of(bgc, struct
> +                                                   dwapb_gpio_port, bgc);
> +       struct dwapb_gpio *gpio = port->gpio;
> +
> +       return irq_create_mapping(gpio->domain, offset);
> +}

I think you want to call irq_find_mapping() here. irq_create_mapping()
should be called for all valid IRQs on probe() instead.

> +               ct = irq_gc->chip_types;
> +               ct->chip.irq_ack = irq_gc_ack_set_bit;
> +               ct->chip.irq_mask = irq_gc_mask_set_bit;
> +               ct->chip.irq_unmask = irq_gc_mask_clr_bit;
> +               ct->chip.irq_set_type = dwapb_irq_set_type;
> +               ct->chip.irq_enable = dwapb_irq_enable;
> +               ct->chip.irq_disable = dwapb_irq_disable;
> +               ct->regs.ack = GPIO_PORTA_EOI;
> +               ct->regs.mask = GPIO_INTMASK;

Please add .startup() and .shutdown() callbacks marking the
respective lines as IRQs, compare to recent patches in the
GPIO subsystem such as this:
http://marc.info/?l=linux-gpio&m=138546100215235&w=2

You probably want to call irq_create_mapping() for each
valid IRQ after registering the chip in this function.

Yours,
Linus Walleij
