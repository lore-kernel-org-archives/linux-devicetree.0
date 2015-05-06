From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V4 2/2] pinctrl: Add Pistachio SoC pin control driver
Date: Wed, 6 May 2015 09:14:58 +0200
Message-ID: <CACRpkdZXYcULynAVOU-K+8f2qnQkEFgzK2+Ku7xXzGQx0=uvBQ@mail.gmail.com>
References: <1430269982-24129-1-git-send-email-abrestic@chromium.org>
	<1430269982-24129-3-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430269982-24129-3-git-send-email-abrestic@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Damien Horsley <Damien.Horsley@imgtec.com>, Govindraj Raja <govindraj.raja@imgtec.com>, Kevin Cernekee <cernekee@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi Andrew and sorry for a slow review process, I've been
overloaded :(

On Wed, Apr 29, 2015 at 3:13 AM, Andrew Bresticker
<abrestic@chromium.org> wrote:

> Add a driver for the pin controller present on the IMG Pistachio SoC.
> This driver provides pinmux and pinconfig operations as well as GPIO
> and IRQ chips for the GPIO banks.
>
> Signed-off-by: Damien Horsley <Damien.Horsley@imgtec.com>
> Signed-off-by: Govindraj Raja <govindraj.raja@imgtec.com>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
> Signed-off-by: Kevin Cernekee <cernekee@chromium.org>
> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
> ---
> Changes from v3:
>  - Addressed review comments from Ezequiel.

Overall this is a very very nice looking driver so expect it to
be merged after addressing or answering my last few
concerns.

> +config PINCTRL_PISTACHIO
> +       def_bool y if MACH_PISTACHIO
> +       select PINMUX
> +       select GENERIC_PINCONF
> +       select GPIOLIB_IRQCHIP

I think you also need
depends on / select GPIOLIB
select OF_GPIO

x86_64 allmodconfig is usually the best way to test
if your GPIOs and pin control fragments are correctly Kconfig:ed.

> +#define PADS_DRIVE_STRENGTH_2MA                0x0
> +#define PADS_DRIVE_STRENGTH_4MA                0x1
> +#define PADS_DRIVE_STRENGTH_8MA                0x2
> +#define PADS_DRIVE_STRENGTH_12MA       0x3

Thanks for being clear on the defines and not using magic
values. This makes things so much easier for people
using and maintaining the driver!

> +#define GPIO_BANK(_bank, _pin_base, _npins)                            \
> +       {                                                               \
> +               .gpio_chip = {                                          \
> +                       .label = "GPIO" #_bank,                         \
> +                       .request = pistachio_gpio_request,              \
> +                       .free = pistachio_gpio_free,                    \
> +                       .get_direction = pistachio_gpio_get_direction,  \
> +                       .direction_input = pistachio_gpio_direction_input, \
> +                       .direction_output = pistachio_gpio_direction_output, \
> +                       .get = pistachio_gpio_get,                      \
> +                       .set = pistachio_gpio_set,                      \
> +                       .base = _pin_base,                              \
> +                       .ngpio = _npins,                                \
> +               },                                                      \
> +               .irq_chip = {                                           \
> +                       .name = "GPIO" #_bank,                          \
> +                       .irq_startup = pistachio_gpio_irq_startup,      \
> +                       .irq_ack = pistachio_gpio_irq_ack,              \
> +                       .irq_mask = pistachio_gpio_irq_mask,            \
> +                       .irq_unmask = pistachio_gpio_irq_unmask,        \
> +                       .irq_set_type = pistachio_gpio_irq_set_type,    \
> +               },                                                      \
> +               .gpio_range = {                                         \
> +                       .name = "GPIO" #_bank,                          \
> +                       .id = _bank,                                    \
> +                       .base = _pin_base,                              \
> +                       .pin_base = _pin_base,                          \
> +                       .npins = _npins,                                \
> +               },                                                      \
> +       }

This -gpio_range is the only thing that bothers me a little, combined with
this:

> +               bank->gpio_range.gc = &bank->gpio_chip;
> +               pinctrl_add_gpio_range(pctl->pctldev, &bank->gpio_range);

Because it adds the ranges from the pinctrl side instead of
doing it from the gpiochip side using
gpiochip_add_pin_range() or gpiochip_add_pingroup_range().

Have you tried using those (from <linux/gpio/driver.h> instead?

They have the upside that .base is taken from the gpio_chip
meaning it is unnecessary to define .base for the gpiochip
too and you can just go for what gpiolib dynamically assigns
for you.

> +               pinctrl_remove_gpio_range(pctl->pctldev, &bank->gpio_range);

And this will then be done automatically by gpiochio_remove().

> +static int __init pistachio_pinctrl_register(void)
> +{
> +       return platform_driver_register(&pistachio_pinctrl_driver);
> +}
> +arch_initcall(pistachio_pinctrl_register);

Is it necessary to have it registered so early?

Apart from these, as noted it looks very nice.

Yours,
Linus Walleij
