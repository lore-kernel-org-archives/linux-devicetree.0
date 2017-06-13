From: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/2] mfd: max7360: Add mfd core device driver
Date: Tue, 13 Jun 2017 16:41:37 +0300
Message-ID: <be03e994-a914-21fc-fc92-ed40d9e26942@mentor.com>
References: <20170613122051.6061-1-valentin_sitdikov@mentor.com>
 <20170613122051.6061-3-valentin_sitdikov@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170613122051.6061-3-valentin_sitdikov-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Valentin Sitdikov <valentin_sitdikov-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Andrei Dranitca <Andrei_Dranitca-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Valentin,

On 06/13/2017 03:20 PM, Valentin Sitdikov wrote:
> From: Andrei Dranitca <Andrei_Dranitca-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> 
> This patch adds core/irq driver to support MAX7360 i2c chip
> which contains keypad, gpio, pwm, gpo and rotary encoder submodules.
> 
> Signed-off-by: Andrei Dranitca <Andrei_Dranitca-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Valentin Sitdikov <valentin_sitdikov-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/mfd/Kconfig         |  16 +++
>  drivers/mfd/Makefile        |   1 +
>  drivers/mfd/max7360.c       | 291 ++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/max7360.h |  90 ++++++++++++++
>  4 files changed, 398 insertions(+)
>  create mode 100644 drivers/mfd/max7360.c
>  create mode 100644 include/linux/mfd/max7360.h
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 3eb5c93..894c2e9 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -721,6 +721,22 @@ config MFD_MAX8998
>  	  additional drivers must be enabled in order to use the functionality
>  	  of the device.
>  
> +config MFD_MAX7360

Can you consider to move the new section upwards to preserve
alphanumerical order at least locally?

