From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v4 2/9] pinctrl: Renesas RZ/A1 pin and gpio controller
Date: Wed, 26 Apr 2017 14:21:34 +0200
Message-ID: <CAMuHMdUy3wo9x=nkpdSVSt34q5yaARc4+kFDC592V2LF7Cxzrg@mail.gmail.com>
References: <1491401247-7030-1-git-send-email-jacopo+renesas@jmondi.org> <1491401247-7030-3-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1491401247-7030-3-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Jacopo,

On Wed, Apr 5, 2017 at 4:07 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> Add combined gpio and pin controller driver for Renesas RZ/A1
> r7s72100 SoC.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

> --- /dev/null
> +++ b/drivers/pinctrl/pinctrl-rza1.c

> +/*
> + * Keep this up-to-date with pinconf-generic.h: it performs packing of
> + * pin conf flags and argument during pinconf_generic_parse_dt_config();
> + * we simply discard pinconf argument here
> + */
> +#define PIN_CONF_UNPACK(pinconf)       ((pinconf) & 0xffUL)

Perhaps this should be moved to pinconf-generic.h, to make sure it stays
up-to-date?

> +static inline int rza1_get_bit(struct rza1_port *port, unsigned int reg,

I'd use "unsigned int" as the return type.
It doesn't matter much as register values are 16-bit, but people might copy
from this driver when writing their own.

> +                              unsigned int bit)
> +{
> +       void __iomem *mem = RZA1_ADDR(port->base, reg, port->id);
> +
> +       return ioread16(mem) & BIT(bit);
> +}

> +static inline int rza1_pin_get_direction(struct rza1_port *port,
> +                                        unsigned int pin)
> +{
> +       unsigned long irqflags;
> +       int input;
> +
> +       spin_lock_irqsave(&port->lock, irqflags);
> +       input = rza1_get_bit(port, RZA1_PM_REG, pin);
> +       spin_unlock_irqrestore(&port->lock, irqflags);
> +
> +       return input;

return !!input;

gpio_chip.get_direction() should return 0, 1, or a negative error value.

> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
