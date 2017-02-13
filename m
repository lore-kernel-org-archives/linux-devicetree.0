From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 3/8] pinctrl: sunxi: Add A64 R_PIO
 controller support
Date: Mon, 13 Feb 2017 23:09:48 +0800
Message-ID: <CAGb2v64aGGwac9AfA=_ZgZppcSoi54Os3tix6O==vdJ3Z_UD0Q@mail.gmail.com>
References: <20170208100009.29362-1-icenowy@aosc.xyz> <20170208100009.29362-3-icenowy@aosc.xyz>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBVEYQ7CQKGQED5OOOJI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170208100009.29362-3-icenowy-ymACFijhrKM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 8, 2017 at 6:00 PM, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org> wrote:
> The A64 has a R_PIO pin controller, similar to the one found on the H3 SoC.
> Add support for the pins controlled by the R_PIO controller.
>
> Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> ---
>  drivers/pinctrl/sunxi/Kconfig                |   5 +
>  drivers/pinctrl/sunxi/Makefile               |   1 +
>  drivers/pinctrl/sunxi/pinctrl-sun50i-a64-r.c | 143 +++++++++++++++++++++++++++
>  3 files changed, 149 insertions(+)
>  create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun50i-a64-r.c
>
> diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
> index 92d845827577..df5089841c6e 100644
> --- a/drivers/pinctrl/sunxi/Kconfig
> +++ b/drivers/pinctrl/sunxi/Kconfig
> @@ -72,6 +72,11 @@ config PINCTRL_SUN50I_A64
>         bool
>         select PINCTRL_SUNXI
>
> +config PINCTRL_SUN50I_A64_R
> +       bool
> +       depends on RESET_CONTROLLER
> +       select PINCTRL_SUNXI
> +
>  config PINCTRL_SUN50I_H5
>         bool
>         select PINCTRL_SUNXI
> diff --git a/drivers/pinctrl/sunxi/Makefile b/drivers/pinctrl/sunxi/Makefile
> index f9a3855c42f1..ce956258cc39 100644
> --- a/drivers/pinctrl/sunxi/Makefile
> +++ b/drivers/pinctrl/sunxi/Makefile
> @@ -12,6 +12,7 @@ obj-$(CONFIG_PINCTRL_SUN8I_A23)               += pinctrl-sun8i-a23.o
>  obj-$(CONFIG_PINCTRL_SUN8I_A23_R)      += pinctrl-sun8i-a23-r.o
>  obj-$(CONFIG_PINCTRL_SUN8I_A33)                += pinctrl-sun8i-a33.o
>  obj-$(CONFIG_PINCTRL_SUN50I_A64)       += pinctrl-sun50i-a64.o
> +obj-$(CONFIG_PINCTRL_SUN50I_A64_R)     += pinctrl-sun50i-a64-r.o
>  obj-$(CONFIG_PINCTRL_SUN8I_A83T)       += pinctrl-sun8i-a83t.o
>  obj-$(CONFIG_PINCTRL_SUN8I_H3)         += pinctrl-sun8i-h3.o
>  obj-$(CONFIG_PINCTRL_SUN8I_H3_R)       += pinctrl-sun8i-h3-r.o
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a64-r.c b/drivers/pinctrl/sunxi/pinctrl-sun50i-a64-r.c
> new file mode 100644
> index 000000000000..90996a63689b
> --- /dev/null
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a64-r.c
> @@ -0,0 +1,143 @@
> +/*
> + * Allwinner A64 SoCs special pins pinctrl driver.
> + *
> + * Based on pinctrl-sun8i-a23-r.c
> + *
> + * Copyright (C) 2016 Icenowy Zheng
> + * Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> + *
> + * Copyright (C) 2014 Chen-Yu Tsai
> + * Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> + *
> + * Copyright (C) 2014 Boris Brezillon
> + * Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> + *
> + * Copyright (C) 2014 Maxime Ripard
> + * Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> + *
> + * This file is licensed under the terms of the GNU General Public
> + * License version 2.  This program is licensed "as is" without any
> + * warranty of any kind, whether express or implied.
> + */
> +
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +
> +#include "pinctrl-sunxi.h"
> +
> +static const struct sunxi_desc_pin sun50i_a64_r_pins[] = {
> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 0),
> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
> +                 SUNXI_FUNCTION(0x2, "s_rsb"),         /* SCK */
> +                 SUNXI_FUNCTION(0x3, "s_i2c"),         /* SCK */
> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 0)),  /* PL_EINT0 */
> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 1),
> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
> +                 SUNXI_FUNCTION(0x2, "s_rsb"),         /* SDA */
> +                 SUNXI_FUNCTION(0x3, "s_i2c"),         /* SDA */
> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 1)),  /* PL_EINT1 */
> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 2),
> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
> +                 SUNXI_FUNCTION(0x2, "s_uart"),        /* TX */
> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 2)),  /* PL_EINT2 */
> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 3),
> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
> +                 SUNXI_FUNCTION(0x2, "s_uart"),        /* RX */
> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 3)),  /* PL_EINT3 */
> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 4),
> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
> +                 SUNXI_FUNCTION(0x3, "s_jtag"),        /* MS */
> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 4)),  /* PL_EINT4 */
> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 5),
> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
> +                 SUNXI_FUNCTION(0x3, "s_jtag"),        /* CK */
> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 5)),  /* PL_EINT5 */
> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 6),
> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
> +                 SUNXI_FUNCTION(0x3, "s_jtag"),        /* DO */
> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 6)),  /* PL_EINT6 */
> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 7),
> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
> +                 SUNXI_FUNCTION(0x3, "s_jtag"),        /* DI */

