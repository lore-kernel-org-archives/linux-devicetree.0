Return-Path: <pebolle@tiscali.nl>
Message-ID: <1435141282.4528.71.camel@tiscali.nl>
Subject: Re: [PATCH 7/9] arm: twr-k70f120m: IOMUX driver for Kinetis SoC
From: Paul Bolle <pebolle@tiscali.nl>
Date: Wed, 24 Jun 2015 12:21:22 +0200
In-Reply-To: <1435094387-20146-8-git-send-email-pawelo@king.net.pl>
References: <1435094387-20146-1-git-send-email-pawelo@king.net.pl>
	 <1435094387-20146-8-git-send-email-pawelo@king.net.pl>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
To: Paul Osmialowski <pawelo@king.net.pl>, Andrew Morton <akpm@linux-foundation.org>, Anson Huang <b20788@freescale.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Bhupesh Sharma <bhupesh.sharma@freescale.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Frank Li <Frank.Li@freescale.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, Haojian Zhuang <haojian.zhuang@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jingchang Lu <jingchang.lu@freescale.com>, Jiri Slaby <jslaby@suse.cz>, Kees Cook <keescook@chromium.org>, Kumar Gala <galak@codeaurora.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <damm+renesas@opensource.se>, Michael Turquette <mturquette@baylibre.com>, Nathan Lynch <nathan_lynch@mentor.com>, Nicolas Pitre <nico@linaro.org>, Maxime Coquelin stm32 <mcoquelin.stm32@gmail.com>, Olof Johansson <olof@lixom.net>, Rob Herring <r.herring@freescale.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Shawn Guo <shawn.guo@linaro.org>, Simon Horman <horms+renesas@verge.net.au>, Stefan Agner <stefan@agner.ch>, Stephen Boyd <sboyd@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, Dave Martin <Dave.Martin@arm.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org
Cc: Yuri Tikhonov <yur@emcraft.com>, Sergei Poselenov <sposelenov@emcraft.com>, Dmitry Cherkassov <d_cherkasov@emcraft.com>, Alexander Potashev <aspotashev@emcraft.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, 2015-06-23 at 23:19 +0200, Paul Osmialowski wrote:
> --- a/drivers/pinctrl/freescale/Kconfig
> +++ b/drivers/pinctrl/freescale/Kconfig
 
> +config PINCTRL_KINETIS
> +	bool "Kinetis pinctrl driver"
> +	depends on OF
> +	depends on SOC_K70
> +	select PINMUX
> +	help
> +	  Say Y here to enable the Kinetis pinctrl driver

> --- a/drivers/pinctrl/freescale/Makefile
> +++ b/drivers/pinctrl/freescale/Makefile

> +obj-$(CONFIG_PINCTRL_KINETIS)	+= pinctrl-kinetis.o

> --- /dev/null
> +++ b/drivers/pinctrl/freescale/pinctrl-kinetis.c

> +#include <linux/module.h>

> +static struct pinctrl_desc kinetis_pinctrl_desc = {
> +	[...]
> +	.owner = THIS_MODULE,
> +};

> +static void __exit kinetis_pinctrl_exit(void)
> +{
> +	platform_driver_unregister(&kinetis_pinctrl_driver);
> +}
> +module_exit(kinetis_pinctrl_exit);
> +
> +MODULE_DESCRIPTION("Freescale Kinetis pinctrl driver");
> +MODULE_LICENSE("GPL v2");

pinctrl-kinetis.o can only be built-in, right? But the code uses a few
module specific constructs. Did you mean to make PINCTRL_KINETIS
tristate instead?

Thanks,


Paul Bolle
