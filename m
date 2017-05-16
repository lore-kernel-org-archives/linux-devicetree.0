From: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 6/6] pintrl: meson: add support for GPIO interrupts
Date: Wed, 17 May 2017 01:07:52 +0200
Message-ID: <1494976072.2728.5.camel@baylibre.com>
References: <36164ed8-aa59-2a77-b7fc-9adce03a2fc1@gmail.com>
         <dc23b800-fe69-8143-6367-d3cd801cd6db@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <dc23b800-fe69-8143-6367-d3cd801cd6db-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2017-05-12 at 21:14 +0200, Heiner Kallweit wrote:
> Add support for GPIO interrupts on Amlogic Meson SoC's.
> 
> There's a limit of 8 parent interupts which can be used in total.
> Note that IRQ_TYPE_EDGE_BOTH interrupts reserve two parent IRQ's,
> one for each edge.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> v2:
> - make the GPIO IRQ controller a separate driver
> - several smaller improvements
> ---
>  drivers/pinctrl/Kconfig                   |   1 +
>  drivers/pinctrl/meson/Makefile            |   2 +-
>  drivers/pinctrl/meson/pinctrl-meson-irq.c | 367
> ++++++++++++++++++++++++++++++
>  drivers/pinctrl/meson/pinctrl-meson.c     |   8 +-
>  drivers/pinctrl/meson/pinctrl-meson.h     |   1 +
>  5 files changed, 377 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/pinctrl/meson/pinctrl-meson-irq.c
> 
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index 37af5e30..f8f401a0 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -153,6 +153,7 @@ config PINCTRL_MESON
>  	select PINCONF
>  	select GENERIC_PINCONF
>  	select GPIOLIB
> +	select GPIOLIB_IRQCHIP
>  	select OF_GPIO
>  	select REGMAP_MMIO
>  
> diff --git a/drivers/pinctrl/meson/Makefile b/drivers/pinctrl/meson/Makefile
> index 27c5b512..827e416d 100644
> --- a/drivers/pinctrl/meson/Makefile
> +++ b/drivers/pinctrl/meson/Makefile
> @@ -1,3 +1,3 @@
>  obj-y	+= pinctrl-meson8.o pinctrl-meson8b.o
>  obj-y	+= pinctrl-meson-gxbb.o pinctrl-meson-gxl.o
> -obj-y	+= pinctrl-meson.o
> +obj-y	+= pinctrl-meson.o pinctrl-meson-irq.o
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-irq.c
> b/drivers/pinctrl/meson/pinctrl-meson-irq.c
> new file mode 100644
> index 00000000..c5f403f3
> --- /dev/null
> +++ b/drivers/pinctrl/meson/pinctrl-meson-irq.c
> @@ -0,0 +1,367 @@
> +/*
> + * Amlogic Meson GPIO IRQ driver
> + *
> + * Copyright 2017 Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> + * Based on a first version by Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation, version 2.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/gpio.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/interrupt.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include "pinctrl-meson.h"
> +
> +#define REG_EDGE_POL		0x00
> +#define REG_PIN_03_SEL		0x04
> +#define REG_PIN_47_SEL		0x08
> +#define REG_FILTER_SEL		0x0c
> +
> +#define REG_EDGE_POL_MASK(x)	(BIT(x) | BIT(16 + (x)))
> +#define REG_EDGE_POL_EDGE(x)	BIT(x)
> +#define REG_EDGE_POL_LOW(x)	BIT(16 + (x))
> +
> +#define MESON_GPIO_MAX_PARENT_IRQ_NUM	8
> +
> +struct meson_gpio_irq_slot {
> +	int irq;
> +	int owner;
> +};
> +
> +static struct regmap *meson_gpio_irq_regmap;
> +static struct meson_gpio_irq_slot
> +		meson_gpio_irq_slots[MESON_GPIO_MAX_PARENT_IRQ_NUM];
> +static int meson_gpio_num_irq_slots;
> +static DEFINE_MUTEX(meson_gpio_irq_slot_mutex);
> +static DECLARE_BITMAP(meson_gpio_irq_locked, 256);
> +
> +static struct meson_pinctrl *meson_gpio_data_to_pc(struct irq_data *data)
> +{
> +	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
> +
> +	return gpiochip_get_data(chip);
> +}
> +
> +static int meson_gpio_to_hwirq(struct meson_bank *bank, unsigned int offset)
> +{
> +	int hwirq;
> +
> +	if (bank->irq_first < 0)
> +		/* this bank cannot generate irqs */
> +		return 0;
> +
> +	hwirq = offset - bank->first + bank->irq_first;
> +
> +	if (hwirq > bank->irq_last)
> +		/* this pin cannot generate irqs */
> +		return 0;
> +
> +	return hwirq;
> +}
> +
> +static int meson_gpio_to_irq(struct meson_pinctrl *pc, unsigned int offset)
> +{
> +	struct meson_bank *bank;
> +	int hwirq;
> +
> +	offset += pc->data->pin_base;
> +
> +	bank = meson_pinctrl_get_bank(pc, offset);
> +	if (IS_ERR(bank))
> +		return PTR_ERR(bank);
> +
> +	hwirq = meson_gpio_to_hwirq(bank, offset);
> +	if (!hwirq)
> +		dev_dbg(pc->dev, "no interrupt for pin %u\n", offset);
> +
> +	return hwirq;
> +}
> +
> +static int meson_gpio_data_to_hwirq(struct irq_data *data)
> +{
> +	struct meson_pinctrl *pc = meson_gpio_data_to_pc(data);
> +	unsigned gpio = irqd_to_hwirq(data);
> +
> +	return meson_gpio_to_irq(pc, gpio);
> +}
> +
> +static irqreturn_t meson_gpio_irq_handler(int irq, void *data)
> +{
> +	struct irq_data *gpio_irqdata = data;
> +	struct meson_pinctrl *pc = meson_gpio_data_to_pc(data);
> +	int hwirq = meson_gpio_data_to_hwirq(gpio_irqdata);
> +
> +	/*
> +	 * For some strange reason spurious interrupts created by the chip
> when
> +	 * the interrupt source registers are written cause a deadlock here.
> +	 * generic_handle_irq calls handle_simple_irq which tries to get
> +	 * spinlock desc->lock. This interrupt handler is called whilst
> +	 * __setup_irq holds desc->lock.
> +	 * The deadlock means that both are running on the same CPU what
> should
> +	 * not happen as __setup_irq called raw_spin_lock_irqsave thus
> disabling
> +	 * interrupts on this CPU.
> +	 * Work around this by ignoring interrupts in code protected by
> +	 * chip_bus_lock (__setup_irq/__free_irq for the respective GPIO
> hwirq).
> +	 */

The explanation for this seems a bit weak. Even your comment say it does not
make sense. I've never seen this 'spurious irq' during my test.

It be nice to have the beginning of an explanation before introducing such hack.

> +	if (test_bit(hwirq, meson_gpio_irq_locked))
> +		dev_dbg(pc->dev, "spurious interrupt detected!\n");
> +	else
> +		generic_handle_irq(gpio_irqdata->irq);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int meson_gpio_alloc_irq_slot(struct irq_data *data, int num_slots,
> +				     int *slots)
> +{
> +	int i, cnt = 0;
> +
> +	mutex_lock(&meson_gpio_irq_slot_mutex);
> +
> +	for (i = 0; i < meson_gpio_num_irq_slots; i++)
> +		if (!meson_gpio_irq_slots[i].owner) {
> +			meson_gpio_irq_slots[i].owner = data->irq;
> +			slots[cnt++] = i;
> +			if (cnt == num_slots)
> +				break;
> +		}
> +
> +	if (cnt < num_slots)
> +		for (i = 0; i < cnt; i++)
> +			meson_gpio_irq_slots[i].owner = 0;
> +
> +	mutex_unlock(&meson_gpio_irq_slot_mutex);
> +
> +	return cnt == num_slots ? 0 : -ENOSPC;
> +}
> +
> +static void meson_gpio_free_irq_slot(struct irq_data *data)
> +{
> +	int i;
> +
> +	mutex_lock(&meson_gpio_irq_slot_mutex);
> +
> +	for (i = 0; i < meson_gpio_num_irq_slots; i++)
> +		if (meson_gpio_irq_slots[i].owner == data->irq) {
> +			free_irq(meson_gpio_irq_slots[i].irq, data);
> +			meson_gpio_irq_slots[i].owner = 0;
> +		}
> +
> +	mutex_unlock(&meson_gpio_irq_slot_mutex);
> +}
> +
> +static int meson_gpio_find_irq_slot(struct irq_data *data, int *slots)
> +{
> +	int i, cnt = 0;
> +
> +	mutex_lock(&meson_gpio_irq_slot_mutex);
> +
> +	for (i = 0; i < meson_gpio_num_irq_slots; i++)
> +		if (meson_gpio_irq_slots[i].owner == data->irq)
> +			slots[cnt++] = i;
> +
> +	mutex_unlock(&meson_gpio_irq_slot_mutex);
> +
> +	return cnt ?: -EINVAL;
> +}
> +
> +static void meson_gpio_set_hwirq(int idx, int hwirq)
> +{
> +	int reg = idx > 3 ? REG_PIN_47_SEL : REG_PIN_03_SEL;
> +	int shift = 8 * (idx % 4);
> +
> +	regmap_update_bits(meson_gpio_irq_regmap, reg, 0xff << shift,
> +			   hwirq << shift);
> +}
> +
> +static void meson_gpio_irq_set_hwirq(struct irq_data *data, int hwirq)
> +{
> +	struct meson_pinctrl *pc = meson_gpio_data_to_pc(data);
> +	int i, cnt, slots[MESON_GPIO_MAX_PARENT_IRQ_NUM];
> +
> +	cnt = meson_gpio_find_irq_slot(data, slots);
> +	if (cnt < 0) {
> +		dev_err(pc->dev, "didn't find gpio irq slot\n");
> +		return;
> +	}
> +
> +	for (i = 0; i < cnt; i++)
> +		meson_gpio_set_hwirq(slots[i], hwirq);
> +}
> +
> +static void meson_gpio_irq_unmask(struct irq_data *data)
> +{
> +	struct meson_pinctrl *pc = meson_gpio_data_to_pc(data);
> +	unsigned gpio = irqd_to_hwirq(data);
> +	int hwirq = meson_gpio_to_irq(pc, gpio);
> +
> +	meson_gpio_irq_set_hwirq(data, hwirq);
> +}
> +
> +static void meson_gpio_irq_mask(struct irq_data *data)
> +{
> +	meson_gpio_irq_set_hwirq(data, 0xff);
> +}
> +
> +static void meson_gpio_irq_shutdown(struct irq_data *data)
> +{
> +	meson_gpio_irq_mask(data);
> +	meson_gpio_free_irq_slot(data);
> +}
> +
> +static int meson_gpio_irq_set_type(struct irq_data *data, unsigned int type)
> +{
> +	int i, ret, irq, num_slots, slots[MESON_GPIO_MAX_PARENT_IRQ_NUM];
> +	unsigned int val = 0;
> +
> +	num_slots = (type == IRQ_TYPE_EDGE_BOTH) ? 2 : 1;
> +	ret = meson_gpio_alloc_irq_slot(data, num_slots, slots);
> +	if (ret)
> +		return ret;
> +
> +	if (type & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING))
> +		val |= REG_EDGE_POL_EDGE(slots[0]);
> +
> +	if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_EDGE_FALLING))
> +		val |= REG_EDGE_POL_LOW(slots[0]);
> +
> +	regmap_update_bits(meson_gpio_irq_regmap, REG_EDGE_POL,
> +			   REG_EDGE_POL_MASK(slots[0]), val);
> +
> +	/*
> +	 * The chip can create an interrupt for either rising or falling edge
> +	 * only. Therefore use two interrupts in case of IRQ_TYPE_EDGE_BOTH,
> +	 * first for falling edge and second one for rising edge.
> +	 */
> +	if (num_slots > 1) {
> +		val = REG_EDGE_POL_EDGE(slots[1]);
> +		regmap_update_bits(meson_gpio_irq_regmap, REG_EDGE_POL,
> +				   REG_EDGE_POL_MASK(slots[1]), val);
> +	}
> +
> +	if (type & IRQ_TYPE_EDGE_BOTH)
> +		val = IRQ_TYPE_EDGE_RISING;
> +	else
> +		val = IRQ_TYPE_LEVEL_HIGH;
> +
> +	for (i = 0; i < num_slots; i++) {
> +		irq = meson_gpio_irq_slots[slots[i]].irq;
> +		ret = irq_set_irq_type(irq, val);
> +		if (ret)
> +			break;
> +		ret = request_irq(irq, meson_gpio_irq_handler, 0,
> +				  "GPIO parent", data);
It seems weird to use request_irq here. With the eventual reuqeste_irq in the
consumer driver, wouldn't you end with to virq allocated for what is only on irq
line really ?

Isn't it showing that you should use domains and mappings ?


> +		if (ret)
> +			break;
> +	}
> +
> +	if (ret)
> +		while (--i >= 0)
> +			free_irq(meson_gpio_irq_slots[slots[i]].irq, data);
> +
> +	return ret;
> +}
> +
> +static void meson_gpio_irq_bus_lock(struct irq_data *data)
> +{
> +	int hwirq = meson_gpio_data_to_hwirq(data);
> +
> +	set_bit(hwirq, meson_gpio_irq_locked);
> +}
> +
> +static void meson_gpio_irq_bus_sync_unlock(struct irq_data *data)
> +{
> +	int hwirq = meson_gpio_data_to_hwirq(data);
> +
> +	clear_bit(hwirq, meson_gpio_irq_locked);
> +}
> +
> +static struct irq_chip meson_gpio_irq_chip = {
> +	.name = "GPIO",
> +	.irq_set_type = meson_gpio_irq_set_type,
> +	.irq_mask = meson_gpio_irq_mask,
> +	.irq_unmask = meson_gpio_irq_unmask,
> +	.irq_shutdown = meson_gpio_irq_shutdown,
> +	.irq_bus_lock = meson_gpio_irq_bus_lock,
> +	.irq_bus_sync_unlock = meson_gpio_irq_bus_sync_unlock,
> +};
> +
> +static int meson_gpio_get_irqs(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	int irq, i;
> +
> +	for (i = 0; i < MESON_GPIO_MAX_PARENT_IRQ_NUM; i++) {
> +		irq = irq_of_parse_and_map(np, i);
> +		if (!irq)
> +			break;
> +		meson_gpio_irq_slots[i].irq = irq;
> +	}
> +
> +	meson_gpio_num_irq_slots = i;
> +
> +	return i ? 0 : -EINVAL;
> +}
> +
> +static const struct regmap_config meson_gpio_regmap_config = {
> +	.reg_bits       = 32,
> +	.reg_stride     = 4,
> +	.val_bits       = 32,
> +	.max_register	= REG_FILTER_SEL,
> +};
> +
> +static int meson_gpio_irq_probe(struct platform_device *pdev)
> +{
> +	struct resource *res;
> +	void __iomem *io_base;
> +	int ret;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	io_base = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(io_base))
> +		return PTR_ERR(io_base);
> +
> +	meson_gpio_irq_regmap = devm_regmap_init_mmio(&pdev->dev, io_base,
> +						&meson_gpio_regmap_config);
> +	if (IS_ERR(meson_gpio_irq_regmap))
> +		return PTR_ERR(meson_gpio_irq_regmap);
> +
> +	/* initialize to IRQ_TYPE_LEVEL_HIGH */
> +	regmap_write(meson_gpio_irq_regmap, REG_EDGE_POL, 0);
> +	/* disable all GPIO interrupt sources */
> +	regmap_write(meson_gpio_irq_regmap, REG_PIN_03_SEL, 0xffffffff);
> +	regmap_write(meson_gpio_irq_regmap, REG_PIN_47_SEL, 0xffffffff);
> +	/* disable filtering */
> +	regmap_write(meson_gpio_irq_regmap, REG_FILTER_SEL, 0);
> +
> +	ret = meson_gpio_get_irqs(pdev);
> +	if (ret)
> +		return ret;
> +
> +	meson_pinctrl_irq_chip = &meson_gpio_irq_chip;
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id meson_gpio_irq_dt_match[] = {
> +	{ .compatible = "amlogic,meson-gpio-interrupt" },
> +	{ },
> +};
> +
> +static struct platform_driver meson_gpio_irq_driver = {
> +	.probe		= meson_gpio_irq_probe,
> +	.driver = {
> +		.name	= "meson-gpio-interrupt",
> +		.of_match_table = meson_gpio_irq_dt_match,
> +	},
> +};
> +builtin_platform_driver(meson_gpio_irq_driver);
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c
> b/drivers/pinctrl/meson/pinctrl-meson.c
> index 39ad9861..c587f6f0 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
> @@ -62,6 +62,8 @@
>  #include "../pinctrl-utils.h"
>  #include "pinctrl-meson.h"
>  
> +struct irq_chip *meson_pinctrl_irq_chip;
> +
>  /**
>   * meson_pinctrl_get_bank() - find the bank containing a given pin
>   *
> @@ -551,7 +553,8 @@ static int meson_gpiolib_register(struct meson_pinctrl
> *pc)
>  		return ret;
>  	}
>  
> -	return 0;
> +	return gpiochip_irqchip_add(&pc->chip, meson_pinctrl_irq_chip, 0,
> +				    handle_simple_irq, IRQ_TYPE_NONE);
>  }
>  
>  static struct regmap_config meson_regmap_config = {
> @@ -640,6 +643,9 @@ static int meson_pinctrl_probe(struct platform_device
> *pdev)
>  	struct meson_pinctrl *pc;
>  	int ret;
>  
> +	if (!meson_pinctrl_irq_chip)
> +		return -EPROBE_DEFER;
> +
>  	pc = devm_kzalloc(dev, sizeof(struct meson_pinctrl), GFP_KERNEL);
>  	if (!pc)
>  		return -ENOMEM;
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.h
> b/drivers/pinctrl/meson/pinctrl-meson.h
> index 40b56aff..16aab328 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.h
> +++ b/drivers/pinctrl/meson/pinctrl-meson.h
> @@ -176,6 +176,7 @@ extern struct meson_pinctrl_data
> meson_gxbb_periphs_pinctrl_data;
>  extern struct meson_pinctrl_data meson_gxbb_aobus_pinctrl_data;
>  extern struct meson_pinctrl_data meson_gxl_periphs_pinctrl_data;
>  extern struct meson_pinctrl_data meson_gxl_aobus_pinctrl_data;
> +extern struct irq_chip *meson_pinctrl_irq_chip;
>  
>  struct meson_bank *meson_pinctrl_get_bank(const struct meson_pinctrl *pc,
>  					  unsigned int pin);
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