The function ID for JTAG on pins PL4 ~ PL7 should be 0x2, not 0x3.

Otherwise,

Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 7)),  /* PL_EINT7 */
> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 8),
> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
> +                 SUNXI_FUNCTION(0x2, "s_i2c"),         /* SCK */
> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 8)),  /* PL_EINT8 */
> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 9),
> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
> +                 SUNXI_FUNCTION(0x2, "s_i2c"),         /* SDA */
> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 9)),  /* PL_EINT9 */
> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 10),
> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
> +                 SUNXI_FUNCTION(0x2, "s_pwm"),
> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 10)), /* PL_EINT10 */
> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 11),
> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
> +                 SUNXI_FUNCTION(0x2, "s_cir_rx"),
> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 11)), /* PL_EINT11 */
> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(L, 12),
> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 12)), /* PL_EINT12 */
> +};
> +
> +static const struct sunxi_pinctrl_desc sun50i_a64_r_pinctrl_data = {
> +       .pins = sun50i_a64_r_pins,
> +       .npins = ARRAY_SIZE(sun50i_a64_r_pins),
> +       .pin_base = PL_BASE,
> +       .irq_banks = 1,
> +};
> +
> +static int sun50i_a64_r_pinctrl_probe(struct platform_device *pdev)
> +{
> +       struct reset_control *rstc;
> +       int ret;
> +
> +       rstc = devm_reset_control_get(&pdev->dev, NULL);
> +       if (IS_ERR(rstc)) {
> +               dev_err(&pdev->dev, "Reset controller missing\n");
> +               return PTR_ERR(rstc);
> +       }
> +
> +       ret = reset_control_deassert(rstc);
> +       if (ret)
> +               return ret;
> +
> +       ret = sunxi_pinctrl_init(pdev,
> +                                &sun50i_a64_r_pinctrl_data);
> +
> +       if (ret)
> +               reset_control_assert(rstc);
> +
> +       return ret;
> +}
> +
> +static const struct of_device_id sun50i_a64_r_pinctrl_match[] = {
> +       { .compatible = "allwinner,sun50i-a64-r-pinctrl", },
> +       {}
> +};
> +
> +static struct platform_driver sun50i_a64_r_pinctrl_driver = {
> +       .probe  = sun50i_a64_r_pinctrl_probe,
> +       .driver = {
> +               .name           = "sun50i-a64-r-pinctrl",
> +               .of_match_table = sun50i_a64_r_pinctrl_match,
> +       },
> +};
> +builtin_platform_driver(sun50i_a64_r_pinctrl_driver);
> --
> 2.11.0
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.
