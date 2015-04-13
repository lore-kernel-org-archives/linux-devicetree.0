From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH v6 2/2] memory: pl353: Add driver for arm pl353 static
 memory controller
Date: Mon, 13 Apr 2015 20:49:16 +0200
Message-ID: <1428950956.3868.16.camel@x220>
References: <1428941512-26411-1-git-send-email-punnaia@xilinx.com>
	 <a1f437fe-51cf-4a89-87b4-8f0a305e68ed@BN1AFFO11FD026.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <a1f437fe-51cf-4a89-87b4-8f0a305e68ed@BN1AFFO11FD026.protection.gbl>
Sender: linux-doc-owner@vger.kernel.org
To: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, michal.simek@xilinx.com, grant.likely@linaro.org, gregkh@linuxfoundation.org, jason@lakedaemon.net, ezequiel.garcia@free-electrons.com, arnd@arndb.de, dwmw2@infradead.org, computersforpeace@gmail.com, artem.bityutskiy@linux.intel.com, jussi.kivilinna@iki.fi, acourbot@nvidia.com, ivan.khoronzhuk@ti.com, joern@logfs.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, kpc528@gmail.com, kalluripunnaiahchoudary@gmail.com, Punnaiah Choudary Kalluri <punnaia@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Mon, 2015-04-13 at 21:41 +0530, Punnaiah Choudary Kalluri wrote:
> --- a/drivers/memory/Kconfig
> +++ b/drivers/memory/Kconfig

> +config PL353_SMC
> +	bool "ARM PL353 Static Memory Controller (SMC) driver"
> +	depends on ARM
> +	help
> +	  This driver is for the ARM PL353 Static Memory Controller (SMC)
> +	  module.

This adds a bool symbol.

> --- a/drivers/memory/Makefile
> +++ b/drivers/memory/Makefile

> +obj-$(CONFIG_PL353_SMC)		+= pl353-smc.o

Which means pl353-smc.o can never be part of a module, right?

(If that's not right you can stop reading here.)

> --- /dev/null
> +++ b/drivers/memory/pl353-smc.c

> + * This program is free software: you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation, either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.

This states the license is GPL v2 or later.

> +#include <linux/module.h>

I wonder whether this include is needed, since this is built-in only
code.

> +MODULE_DEVICE_TABLE(of, pl353_smc_of_match);

According to include/linux/module.h this will be preprocessed away for
built-in code.

> +static struct platform_driver pl353_smc_driver = {
> +	.probe		= pl353_smc_probe,
> +	.remove		= pl353_smc_remove,
> +	.driver		= {
> +		.name	= "pl353-smc",
> +		.owner	= THIS_MODULE,

THIS_MODULE will be equivalent to NULL for built-in code, according to
include/linux/export.h.

> +		.pm	= &pl353_smc_dev_pm_ops,
> +		.of_match_table = pl353_smc_of_match,
> +	},
> +};

> +module_platform_driver(pl353_smc_driver);

Speaking from memory: for built-in only code this is equivalent to
having a wrapper that only does
    register_platform_driver(&pl353_smc_driver);

and mark that wrapper with device_initcall().

> +MODULE_AUTHOR("Xilinx, Inc.");
> +MODULE_DESCRIPTION("ARM PL353 SMC Driver");
> +MODULE_LICENSE("GPL v2");

For built-in only code these macros will be effectively preprocessed
away.

(Would you make PL353_SMC a tristate symbol then you should note that
according to include/linux/module.h "GPL" is the license ident that
matches the license stated in the comment at the top of this file.)

Thanks,


Paul Bolle

