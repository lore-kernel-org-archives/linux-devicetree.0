From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH 2/3] mfd: tps65912: Rewrite driver adding DT support and
 using regmap
Date: Mon, 21 Sep 2015 13:22:32 -0500
Message-ID: <56004AE8.5030504@ti.com>
References: <1442339861-30300-1-git-send-email-afd@ti.com>
 <1442339861-30300-3-git-send-email-afd@ti.com> <20150920041644.GF3039@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150920041644.GF3039@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09/19/2015 11:16 PM, Lee Jones wrote:
> On Tue, 15 Sep 2015, Andrew F. Davis wrote:
>
>> The old driver does not support DT. Rewrite the driver adding DT support
>> and use modern kernel features such as regmap and related helpers.
>>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> ---
>>   drivers/gpio/gpio-tps65912.c           | 291 ++++++------
>>   drivers/mfd/Kconfig                    |  20 +-
>>   drivers/mfd/Makefile                   |   3 +-
>>   drivers/mfd/tps65912-core.c            | 288 +++++-------
>>   drivers/mfd/tps65912-i2c.c             | 233 ++++------
>>   drivers/mfd/tps65912-irq.c             | 217 ---------
>>   drivers/mfd/tps65912-spi.c             | 236 ++++------
>>   drivers/regulator/tps65912-regulator.c | 783 ++++++++++-----------------------
>>   include/linux/mfd/tps65912.h           | 256 +++++++----
>>   9 files changed, 854 insertions(+), 1473 deletions(-)
>>   rewrite drivers/gpio/gpio-tps65912.c (68%)
>>   rewrite drivers/mfd/tps65912-core.c (96%)
>>   rewrite drivers/mfd/tps65912-i2c.c (92%)
>>   delete mode 100644 drivers/mfd/tps65912-irq.c
>>   rewrite drivers/mfd/tps65912-spi.c (91%)
>>   rewrite drivers/regulator/tps65912-regulator.c (94%)
>
> Is there really no other way to split this up?
>

I don't think so, not without breaking stuff, all the files are strongly
connected.

