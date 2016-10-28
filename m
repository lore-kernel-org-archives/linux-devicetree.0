From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2 4/4] gpio: pv88080: Add GPIO function support
Date: Fri, 28 Oct 2016 14:10:47 +0200
Message-ID: <CACRpkdYW_LnT9zLQp=r8xE1o=_hfwGEhOu_w2bp+hRZNN29WLA@mail.gmail.com>
References: <cover.1477530195.git.eric.jeong@diasemi.com> <0ef1d730ec55eaaf736fb1606ea73d7af27c1021.1477530195.git.eric.jeong@diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <0ef1d730ec55eaaf736fb1606ea73d7af27c1021.1477530195.git.eric.jeong@diasemi.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Eric Jeong <eric.jeong.opensource@diasemi.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, LINUX-GPIO <linux-gpio@vger.kernel.org>, LINUX-KERNEL <linux-kernel@vger.kernel.org>, DEVICETREE <devicetree@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Support Opensource <support.opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 27, 2016 at 3:03 AM, Eric Jeong
<eric.jeong.opensource@diasemi.com> wrote:

> From: Eric Jeong <eric.jeong.opensource@diasemi.com>
>
> This patch adds support for PV88080 PMIC GPIOs.
> PV88080 has two configurable GPIOs.
>
> Kconfig and Makefile are updated to reflect support
> for PV88080 PMIC GPIO.
>
> Signed-off-by: Eric Jeong <eric.jeong.opensource@diasemi.com>
(...)

> +static int pv88080_gpio_direction_input(struct gpio_chip *gc,
> +                               unsigned int offset)
> +{
> +       struct pv88080_gpio *priv = gpiochip_get_data(gc);
> +       struct pv88080 *chip = priv->chip;
> +       int ret;
> +
> +       /* Set the initial value */
> +       ret = regmap_update_bits(chip->regmap, priv->gpio_base_reg + offset,
> +                                       PV88080_GPIO_OUTPUT_MASK, 0);
> +       if (ret)
> +               return ret;

So you set the initial value when we change the pin to *input*...

> +
> +       return regmap_update_bits(chip->regmap, priv->gpio_base_reg + offset,
> +                               PV88080_GPIO_DIRECTION_MASK, 0);
> +}
> +
> +static int pv88080_gpio_direction_output(struct gpio_chip *gc,
> +                               unsigned int offset, int value)
> +{
> +       struct pv88080_gpio *priv = gpiochip_get_data(gc);
> +       struct pv88080 *chip = priv->chip;
> +       int ret;
> +
> +       ret = regmap_update_bits(chip->regmap, priv->gpio_base_reg + offset,
> +                       PV88080_GPIO_DIRECTION_MASK,
> +                       PV88080_GPIO_DIRECTION_MASK);

But do nothing when we change the pin to *output*?

It seems like you switched the two function implementations or
something?

> +static int pv88080_gpio_get(struct gpio_chip *gc, unsigned int offset)
> +{
> +       struct pv88080_gpio *priv = gpiochip_get_data(gc);
> +       struct pv88080 *chip = priv->chip;
> +       unsigned int reg = 0, direction;
> +       int ret;
> +
> +       ret = regmap_read(chip->regmap, priv->gpio_base_reg + offset, &reg);
> +       if (ret)
> +               return ret;
> +
> +       direction = (reg & PV88080_GPIO_DIRECTION_MASK);
> +       if (direction == PV88080_PORT_DIRECTION_OUTPUT) {
> +               if (reg & PV88080_GPIO_OUTPUT_EN)
> +                       return 1;
> +               ret = 0;
> +       } else {
> +               ret = regmap_read(chip->regmap, priv->input_reg, &reg);
> +               if (ret < 0)
> +                       return ret;
> +               ret = (reg & (PV88080_GPIO_INPUT_MASK << offset)) >> offset;

Isn't this what you want to do?

#include <linux/bitops.h>

ret = !!(reg & BIT(offset));

The mask is 0x01. No point in making things more complicated than they are.


> +static void pv88080_gpio_set(struct gpio_chip *gc, unsigned int offset,
> +                               int value)
> +{
> +       struct pv88080_gpio *priv = gpiochip_get_data(gc);
> +       struct pv88080 *chip = priv->chip;
> +
> +       if (value)
> +               regmap_update_bits(chip->regmap, priv->gpio_base_reg + offset,
> +                               PV88080_GPIO_OUTPUT_MASK,
> +                               PV88080_GPIO_OUTPUT_EN);
> +       else
> +               regmap_update_bits(chip->regmap, priv->gpio_base_reg + offset,
> +                               PV88080_GPIO_OUTPUT_MASK,
> +                               PV88080_GPIO_OUTPUT_DIS);
> +}

Looks good, output is more complicated.

> +static const struct gpio_chip template_gpio = {
> +       .label = "pv88080-gpio",
> +       .owner = THIS_MODULE,
> +       .get_direction = pv88080_gpio_get_direction,
> +       .direction_input = pv88080_gpio_direction_input,
> +       .direction_output = pv88080_gpio_direction_output,
> +       .get = pv88080_gpio_get,
> +       .set = pv88080_gpio_set,
> +       .base = -1,
> +       .ngpio = DEFAULT_PIN_NUMBER,
> +};

Why even have a #define for DEFAULT_PIN_NUMBER?
Just hardcode it here.

> +       priv->chip = chip;
> +       priv->gpio_chip = template_gpio;
> +       priv->gpio_chip.parent = chip->dev;

I slightly prefer that you fill in the priv->gpio_chip with code (one
assignment per line) rather than
assigning a template like here, but it's your pick.

> +       if (pdata && pdata->gpio_base)
> +               priv->gpio_chip.base = pdata->gpio_base;

Give me any good reason to support this. Please just drop
this platform data. Use -1 like in the template and get
dynamic assignment of GPIO numbers.

Yours,
Linus Walleij
