From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 2/8] drivers: pinctrl: add driver for
 Allwinner A64 SoC
Date: Thu, 18 Feb 2016 09:28:13 -0800
Message-ID: <CAGb2v67UkRv86rUMfY9u+szv7CKAK9wh8kfoqWh8XUCkifjjUQ@mail.gmail.com>
References: <1455709440-8668-1-git-send-email-andre.przywara@arm.com> <1455709440-8668-3-git-send-email-andre.przywara@arm.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBRH6S63AKGQECKJZ25Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1455709440-8668-3-git-send-email-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Feb 17, 2016 at 3:43 AM, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org> wrote:
> Based on the Allwinner A64 user manual and on the previous sunxi
> pinctrl drivers this introduces the pin multiplex assignments for
> the ARMv8 Allwinner A64 SoC.
> Port A is apparently used for the fixed function DRAM controller, so
> the ports start at B here (the manual mentions "n from 1 to 7", so
> not starting at 0).
>
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> ---
>  .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |   1 +
>  arch/arm64/Kconfig.platforms                       |   1 +
>  drivers/pinctrl/sunxi/Kconfig                      |   4 +
>  drivers/pinctrl/sunxi/Makefile                     |   1 +
>  drivers/pinctrl/sunxi/pinctrl-sun50i-a64.c         | 606 +++++++++++++++++++++
>  5 files changed, 613 insertions(+)
>  create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun50i-a64.c
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
> index 9213b27..08b2361 100644
> --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
> @@ -21,6 +21,7 @@ Required properties:
>    "allwinner,sun9i-a80-r-pinctrl"
>    "allwinner,sun8i-a83t-pinctrl"
>    "allwinner,sun8i-h3-pinctrl"
> +  "allwinner,sun50i-a64-pinctrl"
>
>  - reg: Should contain the register physical address and length for the
>    pin controller.
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 2f7f69b..d15c532 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -2,6 +2,7 @@ menu "Platform selection"
>
>  config ARCH_SUNXI
>         bool "Allwinner sunxi 64-bit SoC Family"
> +       select PINCTRL_SUN50I_A64
>         help
>           This enables support for Allwinner sunxi based SoCs like the A64.
>
> diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
> index 1868b82..aaf075b 100644
> --- a/drivers/pinctrl/sunxi/Kconfig
> +++ b/drivers/pinctrl/sunxi/Kconfig
> @@ -68,4 +68,8 @@ config PINCTRL_SUN9I_A80_R
>         depends on RESET_CONTROLLER
>         select PINCTRL_SUNXI
>
> +config PINCTRL_SUN50I_A64
> +       bool
> +       select PINCTRL_SUNXI
> +
>  endif
> diff --git a/drivers/pinctrl/sunxi/Makefile b/drivers/pinctrl/sunxi/Makefile
> index f22de0e..2d8b64e 100644
> --- a/drivers/pinctrl/sunxi/Makefile
> +++ b/drivers/pinctrl/sunxi/Makefile
> @@ -12,6 +12,7 @@ obj-$(CONFIG_PINCTRL_SUN7I_A20)               += pinctrl-sun7i-a20.o
>  obj-$(CONFIG_PINCTRL_SUN8I_A23)                += pinctrl-sun8i-a23.o
>  obj-$(CONFIG_PINCTRL_SUN8I_A23_R)      += pinctrl-sun8i-a23-r.o
>  obj-$(CONFIG_PINCTRL_SUN8I_A33)                += pinctrl-sun8i-a33.o
> +obj-$(CONFIG_PINCTRL_SUN50I_A64)       += pinctrl-sun50i-a64.o
>  obj-$(CONFIG_PINCTRL_SUN8I_A83T)       += pinctrl-sun8i-a83t.o
>  obj-$(CONFIG_PINCTRL_SUN8I_H3)         += pinctrl-sun8i-h3.o
>  obj-$(CONFIG_PINCTRL_SUN8I_H3_R)       += pinctrl-sun8i-h3-r.o
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a64.c b/drivers/pinctrl/sunxi/pinctrl-sun50i-a64.c
> new file mode 100644
> index 0000000..20bd15b
> --- /dev/null
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a64.c
> @@ -0,0 +1,606 @@
> +/*
> + * Allwinner A64 SoCs pinctrl driver.
> + *
> + * Copyright (C) 2016 - ARM Ltd.
> + * Author: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> + *
> + * Based on pinctrl-sun7i-a20.c, which is:
> + * Copyright (C) 2014 Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> + *
> + * This file is licensed under the terms of the GNU General Public
> + * License version 2.  This program is licensed "as is" without any
> + * warranty of any kind, whether express or implied.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/pinctrl/pinctrl.h>
> +
> +#include "pinctrl-sunxi.h"
> +
> +static const struct sunxi_desc_pin a64_pins[] = {

[...]

> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 8),
> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
> +                 SUNXI_FUNCTION(0x2, "owa"),           /* OUT */

This is better known as spdif.

> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 8)),  /* EINT8 */
> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 9),
> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 9)),  /* EINT9 */
> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 10),
> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
> +                 SUNXI_FUNCTION(0x2, "mic"),           /* CLK */
> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 10)), /* EINT10 */
> +       SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 11),
> +                 SUNXI_FUNCTION(0x0, "gpio_in"),
> +                 SUNXI_FUNCTION(0x1, "gpio_out"),
> +                 SUNXI_FUNCTION(0x2, "mic"),           /* DATA */
> +                 SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 11)), /* EINT11 */
> +};
> +
> +static const struct sunxi_pinctrl_desc a64_pinctrl_data = {
> +       .pins = a64_pins,
> +       .npins = ARRAY_SIZE(a64_pins),
> +       .irq_banks = 3,
> +};
> +
> +static int a64_pinctrl_probe(struct platform_device *pdev)
> +{
> +       return sunxi_pinctrl_init(pdev,
> +                                 &a64_pinctrl_data);
> +}
> +
> +static const struct of_device_id a64_pinctrl_match[] = {
> +       { .compatible = "allwinner,sun50i-a64-pinctrl", },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, a64_pinctrl_match);
> +
> +static struct platform_driver a64_pinctrl_driver = {
> +       .probe  = a64_pinctrl_probe,
> +       .driver = {
> +               .name           = "sun50i-a64-pinctrl",
> +               .of_match_table = a64_pinctrl_match,
> +       },
> +};
> +module_platform_driver(a64_pinctrl_driver);

Since the Kconfig symbol is bool, you could probably use
builtin_platform_driver and drop MODULE_*.

Regards
ChenYu

> +
> +MODULE_AUTHOR("Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>");
> +MODULE_DESCRIPTION("Allwinner A64 pinctrl driver");
> +MODULE_LICENSE("GPL");
> --
> 2.6.4
>
