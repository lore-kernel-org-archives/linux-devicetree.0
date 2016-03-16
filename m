From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] gpio: Add AXP209 GPIO driver
Date: Wed, 16 Mar 2016 10:56:02 +0100
Message-ID: <CACRpkdZ+F4jMG=s0zjF0mC34dm5CqVKtWTuyo+io+tG-J14rGg@mail.gmail.com>
References: <1457520614-32239-1-git-send-email-maxime.ripard@free-electrons.com>
	<1457520614-32239-2-git-send-email-maxime.ripard@free-electrons.com>
Reply-To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDE6RCFOWIARBMW3US3QKGQEB46XUFA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1457520614-32239-2-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 9, 2016 at 11:50 AM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> The AXP209 PMIC has a bunch of GPIOs accessible, that are usually used to
> control LEDs or backlight.
>
> Add a driver for them
>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

OK...

> +++ b/Documentation/devicetree/bindings/gpio/gpio-axp209.txt

Some people insist that bindings be sent separately from the
drivers but I don't care. Especially not for this simple binding.

> +AXP209 GPIO controller

Write something more about the hardware here. For example the
quite obvious fact that it is part of an bigger MFD device.
In some cases people put all the bindings inside a single
file in bindings/mfd/*, follow Lee's recommendation here, I have
no strong opinion.

> +axp209: pmic@34 {
> +       compatible = "x-powers,axp209";

Doesn't this need "simple-mfd" if the GPIO subdriver shall
probe properly?

> +       reg = <0x34>;
> +       interrupt-parent = <&nmi_intc>;
> +       interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> +       interrupt-controller;
> +       #interrupt-cells = <1>;
> +
> +       axp_gpio: gpio {
> +               compatible = "x-powers,axp209-gpio";
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +       };
> +};

(...)
> +++ b/drivers/gpio/gpio-axp209.c
(...)
> +#include <linux/device.h>
> +#include <linux/gpio.h>

Should only need <linux/gpio/driver.h>

> +struct axp20x_gpio *to_axp20x_gpio(struct gpio_chip *chip)
> +{
> +       return container_of(chip, struct axp20x_gpio, chip);
> +}

No. Use devm_gpiochip_add_data() and gpiochip_get_data()
to get the pointer back.

> +static int axp20x_gpio_get_reg(unsigned offset)
> +{
> +       switch (offset) {
> +       case 0:
> +               return AXP20X_GPIO0_CTRL;
> +       case 1:
> +               return AXP20X_GPIO1_CTRL;
> +       case 2:
> +               return AXP20X_GPIO2_CTRL;
> +       }
> +
> +       return -EINVAL;
> +}

Can't you just:

static u8 regs[] = {AXP20X_GPIO0_CTRL, AXP20X_GPIO1_CTRL, AXP20X_GPIO2_CTRL};

static int axp20x_gpio_get_reg(unsigned offset)
{
    if (offset >= ARRAY_SIZE(regs))
        return -EINVAL;
    return regs[offset];
}

> +static int axp20x_gpio_get(struct gpio_chip *chip, unsigned offset)
> +{
> +       struct axp20x_gpio *gpio = to_axp20x_gpio(chip);
> +       unsigned int val;
> +       int reg, ret;
> +
> +       reg = axp20x_gpio_get_reg(offset);
> +       if (reg < 0)
> +               return reg;
> +
> +       ret = regmap_read(gpio->regmap, reg, &val);
> +       if (ret)
> +               return ret;
> +
> +       return val & (1 << (offset + 4));

This doesn't clamp to [0,1]. Please do this instead:

#include <linux/bitops.h>

return !!(val & BIT(offset+4));

> +static int axp20x_gpio_probe(struct platform_device *pdev)
> +{
> +       struct axp20x_dev *axp20x = dev_get_drvdata(pdev->dev.parent);
> +       struct axp20x_gpio *gpio;
> +       int ret;
> +
> +       if (!of_device_is_available(pdev->dev.of_node))
> +               return -ENODEV;
> +
> +       if (!axp20x) {
> +               dev_err(&pdev->dev, "Parent drvdata not set\n");
> +               return -EINVAL;
> +       }
> +
> +       gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
> +       if (!gpio)
> +               return -ENOMEM;
> +
> +       gpio->chip.base                 = -1;
> +       gpio->chip.can_sleep            = true;
> +       gpio->chip.dev                  = &pdev->dev;

This is renamed .parent upstream, ick use latest kernel as base for
your patches ;)

> +       gpio->chip.label                = dev_name(&pdev->dev);
> +       gpio->chip.owner                = THIS_MODULE;
> +       gpio->chip.get                  = axp20x_gpio_get;
> +       gpio->chip.set                  = axp20x_gpio_set;
> +       gpio->chip.direction_input      = axp20x_gpio_input;
> +       gpio->chip.direction_output     = axp20x_gpio_output;
> +       gpio->chip.ngpio                = 3;
> +
> +       gpio->regmap = axp20x->regmap;
> +
> +       ret = gpiochip_add(&gpio->chip);

devm_gpiochip_add_data() as mentioned.

Yours,
Linus Walleij