> +	tristate "Maxim Semiconductor MAX7360 support"
> +	depends on I2C && OF
> +	select MFD_CORE
> +	select REGMAP_I2C
> +	select IRQ_DOMAIN
> +	help
> +	  Say yes here to add support for Maxim Semiconductor MAX7360.
> +	  This provides microprocessors with management of up to 64 key switches,
> +	  with an additional eight LED drivers/GPIOs that feature constant-current,
> +	  PWM intensity control, and rotary switch control options.
> +
> +	  This driver provides common support for accessing the device,
> +	  additional drivers must be enabled in order to use the functionality
> +	  of the device.
> +
>  config MFD_MT6397
>  	tristate "MediaTek MT6397 PMIC Support"
>  	select MFD_CORE
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index c16bf1e..9e721c0 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -137,6 +137,7 @@ obj-$(CONFIG_MFD_DA9063)	+= da9063.o
>  obj-$(CONFIG_MFD_DA9150)	+= da9150-core.o
>  
>  obj-$(CONFIG_MFD_MAX14577)	+= max14577.o
> +obj-$(CONFIG_MFD_MAX7360)	+= max7360.o
>  obj-$(CONFIG_MFD_MAX77620)	+= max77620.o
>  obj-$(CONFIG_MFD_MAX77686)	+= max77686.o
>  obj-$(CONFIG_MFD_MAX77693)	+= max77693.o
> diff --git a/drivers/mfd/max7360.c b/drivers/mfd/max7360.c
> new file mode 100644
> index 0000000..d18ea96
> --- /dev/null
> +++ b/drivers/mfd/max7360.c
> @@ -0,0 +1,291 @@
> +/*
> + * Copyright (C) 2017 Mentor Graphics
> + *
> + * Author: Andrei Dranitca <Andrei_Dranitca-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> + * Author: Valentin Sitdikov <Valentin.Sitdikov-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/max7360.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_irq.h>
> +#include <linux/slab.h>

Add <linux/regmap.h> into the list.

> +
> +
> +static const struct mfd_cell max7360_devices[] = {
> +	{
> +		.name           = "max7360-gpio",
> +		.of_compatible	= "maxim,max7360-gpio",
> +	},
> +	{
> +		.name           = "max7360-keypad",
> +		.of_compatible	= "maxim,max7360-keypad",
> +	},
> +	{
> +		.name           = "max7360-pwm",
> +		.of_compatible	= "maxim,max7360-pwm",
> +	},
> +	{
> +		.name           = "max7360-rotary",
> +		.of_compatible	= "maxim,max7360-rotary",
> +	},
> +};

Since the driver depends on OF, you don't need to list the cells.

Consider to replace devm_mfd_add_devices() with devm_of_platform_populate().

> +
> +static irqreturn_t max7360_irq(int irq, void *data)
> +{
> +	struct max7360 *max7360 = data;
> +	int virq;
> +
> +	virq = irq_find_mapping(max7360->domain, MAX7360_INT_GPIO);
> +	handle_nested_irq(virq);
> +	virq = irq_find_mapping(max7360->domain, MAX7360_INT_KEYPAD);
> +	handle_nested_irq(virq);
> +	virq = irq_find_mapping(max7360->domain, MAX7360_INT_ROTARY);
> +	handle_nested_irq(virq);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t max7360_irqi(int irq, void *data)
> +{
> +	struct max7360 *max7360 = data;
> +	int virq;
> +
> +	virq = irq_find_mapping(max7360->domain, MAX7360_INT_GPIO);
> +	handle_nested_irq(virq);
> +	virq = irq_find_mapping(max7360->domain, MAX7360_INT_ROTARY);
> +	handle_nested_irq(virq);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t max7360_irqk(int irq, void *data)
> +{
> +	struct max7360 *max7360 = data;
> +	int virq;
> +
> +	virq = irq_find_mapping(max7360->domain, MAX7360_INT_KEYPAD);
> +	handle_nested_irq(virq);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int max7360_irq_map(struct irq_domain *d, unsigned int virq,
> +			  irq_hw_number_t hwirq)
> +{
> +	struct max7360 *max7360 = d->host_data;
> +
> +	irq_set_chip_data(virq, max7360);
> +	irq_set_chip_and_handler(virq, &dummy_irq_chip,
> +				handle_edge_irq);
> +	irq_set_nested_thread(virq, 1);
> +	irq_set_noprobe(virq);
> +
> +	return 0;
> +}
> +
> +static void max7360_irq_unmap(struct irq_domain *d, unsigned int virq)
> +{
> +	irq_set_chip_and_handler(virq, NULL, NULL);
> +	irq_set_chip_data(virq, NULL);
> +}
> +
> +static const struct irq_domain_ops max7360_irq_ops = {
> +	.map    = max7360_irq_map,
> +	.unmap  = max7360_irq_unmap,
> +	.xlate  = irq_domain_xlate_onecell,
> +};
> +
> +static void max7360_free_irqs(struct max7360 *max7360)
> +{
> +	if (max7360->shared_irq)
> +		free_irq(max7360->shared_irq, max7360);
> +	else {
> +		free_irq(max7360->irq_inti, max7360);
> +		free_irq(max7360->irq_intk, max7360);
> +	}
> +}
> +
> +static int max7360_irq_init(struct max7360 *max7360, struct device_node *np)
> +{
> +	int ret;
> +
> +	max7360->irq_inti = of_irq_get_byname(np, "inti");
> +	if (max7360->irq_inti < 0) {
> +		dev_err(max7360->dev, "no inti provided");
> +		return -ENODEV;
> +	}
> +
> +	max7360->irq_intk = of_irq_get_byname(np, "intk");
> +	if (max7360->irq_intk < 0) {
> +		dev_err(max7360->dev, "no intk provided");
> +		return -ENODEV;
> +	}
> +
> +	if (max7360->irq_inti == max7360->irq_intk) {
> +		/*
> +		 * In case of pin inti and pin intk are the connected
> +		 * to the same soc`s irq pin.
> +		 */
> +		max7360->shared_irq = max7360->irq_inti;
> +		ret = request_threaded_irq(max7360->shared_irq, NULL,
> +					  max7360_irq,
> +					  IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> +					  "max7360", max7360);
> +		if (ret) {
> +			dev_err(max7360->dev, "failed to request IRQ: %d\n",
> +				ret);
> +			return ret;
> +		}
> +	} else {
> +		max7360->shared_irq = 0;
> +		ret = request_threaded_irq(max7360->irq_inti, NULL,
> +					  max7360_irqi,
> +					  IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> +					  "max7360", max7360);
> +		if (ret) {
> +			dev_err(max7360->dev, "failed to request inti IRQ: %d\n",
> +			       ret);
> +			return ret;
> +		}
> +
> +		ret = request_threaded_irq(max7360->irq_intk, NULL,
> +					  max7360_irqk,
> +					  IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> +					  "max7360", max7360);
> +		if (ret) {
> +			free_irq(max7360->irq_inti, max7360);
> +			dev_err(max7360->dev, "failed to request intk IRQ: %d\n",
> +				ret);
> +			return ret;
> +		}
> +	}
> +
> +	max7360->domain = irq_domain_add_simple(np, MAX7360_NR_INTERNAL_IRQS,
> +					       0, &max7360_irq_ops, max7360);
> +
> +	if (!max7360->domain) {
> +		max7360_free_irqs(max7360);
> +		dev_err(max7360->dev, "Failed to create irqdomain\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = irq_create_mapping(max7360->domain, MAX7360_INT_GPIO);
> +	if (!ret) {
> +		max7360_free_irqs(max7360);
> +		dev_err(max7360->dev, "Failed to map GPIO IRQ\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = irq_create_mapping(max7360->domain, MAX7360_INT_KEYPAD);
> +	if (!ret) {
> +		max7360_free_irqs(max7360);
> +		dev_err(max7360->dev, "Failed to map KEYPAD IRQ\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = irq_create_mapping(max7360->domain, MAX7360_INT_ROTARY);
> +	if (!ret) {
> +		max7360_free_irqs(max7360);
> +		dev_err(max7360->dev, "Failed to map ROTARY IRQ\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +static int max7360_device_init(struct max7360 *max7360)
> +{
> +	int ret;
> +
> +	ret = devm_mfd_add_devices(max7360->dev, PLATFORM_DEVID_NONE,
> +			     max7360_devices,
> +			     ARRAY_SIZE(max7360_devices), NULL,
> +			     0, max7360->domain);
> +	if (ret)
> +		dev_err(max7360->dev, "failed to add child devices\n");
> +
> +	return ret;
> +}
> +
> +static const struct regmap_range max7360_volatile_ranges[] = {
> +	{
> +		.range_min = MAX7360_REG_KEYFIFO,
> +		.range_max = MAX7360_REG_KEYFIFO,
> +	}, {
> +		.range_min = MAX7360_REG_GPIOIN,
> +		.range_max = MAX7360_REG_GPIOIN,
> +	},
> +};
> +
> +static const struct regmap_access_table max7360_volatile_table = {
> +	.yes_ranges = max7360_volatile_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(max7360_volatile_ranges),
> +};
> +
> +static const struct regmap_config max7360_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = 0xff,
> +	.volatile_table = &max7360_volatile_table,
> +	.cache_type = REGCACHE_RBTREE,
> +};
> +
> +static int max7360_probe(struct i2c_client *i2c,
> +			const struct i2c_device_id *id)
> +{
> +	struct device_node *np = i2c->dev.of_node;
> +	struct max7360 *max7360;
> +	int ret;
> +
> +	max7360 = devm_kzalloc(&i2c->dev, sizeof(struct max7360),
> +			      GFP_KERNEL);
> +	if (!max7360)
> +		return -ENOMEM;
> +
> +	max7360->dev = &i2c->dev;
> +	max7360->i2c = i2c;
> +
> +	i2c_set_clientdata(i2c, max7360);
> +
> +	max7360->regmap = devm_regmap_init_i2c(i2c, &max7360_regmap_config);

Missing error check.

> +
> +	ret = max7360_irq_init(max7360, np);
> +	if (ret)
> +		return ret;

On driver unload, device removal and error path below a plenty of requested
IRQ resources are leaked.

Also can you evaluate if regmap-irq interface is suitable to be used
within the driver?

> +
> +	ret = max7360_device_init(max7360);
> +	if (ret) {
> +		dev_err(max7360->dev, "failed to add child devices\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id max7360_match[] = {
> +	{ .compatible = "maxim,max7360" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, max7360_match);
> +
> +static struct i2c_driver max7360_driver = {
> +	.driver = {
> +		.name = "max7360",
> +		.of_match_table = max7360_match,
> +	},
> +	.probe = max7360_probe,
> +};
> +builtin_i2c_driver(max7360_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("MAX7360 MFD core driver");
> diff --git a/include/linux/mfd/max7360.h b/include/linux/mfd/max7360.h
> new file mode 100644
> index 0000000..c59941c
> --- /dev/null
> +++ b/include/linux/mfd/max7360.h
> @@ -0,0 +1,90 @@
> +#ifndef __LINUX_MFD_MAX7360_H
> +#define __LINUX_MFD_MAX7360_H
> +#include <linux/regmap.h>
> +
> +#define MAX7360_MAX_KEY_ROWS	8
> +#define MAX7360_MAX_KEY_COLS	8
> +#define MAX7360_MAX_KEY_NUM	(MAX7360_MAX_KEY_ROWS * MAX7360_MAX_KEY_COLS)
> +#define MAX7360_ROW_SHIFT	3
> +
> +#define MAX7360_MAX_GPIO 8
> +#define MAX7360_MAX_GPO 6
> +#define MAX7360_COL_GPO_PINS 8
> +/*
> + * MAX7360 registers
> + */
> +#define MAX7360_REG_KEYFIFO	0x00
> +#define MAX7360_REG_CONFIG	0x01
> +#define MAX7360_REG_DEBOUNCE	0x02
> +#define MAX7360_REG_INTERRUPT	0x03
> +#define MAX7360_REG_PORTS	0x04
> +#define MAX7360_REG_KEYREP	0x05
> +#define MAX7360_REG_SLEEP	0x06
> +
> +/*
> + * MAX7360 registers
> + */
> +#define MAX7360_REG_GPIOCFG	0x40
> +#define MAX7360_REG_GPIOCTRL	0x41
> +#define MAX7360_REG_GPIODEB	0x42
> +#define MAX7360_REG_GPIOCURR	0x43
> +#define MAX7360_REG_GPIOOUTM	0x44
> +#define MAX7360_REG_PWMCOM	0x45
> +#define MAX7360_REG_RTRCFG	0x46
> +#define MAX7360_REG_GPIOIN	0x49
> +#define MAX7360_REG_RTR_CNT	0x4A
> +#define MAX7360_REG_PWMBASE	0x50
> +#define MAX7360_REG_PWMCFG	0x58
> +
> +
> +#define MAX7360_REG_PORTCFGBASE 0x58
> +
> +/*
> + * Configuration register bits
> + */
> +#define MAX7360_CFG_SLEEP	BIT(7)
> +#define MAX7360_CFG_INTERRUPT	BIT(5)
> +#define MAX7360_CFG_KEY_RELEASE	BIT(3)
> +#define MAX7360_CFG_WAKEUP	BIT(1)
> +#define MAX7360_CFG_TIMEOUT	BIT(0)
> +
> +/*
> + * Autosleep register values (ms)
> + */
> +#define MAX7360_AUTOSLEEP_8192	0x01
> +#define MAX7360_AUTOSLEEP_4096	0x02
> +#define MAX7360_AUTOSLEEP_2048	0x03
> +#define MAX7360_AUTOSLEEP_1024	0x04
> +#define MAX7360_AUTOSLEEP_512	0x05
> +#define MAX7360_AUTOSLEEP_256	0x06
> +
> +#define MAX7360_INT_INTI	0
> +#define MAX7360_INT_INTK	1
> +
> +#define MAX7360_INT_GPIO   0
> +#define MAX7360_INT_KEYPAD 1
> +#define MAX7360_INT_ROTARY 2
> +
> +#define MAX7360_NR_INTERNAL_IRQS	3
> +
> +/**
> + * struct max7360
> + * @dev:	Parent device pointer
> + * @i2c:	I2c client pointer
> + * @domain:	Irq domain pointer
> + * @regmap:	Used for I2C communication on accessing registers
> + * @shared_irq:	Irq number if inti and intk pins are connected together
> + * @irq_inti:	Irq number for inti pin
> + * @irq_intk:	Irq number for inik pin
> + */
> +struct max7360 {
> +	struct device		*dev;
> +	struct i2c_client	*i2c;
> +	struct irq_domain	*domain;
> +	struct regmap		*regmap;
> +
> +	int			shared_irq;
> +	int			irq_inti;
> +	int			irq_intk;
> +};

I'd recommend to hide this structure inside the MFD driver, it should
be possible.

> +#endif
> 

--
With best wishes,
Vladimir
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