>> diff --git a/drivers/gpio/gpio-tps65912.c b/drivers/gpio/gpio-tps65912.c
>> dissimilarity index 68%
>> index 9cdbc0c..a15d4e7 100644
>> --- a/drivers/gpio/gpio-tps65912.c
>> +++ b/drivers/gpio/gpio-tps65912.c
>> @@ -1,153 +1,138 @@
>> -/*
>> - * Copyright 2011 Texas Instruments Inc.
>> - *
>> - * Author: Margarita Olaya <magi@slimlogic.co.uk>
>> - *
>> - *  This program is free software; you can redistribute it and/or modify it
>> - *  under  the terms of the GNU General  Public License as published by the
>> - *  Free Software Foundation;  either version 2 of the License, or (at your
>> - *  option) any later version.
>> - *
>> - * This driver is based on wm8350 implementation.
>> - */
>> -
>> -#include <linux/kernel.h>
>> -#include <linux/module.h>
>> -#include <linux/errno.h>
>> -#include <linux/gpio.h>
>> -#include <linux/mfd/core.h>
>> -#include <linux/platform_device.h>
>> -#include <linux/seq_file.h>
>> -#include <linux/slab.h>
>> -#include <linux/mfd/tps65912.h>
>> -
>> -struct tps65912_gpio_data {
>> -	struct tps65912 *tps65912;
>> -	struct gpio_chip gpio_chip;
>> -};
>> -
>> -#define to_tgd(gc) container_of(gc, struct tps65912_gpio_data, gpio_chip)
>> -
>> -static int tps65912_gpio_get(struct gpio_chip *gc, unsigned offset)
>> -{
>> -	struct tps65912_gpio_data *tps65912_gpio = to_tgd(gc);
>> -	struct tps65912 *tps65912 = tps65912_gpio->tps65912;
>> -	int val;
>> -
>> -	val = tps65912_reg_read(tps65912, TPS65912_GPIO1 + offset);
>> -
>> -	if (val & GPIO_STS_MASK)
>> -		return 1;
>> -
>> -	return 0;
>> -}
>> -
>> -static void tps65912_gpio_set(struct gpio_chip *gc, unsigned offset,
>> -			      int value)
>> -{
>> -	struct tps65912_gpio_data *tps65912_gpio = to_tgd(gc);
>> -	struct tps65912 *tps65912 = tps65912_gpio->tps65912;
>> -
>> -	if (value)
>> -		tps65912_set_bits(tps65912, TPS65912_GPIO1 + offset,
>> -							GPIO_SET_MASK);
>> -	else
>> -		tps65912_clear_bits(tps65912, TPS65912_GPIO1 + offset,
>> -								GPIO_SET_MASK);
>> -}
>> -
>> -static int tps65912_gpio_output(struct gpio_chip *gc, unsigned offset,
>> -				int value)
>> -{
>> -	struct tps65912_gpio_data *tps65912_gpio = to_tgd(gc);
>> -	struct tps65912 *tps65912 = tps65912_gpio->tps65912;
>> -
>> -	/* Set the initial value */
>> -	tps65912_gpio_set(gc, offset, value);
>> -
>> -	return tps65912_set_bits(tps65912, TPS65912_GPIO1 + offset,
>> -								GPIO_CFG_MASK);
>> -}
>> -
>> -static int tps65912_gpio_input(struct gpio_chip *gc, unsigned offset)
>> -{
>> -	struct tps65912_gpio_data *tps65912_gpio = to_tgd(gc);
>> -	struct tps65912 *tps65912 = tps65912_gpio->tps65912;
>> -
>> -	return tps65912_clear_bits(tps65912, TPS65912_GPIO1 + offset,
>> -								GPIO_CFG_MASK);
>> -}
>> -
>> -static struct gpio_chip template_chip = {
>> -	.label			= "tps65912",
>> -	.owner			= THIS_MODULE,
>> -	.direction_input	= tps65912_gpio_input,
>> -	.direction_output	= tps65912_gpio_output,
>> -	.get			= tps65912_gpio_get,
>> -	.set			= tps65912_gpio_set,
>> -	.can_sleep		= true,
>> -	.ngpio			= 5,
>> -	.base			= -1,
>> -};
>> -
>> -static int tps65912_gpio_probe(struct platform_device *pdev)
>> -{
>> -	struct tps65912 *tps65912 = dev_get_drvdata(pdev->dev.parent);
>> -	struct tps65912_board *pdata = dev_get_platdata(tps65912->dev);
>> -	struct tps65912_gpio_data *tps65912_gpio;
>> -	int ret;
>> -
>> -	tps65912_gpio = devm_kzalloc(&pdev->dev, sizeof(*tps65912_gpio),
>> -				     GFP_KERNEL);
>> -	if (tps65912_gpio == NULL)
>> -		return -ENOMEM;
>> -
>> -	tps65912_gpio->tps65912 = tps65912;
>> -	tps65912_gpio->gpio_chip = template_chip;
>> -	tps65912_gpio->gpio_chip.dev = &pdev->dev;
>> -	if (pdata && pdata->gpio_base)
>> -		tps65912_gpio->gpio_chip.base = pdata->gpio_base;
>> -
>> -	ret = gpiochip_add(&tps65912_gpio->gpio_chip);
>> -	if (ret < 0) {
>> -		dev_err(&pdev->dev, "Failed to register gpiochip, %d\n", ret);
>> -		return ret;
>> -	}
>> -
>> -	platform_set_drvdata(pdev, tps65912_gpio);
>> -
>> -	return ret;
>> -}
>> -
>> -static int tps65912_gpio_remove(struct platform_device *pdev)
>> -{
>> -	struct tps65912_gpio_data  *tps65912_gpio = platform_get_drvdata(pdev);
>> -
>> -	gpiochip_remove(&tps65912_gpio->gpio_chip);
>> -	return 0;
>> -}
>> -
>> -static struct platform_driver tps65912_gpio_driver = {
>> -	.driver = {
>> -		.name = "tps65912-gpio",
>> -	},
>> -	.probe = tps65912_gpio_probe,
>> -	.remove = tps65912_gpio_remove,
>> -};
>> -
>> -static int __init tps65912_gpio_init(void)
>> -{
>> -	return platform_driver_register(&tps65912_gpio_driver);
>> -}
>> -subsys_initcall(tps65912_gpio_init);
>> -
>> -static void __exit tps65912_gpio_exit(void)
>> -{
>> -	platform_driver_unregister(&tps65912_gpio_driver);
>> -}
>> -module_exit(tps65912_gpio_exit);
>> -
>> -MODULE_AUTHOR("Margarita Olaya Cabrera <magi@slimlogic.co.uk>");
>> -MODULE_DESCRIPTION("GPIO interface for TPS65912 PMICs");
>> -MODULE_LICENSE("GPL v2");
>> -MODULE_ALIAS("platform:tps65912-gpio");
>> +/*
>> + * gpio-tps65912.c -- TI TPS65912x GPIO Driver
>> + *
>> + * Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
>> + *
>> + * Author: Andrew F. Davis <afd@ti.com>
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + *
>> + * This program is distributed "as is" WITHOUT ANY WARRANTY of any
>> + * kind, whether expressed or implied; without even the implied warranty
>> + * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License version 2 for more details.
>> + *
>> + * Based on the Arizona GPIO driver and the previous TPS65912 driver by
>> + * Margarita Olaya Cabrera <magi@slimlogic.co.uk>
>> + */
>> +
>> +#include <linux/gpio.h>
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
>> +
>> +#include <linux/mfd/tps65912.h>
>> +
>> +struct tps65912_gpio {
>> +	struct tps65912 *tps;
>> +	struct gpio_chip gpio_chip;
>> +};
>> +
>> +#define to_gpio(gc) container_of(gc, struct tps65912_gpio, gpio_chip)
>> +
>> +static int tps65912_gpio_get(struct gpio_chip *gc, unsigned offset)
>> +{
>> +	struct tps65912_gpio *gpio = to_gpio(gc);
>> +	int ret, val;
>> +
>> +	ret = regmap_read(gpio->tps->regmap, TPS65912_GPIO1 + offset, &val);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return val & GPIO_STS_MASK;
>> +}
>> +
>> +static void tps65912_gpio_set(struct gpio_chip *gc, unsigned offset,
>> +			      int value)
>> +{
>> +	struct tps65912_gpio *gpio = to_gpio(gc);
>> +
>> +	regmap_update_bits(gpio->tps->regmap, TPS65912_GPIO1 + offset,
>> +			   GPIO_SET_MASK, value ? GPIO_SET_MASK : 0);
>> +}
>> +
>> +static int tps65912_gpio_output(struct gpio_chip *gc, unsigned offset,
>> +				int value)
>> +{
>> +	struct tps65912_gpio *gpio = to_gpio(gc);
>> +
>> +	/* Set the initial value */
>> +	tps65912_gpio_set(gc, offset, value);
>> +
>> +	return regmap_update_bits(gpio->tps->regmap, TPS65912_GPIO1 + offset,
>> +				  GPIO_CFG_MASK, GPIO_CFG_MASK);
>> +}
>> +
>> +static int tps65912_gpio_input(struct gpio_chip *gc, unsigned offset)
>> +{
>> +	struct tps65912_gpio *gpio = to_gpio(gc);
>> +
>> +	return regmap_update_bits(gpio->tps->regmap, TPS65912_GPIO1 + offset,
>> +				  GPIO_CFG_MASK, 0);
>> +}
>> +
>> +static const struct of_device_id tps65912_gpio_of_match_table[] = {
>> +	{ .compatible = "ti,tps65912-gpio", },
>> +	{ /*sentinel*/ },
>> +};
>> +MODULE_DEVICE_TABLE(of, tps65912_gpio_of_match_table);
>> +
>> +static struct gpio_chip template_chip = {
>> +	.label			= "tps65912-gpio",
>> +	.owner			= THIS_MODULE,
>> +	.direction_input	= tps65912_gpio_input,
>> +	.direction_output	= tps65912_gpio_output,
>> +	.get			= tps65912_gpio_get,
>> +	.set			= tps65912_gpio_set,
>> +	.can_sleep		= true,
>> +	.ngpio			= 5,
>> +	.base			= -1,
>> +};
>> +
>> +static int tps65912_gpio_probe(struct platform_device *pdev)
>> +{
>> +	struct tps65912_gpio *gpio;
>> +	int ret;
>> +
>> +	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
>> +	if (!gpio)
>> +		return -ENOMEM;
>> +
>> +	gpio->tps = dev_get_drvdata(pdev->dev.parent);
>> +	gpio->gpio_chip = template_chip;
>> +	ret = gpiochip_add(&gpio->gpio_chip);
>> +	if (ret < 0) {
>> +		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	platform_set_drvdata(pdev, gpio);
>> +
>> +	return 0;
>> +}
>> +
>> +static int tps65912_gpio_remove(struct platform_device *pdev)
>> +{
>> +	struct tps65912_gpio *gpio = platform_get_drvdata(pdev);
>> +
>> +	gpiochip_remove(&gpio->gpio_chip);
>> +
>> +	return 0;
>> +}
>> +
>> +static struct platform_driver tps65912_gpio_driver = {
>> +	.driver = {
>> +		.name = "tps65912-gpio",
>> +		.of_match_table = tps65912_gpio_of_match_table,
>> +	},
>> +	.probe = tps65912_gpio_probe,
>> +	.remove = tps65912_gpio_remove,
>> +};
>> +
>> +module_platform_driver(tps65912_gpio_driver);
>> +
>> +MODULE_AUTHOR("Andrew F. Davis <afd@ti.com>");
>> +MODULE_DESCRIPTION("TPS65912 GPIO driver");
>> +MODULE_ALIAS("platform:tps65912-gpio");
>> +MODULE_LICENSE("GPL v2");
>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>> index 99d6367..3a36b37 100644
>> --- a/drivers/mfd/Kconfig
>> +++ b/drivers/mfd/Kconfig
>> @@ -1168,27 +1168,25 @@ config MFD_TPS65910
>>   	  Power Management chips.
>>
>>   config MFD_TPS65912
>> -	bool "TI TPS65912 Power Management chip"
>> -	depends on GPIOLIB
>> +	select REGMAP
>> +	select REGMAP_IRQ
>>   	select MFD_CORE
>> -	help
>> -	  If you say yes here you get support for the TPS65912 series of
>> -	  PM chips.
>> +	tristate
>
> Better to put this at the top, as excepted.
>

ACK

>>   config MFD_TPS65912_I2C
>> -	bool "TI TPS65912 Power Management chip with I2C"
>> -	select MFD_CORE
>> +	tristate "TI TPS65912 Power Management chip with I2C"
>>   	select MFD_TPS65912
>> -	depends on I2C=y && GPIOLIB
>> +	select REGMAP_I2C
>> +	depends on I2C
>>   	help
>>   	  If you say yes here you get support for the TPS65912 series of
>>   	  PM chips with I2C interface.
>>
>>   config MFD_TPS65912_SPI
>> -	bool "TI TPS65912 Power Management chip with SPI"
>> -	select MFD_CORE
>> +	tristate "TI TPS65912 Power Management chip with SPI"
>>   	select MFD_TPS65912
>> -	depends on SPI_MASTER && GPIOLIB
>> +	select REGMAP_SPI
>> +	depends on SPI_MASTER
>>   	help
>>   	  If you say yes here you get support for the TPS65912 series of
>>   	  PM chips with SPI interface.
>> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
>> index a59e3fc..49c3530 100644
>> --- a/drivers/mfd/Makefile
>> +++ b/drivers/mfd/Makefile
>> @@ -69,8 +69,7 @@ obj-$(CONFIG_TPS6507X)		+= tps6507x.o
>>   obj-$(CONFIG_MFD_TPS65217)	+= tps65217.o
>>   obj-$(CONFIG_MFD_TPS65218)	+= tps65218.o
>>   obj-$(CONFIG_MFD_TPS65910)	+= tps65910.o
>> -tps65912-objs                   := tps65912-core.o tps65912-irq.o
>> -obj-$(CONFIG_MFD_TPS65912)	+= tps65912.o
>> +obj-$(CONFIG_MFD_TPS65912)	+= tps65912-core.o
>>   obj-$(CONFIG_MFD_TPS65912_I2C)	+= tps65912-i2c.o
>>   obj-$(CONFIG_MFD_TPS65912_SPI)  += tps65912-spi.o
>>   obj-$(CONFIG_MFD_TPS80031)	+= tps80031.o
>> diff --git a/drivers/mfd/tps65912-core.c b/drivers/mfd/tps65912-core.c
>> dissimilarity index 96%
>> index 1f82d60..06b27f5 100644
>> --- a/drivers/mfd/tps65912-core.c
>> +++ b/drivers/mfd/tps65912-core.c
>> @@ -1,175 +1,113 @@
>> -/*
>> - * tps65912-core.c  --  TI TPS65912x
>> - *
>> - * Copyright 2011 Texas Instruments Inc.
>> - *
>> - * Author: Margarita Olaya Cabrera <magi@slimlogic.co.uk>
>> - *
>> - *  This program is free software; you can redistribute it and/or modify it
>> - *  under  the terms of the GNU General  Public License as published by the
>> - *  Free Software Foundation;  either version 2 of the License, or (at your
>> - *  option) any later version.
>> - *
>> - *  This driver is based on wm8350 implementation.
>> - */
>> -
>> -#include <linux/module.h>
>> -#include <linux/moduleparam.h>
>> -#include <linux/slab.h>
>> -#include <linux/gpio.h>
>> -#include <linux/mfd/core.h>
>> -#include <linux/mfd/tps65912.h>
>> -
>> -static const struct mfd_cell tps65912s[] = {
>> -	{
>> -		.name = "tps65912-pmic",
>> -	},
>> -};
>> -
>> -int tps65912_set_bits(struct tps65912 *tps65912, u8 reg, u8 mask)
>> -{
>> -	u8 data;
>> -	int err;
>> -
>> -	mutex_lock(&tps65912->io_mutex);
>> -
>> -	err = tps65912->read(tps65912, reg, 1, &data);
>> -	if (err) {
>> -		dev_err(tps65912->dev, "Read from reg 0x%x failed\n", reg);
>> -		goto out;
>> -	}
>> -
>> -	data |= mask;
>> -	err = tps65912->write(tps65912, reg, 1, &data);
>> -	if (err)
>> -		dev_err(tps65912->dev, "Write to reg 0x%x failed\n", reg);
>> -
>> -out:
>> -	mutex_unlock(&tps65912->io_mutex);
>> -	return err;
>> -}
>> -EXPORT_SYMBOL_GPL(tps65912_set_bits);
>> -
>> -int tps65912_clear_bits(struct tps65912 *tps65912, u8 reg, u8 mask)
>> -{
>> -	u8 data;
>> -	int err;
>> -
>> -	mutex_lock(&tps65912->io_mutex);
>> -	err = tps65912->read(tps65912, reg, 1, &data);
>> -	if (err) {
>> -		dev_err(tps65912->dev, "Read from reg 0x%x failed\n", reg);
>> -		goto out;
>> -	}
>> -
>> -	data &= ~mask;
>> -	err = tps65912->write(tps65912, reg, 1, &data);
>> -	if (err)
>> -		dev_err(tps65912->dev, "Write to reg 0x%x failed\n", reg);
>> -
>> -out:
>> -	mutex_unlock(&tps65912->io_mutex);
>> -	return err;
>> -}
>> -EXPORT_SYMBOL_GPL(tps65912_clear_bits);
>> -
>> -static inline int tps65912_read(struct tps65912 *tps65912, u8 reg)
>> -{
>> -	u8 val;
>> -	int err;
>> -
>> -	err = tps65912->read(tps65912, reg, 1, &val);
>> -	if (err < 0)
>> -		return err;
>> -
>> -	return val;
>> -}
>> -
>> -static inline int tps65912_write(struct tps65912 *tps65912, u8 reg, u8 val)
>> -{
>> -	return tps65912->write(tps65912, reg, 1, &val);
>> -}
>> -
>> -int tps65912_reg_read(struct tps65912 *tps65912, u8 reg)
>> -{
>> -	int data;
>> -
>> -	mutex_lock(&tps65912->io_mutex);
>> -
>> -	data = tps65912_read(tps65912, reg);
>> -	if (data < 0)
>> -		dev_err(tps65912->dev, "Read from reg 0x%x failed\n", reg);
>> -
>> -	mutex_unlock(&tps65912->io_mutex);
>> -	return data;
>> -}
>> -EXPORT_SYMBOL_GPL(tps65912_reg_read);
>> -
>> -int tps65912_reg_write(struct tps65912 *tps65912, u8 reg, u8 val)
>> -{
>> -	int err;
>> -
>> -	mutex_lock(&tps65912->io_mutex);
>> -
>> -	err = tps65912_write(tps65912, reg, val);
>> -	if (err < 0)
>> -		dev_err(tps65912->dev, "Write for reg 0x%x failed\n", reg);
>> -
>> -	mutex_unlock(&tps65912->io_mutex);
>> -	return err;
>> -}
>> -EXPORT_SYMBOL_GPL(tps65912_reg_write);
>> -
>> -int tps65912_device_init(struct tps65912 *tps65912)
>> -{
>> -	struct tps65912_board *pmic_plat_data = dev_get_platdata(tps65912->dev);
>> -	struct tps65912_platform_data *init_data;
>> -	int ret, dcdc_avs, value;
>> -
>> -	init_data = kzalloc(sizeof(struct tps65912_platform_data), GFP_KERNEL);
>> -	if (init_data == NULL)
>> -		return -ENOMEM;
>> -
>> -	mutex_init(&tps65912->io_mutex);
>> -	dev_set_drvdata(tps65912->dev, tps65912);
>> -
>> -	dcdc_avs = (pmic_plat_data->is_dcdc1_avs << 0 |
>> -			pmic_plat_data->is_dcdc2_avs  << 1 |
>> -				pmic_plat_data->is_dcdc3_avs << 2 |
>> -					pmic_plat_data->is_dcdc4_avs << 3);
>> -	if (dcdc_avs) {
>> -		tps65912->read(tps65912, TPS65912_I2C_SPI_CFG, 1, &value);
>> -		dcdc_avs |= value;
>> -		tps65912->write(tps65912, TPS65912_I2C_SPI_CFG, 1, &dcdc_avs);
>> -	}
>> -
>> -	ret = mfd_add_devices(tps65912->dev, -1,
>> -			      tps65912s, ARRAY_SIZE(tps65912s),
>> -			      NULL, 0, NULL);
>> -	if (ret < 0)
>> -		goto err;
>> -
>> -	init_data->irq = pmic_plat_data->irq;
>> -	init_data->irq_base = pmic_plat_data->irq_base;
>> -	ret = tps65912_irq_init(tps65912, init_data->irq, init_data);
>> -	if (ret < 0)
>> -		goto err;
>> -
>> -	kfree(init_data);
>> -	return ret;
>> -
>> -err:
>> -	kfree(init_data);
>> -	mfd_remove_devices(tps65912->dev);
>> -	return ret;
>> -}
>> -
>> -void tps65912_device_exit(struct tps65912 *tps65912)
>> -{
>> -	mfd_remove_devices(tps65912->dev);
>> -	tps65912_irq_exit(tps65912);
>> -}
>> -
>> -MODULE_AUTHOR("Margarita Olaya	<magi@slimlogic.co.uk>");
>> -MODULE_DESCRIPTION("TPS65912x chip family multi-function driver");
>> -MODULE_LICENSE("GPL");
>> +/*
>> + * tps65912-i2c.c -- Core functions for TI TPS65912x PMIC
>
> Please remove the filename, as these have a habit of becoming
> incorrect.  I think it's even wrong here isn't it?
>

Yeah, I'll remove this from all of them then.

>> + * Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
>> + *
>> + * Author: Andrew F. Davis <afd@ti.com>
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + *
>> + * This program is distributed "as is" WITHOUT ANY WARRANTY of any
>> + * kind, whether expressed or implied; without even the implied warranty
>> + * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License version 2 for more details.
>> + *
>> + * Based on the TPS65218 driver and the previous TPS65912 driver by
>> + * Margarita Olaya Cabrera <magi@slimlogic.co.uk>
>> + */
>> +
>> +#include <linux/interrupt.h>
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
>> +
>
> No need for the '\n'.
>

Is it prohibited? It seems a lot over files do it this way, I personally
think it makes it cleaner to see what headers are driver local. If you
really don't like it have have no problem removing it though.

>> +#include <linux/mfd/tps65912.h>
>> +
>> +#define TPS65912_IRQ(_name, _reg, _offset)	\
>> +	[TPS65912_IRQ_ ## _name] = {	\
>> +		.mask = TPS65912_ ## _reg ## _ ## _name,	\
>> +		.reg_offset = _offset,	\
>> +	}
>
> If you find this useful, then others will too.
>
> Please submit this to Mark Brown.
>

This is a really horrible macro hack I made so I didn't have to type
out the whole register name each time, I'm not sure anyone else
could use this, a better solution for most would be to use less
verbose #defines for register names.

>> +static const struct regmap_irq tps65912_irqs[] = {
>> +	/* INT_STS IRQs */
>> +	TPS65912_IRQ(PWRHOLD_F, INT_STS, 0),
>> +	TPS65912_IRQ(VMON, INT_STS, 0),
>> +	TPS65912_IRQ(PWRON, INT_STS, 0),
>> +	TPS65912_IRQ(PWRON_LP, INT_STS, 0),
>> +	TPS65912_IRQ(PWRHOLD_R, INT_STS, 0),
>> +	TPS65912_IRQ(HOTDIE, INT_STS, 0),
>> +	TPS65912_IRQ(GPIO1_R, INT_STS, 0),
>> +	TPS65912_IRQ(GPIO1_F, INT_STS, 0),
>> +	/* INT_STS2 IRQs */
>> +	TPS65912_IRQ(GPIO2_R, INT_STS2, 1),
>> +	TPS65912_IRQ(GPIO2_F, INT_STS2, 1),
>> +	TPS65912_IRQ(GPIO3_R, INT_STS2, 1),
>> +	TPS65912_IRQ(GPIO3_F, INT_STS2, 1),
>> +	TPS65912_IRQ(GPIO4_R, INT_STS2, 1),
>> +	TPS65912_IRQ(GPIO4_F, INT_STS2, 1),
>> +	TPS65912_IRQ(GPIO5_R, INT_STS2, 1),
>> +	TPS65912_IRQ(GPIO5_F, INT_STS2, 1),
>> +	/* INT_STS3 IRQs */
>> +	TPS65912_IRQ(PGOOD_DCDC1, INT_STS3, 2),
>> +	TPS65912_IRQ(PGOOD_DCDC2, INT_STS3, 2),
>> +	TPS65912_IRQ(PGOOD_DCDC3, INT_STS3, 2),
>> +	TPS65912_IRQ(PGOOD_DCDC4, INT_STS3, 2),
>> +	TPS65912_IRQ(PGOOD_LDO1, INT_STS3, 2),
>> +	TPS65912_IRQ(PGOOD_LDO2, INT_STS3, 2),
>> +	TPS65912_IRQ(PGOOD_LDO3, INT_STS3, 2),
>> +	TPS65912_IRQ(PGOOD_LDO4, INT_STS3, 2),
>> +	/* INT_STS4 IRQs */
>> +	TPS65912_IRQ(PGOOD_LDO5, INT_STS4, 3),
>> +	TPS65912_IRQ(PGOOD_LDO6, INT_STS4, 3),
>> +	TPS65912_IRQ(PGOOD_LDO7, INT_STS4, 3),
>> +	TPS65912_IRQ(PGOOD_LDO8, INT_STS4, 3),
>> +	TPS65912_IRQ(PGOOD_LDO9, INT_STS4, 3),
>> +	TPS65912_IRQ(PGOOD_LDO10, INT_STS4, 3),
>> +};
>> +
>> +static struct regmap_irq_chip tps65912_irq_chip = {
>> +	.name = "tps65912",
>> +	.irqs = tps65912_irqs,
>> +	.num_irqs = ARRAY_SIZE(tps65912_irqs),
>> +
>
> Rid the '\n' please.
>

ACK

>> +	.num_regs = 4,
>
> Why do you have 2 num_regs entries?
>

Not sure what you mean, the other is num_irqs?

>> +	.irq_reg_stride = 2,
>> +	.mask_base = TPS65912_INT_MSK,
>> +	.status_base = TPS65912_INT_STS,
>> +	.ack_base = TPS65912_INT_STS,
>> +	.init_ack_masked = true,
>> +};
>> +
>> +int tps65912_device_init(struct tps65912 *tps)
>> +{
>> +	int ret;
>> +
>> +	ret = regmap_add_irq_chip(tps->regmap, tps->irq, IRQF_ONESHOT, 0,
>> +				  &tps65912_irq_chip, &tps->irq_data);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = of_platform_populate(tps->dev->of_node, NULL, NULL, tps->dev);
>> +	if (ret < 0)
>> +		goto err_irq;
>> +
>> +	return 0;
>> +
>> +err_irq:
>> +	regmap_del_irq_chip(tps->irq, tps->irq_data);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(tps65912_device_init);
>> +
>> +void tps65912_device_exit(struct tps65912 *tps)
>> +{
>> +	regmap_del_irq_chip(tps->irq, tps->irq_data);
>> +}
>> +EXPORT_SYMBOL_GPL(tps65912_device_exit);
>> +
>> +MODULE_AUTHOR("Andrew F. Davis <afd@ti.com>");
>> +MODULE_DESCRIPTION("TPS65912x MFD Driver");
>> +MODULE_LICENSE("GPL v2");
>> diff --git a/drivers/mfd/tps65912-i2c.c b/drivers/mfd/tps65912-i2c.c
>> dissimilarity index 92%
>> index 7e55640..feb1e5a 100644
>> --- a/drivers/mfd/tps65912-i2c.c
>> +++ b/drivers/mfd/tps65912-i2c.c
>> @@ -1,139 +1,94 @@
>> -/*
>> - * tps65912-i2c.c  --  I2C access for TI TPS65912x PMIC
>> - *
>> - * Copyright 2011 Texas Instruments Inc.
>> - *
>> - * Author: Margarita Olaya Cabrera <magi@slimlogic.co.uk>
>> - *
>> - *  This program is free software; you can redistribute it and/or modify it
>> - *  under  the terms of the GNU General  Public License as published by the
>> - *  Free Software Foundation;  either version 2 of the License, or (at your
>> - *  option) any later version.
>> - *
>> - *  This driver is based on wm8350 implementation.
>> - */
>> -
>> -#include <linux/module.h>
>> -#include <linux/moduleparam.h>
>> -#include <linux/init.h>
>> -#include <linux/slab.h>
>> -#include <linux/gpio.h>
>> -#include <linux/i2c.h>
>> -#include <linux/mfd/core.h>
>> -#include <linux/mfd/tps65912.h>
>> -
>> -static int tps65912_i2c_read(struct tps65912 *tps65912, u8 reg,
>> -				  int bytes, void *dest)
>> -{
>> -	struct i2c_client *i2c = tps65912->control_data;
>> -	struct i2c_msg xfer[2];
>> -	int ret;
>> -
>> -	/* Write register */
>> -	xfer[0].addr = i2c->addr;
>> -	xfer[0].flags = 0;
>> -	xfer[0].len = 1;
>> -	xfer[0].buf = &reg;
>> -
>> -	/* Read data */
>> -	xfer[1].addr = i2c->addr;
>> -	xfer[1].flags = I2C_M_RD;
>> -	xfer[1].len = bytes;
>> -	xfer[1].buf = dest;
>> -
>> -	ret = i2c_transfer(i2c->adapter, xfer, 2);
>> -	if (ret == 2)
>> -		ret = 0;
>> -	else if (ret >= 0)
>> -		ret = -EIO;
>> -	return ret;
>> -}
>> -
>> -static int tps65912_i2c_write(struct tps65912 *tps65912, u8 reg,
>> -				   int bytes, void *src)
>> -{
>> -	struct i2c_client *i2c = tps65912->control_data;
>> -	/* we add 1 byte for device register */
>> -	u8 msg[TPS6591X_MAX_REGISTER + 1];
>> -	int ret;
>> -
>> -	if (bytes > TPS6591X_MAX_REGISTER)
>> -		return -EINVAL;
>> -
>> -	msg[0] = reg;
>> -	memcpy(&msg[1], src, bytes);
>> -
>> -	ret = i2c_master_send(i2c, msg, bytes + 1);
>> -	if (ret < 0)
>> -		return ret;
>> -	if (ret != bytes + 1)
>> -		return -EIO;
>> -
>> -	return 0;
>> -}
>> -
>> -static int tps65912_i2c_probe(struct i2c_client *i2c,
>> -			    const struct i2c_device_id *id)
>> -{
>> -	struct tps65912 *tps65912;
>> -
>> -	tps65912 = devm_kzalloc(&i2c->dev,
>> -				sizeof(struct tps65912), GFP_KERNEL);
>> -	if (tps65912 == NULL)
>> -		return -ENOMEM;
>> -
>> -	i2c_set_clientdata(i2c, tps65912);
>> -	tps65912->dev = &i2c->dev;
>> -	tps65912->control_data = i2c;
>> -	tps65912->read = tps65912_i2c_read;
>> -	tps65912->write = tps65912_i2c_write;
>> -
>> -	return tps65912_device_init(tps65912);
>> -}
>> -
>> -static int tps65912_i2c_remove(struct i2c_client *i2c)
>> -{
>> -	struct tps65912 *tps65912 = i2c_get_clientdata(i2c);
>> -
>> -	tps65912_device_exit(tps65912);
>> -
>> -	return 0;
>> -}
>> -
>> -static const struct i2c_device_id tps65912_i2c_id[] = {
>> -	{"tps65912", 0 },
>> -	{ }
>> -};
>> -MODULE_DEVICE_TABLE(i2c, tps65912_i2c_id);
>> -
>> -static struct i2c_driver tps65912_i2c_driver = {
>> -	.driver = {
>> -		   .name = "tps65912",
>> -	},
>> -	.probe = tps65912_i2c_probe,
>> -	.remove = tps65912_i2c_remove,
>> -	.id_table = tps65912_i2c_id,
>> -};
>> -
>> -static int __init tps65912_i2c_init(void)
>> -{
>> -	int ret;
>> -
>> -	ret = i2c_add_driver(&tps65912_i2c_driver);
>> -	if (ret != 0)
>> -		pr_err("Failed to register TPS65912 I2C driver: %d\n", ret);
>> -
>> -	return ret;
>> -}
>> -/* init early so consumer devices can complete system boot */
>> -subsys_initcall(tps65912_i2c_init);
>> -
>> -static void __exit tps65912_i2c_exit(void)
>> -{
>> -	i2c_del_driver(&tps65912_i2c_driver);
>> -}
>> -module_exit(tps65912_i2c_exit);
>> -
>> -MODULE_AUTHOR("Margarita Olaya	<magi@slimlogic.co.uk>");
>> -MODULE_DESCRIPTION("TPS6591x chip family multi-function driver");
>> -MODULE_LICENSE("GPL");
>> +/*
>> + * tps65912-i2c.c -- I2C access driver for TI TPS65912x PMIC
>
> Remove the filename please.
>
>> + * Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
>> + *
>> + * Author: Andrew F. Davis <afd@ti.com>
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + *
>> + * This program is distributed "as is" WITHOUT ANY WARRANTY of any
>> + * kind, whether expressed or implied; without even the implied warranty
>> + * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License version 2 for more details.
>> + *
>> + * Based on the TPS65218 driver and the previous TPS65912 driver by
>> + * Margarita Olaya Cabrera <magi@slimlogic.co.uk>
>> + */
>> +
>> +#include <linux/i2c.h>
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
>> +#include <linux/regmap.h>
>> +
>
> Remove the '\n'.
>
>> +#include <linux/mfd/tps65912.h>
>> +
>> +static const struct of_device_id tps65912_i2c_of_match_table[] = {
>> +	{ .compatible = "ti,tps65912", },
>> +	{ /*sentinel*/ }
>
> No need for this comment.  We know what { } does.
>

We do, but I didn't when I first saw this kind of thing, everything is
obvious to someone, I'm not sure trying to keep the kernel as comment
bare as it is is a good idea. Plus, how many chances do you get to
use the word "sentinel" :). But I'll remove it if you have a strong
opposition to it.

>> +};
>> +
>> +static int tps65912_i2c_probe(struct i2c_client *client,
>> +			      const struct i2c_device_id *ids)
>> +{
>> +	struct tps65912 *tps;
>> +	const struct of_device_id *match;
>> +
>> +	match = of_match_device(tps65912_i2c_of_match_table, &client->dev);
>> +	if (!match) {
>> +		dev_err(&client->dev, "Failed to find matching DT id\n");
>> +		return -EINVAL;
>> +	}
>
> Why are you matching?
>

It looks like other drivers do this so they will fail early if they were
not instantiated with DT. Here we don't need the match, so I'll just
drop this check.

>> +	tps = devm_kzalloc(&client->dev, sizeof(*tps), GFP_KERNEL);
>> +	if (!tps)
>> +		return -ENOMEM;
>> +
>> +	i2c_set_clientdata(client, tps);
>> +	tps->dev = &client->dev;
>> +	tps->irq = client->irq;
>> +
>> +	tps->regmap = devm_regmap_init_i2c(client, &tps65912_regmap_config);
>> +	if (IS_ERR(tps->regmap)) {
>> +		int ret = PTR_ERR(tps->regmap);
>
> Neater just to declare 'int ret' up the top like we always do.
>

Linus has decreed we should not mix code and declerations outside of C89,
and so I will not, but ret is at the top of its scope and so is conforment
to C89. Moving it further up might be overly overly pedantic.

But if you think it would be really neater I can move it :)

>> +		dev_err(tps->dev, "Failed to allocate register map: %d\n",
>> +			ret);
>> +		return ret;
>> +	}
>> +
>> +	return tps65912_device_init(tps);
>> +}
>> +
>> +static int tps65912_i2c_remove(struct i2c_client *client)
>> +{
>> +	struct tps65912 *tps = i2c_get_clientdata(client);
>> +
>> +	tps65912_device_exit(tps);
>
> Why don't you have tps65912_device_exit() provide an error code and do:
>
>    return tps65912_device_exit(tps);
>

tps65912_device_exit only calls one void returning function and so will
always return 0, I'm not sure what difference this change will make, but
I'll do that.

>> +	return 0;
>> +}
>> +
>> +static const struct i2c_device_id tps65912_i2c_id_table[] = {
>> +	{ "tps65912", TPS65912 },
>
> This doesn't appear to be used?
>

The TPS65912 part is not, but it may someday get an extra device ID,
some use just 0 for the second field, but I have TPS65912 defined so
might as well use it.

>> +	{ /*sentinel*/ },
>
> As before.
>
>> +};
>> +MODULE_DEVICE_TABLE(i2c, tps65912_i2c_id_table);
>> +
>> +static struct i2c_driver tps65912_i2c_driver = {
>> +	.driver		= {
>> +		.name	= "tps65912",
>> +		.of_match_table = tps65912_i2c_of_match_table,
>> +	},
>> +	.probe		= tps65912_i2c_probe,
>> +	.remove		= tps65912_i2c_remove,
>> +	.id_table       = tps65912_i2c_id_table,
>> +};
>> +
>> +module_i2c_driver(tps65912_i2c_driver);
>> +
>> +MODULE_AUTHOR("Andrew F. Davis <afd@ti.com>");
>> +MODULE_DESCRIPTION("TPS65912x I2C Interface Driver");
>> +MODULE_LICENSE("GPL v2");
>> diff --git a/drivers/mfd/tps65912-irq.c b/drivers/mfd/tps65912-irq.c
>> deleted file mode 100644
>> index db2c29c..0000000
>> --- a/drivers/mfd/tps65912-irq.c
>> +++ /dev/null
>> @@ -1,217 +0,0 @@
>> -/*
>> - * tps65912-irq.c  --  TI TPS6591x
>> - *
>> - * Copyright 2011 Texas Instruments Inc.
>> - *
>> - * Author: Margarita Olaya <magi@slimlogic.co.uk>
>> - *
>> - *  This program is free software; you can redistribute it and/or modify it
>> - *  under  the terms of the GNU General  Public License as published by the
>> - *  Free Software Foundation;  either version 2 of the License, or (at your
>> - *  option) any later version.
>> - *
>> - * This driver is based on wm8350 implementation.
>> - */
>> -
>> -#include <linux/kernel.h>
>> -#include <linux/module.h>
>> -#include <linux/bug.h>
>> -#include <linux/device.h>
>> -#include <linux/interrupt.h>
>> -#include <linux/irq.h>
>> -#include <linux/gpio.h>
>> -#include <linux/mfd/tps65912.h>
>> -
>> -static inline int irq_to_tps65912_irq(struct tps65912 *tps65912,
>> -							int irq)
>> -{
>> -	return irq - tps65912->irq_base;
>> -}
>> -
>> -/*
>> - * This is a threaded IRQ handler so can access I2C/SPI.  Since the
>> - * IRQ handler explicitly clears the IRQ it handles the IRQ line
>> - * will be reasserted and the physical IRQ will be handled again if
>> - * another interrupt is asserted while we run - in the normal course
>> - * of events this is a rare occurrence so we save I2C/SPI reads. We're
>> - * also assuming that it's rare to get lots of interrupts firing
>> - * simultaneously so try to minimise I/O.
>> - */
>> -static irqreturn_t tps65912_irq(int irq, void *irq_data)
>> -{
>> -	struct tps65912 *tps65912 = irq_data;
>> -	u32 irq_sts;
>> -	u32 irq_mask;
>> -	u8 reg;
>> -	int i;
>> -
>> -
>> -	tps65912->read(tps65912, TPS65912_INT_STS, 1, &reg);
>> -	irq_sts = reg;
>> -	tps65912->read(tps65912, TPS65912_INT_STS2, 1, &reg);
>> -	irq_sts |= reg << 8;
>> -	tps65912->read(tps65912, TPS65912_INT_STS3, 1, &reg);
>> -	irq_sts |= reg << 16;
>> -	tps65912->read(tps65912, TPS65912_INT_STS4, 1, &reg);
>> -	irq_sts |= reg << 24;
>> -
>> -	tps65912->read(tps65912, TPS65912_INT_MSK, 1, &reg);
>> -	irq_mask = reg;
>> -	tps65912->read(tps65912, TPS65912_INT_MSK2, 1, &reg);
>> -	irq_mask |= reg << 8;
>> -	tps65912->read(tps65912, TPS65912_INT_MSK3, 1, &reg);
>> -	irq_mask |= reg << 16;
>> -	tps65912->read(tps65912, TPS65912_INT_MSK4, 1, &reg);
>> -	irq_mask |= reg << 24;
>> -
>> -	irq_sts &= ~irq_mask;
>> -	if (!irq_sts)
>> -		return IRQ_NONE;
>> -
>> -	for (i = 0; i < tps65912->irq_num; i++) {
>> -		if (!(irq_sts & (1 << i)))
>> -			continue;
>> -
>> -		handle_nested_irq(tps65912->irq_base + i);
>> -	}
>> -
>> -	/* Write the STS register back to clear IRQs we handled */
>> -	reg = irq_sts & 0xFF;
>> -	irq_sts >>= 8;
>> -	if (reg)
>> -		tps65912->write(tps65912, TPS65912_INT_STS, 1, &reg);
>> -	reg = irq_sts & 0xFF;
>> -	irq_sts >>= 8;
>> -	if (reg)
>> -		tps65912->write(tps65912, TPS65912_INT_STS2, 1, &reg);
>> -	reg = irq_sts & 0xFF;
>> -	irq_sts >>= 8;
>> -	if (reg)
>> -		tps65912->write(tps65912, TPS65912_INT_STS3, 1, &reg);
>> -	reg = irq_sts & 0xFF;
>> -	if (reg)
>> -		tps65912->write(tps65912, TPS65912_INT_STS4, 1, &reg);
>> -
>> -	return IRQ_HANDLED;
>> -}
>> -
>> -static void tps65912_irq_lock(struct irq_data *data)
>> -{
>> -	struct tps65912 *tps65912 = irq_data_get_irq_chip_data(data);
>> -
>> -	mutex_lock(&tps65912->irq_lock);
>> -}
>> -
>> -static void tps65912_irq_sync_unlock(struct irq_data *data)
>> -{
>> -	struct tps65912 *tps65912 = irq_data_get_irq_chip_data(data);
>> -	u32 reg_mask;
>> -	u8 reg;
>> -
>> -	tps65912->read(tps65912, TPS65912_INT_MSK, 1, &reg);
>> -	reg_mask = reg;
>> -	tps65912->read(tps65912, TPS65912_INT_MSK2, 1, &reg);
>> -	reg_mask |= reg << 8;
>> -	tps65912->read(tps65912, TPS65912_INT_MSK3, 1, &reg);
>> -	reg_mask |= reg << 16;
>> -	tps65912->read(tps65912, TPS65912_INT_MSK4, 1, &reg);
>> -	reg_mask |= reg << 24;
>> -
>> -	if (tps65912->irq_mask != reg_mask) {
>> -		reg = tps65912->irq_mask & 0xFF;
>> -		tps65912->write(tps65912, TPS65912_INT_MSK, 1, &reg);
>> -		reg = tps65912->irq_mask >> 8 & 0xFF;
>> -		tps65912->write(tps65912, TPS65912_INT_MSK2, 1, &reg);
>> -		reg = tps65912->irq_mask >> 16 & 0xFF;
>> -		tps65912->write(tps65912, TPS65912_INT_MSK3, 1, &reg);
>> -		reg = tps65912->irq_mask >> 24 & 0xFF;
>> -		tps65912->write(tps65912, TPS65912_INT_MSK4, 1, &reg);
>> -	}
>> -
>> -	mutex_unlock(&tps65912->irq_lock);
>> -}
>> -
>> -static void tps65912_irq_enable(struct irq_data *data)
>> -{
>> -	struct tps65912 *tps65912 = irq_data_get_irq_chip_data(data);
>> -
>> -	tps65912->irq_mask &= ~(1 << irq_to_tps65912_irq(tps65912, data->irq));
>> -}
>> -
>> -static void tps65912_irq_disable(struct irq_data *data)
>> -{
>> -	struct tps65912 *tps65912 = irq_data_get_irq_chip_data(data);
>> -
>> -	tps65912->irq_mask |= (1 << irq_to_tps65912_irq(tps65912, data->irq));
>> -}
>> -
>> -static struct irq_chip tps65912_irq_chip = {
>> -	.name = "tps65912",
>> -	.irq_bus_lock = tps65912_irq_lock,
>> -	.irq_bus_sync_unlock = tps65912_irq_sync_unlock,
>> -	.irq_disable = tps65912_irq_disable,
>> -	.irq_enable = tps65912_irq_enable,
>> -};
>> -
>> -int tps65912_irq_init(struct tps65912 *tps65912, int irq,
>> -			    struct tps65912_platform_data *pdata)
>> -{
>> -	int ret, cur_irq;
>> -	int flags = IRQF_ONESHOT;
>> -	u8 reg;
>> -
>> -	if (!irq) {
>> -		dev_warn(tps65912->dev, "No interrupt support, no core IRQ\n");
>> -		return 0;
>> -	}
>> -
>> -	if (!pdata || !pdata->irq_base) {
>> -		dev_warn(tps65912->dev, "No interrupt support, no IRQ base\n");
>> -		return 0;
>> -	}
>> -
>> -	/* Clear unattended interrupts */
>> -	tps65912->read(tps65912, TPS65912_INT_STS, 1, &reg);
>> -	tps65912->write(tps65912, TPS65912_INT_STS, 1, &reg);
>> -	tps65912->read(tps65912, TPS65912_INT_STS2, 1, &reg);
>> -	tps65912->write(tps65912, TPS65912_INT_STS2, 1, &reg);
>> -	tps65912->read(tps65912, TPS65912_INT_STS3, 1, &reg);
>> -	tps65912->write(tps65912, TPS65912_INT_STS3, 1, &reg);
>> -	tps65912->read(tps65912, TPS65912_INT_STS4, 1, &reg);
>> -	tps65912->write(tps65912, TPS65912_INT_STS4, 1, &reg);
>> -
>> -	/* Mask top level interrupts */
>> -	tps65912->irq_mask = 0xFFFFFFFF;
>> -
>> -	mutex_init(&tps65912->irq_lock);
>> -	tps65912->chip_irq = irq;
>> -	tps65912->irq_base = pdata->irq_base;
>> -
>> -	tps65912->irq_num = TPS65912_NUM_IRQ;
>> -
>> -	/* Register with genirq */
>> -	for (cur_irq = tps65912->irq_base;
>> -	     cur_irq < tps65912->irq_num + tps65912->irq_base;
>> -	     cur_irq++) {
>> -		irq_set_chip_data(cur_irq, tps65912);
>> -		irq_set_chip_and_handler(cur_irq, &tps65912_irq_chip,
>> -					 handle_edge_irq);
>> -		irq_set_nested_thread(cur_irq, 1);
>> -		irq_clear_status_flags(cur_irq, IRQ_NOREQUEST | IRQ_NOPROBE);
>> -	}
>> -
>> -	ret = request_threaded_irq(irq, NULL, tps65912_irq, flags,
>> -				   "tps65912", tps65912);
>> -
>> -	irq_set_irq_type(irq, IRQ_TYPE_LEVEL_LOW);
>> -	if (ret != 0)
>> -		dev_err(tps65912->dev, "Failed to request IRQ: %d\n", ret);
>> -
>> -	return ret;
>> -}
>> -
>> -int tps65912_irq_exit(struct tps65912 *tps65912)
>> -{
>> -	free_irq(tps65912->chip_irq, tps65912);
>> -	return 0;
>> -}
>> diff --git a/drivers/mfd/tps65912-spi.c b/drivers/mfd/tps65912-spi.c
>> dissimilarity index 91%
>> index de60ad9..d6ab929 100644
>> --- a/drivers/mfd/tps65912-spi.c
>> +++ b/drivers/mfd/tps65912-spi.c
>> @@ -1,141 +1,95 @@
>> -/*
>> - * tps65912-spi.c  --  SPI access for TI TPS65912x PMIC
>> - *
>> - * Copyright 2011 Texas Instruments Inc.
>> - *
>> - * Author: Margarita Olaya Cabrera <magi@slimlogic.co.uk>
>> - *
>> - *  This program is free software; you can redistribute it and/or modify it
>> - *  under  the terms of the GNU General  Public License as published by the
>> - *  Free Software Foundation;  either version 2 of the License, or (at your
>> - *  option) any later version.
>> - *
>> - *  This driver is based on wm8350 implementation.
>> - */
>> -
>> -#include <linux/module.h>
>> -#include <linux/moduleparam.h>
>> -#include <linux/init.h>
>> -#include <linux/slab.h>
>> -#include <linux/gpio.h>
>> -#include <linux/spi/spi.h>
>> -#include <linux/mfd/core.h>
>> -#include <linux/mfd/tps65912.h>
>> -
>> -static int tps65912_spi_write(struct tps65912 *tps65912, u8 addr,
>> -							int bytes, void *src)
>> -{
>> -	struct spi_device *spi = tps65912->control_data;
>> -	u8 *data = (u8 *) src;
>> -	int ret;
>> -	/* bit 23 is the read/write bit */
>> -	unsigned long spi_data = 1 << 23 | addr << 15 | *data;
>> -	struct spi_transfer xfer;
>> -	struct spi_message msg;
>> -	u32 tx_buf;
>> -
>> -	tx_buf = spi_data;
>> -
>> -	xfer.tx_buf	= &tx_buf;
>> -	xfer.rx_buf	= NULL;
>> -	xfer.len	= sizeof(unsigned long);
>> -	xfer.bits_per_word = 24;
>> -
>> -	spi_message_init(&msg);
>> -	spi_message_add_tail(&xfer, &msg);
>> -
>> -	ret = spi_sync(spi, &msg);
>> -	return ret;
>> -}
>> -
>> -static int tps65912_spi_read(struct tps65912 *tps65912, u8 addr,
>> -							int bytes, void *dest)
>> -{
>> -	struct spi_device *spi = tps65912->control_data;
>> -	/* bit 23 is the read/write bit */
>> -	unsigned long spi_data = 0 << 23 | addr << 15;
>> -	struct spi_transfer xfer;
>> -	struct spi_message msg;
>> -	int ret;
>> -	u8 *data = (u8 *) dest;
>> -	u32 tx_buf, rx_buf;
>> -
>> -	tx_buf = spi_data;
>> -	rx_buf = 0;
>> -
>> -	xfer.tx_buf	= &tx_buf;
>> -	xfer.rx_buf	= &rx_buf;
>> -	xfer.len	= sizeof(unsigned long);
>> -	xfer.bits_per_word = 24;
>> -
>> -	spi_message_init(&msg);
>> -	spi_message_add_tail(&xfer, &msg);
>> -
>> -	if (spi == NULL)
>> -		return 0;
>> -
>> -	ret = spi_sync(spi, &msg);
>> -	if (ret == 0)
>> -		*data = (u8) (rx_buf & 0xFF);
>> -	return ret;
>> -}
>> -
>> -static int tps65912_spi_probe(struct spi_device *spi)
>> -{
>> -	struct tps65912 *tps65912;
>> -
>> -	tps65912 = devm_kzalloc(&spi->dev,
>> -				sizeof(struct tps65912), GFP_KERNEL);
>> -	if (tps65912 == NULL)
>> -		return -ENOMEM;
>> -
>> -	tps65912->dev = &spi->dev;
>> -	tps65912->control_data = spi;
>> -	tps65912->read = tps65912_spi_read;
>> -	tps65912->write = tps65912_spi_write;
>> -
>> -	spi_set_drvdata(spi, tps65912);
>> -
>> -	return tps65912_device_init(tps65912);
>> -}
>> -
>> -static int tps65912_spi_remove(struct spi_device *spi)
>> -{
>> -	struct tps65912 *tps65912 = spi_get_drvdata(spi);
>> -
>> -	tps65912_device_exit(tps65912);
>> -
>> -	return 0;
>> -}
>> -
>> -static struct spi_driver tps65912_spi_driver = {
>> -	.driver = {
>> -		.name = "tps65912",
>> -		.owner = THIS_MODULE,
>> -	},
>> -	.probe	= tps65912_spi_probe,
>> -	.remove = tps65912_spi_remove,
>> -};
>> -
>> -static int __init tps65912_spi_init(void)
>> -{
>> -	int ret;
>> -
>> -	ret = spi_register_driver(&tps65912_spi_driver);
>> -	if (ret != 0)
>> -		pr_err("Failed to register TPS65912 SPI driver: %d\n", ret);
>> -
>> -	return 0;
>> -}
>> -/* init early so consumer devices can complete system boot */
>> -subsys_initcall(tps65912_spi_init);
>> -
>> -static void __exit tps65912_spi_exit(void)
>> -{
>> -	spi_unregister_driver(&tps65912_spi_driver);
>> -}
>> -module_exit(tps65912_spi_exit);
>> -
>> -MODULE_AUTHOR("Margarita Olaya	<magi@slimlogic.co.uk>");
>> -MODULE_DESCRIPTION("SPI support for TPS65912 chip family mfd");
>> -MODULE_LICENSE("GPL");
>> +/*
>> + * tps65912-spi.c -- SPI access driver for TI TPS65912x PMIC
>
> All the same comments as the other files -- I'll not labour them.
>
> Same goes for the rest of the file.
>

ACK

>> + * Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
>> + *
>> + * Author: Andrew F. Davis <afd@ti.com>
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + *
>> + * This program is distributed "as is" WITHOUT ANY WARRANTY of any
>> + * kind, whether expressed or implied; without even the implied warranty
>> + * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License version 2 for more details.
>> + *
>> + * Based on the TPS65218 driver and the previous TPS65912 driver by
>> + * Margarita Olaya Cabrera <magi@slimlogic.co.uk>
>> + */
>> +
>> +#include <linux/spi/spi.h>
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
>> +#include <linux/regmap.h>
>
> Alphabetical.
>

