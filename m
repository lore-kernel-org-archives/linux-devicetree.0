From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 1/5] phy: Add a driver for simple phy
Date: Thu, 14 Apr 2016 11:22:58 +0530
Message-ID: <570F303A.6030605@ti.com>
References: <1447708924-15076-1-git-send-email-albeu@free.fr>
 <1447708924-15076-2-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447708924-15076-2-git-send-email-albeu-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Tuesday 17 November 2015 02:52 AM, Alban Bedel wrote:
> This driver is meant to take care of all trivial phys that don't need
> any special configuration, it just enable a regulator, a clock and
> deassert a reset. A public API is also included to allow re-using the
> code in other drivers.
> 
> Signed-off-by: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
> ---
>  drivers/phy/Kconfig        |  12 +++
>  drivers/phy/Makefile       |   1 +
>  drivers/phy/phy-simple.c   | 204 +++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/phy/simple.h |  39 +++++++++
>  4 files changed, 256 insertions(+)
>  create mode 100644 drivers/phy/phy-simple.c
>  create mode 100644 include/linux/phy/simple.h
> 
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 7eb5859d..028fb16 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -118,6 +118,18 @@ config PHY_RCAR_GEN2
>  	help
>  	  Support for USB PHY found on Renesas R-Car generation 2 SoCs.
>  
> +config PHY_SIMPLE
> +	tristate
> +	select GENERIC_PHY
> +	help
> +
> +config PHY_SIMPLE_PDEV

Where will this config be used? Why do we need two configs for a single driver?
> +	tristate "Simple PHY driver"
> +	select PHY_SIMPLE
> +	help
> +	  A PHY driver for simple devices that only need a regulator, clock
> +	  and reset for power up and shutdown.
> +
>  config OMAP_CONTROL_PHY
>  	tristate "OMAP CONTROL PHY Driver"
>  	depends on ARCH_OMAP2PLUS || COMPILE_TEST
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index 075db1a..1a44362 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -24,6 +24,7 @@ obj-$(CONFIG_TWL4030_USB)		+= phy-twl4030-usb.o
>  obj-$(CONFIG_PHY_EXYNOS5250_SATA)	+= phy-exynos5250-sata.o
>  obj-$(CONFIG_PHY_HIX5HD2_SATA)		+= phy-hix5hd2-sata.o
>  obj-$(CONFIG_PHY_MT65XX_USB3)		+= phy-mt65xx-usb3.o
> +obj-$(CONFIG_PHY_SIMPLE)		+= phy-simple.o
>  obj-$(CONFIG_PHY_SUN4I_USB)		+= phy-sun4i-usb.o
>  obj-$(CONFIG_PHY_SUN9I_USB)		+= phy-sun9i-usb.o
>  obj-$(CONFIG_PHY_SAMSUNG_USB2)		+= phy-exynos-usb2.o
> diff --git a/drivers/phy/phy-simple.c b/drivers/phy/phy-simple.c
> new file mode 100644
> index 0000000..013f846
> --- /dev/null
> +++ b/drivers/phy/phy-simple.c
> @@ -0,0 +1,204 @@
> +/*
> + * Copyright (C) 2015 Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/phy/simple.h>
> +#include <linux/clk.h>
> +#include <linux/reset.h>
> +
> +int simple_phy_power_on(struct phy *phy)
> +{
> +	struct simple_phy *sphy = phy_get_drvdata(phy);
> +	int err;
> +
> +	if (sphy->regulator) {
> +		err = regulator_enable(sphy->regulator);
> +		if (err)
> +			return err;
> +	}
> +
> +	if (sphy->clk) {
> +		err = clk_prepare_enable(sphy->clk);
> +		if (err)
> +			goto regulator_disable;
> +	}
> +
> +	if (sphy->reset) {
> +		err = reset_control_deassert(sphy->reset);
> +		if (err)
> +			goto clock_disable;
> +	}
> +
> +	return 0;
> +
> +clock_disable:
> +	if (sphy->clk)
> +		clk_disable_unprepare(sphy->clk);
> +regulator_disable:
> +	if (sphy->regulator)
> +		WARN_ON(regulator_disable(sphy->regulator));
> +
> +	return err;
> +}
> +EXPORT_SYMBOL_GPL(simple_phy_power_on);

IMO simple-phy driver should be an independent driver and shouldn't export
symbols. The dt binding for the simple phy device should be something like
below where all the properties of the simple phy device should be in the
binding documentation.
usbphy {
	compatible = "simple-phy";
	phy-supply = <&supply>;
	clocks = <&clock>;
	reset = <&reset>;
};

Anything that needs more than this shouldn't be a simple phy.

Thanks
Kishon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
