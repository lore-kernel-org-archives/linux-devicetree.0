From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH anybus v1 1/4] mfd: support the Arcx anybus bridge.
Date: Wed, 24 Oct 2018 08:58:45 -0700
Message-ID: <06aad868-58d7-7e4b-44a2-9272e79989db@infradead.org>
References: <20181024142456.10084-1-svendev@arcx.com>
 <20181024142456.10084-2-svendev@arcx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181024142456.10084-2-svendev@arcx.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sven Van Asbroeck <svendev@arcx.com>, lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, afaerber@suse.de, treding@nvidia.com, david@lechnology.com, noralf@tronnes.org, johan@kernel.org, monstr@monstr.eu, michal.vokac@ysoft.com, arnd@arndb.de, gregkh@linuxfoundation.org, john.garry@huawei.com, andriy.shevchenko@linux.intel.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, yuanzhichang@hisilicon.com, stuyoder@gmail.com, linus.walleij@linaro.org, maxime.ripard@bootlin.com, bogdan.purcareata@nxp.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi-

On 10/24/18 7:24 AM, Sven Van Asbroeck wrote:
> Add a driver for the Arcx anybus bridge.
> 
> This chip embeds up to two Anybus-S application connectors
> (slots), and connects to the SoC via the i.MX parallel WEIM bus.
> There is also a CAN power readout, unrelated to the anybus.
> 
> Signed-off-by: Sven Van Asbroeck <svendev@arcx.com>
> ---
>  drivers/mfd/Kconfig          |  11 +
>  drivers/mfd/Makefile         |   1 +
>  drivers/mfd/anybus-bridge.c  | 441 +++++++++++++++++++++++++++++++++++
>  include/linux/anybuss-host.h |  28 +++
>  4 files changed, 481 insertions(+)
>  create mode 100644 drivers/mfd/anybus-bridge.c
>  create mode 100644 include/linux/anybuss-host.h
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 11841f4b7b2b..49b9de71cb16 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -125,6 +125,17 @@ config MFD_ATMEL_SMC
>  	bool
>  	select MFD_SYSCON
>  
> +config MFD_ANYBUS_BRIDGE
> +	tristate "Arcx Anybus-S Bridge"
> +	select MFD_CORE
> +	select REGMAP
> +	depends on OF
> +	help
> +	  Select this to get support for the Arcx Anybus bridge.
> +	  It is accessible via the i.MX parallel WEIM bus, and
> +	  embeds up to two Anybus-S application connectors (slots).
> +	  There is also a CAN power readout, unrelated to the anybus.

	                                                      Anybus.

> +
>  config MFD_BCM590XX
>  	tristate "Broadcom BCM590xx PMUs"
>  	select MFD_CORE

> diff --git a/drivers/mfd/anybus-bridge.c b/drivers/mfd/anybus-bridge.c
> new file mode 100644
> index 000000000000..f6eda5b2b6e8
> --- /dev/null
> +++ b/drivers/mfd/anybus-bridge.c
> @@ -0,0 +1,441 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Arcx Anybus Bridge driver
> + *
> + * Copyright (C) 2018 Arcx Inc
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/slab.h>
> +#include <linux/platform_device.h>
> +#include <linux/gpio.h>
> +#include <linux/of_gpio.h>
> +#include <linux/of_address.h>
> +#include <linux/pwm.h>
> +#include <linux/mfd/core.h>
> +#include <linux/of_irq.h>
> +#include <linux/delay.h>
> +#include <linux/regmap.h>
> +#include <linux/idr.h>
> +#include <linux/spinlock.h>
> +
> +#include <linux/anybuss-host.h>
> +

[snip]

