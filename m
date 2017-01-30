From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/8] pinctrl: stm32: use gpio-ranges to declare bank range
Date: Mon, 30 Jan 2017 16:19:26 +0100
Message-ID: <CACRpkdYtZCJVrZhXOPXd-MNMX0Ry_H1dLQopKwsj9HnO03BtKg@mail.gmail.com>
References: <1485533721-9019-1-git-send-email-alexandre.torgue@st.com> <1485533721-9019-3-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1485533721-9019-3-git-send-email-alexandre.torgue@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre TORGUE <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, Olof Johansson <olof@lixom.net>, Patrice Chotard <patrice.chotard@st.com>, Lee Jones <lee.jones@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 27, 2017 at 5:15 PM, Alexandre TORGUE
<alexandre.torgue@st.com> wrote:

> Use device tree entries to declare gpio range. It will allow to use
> no contiguous gpio bank and holes inside a bank.
>
> Signed-off-by: Alexandre TORGUE <alexandre.torgue@st.com>

(...)
> +       of_property_read_string(np, "st,bank-name", &bank->gpio_chip.label);
> +
> +       if (!of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3, 0, &args))
> +               bank_nr = args.args[1] / STM32_GPIO_PINS_PER_BANK;
> +       else {
> +               range->name = bank->gpio_chip.label;
> +               range->id = bank_nr;
> +               range->pin_base = range->id * STM32_GPIO_PINS_PER_BANK;
> +               range->base = range->id * STM32_GPIO_PINS_PER_BANK;
> +               range->npins = npins;
> +               range->gc = &bank->gpio_chip;
> +               pinctrl_add_gpio_range(pctl->pctl_dev,
> +                                      &pctl->banks[bank_nr].range);
> +       }

Why are you doing this?

There is already code in drivers/gpio/gpiolib-of.c to pick ranges
from the device tree and add when you're adding the GPIO chips.

Please use that or figure out what is needed to make it work for
you instead of reimplementing it.

Yours,
Linus Walleij
