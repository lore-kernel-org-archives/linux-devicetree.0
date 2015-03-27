From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH v2 1/2] pinctrl: Add driver for Alphascale asm9260
 pinctrl
Date: Fri, 27 Mar 2015 18:10:43 +0100
Message-ID: <1427476243.2334.12.camel@x220>
References: <CACRpkdbKLkMB6WP0zp2xN+gM4ytvs=3V5hh8uKt8e=YE4gAAqQ@mail.gmail.com>
	 <1427448973-665-1-git-send-email-linux@rempel-privat.de>
	 <1427448973-665-2-git-send-email-linux@rempel-privat.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1427448973-665-2-git-send-email-linux@rempel-privat.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Oleksij Rempel <linux@rempel-privat.de>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds a mismatch between the Kconfig symbol (bool) and the
code (which assumes a modular built too).

On Fri, 2015-03-27 at 10:36 +0100, Oleksij Rempel wrote:
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -47,6 +47,14 @@ config PINCTRL_AS3722
>  	  open drain configuration for the GPIO pins of AS3722 devices. It also
>  	  supports the GPIO functionality through gpiolib.
>  
> +config PINCTRL_ASM9260
> +	bool "Pinctrl driver for Alphascale asm9260"

This adds a bool symbol.

> +	depends on MACH_ASM9260
> +	select PINMUX
> +	select GENERIC_PINCONF
> +	help
> +	  Say Y here to enable the Alphascale asm9260 pinctrl driver
> +

> -- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile

> +obj-$(CONFIG_PINCTRL_ASM9260)	+= pinctrl-asm9260.o

So this object can now only be built-in.

> --- /dev/null
> +++ b/drivers/pinctrl/pinctrl-asm9260.c
> @@ -0,0 +1,733 @@
> +/*
> + * Pinctrl driver for the Alphascale ASM9260 SoC
> + *
> + * Copyright (c) 2014, Oleksij Rempel <linux@rempel-privat.de>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/module.h>

This include is probably not needed.

> +#include <linux/pinctrl/pinconf-generic.h>
> +#include <linux/pinctrl/pinmux.h>
> +#include <linux/platform_device.h>
> +
> +#include "core.h"
> +#include "pinctrl-utils.h"

> +/*
> + * Pin control driver setup
> + */
> +static struct pinctrl_desc asm9260_pinctrl_desc = {
> +	.pctlops	= &asm9260_pinctrl_ops,
> +	.pmxops		= &asm9260_pinmux_ops,
> +	.confops	= &asm9260_pinconf_ops,
> +	.owner		= THIS_MODULE,

THIS_MODULE is, basically, equivalent to NULL for built-in code.

> +};
> +

> +MODULE_DEVICE_TABLE(of, asm9260_pinctrl_of_match);

This will be preprocessed away for built-in code.

> +module_platform_driver(asm9260_pinctrl_driver);

The built-in equivalent of this seems to be a wrapper that
only does
    platform_driver_register(&asm9260_pinctrl_driver);

and mark that wrapper as a device_initcall(). There appears to be no
macro that does all that in one line.

> +MODULE_AUTHOR("Oleksij Rempel <linux@rempel-privat.de>");
> +MODULE_DESCRIPTION("Alphascale ASM9260 pinctrl driver");
> +MODULE_LICENSE("GPL");

These three macros will be, effectively, preprocessed away for built-in
code. (By the way, you probably want to use "GPL v2" as the license
ident if it would be possible to build this code modular.)


Paul Bolle
