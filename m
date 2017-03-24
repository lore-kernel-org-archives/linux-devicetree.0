From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/7] pinctrl: Renesas RZ/A1 pin and gpio controller
Date: Fri, 24 Mar 2017 16:42:47 +0100
Message-ID: <CACRpkdYjZJ7e0tJy6_jfpRT+UDFWqnu8ZX18-gaAHVZLgW-prA@mail.gmail.com>
References: <1490368934-12494-1-git-send-email-jacopo+renesas@jmondi.org> <1490368934-12494-2-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1490368934-12494-2-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 24, 2017 at 4:22 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:

I assume Geert will queue this driver even if it is outside of sh-pfc?

> Add combined gpio and pin controller driver for Renesas RZ/A1
> r7s72100 SoC.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/pinctrl/Kconfig        |  10 +
>  drivers/pinctrl/Makefile       |   1 +
>  drivers/pinctrl/pinctrl-rza1.c | 961 +++++++++++++++++++++++++++++++++++++++++

So this is very different from the SH-PFC family and should not
be in drivers/pinctrl/sh-pfc?

> +config PINCTRL_RZA1
> +       bool "Renesas RZ/A1 gpio and pinctrl driver"
> +       depends on OF
> +       depends on ARCH_R7S72100 || COMPILE_TEST
> +       select GENERIC_PINCTRL_GROUPS
> +       select GENERIC_PINMUX_FUNCTIONS
> +       select GENERIC_PINCONF

If it is also a GPIO driver I guess it should
select GPIOLIB as well.

This was not possible in the past, but it is possible nowadays.

> +struct gpio_chip rza1_gpiochip_template = {
> +       .request                = rza1_gpio_request,
> +       .free                   = rza1_gpio_free,
> +       .get_direction          = rza1_gpio_get_direction,
> +       .direction_input        = rza1_gpio_direction_input,
> +       .direction_output       = rza1_gpio_direction_output,
> +       .get                    = rza1_gpio_get,
> +       .set                    = rza1_gpio_set,
> +};

We now also have .set_multiple() and more interestingly
.set_config() which can be backed by pinctrl if you want
to e.g. support debouncing and/or open drain/open source.

Maybe this is stuff your pin controller can do, but not needed
in the initial submission for sure.

> +static int rza1_pinmux_set(struct pinctrl_dev *pctldev, unsigned int selector,
> +                          unsigned int group)

Please name it rza1_set_mux() to correspond with the ops field.

Yours,
Linus Walleij
