From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: memory: da8xx-ddrctl: new driver
Date: Tue, 18 Oct 2016 23:45:39 +0300
Message-ID: <5932848.mWNUo4iXtK@avalon>
References: <1476721850-454-1-git-send-email-bgolaszewski@baylibre.com> <1476721850-454-2-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1476721850-454-2-git-send-email-bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-soc <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-drm <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Bartosz,

Thank you for the patch.

On Monday 17 Oct 2016 18:30:48 Bartosz Golaszewski wrote:
> Create a new driver for the da8xx DDR2/mDDR controller and implement
> support for writing to the Peripheral Bus Burst Priority Register.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>  .../memory-controllers/ti-da8xx-ddrctl.txt         | 25 +++++++
>  drivers/memory/Kconfig                             |  8 +++
>  drivers/memory/Makefile                            |  1 +
>  drivers/memory/da8xx-ddrctl.c                      | 77 +++++++++++++++++++
>  4 files changed, 111 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/memory-controllers/ti-da8xx-ddrctl.txt
> create mode 100644 drivers/memory/da8xx-ddrctl.c
> 
> diff --git
> a/Documentation/devicetree/bindings/memory-controllers/ti-da8xx-ddrctl.txt
> b/Documentation/devicetree/bindings/memory-controllers/ti-da8xx-ddrctl.txt
> new file mode 100644
> index 0000000..e340404
> --- /dev/null
> +++
> b/Documentation/devicetree/bindings/memory-controllers/ti-da8xx-ddrctl.txt
> @@ -0,0 +1,25 @@
> +* Device tree bindings for Texas Instruments da8xx DDR2/mDDR memory
> controller
> +
> +The DDR2/mDDR memory controller present on Texas Instruments da8xx SoCs
> memory
> +maps a set of registers which allow to tweak the controller's behavior.
> +
> +Documentation:
> +OMAP-L138 (DA850) - http://www.ti.com/lit/ug/spruh82c/spruh82c.pdf
> +
> +Required properties:
> +
> +- compatible:		"ti,da850-ddrctl"

Don't you need a reg property ?

> +Optional properties:
> +
> +- ti,pr-old-count:	Priority raise old counter. Specifies the number of
> +			memory transfers after which the DDR2/mDDR memory
> +			controller will elevate the priority of the oldest
> +			command in the command FIFO. Must be between 0-255.

Isn't this a system configuration more than a hardware description ?

> +Example for da850 shown below.
> +
> +ddrctl {
> +	compatible = "ti,da850-ddrctl";
> +	ti,pr-old-count = <0x20>;
> +};
> diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
> index 4b4c0c3..ec80e35 100644
> --- a/drivers/memory/Kconfig
> +++ b/drivers/memory/Kconfig
> @@ -134,6 +134,14 @@ config MTK_SMI
>  	  mainly help enable/disable iommu and control the power domain and
>  	  clocks for each local arbiter.
> 
> +config DA8XX_DDRCTL
> +	bool "Texas Instruments da8xx DDR2/mDDR driver"
> +	depends on ARCH_DAVINCI_DA8XX
> +	help
> +	  This driver is for the DDR2/mDDR Memory Controller present on
> +	  Texas Instruments da8xx SoCs. It's used to tweak various memory
> +	  controller configuration options.
> +
>  source "drivers/memory/samsung/Kconfig"
>  source "drivers/memory/tegra/Kconfig"
> 
> diff --git a/drivers/memory/Makefile b/drivers/memory/Makefile
> index b20ae38..e88097fb 100644
> --- a/drivers/memory/Makefile
> +++ b/drivers/memory/Makefile
> @@ -17,6 +17,7 @@ obj-$(CONFIG_MVEBU_DEVBUS)	+= mvebu-devbus.o
>  obj-$(CONFIG_TEGRA20_MC)	+= tegra20-mc.o
>  obj-$(CONFIG_JZ4780_NEMC)	+= jz4780-nemc.o
>  obj-$(CONFIG_MTK_SMI)		+= mtk-smi.o
> +obj-$(CONFIG_DA8XX_DDRCTL)	+= da8xx-ddrctl.o
> 
>  obj-$(CONFIG_SAMSUNG_MC)	+= samsung/
>  obj-$(CONFIG_TEGRA_MC)		+= tegra/
> diff --git a/drivers/memory/da8xx-ddrctl.c b/drivers/memory/da8xx-ddrctl.c
> new file mode 100644
> index 0000000..dcd0a61
> --- /dev/null
> +++ b/drivers/memory/da8xx-ddrctl.c
> @@ -0,0 +1,77 @@
> +/*
> + * TI da8xx DDR2/mDDR controller driver
> + *
> + * Copyright (C) 2016 BayLibre SAS
> + *
> + * Author:
> + *   Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/io.h>
> +
> +#define DA8XX_DDR_CTL_BASE	0xB0000000
> +#define DA8XX_PBBPR_OFFSET	0x00000020
> +#define DA8XX_PBBPR_REG(p)	((p) + DA8XX_PBBPR_OFFSET)
> +
> +#define DA8XX_PBBPR_MAX		0xff
> +
> +static void da8xx_ddrctl_set_pbbpr(void __iomem *ddrctl, struct device
> *dev) +{
> +	struct device_node *node = dev->of_node;
> +	u32 pr_old_count;
> +	int ret;
> +
> +	ret = of_property_read_u32(node, "ti,pr-old-count", &pr_old_count);
> +	if (ret)
> +		return;
> +
> +	if (pr_old_count > DA8XX_PBBPR_MAX) {
> +		dev_warn(dev, "priority raise old counter value too high\n");
> +		return;
> +	}
> +
> +	__raw_writel(pr_old_count, DA8XX_PBBPR_REG(ddrctl));
> +}
> +
> +static int da8xx_ddrctl_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	void __iomem *ddrctl;
> +
> +	ddrctl = ioremap(DA8XX_DDR_CTL_BASE, SZ_256);
> +	if (!ddrctl) {
> +		dev_err(dev, "unable to map memory controller registers\n");
> +		return -EIO;
> +	}
> +
> +	da8xx_ddrctl_set_pbbpr(ddrctl, dev);
> +
> +	iounmap(ddrctl);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id da8xx_ddrctl_of_match[] = {
> +	{ .compatible = "ti,da850-ddrctl", },
> +	{ },
> +};
> +
> +static struct platform_driver da8xx_ddrctl_driver = {
> +	.probe = da8xx_ddrctl_probe,
> +	.driver = {
> +		.name = "da8xx-ddrctl",
> +		.of_match_table = da8xx_ddrctl_of_match,
> +	},
> +};
> +module_platform_driver(da8xx_ddrctl_driver);
> +
> +MODULE_AUTHOR("Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>");
> +MODULE_DESCRIPTION("TI da8xx DDR2/mDDR controller driver");
> +MODULE_LICENSE("GPL v2");

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