ACK

>> +#include <linux/mfd/tps65912.h>
>> +
>> +static const struct of_device_id tps65912_spi_of_match_table[] = {
>> +	{ .compatible = "ti,tps65912", },
>> +	{ /*sentinel*/ }
>> +};
>> +
>> +static int tps65912_spi_probe(struct spi_device *spi)
>> +{
>> +	struct tps65912 *tps;
>> +	const struct of_device_id *match;
>> +
>> +	match = of_match_device(tps65912_spi_of_match_table, &spi->dev);
>> +	if (!match) {
>> +		dev_err(&spi->dev, "Failed to find matching DT id\n");
>> +		return -EINVAL;
>> +	}
>
> Why are you matching?
>

Same response as above.

>> +	tps = devm_kzalloc(&spi->dev, sizeof(*tps), GFP_KERNEL);
>> +	if (!tps)
>> +		return -ENOMEM;
>> +
>> +	spi_set_drvdata(spi, tps);
>> +	tps->dev = &spi->dev;
>> +	tps->irq = spi->irq;
>> +
>> +	tps->regmap = devm_regmap_init_spi(spi, &tps65912_regmap_config);
>> +	if (IS_ERR(tps->regmap)) {
>> +		int ret = PTR_ERR(tps->regmap);
>> +
>> +		dev_err(tps->dev, "Failed to allocate register map: %d\n",
>> +			ret);
>> +
>> +		return ret;
>> +	}
>> +
>> +	return tps65912_device_init(tps);
>> +}
>> +
>> +static int tps65912_spi_remove(struct spi_device *client)
>> +{
>> +	struct tps65912 *tps = spi_get_drvdata(client);
>> +
>> +	tps65912_device_exit(tps);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct spi_device_id tps65912_spi_id_table[] = {
>> +	{ "tps65912", TPS65912 },
>> +	{ /*sentinel*/ },
>> +};
>> +MODULE_DEVICE_TABLE(spi, tps65912_spi_id_table);
>> +
>> +static struct spi_driver tps65912_spi_driver = {
>> +	.driver		= {
>> +		.name	= "tps65912",
>> +		.owner	= THIS_MODULE,
>
> Remove this line.
>

I wasn't sure about this one, all the SPI drivers I looked at still have
this, but if you are sure this is not needed then I'll remove it.

(also if it is not needed someone could probably remove this from all
these drivers like 816c44c36901 did in power)

Thanks,
Andrew

>> +		.of_match_table = tps65912_spi_of_match_table,
>> +	},
>> +	.probe		= tps65912_spi_probe,
>> +	.remove		= tps65912_spi_remove,
>> +	.id_table       = tps65912_spi_id_table,
>> +};
>> +
>> +module_spi_driver(tps65912_spi_driver);
>> +
>> +MODULE_AUTHOR("Andrew F. Davis <afd@ti.com>");
>> +MODULE_DESCRIPTION("TPS65912x SPI Interface Driver");
>> +MODULE_LICENSE("GPL v2");
>> diff --git a/drivers/regulator/tps65912-regulator.c b/drivers/regulator/tps65912-regulator.c
>> dissimilarity index 94%
>> index 9503d54..3d72f6f 100644
>> --- a/drivers/regulator/tps65912-regulator.c
>> +++ b/drivers/regulator/tps65912-regulator.c
>> @@ -1,541 +1,242 @@
>> -/*
>> - * tps65912.c  --  TI tps65912
>> - *
>> - * Copyright 2011 Texas Instruments Inc.
>> - *
>> - * Author: Margarita Olaya Cabrera <magi@slimlogic.co.uk>
>> - *
>> - *  This program is free software; you can redistribute it and/or modify it
>> - *  under  the terms of the GNU General  Public License as published by the
>> - *  Free Software Foundation;  either version 2 of the License, or (at your
>> - *  option) any later version.
>> - *
>> - * This driver is based on wm8350 implementation.
>> - */
>> -
>> -#include <linux/kernel.h>
>> -#include <linux/module.h>
>> -#include <linux/init.h>
>> -#include <linux/err.h>
>> -#include <linux/platform_device.h>
>> -#include <linux/regulator/driver.h>
>> -#include <linux/regulator/machine.h>
>> -#include <linux/slab.h>
>> -#include <linux/gpio.h>
>> -#include <linux/mfd/tps65912.h>
>> -
>> -/* DCDC's */
>> -#define TPS65912_REG_DCDC1	0
>> -#define TPS65912_REG_DCDC2	1
>> -#define TPS65912_REG_DCDC3	2
>> -#define TPS65912_REG_DCDC4	3
>> -
>> -/* LDOs */
>> -#define TPS65912_REG_LDO1	4
>> -#define TPS65912_REG_LDO2	5
>> -#define TPS65912_REG_LDO3	6
>> -#define TPS65912_REG_LDO4	7
>> -#define TPS65912_REG_LDO5	8
>> -#define TPS65912_REG_LDO6	9
>> -#define TPS65912_REG_LDO7	10
>> -#define TPS65912_REG_LDO8	11
>> -#define TPS65912_REG_LDO9	12
>> -#define TPS65912_REG_LDO10	13
>> -
>> -/* Number of step-down converters available */
>> -#define TPS65912_NUM_DCDC	4
>> -
>> -/* Number of LDO voltage regulators  available */
>> -#define TPS65912_NUM_LDO	10
>> -
>> -/* Number of total regulators available */
>> -#define TPS65912_NUM_REGULATOR		(TPS65912_NUM_DCDC + TPS65912_NUM_LDO)
>> -
>> -#define TPS65912_REG_ENABLED	0x80
>> -#define OP_SELREG_MASK		0x40
>> -#define OP_SELREG_SHIFT		6
>> -
>> -struct tps_info {
>> -	const char *name;
>> -};
>> -
>> -static struct tps_info tps65912_regs[] = {
>> -	{
>> -		.name = "DCDC1",
>> -	},
>> -	{
>> -		.name = "DCDC2",
>> -	},
>> -	{
>> -		.name = "DCDC3",
>> -	},
>> -	{
>> -		.name = "DCDC4",
>> -	},
>> -	{
>> -		.name = "LDO1",
>> -	},
>> -	{
>> -		.name = "LDO2",
>> -	},
>> -	{
>> -		.name = "LDO3",
>> -	},
>> -	{
>> -		.name = "LDO4",
>> -	},
>> -	{
>> -		.name = "LDO5",
>> -	},
>> -	{
>> -		.name = "LDO6",
>> -	},
>> -	{
>> -		.name = "LDO7",
>> -	},
>> -	{
>> -		.name = "LDO8",
>> -	},
>> -	{
>> -		.name = "LDO9",
>> -	},
>> -	{
>> -		.name = "LDO10",
>> -	},
>> -};
>> -
>> -struct tps65912_reg {
>> -	struct regulator_desc desc[TPS65912_NUM_REGULATOR];
>> -	struct tps65912 *mfd;
>> -	struct regulator_dev *rdev[TPS65912_NUM_REGULATOR];
>> -	struct tps_info *info[TPS65912_NUM_REGULATOR];
>> -	/* for read/write access */
>> -	struct mutex io_lock;
>> -	int mode;
>> -	int (*get_ctrl_reg)(int);
>> -	int dcdc_range[TPS65912_NUM_DCDC];
>> -	int pwm_mode_reg;
>> -	int eco_reg;
>> -};
>> -
>> -static const struct regulator_linear_range tps65912_ldo_ranges[] = {
>> -	REGULATOR_LINEAR_RANGE(800000, 0, 32, 25000),
>> -	REGULATOR_LINEAR_RANGE(1650000, 33, 60, 50000),
>> -	REGULATOR_LINEAR_RANGE(3100000, 61, 63, 100000),
>> -};
>> -
>> -static int tps65912_get_range(struct tps65912_reg *pmic, int id)
>> -{
>> -	struct tps65912 *mfd = pmic->mfd;
>> -	int range;
>> -
>> -	switch (id) {
>> -	case TPS65912_REG_DCDC1:
>> -		range = tps65912_reg_read(mfd, TPS65912_DCDC1_LIMIT);
>> -		break;
>> -	case TPS65912_REG_DCDC2:
>> -		range = tps65912_reg_read(mfd, TPS65912_DCDC2_LIMIT);
>> -		break;
>> -	case TPS65912_REG_DCDC3:
>> -		range = tps65912_reg_read(mfd, TPS65912_DCDC3_LIMIT);
>> -		break;
>> -	case TPS65912_REG_DCDC4:
>> -		range = tps65912_reg_read(mfd, TPS65912_DCDC4_LIMIT);
>> -		break;
>> -	default:
>> -		return 0;
>> -	}
>> -
>> -	if (range >= 0)
>> -		range = (range & DCDC_LIMIT_RANGE_MASK)
>> -			>> DCDC_LIMIT_RANGE_SHIFT;
>> -
>> -	pmic->dcdc_range[id] = range;
>> -	return range;
>> -}
>> -
>> -static unsigned long tps65912_vsel_to_uv_range0(u8 vsel)
>> -{
>> -	unsigned long uv;
>> -
>> -	uv = ((vsel * 12500) + 500000);
>> -	return uv;
>> -}
>> -
>> -static unsigned long tps65912_vsel_to_uv_range1(u8 vsel)
>> -{
>> -	unsigned long uv;
>> -
>> -	 uv = ((vsel * 12500) + 700000);
>> -	return uv;
>> -}
>> -
>> -static unsigned long tps65912_vsel_to_uv_range2(u8 vsel)
>> -{
>> -	unsigned long uv;
>> -
>> -	uv = ((vsel * 25000) + 500000);
>> -	return uv;
>> -}
>> -
>> -static unsigned long tps65912_vsel_to_uv_range3(u8 vsel)
>> -{
>> -	unsigned long uv;
>> -
>> -	if (vsel == 0x3f)
>> -		uv = 3800000;
>> -	else
>> -		uv = ((vsel * 50000) + 500000);
>> -
>> -	return uv;
>> -}
>> -
>> -static int tps65912_get_ctrl_register(int id)
>> -{
>> -	if (id >= TPS65912_REG_DCDC1 && id <= TPS65912_REG_LDO4)
>> -		return id * 3 + TPS65912_DCDC1_AVS;
>> -	else if (id >= TPS65912_REG_LDO5 && id <= TPS65912_REG_LDO10)
>> -		return id - TPS65912_REG_LDO5 + TPS65912_LDO5;
>> -	else
>> -		return -EINVAL;
>> -}
>> -
>> -static int tps65912_get_sel_register(struct tps65912_reg *pmic, int id)
>> -{
>> -	struct tps65912 *mfd = pmic->mfd;
>> -	int opvsel;
>> -	u8 reg = 0;
>> -
>> -	if (id >= TPS65912_REG_DCDC1 && id <= TPS65912_REG_LDO4) {
>> -		opvsel = tps65912_reg_read(mfd, id * 3 + TPS65912_DCDC1_OP);
>> -		if (opvsel & OP_SELREG_MASK)
>> -			reg = id * 3 + TPS65912_DCDC1_AVS;
>> -		else
>> -			reg = id * 3 + TPS65912_DCDC1_OP;
>> -	} else if (id >= TPS65912_REG_LDO5 && id <= TPS65912_REG_LDO10) {
>> -		reg = id - TPS65912_REG_LDO5 + TPS65912_LDO5;
>> -	} else {
>> -		return -EINVAL;
>> -	}
>> -
>> -	return reg;
>> -}
>> -
>> -static int tps65912_get_mode_regiters(struct tps65912_reg *pmic, int id)
>> -{
>> -	switch (id) {
>> -	case TPS65912_REG_DCDC1:
>> -		pmic->pwm_mode_reg = TPS65912_DCDC1_CTRL;
>> -		pmic->eco_reg = TPS65912_DCDC1_AVS;
>> -		break;
>> -	case TPS65912_REG_DCDC2:
>> -		pmic->pwm_mode_reg = TPS65912_DCDC2_CTRL;
>> -		pmic->eco_reg = TPS65912_DCDC2_AVS;
>> -		break;
>> -	case TPS65912_REG_DCDC3:
>> -		pmic->pwm_mode_reg = TPS65912_DCDC3_CTRL;
>> -		pmic->eco_reg = TPS65912_DCDC3_AVS;
>> -		break;
>> -	case TPS65912_REG_DCDC4:
>> -		pmic->pwm_mode_reg = TPS65912_DCDC4_CTRL;
>> -		pmic->eco_reg = TPS65912_DCDC4_AVS;
>> -		break;
>> -	default:
>> -		return -EINVAL;
>> -	}
>> -
>> -	return 0;
>> -}
>> -
>> -static int tps65912_reg_is_enabled(struct regulator_dev *dev)
>> -{
>> -	struct tps65912_reg *pmic = rdev_get_drvdata(dev);
>> -	struct tps65912 *mfd = pmic->mfd;
>> -	int reg, value, id = rdev_get_id(dev);
>> -
>> -	if (id < TPS65912_REG_DCDC1 || id > TPS65912_REG_LDO10)
>> -		return -EINVAL;
>> -
>> -	reg = pmic->get_ctrl_reg(id);
>> -	if (reg < 0)
>> -		return reg;
>> -
>> -	value = tps65912_reg_read(mfd, reg);
>> -	if (value < 0)
>> -		return value;
>> -
>> -	return value & TPS65912_REG_ENABLED;
>> -}
>> -
>> -static int tps65912_reg_enable(struct regulator_dev *dev)
>> -{
>> -	struct tps65912_reg *pmic = rdev_get_drvdata(dev);
>> -	struct tps65912 *mfd = pmic->mfd;
>> -	int id = rdev_get_id(dev);
>> -	int reg;
>> -
>> -	if (id < TPS65912_REG_DCDC1 || id > TPS65912_REG_LDO10)
>> -		return -EINVAL;
>> -
>> -	reg = pmic->get_ctrl_reg(id);
>> -	if (reg < 0)
>> -		return reg;
>> -
>> -	return tps65912_set_bits(mfd, reg, TPS65912_REG_ENABLED);
>> -}
>> -
>> -static int tps65912_reg_disable(struct regulator_dev *dev)
>> -{
>> -	struct tps65912_reg *pmic = rdev_get_drvdata(dev);
>> -	struct tps65912 *mfd = pmic->mfd;
>> -	int id = rdev_get_id(dev), reg;
>> -
>> -	reg = pmic->get_ctrl_reg(id);
>> -	if (reg < 0)
>> -		return reg;
>> -
>> -	return tps65912_clear_bits(mfd, reg, TPS65912_REG_ENABLED);
>> -}
>> -
>> -static int tps65912_set_mode(struct regulator_dev *dev, unsigned int mode)
>> -{
>> -	struct tps65912_reg *pmic = rdev_get_drvdata(dev);
>> -	struct tps65912 *mfd = pmic->mfd;
>> -	int pwm_mode, eco, id = rdev_get_id(dev);
>> -
>> -	tps65912_get_mode_regiters(pmic, id);
>> -
>> -	pwm_mode = tps65912_reg_read(mfd, pmic->pwm_mode_reg);
>> -	eco = tps65912_reg_read(mfd, pmic->eco_reg);
>> -
>> -	pwm_mode &= DCDCCTRL_DCDC_MODE_MASK;
>> -	eco &= DCDC_AVS_ECO_MASK;
>> -
>> -	switch (mode) {
>> -	case REGULATOR_MODE_FAST:
>> -		/* Verify if mode alredy set */
>> -		if (pwm_mode && !eco)
>> -			break;
>> -		tps65912_set_bits(mfd, pmic->pwm_mode_reg, DCDCCTRL_DCDC_MODE_MASK);
>> -		tps65912_clear_bits(mfd, pmic->eco_reg, DCDC_AVS_ECO_MASK);
>> -		break;
>> -	case REGULATOR_MODE_NORMAL:
>> -	case REGULATOR_MODE_IDLE:
>> -		if (!pwm_mode && !eco)
>> -			break;
>> -		tps65912_clear_bits(mfd, pmic->pwm_mode_reg, DCDCCTRL_DCDC_MODE_MASK);
>> -		tps65912_clear_bits(mfd, pmic->eco_reg, DCDC_AVS_ECO_MASK);
>> -		break;
>> -	case REGULATOR_MODE_STANDBY:
>> -		if (!pwm_mode && eco)
>> -			break;
>> -		tps65912_clear_bits(mfd, pmic->pwm_mode_reg, DCDCCTRL_DCDC_MODE_MASK);
>> -		tps65912_set_bits(mfd, pmic->eco_reg, DCDC_AVS_ECO_MASK);
>> -		break;
>> -	default:
>> -		return -EINVAL;
>> -	}
>> -
>> -	return 0;
>> -}
>> -
>> -static unsigned int tps65912_get_mode(struct regulator_dev *dev)
>> -{
>> -	struct tps65912_reg *pmic = rdev_get_drvdata(dev);
>> -	struct tps65912 *mfd = pmic->mfd;
>> -	int pwm_mode, eco, mode = 0, id = rdev_get_id(dev);
>> -
>> -	tps65912_get_mode_regiters(pmic, id);
>> -
>> -	pwm_mode = tps65912_reg_read(mfd, pmic->pwm_mode_reg);
>> -	eco = tps65912_reg_read(mfd, pmic->eco_reg);
>> -
>> -	pwm_mode &= DCDCCTRL_DCDC_MODE_MASK;
>> -	eco &= DCDC_AVS_ECO_MASK;
>> -
>> -	if (pwm_mode && !eco)
>> -		mode = REGULATOR_MODE_FAST;
>> -	else if (!pwm_mode && !eco)
>> -		mode = REGULATOR_MODE_NORMAL;
>> -	else if (!pwm_mode && eco)
>> -		mode = REGULATOR_MODE_STANDBY;
>> -
>> -	return mode;
>> -}
>> -
>> -static int tps65912_list_voltage(struct regulator_dev *dev, unsigned selector)
>> -{
>> -	struct tps65912_reg *pmic = rdev_get_drvdata(dev);
>> -	int range, voltage = 0, id = rdev_get_id(dev);
>> -
>> -	if (id > TPS65912_REG_DCDC4)
>> -		return -EINVAL;
>> -
>> -	range = pmic->dcdc_range[id];
>> -
>> -	switch (range) {
>> -	case 0:
>> -		/* 0.5 - 1.2875V in 12.5mV steps */
>> -		voltage = tps65912_vsel_to_uv_range0(selector);
>> -		break;
>> -	case 1:
>> -		/* 0.7 - 1.4875V in 12.5mV steps */
>> -		voltage = tps65912_vsel_to_uv_range1(selector);
>> -		break;
>> -	case 2:
>> -		/* 0.5 - 2.075V in 25mV steps */
>> -		voltage = tps65912_vsel_to_uv_range2(selector);
>> -		break;
>> -	case 3:
>> -		/* 0.5 - 3.8V in 50mV steps */
>> -		voltage = tps65912_vsel_to_uv_range3(selector);
>> -		break;
>> -	}
>> -	return voltage;
>> -}
>> -
>> -static int tps65912_get_voltage_sel(struct regulator_dev *dev)
>> -{
>> -	struct tps65912_reg *pmic = rdev_get_drvdata(dev);
>> -	struct tps65912 *mfd = pmic->mfd;
>> -	int id = rdev_get_id(dev);
>> -	int reg, vsel;
>> -
>> -	reg = tps65912_get_sel_register(pmic, id);
>> -	if (reg < 0)
>> -		return reg;
>> -
>> -	vsel = tps65912_reg_read(mfd, reg);
>> -	vsel &= 0x3F;
>> -
>> -	return vsel;
>> -}
>> -
>> -static int tps65912_set_voltage_sel(struct regulator_dev *dev,
>> -					 unsigned selector)
>> -{
>> -	struct tps65912_reg *pmic = rdev_get_drvdata(dev);
>> -	struct tps65912 *mfd = pmic->mfd;
>> -	int id = rdev_get_id(dev);
>> -	int value;
>> -	u8 reg;
>> -
>> -	reg = tps65912_get_sel_register(pmic, id);
>> -	value = tps65912_reg_read(mfd, reg);
>> -	value &= 0xC0;
>> -	return tps65912_reg_write(mfd, reg, selector | value);
>> -}
>> -
>> -/* Operations permitted on DCDCx */
>> -static struct regulator_ops tps65912_ops_dcdc = {
>> -	.is_enabled = tps65912_reg_is_enabled,
>> -	.enable = tps65912_reg_enable,
>> -	.disable = tps65912_reg_disable,
>> -	.set_mode = tps65912_set_mode,
>> -	.get_mode = tps65912_get_mode,
>> -	.get_voltage_sel = tps65912_get_voltage_sel,
>> -	.set_voltage_sel = tps65912_set_voltage_sel,
>> -	.list_voltage = tps65912_list_voltage,
>> -};
>> -
>> -/* Operations permitted on LDOx */
>> -static struct regulator_ops tps65912_ops_ldo = {
>> -	.is_enabled = tps65912_reg_is_enabled,
>> -	.enable = tps65912_reg_enable,
>> -	.disable = tps65912_reg_disable,
>> -	.get_voltage_sel = tps65912_get_voltage_sel,
>> -	.set_voltage_sel = tps65912_set_voltage_sel,
>> -	.list_voltage = regulator_list_voltage_linear_range,
>> -	.map_voltage = regulator_map_voltage_linear_range,
>> -};
>> -
>> -static int tps65912_probe(struct platform_device *pdev)
>> -{
>> -	struct tps65912 *tps65912 = dev_get_drvdata(pdev->dev.parent);
>> -	struct regulator_config config = { };
>> -	struct tps_info *info;
>> -	struct regulator_init_data *reg_data;
>> -	struct regulator_dev *rdev;
>> -	struct tps65912_reg *pmic;
>> -	struct tps65912_board *pmic_plat_data;
>> -	int i;
>> -
>> -	pmic_plat_data = dev_get_platdata(tps65912->dev);
>> -	if (!pmic_plat_data)
>> -		return -EINVAL;
>> -
>> -	reg_data = pmic_plat_data->tps65912_pmic_init_data;
>> -
>> -	pmic = devm_kzalloc(&pdev->dev, sizeof(*pmic), GFP_KERNEL);
>> -	if (!pmic)
>> -		return -ENOMEM;
>> -
>> -	mutex_init(&pmic->io_lock);
>> -	pmic->mfd = tps65912;
>> -	platform_set_drvdata(pdev, pmic);
>> -
>> -	pmic->get_ctrl_reg = &tps65912_get_ctrl_register;
>> -	info = tps65912_regs;
>> -
>> -	for (i = 0; i < TPS65912_NUM_REGULATOR; i++, info++, reg_data++) {
>> -		int range = 0;
>> -		/* Register the regulators */
>> -		pmic->info[i] = info;
>> -
>> -		pmic->desc[i].name = info->name;
>> -		pmic->desc[i].id = i;
>> -		pmic->desc[i].n_voltages = 64;
>> -		if (i > TPS65912_REG_DCDC4) {
>> -			pmic->desc[i].ops = &tps65912_ops_ldo;
>> -			pmic->desc[i].linear_ranges = tps65912_ldo_ranges;
>> -			pmic->desc[i].n_linear_ranges =
>> -					ARRAY_SIZE(tps65912_ldo_ranges);
>> -		} else {
>> -			pmic->desc[i].ops = &tps65912_ops_dcdc;
>> -		}
>> -		pmic->desc[i].type = REGULATOR_VOLTAGE;
>> -		pmic->desc[i].owner = THIS_MODULE;
>> -		range = tps65912_get_range(pmic, i);
>> -
>> -		config.dev = tps65912->dev;
>> -		config.init_data = reg_data;
>> -		config.driver_data = pmic;
>> -
>> -		rdev = devm_regulator_register(&pdev->dev, &pmic->desc[i],
>> -					       &config);
>> -		if (IS_ERR(rdev)) {
>> -			dev_err(tps65912->dev,
>> -				"failed to register %s regulator\n",
>> -				pdev->name);
>> -			return PTR_ERR(rdev);
>> -		}
>> -
>> -		/* Save regulator for cleanup */
>> -		pmic->rdev[i] = rdev;
>> -	}
>> -	return 0;
>> -}
>> -
>> -static struct platform_driver tps65912_driver = {
>> -	.driver = {
>> -		.name = "tps65912-pmic",
>> -	},
>> -	.probe = tps65912_probe,
>> -};
>> -
>> -static int __init tps65912_init(void)
>> -{
>> -	return platform_driver_register(&tps65912_driver);
>> -}
>> -subsys_initcall(tps65912_init);
>> -
>> -static void __exit tps65912_cleanup(void)
>> -{
>> -	platform_driver_unregister(&tps65912_driver);
>> -}
>> -module_exit(tps65912_cleanup);
>> -
>> -MODULE_AUTHOR("Margarita Olaya Cabrera <magi@slimlogic.co.uk>");
>> -MODULE_DESCRIPTION("TPS65912 voltage regulator driver");
>> -MODULE_LICENSE("GPL v2");
>> -MODULE_ALIAS("platform:tps65912-pmic");
>> +/*
>> + * tps65912-regulator.c
>> + *
>> + * Regulator driver for TPS65912 PMIC
>> + *
>> + * Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
>> + *
>> + * Author: Andrew F. Davis <afd@ti.com>
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + *
>> + * This program is distributed "as is" WITHOUT ANY WARRANTY of any
>> + * kind, whether expressed or implied; without even the implied warranty
>> + * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License version 2 for more details.
>> + *
>> + * Based on the TPS65218 driver and the previous TPS65912 driver by
>> + * Margarita Olaya Cabrera <magi@slimlogic.co.uk>
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regulator/driver.h>
>> +#include <linux/regulator/of_regulator.h>
>> +
>> +#include <linux/mfd/tps65912.h>
>> +
>> +enum tps65912_regulators { DCDC1, DCDC2, DCDC3, DCDC4, LDO1, LDO2, LDO3,
>> +	LDO4, LDO5, LDO6, LDO7, LDO8, LDO9, LDO10 };
>> +
>> +#define TPS65912_REGULATOR(_name, _id, _ops, _vr, _er, _lr, _nlr)	\
>> +	{								\
>> +		.name			= _name,			\
>> +		.id			= _id,				\
>> +		.ops			= &_ops,			\
>> +		.n_voltages		= 64,				\
>> +		.type			= REGULATOR_VOLTAGE,		\
>> +		.owner			= THIS_MODULE,			\
>> +		.vsel_reg		= _vr,				\
>> +		.vsel_mask		= 0x3f,				\
>> +		.enable_reg		= _er,				\
>> +		.enable_mask		= BIT(7),			\
>> +		.volt_table		= NULL,				\
>> +		.linear_ranges		= _lr,				\
>> +		.n_linear_ranges	= _nlr,				\
>> +	}								\
>> +
>> +#define TPS65912_INFO(_id, _nm, _min, _max)	\
>> +	[_id] = {					\
>> +		.id		= _id,			\
>> +		.name		= _nm,			\
>> +		.min_uV		= _min,			\
>> +		.max_uV		= _max,			\
>> +	}
>> +
>> +static const struct regulator_linear_range tps65912_dcdc_ranges[] = {
>> +	REGULATOR_LINEAR_RANGE(500000, 0x0, 0x3f, 50000),
>> +};
>> +
>> +static const struct regulator_linear_range tps65912_ldo_ranges[] = {
>> +	REGULATOR_LINEAR_RANGE(800000, 0x0, 0x20, 25000),
>> +	REGULATOR_LINEAR_RANGE(1650000, 0x21, 0x3c, 50000),
>> +	REGULATOR_LINEAR_RANGE(3100000, 0x3d, 0x3f, 100000),
>> +};
>> +
>> +static struct tps_info tps65912_pmic_regs[] = {
>> +	TPS65912_INFO(DCDC1, "DCDC1", 500000, 3800000),
>> +	TPS65912_INFO(DCDC2, "DCDC2", 500000, 3800000),
>> +	TPS65912_INFO(DCDC3, "DCDC3", 500000, 3800000),
>> +	TPS65912_INFO(DCDC4, "DCDC4", 500000, 3800000),
>> +	TPS65912_INFO(LDO1, "LDO1", 800000, 3300000),
>> +	TPS65912_INFO(LDO2, "LDO2", 800000, 3300000),
>> +	TPS65912_INFO(LDO3, "LDO3", 800000, 3300000),
>> +	TPS65912_INFO(LDO4, "LDO4", 1600000, 3300000),
>> +	TPS65912_INFO(LDO5, "LDO5", 1600000, 3300000),
>> +	TPS65912_INFO(LDO6, "LDO6", 800000, 3300000),
>> +	TPS65912_INFO(LDO7, "LDO7", 800000, 3300000),
>> +	TPS65912_INFO(LDO8, "LDO8", 800000, 3300000),
>> +	TPS65912_INFO(LDO9, "LDO9", 800000, 3300000),
>> +	TPS65912_INFO(LDO10, "LDO10", 800000, 3300000),
>> +};
>> +
>> +#define TPS65912_OF_MATCH(comp, label) \
>> +	{ \
>> +		.compatible = comp, \
>> +		.data = &label, \
>> +	}
>> +
>> +static const struct of_device_id tps65912_regulator_of_match_table[] = {
>> +	TPS65912_OF_MATCH("ti,tps65912-dcdc1", tps65912_pmic_regs[DCDC1]),
>> +	TPS65912_OF_MATCH("ti,tps65912-dcdc2", tps65912_pmic_regs[DCDC2]),
>> +	TPS65912_OF_MATCH("ti,tps65912-dcdc3", tps65912_pmic_regs[DCDC3]),
>> +	TPS65912_OF_MATCH("ti,tps65912-dcdc4", tps65912_pmic_regs[DCDC4]),
>> +	TPS65912_OF_MATCH("ti,tps65912-ldo1", tps65912_pmic_regs[LDO1]),
>> +	TPS65912_OF_MATCH("ti,tps65912-ldo2", tps65912_pmic_regs[LDO2]),
>> +	TPS65912_OF_MATCH("ti,tps65912-ldo3", tps65912_pmic_regs[LDO3]),
>> +	TPS65912_OF_MATCH("ti,tps65912-ldo4", tps65912_pmic_regs[LDO4]),
>> +	TPS65912_OF_MATCH("ti,tps65912-ldo5", tps65912_pmic_regs[LDO5]),
>> +	TPS65912_OF_MATCH("ti,tps65912-ldo6", tps65912_pmic_regs[LDO6]),
>> +	TPS65912_OF_MATCH("ti,tps65912-ldo7", tps65912_pmic_regs[LDO7]),
>> +	TPS65912_OF_MATCH("ti,tps65912-ldo8", tps65912_pmic_regs[LDO8]),
>> +	TPS65912_OF_MATCH("ti,tps65912-ldo9", tps65912_pmic_regs[LDO9]),
>> +	TPS65912_OF_MATCH("ti,tps65912-ldo10", tps65912_pmic_regs[LDO10]),
>> +	{ /*sentinel*/ },
>> +};
>> +MODULE_DEVICE_TABLE(of, tps65912_regulator_of_match_table);
>> +
>> +/* Operations permitted on DCDCx */
>> +static struct regulator_ops tps65912_ops_dcdc = {
>> +	.is_enabled		= regulator_is_enabled_regmap,
>> +	.enable			= regulator_enable_regmap,
>> +	.disable		= regulator_disable_regmap,
>> +	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
>> +	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
>> +	.list_voltage		= regulator_list_voltage_linear_range,
>> +};
>> +
>> +/* Operations permitted on LDOx */
>> +static struct regulator_ops tps65912_ops_ldo = {
>> +	.is_enabled		= regulator_is_enabled_regmap,
>> +	.enable			= regulator_enable_regmap,
>> +	.disable		= regulator_disable_regmap,
>> +	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
>> +	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
>> +	.list_voltage		= regulator_list_voltage_linear_range,
>> +	.map_voltage		= regulator_map_voltage_linear_range,
>> +};
>> +
>> +static const struct regulator_desc regulators[] = {
>> +	TPS65912_REGULATOR("DCDC1", TPS65912_DCDC_1, tps65912_ops_dcdc,
>> +			   TPS65912_DCDC1_OP, TPS65912_DCDC1_CTRL,
>> +			   tps65912_dcdc_ranges,
>> +			   ARRAY_SIZE(tps65912_dcdc_ranges)),
>> +	TPS65912_REGULATOR("DCDC2", TPS65912_DCDC_2, tps65912_ops_dcdc,
>> +			   TPS65912_DCDC2_OP, TPS65912_DCDC2_CTRL,
>> +			   tps65912_dcdc_ranges,
>> +			   ARRAY_SIZE(tps65912_dcdc_ranges)),
>> +	TPS65912_REGULATOR("DCDC3", TPS65912_DCDC_3, tps65912_ops_dcdc,
>> +			   TPS65912_DCDC3_OP, TPS65912_DCDC3_CTRL,
>> +			   tps65912_dcdc_ranges,
>> +			   ARRAY_SIZE(tps65912_dcdc_ranges)),
>> +	TPS65912_REGULATOR("DCDC4", TPS65912_DCDC_4, tps65912_ops_dcdc,
>> +			   TPS65912_DCDC4_OP, TPS65912_DCDC4_CTRL,
>> +			   tps65912_dcdc_ranges,
>> +			   ARRAY_SIZE(tps65912_dcdc_ranges)),
>> +	TPS65912_REGULATOR("LDO1", TPS65912_LDO_1, tps65912_ops_ldo,
>> +			   TPS65912_LDO1_OP, TPS65912_LDO1_AVS,
>> +			   tps65912_ldo_ranges,
>> +			   ARRAY_SIZE(tps65912_ldo_ranges)),
>> +	TPS65912_REGULATOR("LDO2", TPS65912_LDO_2, tps65912_ops_ldo,
>> +			   TPS65912_LDO2_OP, TPS65912_LDO2_AVS,
>> +			   tps65912_ldo_ranges,
>> +			   ARRAY_SIZE(tps65912_ldo_ranges)),
>> +	TPS65912_REGULATOR("LDO3", TPS65912_LDO_3, tps65912_ops_ldo,
>> +			   TPS65912_LDO3_OP, TPS65912_LDO3_AVS,
>> +			   tps65912_ldo_ranges,
>> +			   ARRAY_SIZE(tps65912_ldo_ranges)),
>> +	TPS65912_REGULATOR("LDO4", TPS65912_LDO_4, tps65912_ops_ldo,
>> +			   TPS65912_LDO4_OP, TPS65912_LDO4_AVS,
>> +			   tps65912_ldo_ranges,
>> +			   ARRAY_SIZE(tps65912_ldo_ranges)),
>> +	TPS65912_REGULATOR("LDO5", TPS65912_LDO_5, tps65912_ops_ldo,
>> +			   TPS65912_LDO5, TPS65912_LDO5,
>> +			   tps65912_ldo_ranges,
>> +			   ARRAY_SIZE(tps65912_ldo_ranges)),
>> +	TPS65912_REGULATOR("LDO6", TPS65912_LDO_6, tps65912_ops_ldo,
>> +			   TPS65912_LDO6, TPS65912_LDO6,
>> +			   tps65912_ldo_ranges,
>> +			   ARRAY_SIZE(tps65912_ldo_ranges)),
>> +	TPS65912_REGULATOR("LDO7", TPS65912_LDO_7, tps65912_ops_ldo,
>> +			   TPS65912_LDO7, TPS65912_LDO7,
>> +			   tps65912_ldo_ranges,
>> +			   ARRAY_SIZE(tps65912_ldo_ranges)),
>> +	TPS65912_REGULATOR("LDO8", TPS65912_LDO_8, tps65912_ops_ldo,
>> +			   TPS65912_LDO8, TPS65912_LDO8,
>> +			   tps65912_ldo_ranges,
>> +			   ARRAY_SIZE(tps65912_ldo_ranges)),
>> +	TPS65912_REGULATOR("LDO9", TPS65912_LDO_9, tps65912_ops_ldo,
>> +			   TPS65912_LDO9, TPS65912_LDO9,
>> +			   tps65912_ldo_ranges,
>> +			   ARRAY_SIZE(tps65912_ldo_ranges)),
>> +	TPS65912_REGULATOR("LDO10", TPS65912_LDO_10, tps65912_ops_ldo,
>> +			   TPS65912_LDO10, TPS65912_LDO10,
>> +			   tps65912_ldo_ranges,
>> +			   ARRAY_SIZE(tps65912_ldo_ranges)),
>> +};
>> +
>> +static int tps65912_regulator_probe(struct platform_device *pdev)
>> +{
>> +	struct tps65912 *tps = dev_get_drvdata(pdev->dev.parent);
>> +	struct regulator_init_data *init_data;
>> +	const struct tps_info *template;
>> +	struct regulator_dev *rdev;
>> +	const struct of_device_id *match;
>> +	struct regulator_config config = { };
>> +	int id;
>> +
>> +	match = of_match_device(tps65912_regulator_of_match_table, &pdev->dev);
>> +	if (!match)
>> +		return -ENODEV;
>> +
>> +	template = match->data;
>> +	id = template->id;
>> +	init_data = of_get_regulator_init_data(&pdev->dev, pdev->dev.of_node,
>> +					       &regulators[id]);
>> +
>> +	platform_set_drvdata(pdev, tps);
>> +
>> +	tps->info[id] = &tps65912_pmic_regs[id];
>> +	config.dev = &pdev->dev;
>> +	config.init_data = init_data;
>> +	config.driver_data = tps;
>> +	config.regmap = tps->regmap;
>> +	config.of_node = pdev->dev.of_node;
>> +
>> +	rdev = devm_regulator_register(&pdev->dev, &regulators[id], &config);
>> +	if (IS_ERR(rdev)) {
>> +		dev_err(tps->dev, "failed to register %s regulator\n",
>> +			pdev->name);
>> +		return PTR_ERR(rdev);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static struct platform_driver tps65912_regulator_driver = {
>> +	.driver = {
>> +		.name = "tps65912-pmic",
>> +		.of_match_table = tps65912_regulator_of_match_table,
>> +	},
>> +	.probe = tps65912_regulator_probe,
>> +};
>> +
>> +module_platform_driver(tps65912_regulator_driver);
>> +
>> +MODULE_AUTHOR("Andrew F. Davis <afd@ti.com>");
>> +MODULE_DESCRIPTION("TPS65912 voltage regulator driver");
>> +MODULE_ALIAS("platform:tps65912-pmic");
>> +MODULE_LICENSE("GPL v2");
>> diff --git a/include/linux/mfd/tps65912.h b/include/linux/mfd/tps65912.h
>> index 6d30903..ab91c12 100644
>> --- a/include/linux/mfd/tps65912.h
>> +++ b/include/linux/mfd/tps65912.h
>> @@ -1,28 +1,34 @@
>>   /*
>> - * tps65912.h  --  TI TPS6591x
>> + * tps65912.h -- TI TPS65912x
>>    *
>> - * Copyright 2011 Texas Instruments Inc.
>> + * Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
>>    *
>> - * Author: Margarita Olaya <magi@slimlogic.co.uk>
>> + * Author: Andrew F. Davis <afd@ti.com>
>>    *
>> - *  This program is free software; you can redistribute it and/or modify it
>> - *  under  the terms of the GNU General  Public License as published by the
>> - *  Free Software Foundation;  either version 2 of the License, or (at your
>> - *  option) any later version.
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>>    *
>> + * This program is distributed "as is" WITHOUT ANY WARRANTY of any
>> + * kind, whether expressed or implied; without even the implied warranty
>> + * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License version 2 for more details.
>> + *
>> + * Based on the TPS65218 driver and the previous TPS65912 driver by
>> + * Margarita Olaya Cabrera <magi@slimlogic.co.uk>
>>    */
>>
>>   #ifndef __LINUX_MFD_TPS65912_H
>>   #define __LINUX_MFD_TPS65912_H
>>
>> -/* TPS regulator type list */
>> -#define REGULATOR_LDO		0
>> -#define REGULATOR_DCDC		1
>> +#include <linux/device.h>
>> +#include <linux/regmap.h>
>> +#include <linux/regulator/driver.h>
>>
>> -/*
>> - * List of registers for TPS65912
>> - */
>> +/* TPS chip id list */
>> +#define TPS65912			0x00
>>
>> +/* List of registers for TPS65912 */
>>   #define TPS65912_DCDC1_CTRL		0x00
>>   #define TPS65912_DCDC2_CTRL		0x01
>>   #define TPS65912_DCDC3_CTRL		0x02
>> @@ -126,41 +132,45 @@
>>   #define TPS65912_VERNUM			0x64
>>   #define TPS6591X_MAX_REGISTER		0x64
>>
>> -/* IRQ Definitions */
>> -#define TPS65912_IRQ_PWRHOLD_F		0
>> -#define TPS65912_IRQ_VMON		1
>> -#define TPS65912_IRQ_PWRON		2
>> -#define TPS65912_IRQ_PWRON_LP		3
>> -#define TPS65912_IRQ_PWRHOLD_R		4
>> -#define TPS65912_IRQ_HOTDIE		5
>> -#define TPS65912_IRQ_GPIO1_R		6
>> -#define TPS65912_IRQ_GPIO1_F		7
>> -#define TPS65912_IRQ_GPIO2_R		8
>> -#define TPS65912_IRQ_GPIO2_F		9
>> -#define TPS65912_IRQ_GPIO3_R		10
>> -#define TPS65912_IRQ_GPIO3_F		11
>> -#define TPS65912_IRQ_GPIO4_R		12
>> -#define TPS65912_IRQ_GPIO4_F		13
>> -#define TPS65912_IRQ_GPIO5_R		14
>> -#define TPS65912_IRQ_GPIO5_F		15
>> -#define TPS65912_IRQ_PGOOD_DCDC1	16
>> -#define TPS65912_IRQ_PGOOD_DCDC2	17
>> -#define TPS65912_IRQ_PGOOD_DCDC3	18
>> -#define TPS65912_IRQ_PGOOD_DCDC4	19
>> -#define TPS65912_IRQ_PGOOD_LDO1		20
>> -#define TPS65912_IRQ_PGOOD_LDO2		21
>> -#define TPS65912_IRQ_PGOOD_LDO3		22
>> -#define TPS65912_IRQ_PGOOD_LDO4		23
>> -#define TPS65912_IRQ_PGOOD_LDO5		24
>> -#define TPS65912_IRQ_PGOOD_LDO6		25
>> -#define TPS65912_IRQ_PGOOD_LDO7		26
>> -#define TPS65912_IRQ_PGOOD_LD08		27
>> -#define TPS65912_IRQ_PGOOD_LDO9		28
>> -#define TPS65912_IRQ_PGOOD_LDO10	29
>> +/* INT_STS Register field definitions */
>> +#define TPS65912_INT_STS_PWRHOLD_F	BIT(0)
>> +#define TPS65912_INT_STS_VMON		BIT(1)
>> +#define TPS65912_INT_STS_PWRON		BIT(2)
>> +#define TPS65912_INT_STS_PWRON_LP	BIT(3)
>> +#define TPS65912_INT_STS_PWRHOLD_R	BIT(4)
>> +#define TPS65912_INT_STS_HOTDIE		BIT(5)
>> +#define TPS65912_INT_STS_GPIO1_R	BIT(6)
>> +#define TPS65912_INT_STS_GPIO1_F	BIT(7)
>>
>> -#define TPS65912_NUM_IRQ		30
>> +/* INT_STS Register field definitions */
>> +#define TPS65912_INT_STS2_GPIO2_R	BIT(0)
>> +#define TPS65912_INT_STS2_GPIO2_F	BIT(1)
>> +#define TPS65912_INT_STS2_GPIO3_R	BIT(2)
>> +#define TPS65912_INT_STS2_GPIO3_F	BIT(3)
>> +#define TPS65912_INT_STS2_GPIO4_R	BIT(4)
>> +#define TPS65912_INT_STS2_GPIO4_F	BIT(5)
>> +#define TPS65912_INT_STS2_GPIO5_R	BIT(6)
>> +#define TPS65912_INT_STS2_GPIO5_F	BIT(7)
>>
>> -/* GPIO 1 and 2 Register Definitions */
>> +/* INT_STS Register field definitions */
>> +#define TPS65912_INT_STS3_PGOOD_DCDC1	BIT(0)
>> +#define TPS65912_INT_STS3_PGOOD_DCDC2	BIT(1)
>> +#define TPS65912_INT_STS3_PGOOD_DCDC3	BIT(2)
>> +#define TPS65912_INT_STS3_PGOOD_DCDC4	BIT(3)
>> +#define TPS65912_INT_STS3_PGOOD_LDO1	BIT(4)
>> +#define TPS65912_INT_STS3_PGOOD_LDO2	BIT(5)
>> +#define TPS65912_INT_STS3_PGOOD_LDO3	BIT(6)
>> +#define TPS65912_INT_STS3_PGOOD_LDO4	BIT(7)
>> +
>> +/* INT_STS Register field definitions */
>> +#define TPS65912_INT_STS4_PGOOD_LDO5	BIT(0)
>> +#define TPS65912_INT_STS4_PGOOD_LDO6	BIT(1)
>> +#define TPS65912_INT_STS4_PGOOD_LDO7	BIT(2)
>> +#define TPS65912_INT_STS4_PGOOD_LDO8	BIT(3)
>> +#define TPS65912_INT_STS4_PGOOD_LDO9	BIT(4)
>> +#define TPS65912_INT_STS4_PGOOD_LDO10	BIT(5)
>> +
>> +/* GPIO 1 and 2 Register field definitions */
>>   #define GPIO_SLEEP_MASK			0x80
>>   #define GPIO_SLEEP_SHIFT		7
>>   #define GPIO_DEB_MASK			0x10
>> @@ -172,7 +182,7 @@
>>   #define GPIO_SET_MASK			0x01
>>   #define GPIO_SET_SHIFT			0
>>
>> -/* GPIO 3 Register Definitions */
>> +/* GPIO 3 Register field definitions */
>>   #define GPIO3_SLEEP_MASK		0x80
>>   #define GPIO3_SLEEP_SHIFT		7
>>   #define GPIO3_SEL_MASK			0x40
>> @@ -190,7 +200,7 @@
>>   #define GPIO3_SET_MASK			0x01
>>   #define GPIO3_SET_SHIFT			0
>>
>> -/* GPIO 4 Register Definitions */
>> +/* GPIO 4 Register field definitions */
>>   #define GPIO4_SLEEP_MASK		0x80
>>   #define GPIO4_SLEEP_SHIFT		7
>>   #define GPIO4_SEL_MASK			0x40
>> @@ -264,65 +274,123 @@
>>   #define DCDC_LIMIT_MAX_SEL_MASK		0x3F
>>   #define DCDC_LIMIT_MAX_SEL_SHIFT	0
>>
>> -/**
>> - * struct tps65912_board
>> - * Board platform dat may be used to initialize regulators.
>> - */
>> -struct tps65912_board {
>> -	int is_dcdc1_avs;
>> -	int is_dcdc2_avs;
>> -	int is_dcdc3_avs;
>> -	int is_dcdc4_avs;
>> -	int irq;
>> -	int irq_base;
>> -	int gpio_base;
>> -	struct regulator_init_data *tps65912_pmic_init_data;
>> +enum tps65912_regulator_id {
>> +	/* DCDC's */
>> +	TPS65912_DCDC_1,
>> +	TPS65912_DCDC_2,
>> +	TPS65912_DCDC_3,
>> +	TPS65912_DCDC_4,
>> +	/* LDOs */
>> +	TPS65912_LDO_1,
>> +	TPS65912_LDO_2,
>> +	TPS65912_LDO_3,
>> +	TPS65912_LDO_4,
>> +	TPS65912_LDO_5,
>> +	TPS65912_LDO_6,
>> +	TPS65912_LDO_7,
>> +	TPS65912_LDO_8,
>> +	TPS65912_LDO_9,
>> +	TPS65912_LDO_10,
>> +};
>> +
>> +#define TPS65912_MAX_REG_ID		TPS65912_LDO_10
>> +
>> +/* Number of step-down converters available */
>> +#define TPS65912_NUM_DCDC		4
>> +/* Number of LDO voltage regulators available */
>> +#define TPS65912_NUM_LDO		10
>> +/* Number of total regulators available */
>> +#define TPS65912_NUM_REGULATOR		(TPS65912_NUM_DCDC + TPS65912_NUM_LDO)
>> +
>> +/* Define the TPS65912 IRQ numbers */
>> +enum tps65912_irqs {
>> +	/* INT_STS registers */
>> +	TPS65912_IRQ_PWRHOLD_F,
>> +	TPS65912_IRQ_VMON,
>> +	TPS65912_IRQ_PWRON,
>> +	TPS65912_IRQ_PWRON_LP,
>> +	TPS65912_IRQ_PWRHOLD_R,
>> +	TPS65912_IRQ_HOTDIE,
>> +	TPS65912_IRQ_GPIO1_R,
>> +	TPS65912_IRQ_GPIO1_F,
>> +	/* INT_STS2 registers */
>> +	TPS65912_IRQ_GPIO2_R,
>> +	TPS65912_IRQ_GPIO2_F,
>> +	TPS65912_IRQ_GPIO3_R,
>> +	TPS65912_IRQ_GPIO3_F,
>> +	TPS65912_IRQ_GPIO4_R,
>> +	TPS65912_IRQ_GPIO4_F,
>> +	TPS65912_IRQ_GPIO5_R,
>> +	TPS65912_IRQ_GPIO5_F,
>> +	/* INT_STS3 registers */
>> +	TPS65912_IRQ_PGOOD_DCDC1,
>> +	TPS65912_IRQ_PGOOD_DCDC2,
>> +	TPS65912_IRQ_PGOOD_DCDC3,
>> +	TPS65912_IRQ_PGOOD_DCDC4,
>> +	TPS65912_IRQ_PGOOD_LDO1,
>> +	TPS65912_IRQ_PGOOD_LDO2,
>> +	TPS65912_IRQ_PGOOD_LDO3,
>> +	TPS65912_IRQ_PGOOD_LDO4,
>> +	/* INT_STS4 registers */
>> +	TPS65912_IRQ_PGOOD_LDO5,
>> +	TPS65912_IRQ_PGOOD_LDO6,
>> +	TPS65912_IRQ_PGOOD_LDO7,
>> +	TPS65912_IRQ_PGOOD_LDO8,
>> +	TPS65912_IRQ_PGOOD_LDO9,
>> +	TPS65912_IRQ_PGOOD_LDO10,
>>   };
>>
>> -/**
>> - * struct tps65912 - tps65912 sub-driver chip access routines
>> +/*
>> + * struct tps_info - packages regulator constraints
>> + * @id: Id of the regulator
>> + * @name: Voltage regulator name
>> + * @min_uV: Minimum micro volts
>> + * @max_uV: Minimum micro volts
>> + *
>> + * This data is used to check the regualtor voltage limits while setting.
>>    */
>> +struct tps_info {
>> +	int id;
>> +	const char *name;
>> +	int min_uV;
>> +	int max_uV;
>> +};
>>
>> +/*
>> + * struct tps65912 - state holder for the tps65912 driver
>> + *
>> + * Device data may be used to access the TPS65912 chip
>> + */
>>   struct tps65912 {
>>   	struct device *dev;
>> -	/* for read/write acces */
>> -	struct mutex io_mutex;
>> -
>> -	/* For device IO interfaces: I2C or SPI */
>> -	void *control_data;
>> +	unsigned int id;
>>
>> -	int (*read)(struct tps65912 *tps65912, u8 reg, int size, void *dest);
>> -	int (*write)(struct tps65912 *tps65912, u8 reg, int size, void *src);
>> -
>> -	/* Client devices */
>> -	struct tps65912_pmic *pmic;
>> +	/* IRQ Data */
>> +	int irq;
>> +	struct regmap_irq_chip_data *irq_data;
>>
>> -	/* GPIO Handling */
>> -	struct gpio_chip gpio;
>> +	struct regulator_desc desc[TPS65912_NUM_REGULATOR];
>> +	struct tps_info *info[TPS65912_NUM_REGULATOR];
>> +	struct regmap *regmap;
>> +};
>>
>> -	/* IRQ Handling */
>> -	struct mutex irq_lock;
>> -	int chip_irq;
>> -	int irq_base;
>> -	int irq_num;
>> -	u32 irq_mask;
>> +static const struct regmap_range tps65912_yes_ranges[] = {
>> +	regmap_reg_range(TPS65912_INT_STS, TPS65912_GPIO5),
>>   };
>>
>> -struct tps65912_platform_data {
>> -	int irq;
>> -	int irq_base;
>> +static const struct regmap_access_table tps65912_volatile_table = {
>> +	.yes_ranges = tps65912_yes_ranges,
>> +	.n_yes_ranges = ARRAY_SIZE(tps65912_yes_ranges),
>>   };
>>
>> -unsigned int tps_chip(void);
>> +static const struct regmap_config tps65912_regmap_config = {
>> +	.reg_bits = 8,
>> +	.val_bits = 8,
>> +	.cache_type = REGCACHE_RBTREE,
>> +	.volatile_table = &tps65912_volatile_table,
>> +};
>>
>> -int tps65912_set_bits(struct tps65912 *tps65912, u8 reg, u8 mask);
>> -int tps65912_clear_bits(struct tps65912 *tps65912, u8 reg, u8 mask);
>> -int tps65912_reg_read(struct tps65912 *tps65912, u8 reg);
>> -int tps65912_reg_write(struct tps65912 *tps65912, u8 reg, u8 val);
>> -int tps65912_device_init(struct tps65912 *tps65912);
>> -void tps65912_device_exit(struct tps65912 *tps65912);
>> -int tps65912_irq_init(struct tps65912 *tps65912, int irq,
>> -			struct tps65912_platform_data *pdata);
>> -int tps65912_irq_exit(struct tps65912 *tps65912);
>> +int tps65912_device_init(struct tps65912 *tps);
>> +void tps65912_device_exit(struct tps65912 *tps);
>>
>>   #endif /*  __LINUX_MFD_TPS65912_H */
>