> +
> +static struct regmap *create_weim_regmap(struct device *dev,
> +			struct resource *res, int slot)
> +{
> +	struct regmap_config regmap_cfg = {
> +		.reg_bits = 11,
> +		.val_bits = 8,
> +		/* bus accesses are simple weim byte accesses.

		                           WEIM

> +		 * they don't require any synchronization.
> +		 * also, the bus driver requirement is that regmap accesses
> +		 * must never sleep.
> +		 */

Kernel multi-line comment style (except in networking code) is like:
		/*
		 * bus accesses are ...
		 * must never sleep.
		 */

> +		.disable_locking = true,
> +		.reg_read = read_reg_weim,
> +		.reg_write = write_reg_weim,
> +	};
> +	void __iomem *base;
> +	char name[32];
> +
> +	if (resource_size(res) < (1<<regmap_cfg.reg_bits))
> +		return ERR_PTR(-EINVAL);
> +	base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(base))
> +		return (struct regmap *)base;
> +	/* give the regmap a name, so it shows up in debugfs */
> +	snprintf(name, sizeof(name), "slot%d", slot);
> +	regmap_cfg.name = devm_kmemdup(dev, name, sizeof(name), GFP_KERNEL);
> +	if (regmap_cfg.name == NULL)
> +		return ERR_PTR(-ENOMEM);
> +	return devm_regmap_init(dev, NULL, base, &regmap_cfg);
> +}
> +
> +static int add_anybus_slot(struct device *dev, anybuss_reset_t reset,
> +				int slot)
> +{
> +	int err, irq;
> +	struct resource mem_res, *irq_res;
> +	struct mfd_cell *cell;
> +	struct anybuss_host_pdata *pdata;
> +	struct gpio_desc *gpio;
> +	struct regmap *regmap;
> +
> +	/* get irq from devicetree */
> +	gpio = devm_gpiod_get_index(dev, "irq", slot, GPIOD_IN);
> +	if (IS_ERR(gpio))
> +		return PTR_ERR(gpio);
> +	irq = gpiod_to_irq(gpio);
> +	if (irq < 0) {
> +		dev_err(dev, "Anybus-S slot %d: no irq?", slot);
> +		return -EINVAL;
> +	}
> +	/* get anybus mem resource from devicetree
> +	 * note that the cpld registers sit at dt offset 0
> +	 * anybus slot memory starts at offset 1
> +	 */

comment style.

> +	err = of_address_to_resource(dev->of_node, slot+1, &mem_res);
> +	if (err) {
> +		dev_err(dev, "Anybus-S slot %d: no weim memory?", slot);
> +		return err;
> +	}
> +	regmap = create_weim_regmap(dev, &mem_res, slot);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +	/* add slot as a mfd device */
> +	irq_res = devm_kzalloc(dev, sizeof(*irq_res), GFP_KERNEL);
> +	if (!irq_res)
> +		return -ENOMEM;
> +	irq_res->start = irq_res->end = irq;
> +	irq_res->flags = IORESOURCE_IRQ;
> +	irq_res->name = "anybus-irq";
> +	cell = devm_kzalloc(dev, sizeof(*cell), GFP_KERNEL);
> +	if (!cell)
> +		return -ENOMEM;
> +	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
> +	if (!pdata)
> +		return -ENOMEM;
> +	pdata->reset = reset;
> +	pdata->regmap = regmap;
> +	cell->name = "anybuss-host";
> +	cell->num_resources = 1;
> +	cell->resources = irq_res;
> +	cell->platform_data = pdata;
> +	cell->pdata_size = sizeof(*pdata);
> +	dev_info(dev, "Anybus-S slot %d: [weim 0x%016x-0x%016x] [irq %d]",
> +		slot, mem_res.start, mem_res.end, irq);
> +	err = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, cell, 1,
> +						NULL, 0, NULL);
> +	if (err)
> +		dev_err(dev, "failed to add Anybus-S slot %d", slot);
> +	return err;
> +}
> +
> +static int add_anybus_slots(struct device *dev, struct device_node *np,
> +				anybuss_reset_t *resets)
> +{
> +	int i, err;
> +
> +	/* bridge has two Anybus-S slots */
> +	for (i = 0; i < 2; i++) {
> +		err = add_anybus_slot(dev, resets[i], i);
> +		if (err)
> +			return err;
> +	}
> +	return 0;
> +}
> +
> +static void do_reset(struct device *dev, u8 rst_bit, bool reset)
> +{
> +	unsigned long flags;
> +	struct bridge_priv *cd = dev_get_drvdata(dev);
> +
> +	spin_lock_irqsave(&cd->regs_lock, flags);
> +	/* CPLD_CONTROL is write-only, so cache its value in
> +	 * cd->control_reg
> +	 */

comment style.

> +	if (reset)
> +		cd->control_reg &= ~rst_bit;
> +	else
> +		cd->control_reg |= rst_bit;
> +	writeb(cd->control_reg, cd->cpld_base + CPLD_CONTROL);
> +	/* h/w work-around:
> +	 * EIM bus is 'too fast', so a reset followed by an immediate
> +	 * not-reset will _not_ change the anybus reset line in any way,
> +	 * losing the reset. to prevent this from happening, introduce
> +	 * a minimum reset duration.
> +	 * Verified minimum safe duration required using a scope
> +	 * on 14-June-2018: 100 us.
> +	 */

comment style.

> +	if (reset)
> +		udelay(100);
> +	spin_unlock_irqrestore(&cd->regs_lock, flags);
> +}
> +

> diff --git a/include/linux/anybuss-host.h b/include/linux/anybuss-host.h
> new file mode 100644
> index 000000000000..38037833acd4
> --- /dev/null
> +++ b/include/linux/anybuss-host.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Anybus-S host adapter definitions
> + *
> + * Copyright 2018 Arcx Inc
> + */
> +
> +#ifndef __LINUX_ANYBUSS_HOST_H__
> +#define __LINUX_ANYBUSS_HOST_H__
> +
> +#include <linux/regmap.h>
> +
> +typedef void (*anybuss_reset_t)(struct device *dev, bool reset);
> +
> +/**
> + * Platform data of the Anybus-S host controller.

    * struct anybuss_host_pdata - Platform data of the Anybus-S host controller.

to convert this comment block to kernel-doc notation.

> + *
> + * @regmap: provides access to the card dpram.
> + *		MUST NOT use caching
> + *		MUST NOT sleep
> + * @reset:  controls the card reset line.
> + */> +struct anybuss_host_pdata {
> +	struct regmap *regmap;
> +	anybuss_reset_t reset;
> +};
> +
> +#endif /* __LINUX_ANYBUS_S_HOST_H__ */
> 


-- 
~Randy
