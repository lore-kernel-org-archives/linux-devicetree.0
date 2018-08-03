From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 2/2] pinctrl: nuvoton: add NPCM7xx pinctrl and GPIO driver
Date: Fri, 3 Aug 2018 02:09:04 +0200
Message-ID: <CACRpkdaXxWWQZQhap51nGcFvZeGnJ0ZK5LuwVJvkWevxvj7JUw@mail.gmail.com>
References: <20180730110406.132729-1-tmaimon77@gmail.com> <20180730110406.132729-3-tmaimon77@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180730110406.132729-3-tmaimon77@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Nancy Yuen <yuenn@google.com>, Patrick Venture <venture@google.com>, Brendan Higgins <brendanhiggins@google.com>, avifishman70@gmail.com, Joel Stanley <joel@jms.id.au>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Tomer,

this is starting to look really good!

Please try this with my patch and drop the new DIR_INV flag that I think
we do not need anymore after that.

Other small bits:

On Mon, Jul 30, 2018 at 1:04 PM Tomer Maimon <tmaimon77@gmail.com> wrote:

> +/* Structure for register banks */
> +struct npcm7xx_gpio {
> +       void __iomem            *base;
> +       struct gpio_chip        gc;
> +       int                     irqbase;
> +       int                     irq;
> +       void                    *priv;
> +       struct irq_chip         irq_chip;
> +       u32                     pinctrl_id;
> +       int (*direction_input)(struct gpio_chip *chip, unsigned offset);
> +       int (*direction_output)(struct gpio_chip *chip, unsigned offset,
> +                               int value);
> +       int (*request)(struct gpio_chip *chip, unsigned offset);
> +       void (*free)(struct gpio_chip *chip, unsigned offset);

Very nice! You sorted it out perfectly.

> +/* GPIO handling in the pinctrl driver */
> +static void npcm_gpio_set(struct gpio_chip *gc, void __iomem *reg,
> +                         unsigned int pinmask)
> +{
> +       unsigned long flags;
> +       unsigned long val;
> +
> +       spin_lock_irqsave(&gc->bgpio_lock, flags);
> +
> +       val = gc->read_reg(reg) | pinmask;
> +       gc->write_reg(reg, val);

I see some GPIO drivers do this but I don't think you need to use these indirect
->read_reg() and ->write_reg() accessors, it just obscures things. If
you need to
access these registers I think it's fine to just use the base and
read/write them.
But it's your pick, I will not insist. Maybe it's a matter of taste.

> +static int npcmgpio_direction_input(struct gpio_chip *chip, unsigned int offset)
> +{
> +       struct npcm7xx_gpio *bank = gpiochip_get_data(chip);
> +       int ret;
> +
> +       ret = pinctrl_gpio_direction_input(offset + chip->base);
> +       if (ret)
> +               return ret;
> +
> +       return bank->direction_input(chip, offset);
> +}

Exactly as I think it should work, sweet!

This:

> +                       pctrl->gpio_bank[id].pinctrl_id = pinspec.args[0];
> +                       pctrl->gpio_bank[id].gc.base = pinspec.args[1];
> +                       pctrl->gpio_bank[id].gc.ngpio = pinspec.args[2];
> +                       pctrl->gpio_bank[id].gc.owner = THIS_MODULE;
> +                       pctrl->gpio_bank[id].gc.label =
> +                               devm_kasprintf(pctrl->dev, GFP_KERNEL, "%pOF",

And this:

> +       for (i = 0 ; i < pctrl->bank_num ; i++) {
> +               ret = gpiochip_add_pin_range(&pctrl->gpio_bank[i].gc,
> +                                            dev_name(pctrl->dev),
> +                                            pctrl->gpio_bank[i].pinctrl_id,
> +                                            pctrl->gpio_bank[i].gc.base,
> +                                            pctrl->gpio_bank[i].gc.ngpio);
> +               if (ret < 0) {
> +                       dev_err(pctrl->dev, "Failed to add GPIO bank %u\n", i);
> +                       gpiochip_remove(&pctrl->gpio_bank[i].gc);
> +                       goto err_range;
> +               }
> +       }

Worries me a bit. This seems to be like this because you register the
GPIO before the pin controller.

Normally we would register in the other order, and the code inside
of_gpiochio_add() as part of [devm_]gpiochip_add() will parse the phandle
and add the ranges when you add the GPIO chip.

Is this impossible to solve this cleanly?

Yours,
Linus Walleij
