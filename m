From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH 2/2] memory: jz4780-nemc: driver for the NEMC on JZ4780
 SoCs
Date: Thu, 05 Mar 2015 20:26:42 +0100
Message-ID: <1425583602.24292.234.camel@x220>
References: <1425574915-50308-1-git-send-email-Zubair.Kakakhel@imgtec.com>
	 <1425574915-50308-3-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425574915-50308-3-git-send-email-Zubair.Kakakhel@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 2015-03-05 at 17:01 +0000, Zubair Lutfullah Kakakhel wrote:
> --- a/drivers/memory/Kconfig
> +++ b/drivers/memory/Kconfig
> @@ -83,6 +83,15 @@ config FSL_IFC
>  	bool
>  	depends on FSL_SOC
>  
> +config JZ4780_NEMC
> +	bool "Ingenic JZ4780 SoC NEMC driver"

A bool Kconfig symbol.

> +	default y
> +	depends on MACH_JZ4780
> +	help
> +	  This driver is for the NAND/External Memory Controller (NEMC) in
> +	  the Ingenic JZ4780. This controller is used to handle external
> +	  memory devices such as NAND and SRAM.
> +
>  source "drivers/memory/tegra/Kconfig"
>  
>  endif
> diff --git a/drivers/memory/Makefile b/drivers/memory/Makefile
> index 6b65481..b670441 100644
> --- a/drivers/memory/Makefile
> +++ b/drivers/memory/Makefile
> @@ -13,5 +13,6 @@ obj-$(CONFIG_FSL_CORENET_CF)	+= fsl-corenet-cf.o
>  obj-$(CONFIG_FSL_IFC)		+= fsl_ifc.o
>  obj-$(CONFIG_MVEBU_DEVBUS)	+= mvebu-devbus.o
>  obj-$(CONFIG_TEGRA20_MC)	+= tegra20-mc.o
> +obj-$(CONFIG_JZ4780_NEMC)	+= jz4780-nemc.o

So jz4780-nemc.o will never be part of a module.
 
>  obj-$(CONFIG_TEGRA_MC)		+= tegra/
> diff --git a/drivers/memory/jz4780-nemc.c b/drivers/memory/jz4780-nemc.c
> new file mode 100644
> index 0000000..370dc7b
> --- /dev/null
> +++ b/drivers/memory/jz4780-nemc.c
> @@ -0,0 +1,405 @@
> +/*
> + * JZ4780 NAND/external memory controller (NEMC)
> + *
> + * Copyright (c) 2015 Imagination Technologies
> + * Author: Alex Smith <alex@alex-smith.me.uk>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation;  either version 2 of the  License, or (at your
> + * option) any later version.
> + */

> +#include <linux/module.h>

This is, I think, a red flag.

> +MODULE_DEVICE_TABLE(of, jz4780_nemc_dt_match);

This will be preprocessed away.

> +static struct platform_driver jz4780_nemc_driver = {
> +	.probe		= jz4780_nemc_probe,
> +	.remove		= jz4780_nemc_remove,
> +	.driver	= {
> +		.name	= "jz4780-nemc",
> +		.owner	= THIS_MODULE,

.owner will, basically, be NULL.

> +		.of_match_table = of_match_ptr(jz4780_nemc_dt_match),
> +	},
> +};
> +
> +static int __init jz4780_nemc_init(void)
> +{
> +	return platform_driver_register(&jz4780_nemc_driver);
> +}
> +subsys_initcall(jz4780_nemc_init);

subsys_initcall() suggests, I guess, you don't actually expect this to
be modular.

> +static void __exit jz4780_nemc_exit(void)
> +{
> +	platform_driver_unregister(&jz4780_nemc_driver);
> +}
> +module_exit(jz4780_nemc_exit);

This will never be called.

> +MODULE_AUTHOR("Alex Smith <alex@alex-smith.me.uk>");
> +MODULE_DESCRIPTION("Ingenic JZ4780 NEMC driver");
> +MODULE_LICENSE("GPL v2");

These macros will be, effectively, preprocessed away.

And, by the way, "GPL v2" is at odds with the license in the comment
quoted above.

Thanks,


Paul Bolle
