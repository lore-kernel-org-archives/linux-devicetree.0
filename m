From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH RfC v4 2/6] irqchip: add Amlogic Meson GPIO irqchip driver
Date: Mon, 29 May 2017 10:38:50 +0200
Message-ID: <3acb15f5-c4ab-1c7f-222b-aba6eab6317f@baylibre.com>
References: <49ab677f-3165-d6f5-75f5-a963879e8ecf@gmail.com>
 <b23d0417-a43b-a28c-3d9f-2be9bf6623f1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b23d0417-a43b-a28c-3d9f-2be9bf6623f1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Heiner,

Finally, thanks for re-submitting an independent irq controller driver.

On 05/28/2017 09:11 PM, Heiner Kallweit wrote:
> Add a driver supporting the GPIO interrupt controller on certain
> Amlogic meson SoC's.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/irqchip/Kconfig          |   3 +
>  drivers/irqchip/Makefile         |   1 +
>  drivers/irqchip/irq-meson-gpio.c | 280 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 284 insertions(+)
>  create mode 100644 drivers/irqchip/irq-meson-gpio.c
> 
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 478f8ace..6bffe733 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -301,3 +301,6 @@ config QCOM_IRQ_COMBINER
>  	help
>  	  Say yes here to add support for the IRQ combiner devices embedded
>  	  in Qualcomm Technologies chips.
> +
> +config MESON_GPIO_INTC
> +	bool

Maybe a :
depends on ARCH_MESON
default y

would be great.

> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> index b64c59b8..1be482bd 100644
> --- a/drivers/irqchip/Makefile
> +++ b/drivers/irqchip/Makefile
> @@ -76,3 +76,4 @@ obj-$(CONFIG_EZNPS_GIC)			+= irq-eznps.o
>  obj-$(CONFIG_ARCH_ASPEED)		+= irq-aspeed-vic.o
>  obj-$(CONFIG_STM32_EXTI) 		+= irq-stm32-exti.o
>  obj-$(CONFIG_QCOM_IRQ_COMBINER)		+= qcom-irq-combiner.o
> +obj-$(CONFIG_MESON_GPIO_INTC)		+= irq-meson-gpio.o
> diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
> new file mode 100644
> index 00000000..acbbbdb0
> --- /dev/null
> +++ b/drivers/irqchip/irq-meson-gpio.c
> @@ -0,0 +1,280 @@
> +/*
> + * Amlogic Meson GPIO IRQ chip driver
> + *
> + * Copyright 2017 Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Please add :
+ * Copyright (c) 2015 Endless Mobile, Inc.
+ * Author: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
+ * Copyright (c) 2016 BayLibre, SAS.
+ * Author: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>

Since you based your work on previous work from Jerome derived from a work initially done by Carlo.

> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation, version 2.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/irqchip.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_address.h>
> +#include <linux/regmap.h>
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
> +#define MAX_PARENT_IRQ_NUM	8
> +
> +struct meson_irq_slot {
> +	unsigned int irq;
> +	unsigned int owner;
> +};
> +
> +struct meson_data {
> +	struct regmap *regmap;
> +	struct meson_irq_slot slots[MAX_PARENT_IRQ_NUM];
> +	unsigned int num_slots;
> +	struct mutex lock;
> +};
> +
> +static int meson_alloc_irq_slot(struct meson_data *md, unsigned int virq)
> +{
> +	int i, slot = -ENOSPC;
> +
> +	mutex_lock(&md->lock);
> +
> +	for (i = 0; i < md->num_slots && slot < 0; i++)
> +		if (!md->slots[i].owner) {
> +			md->slots[i].owner = virq;
> +			slot = i;
> +		}
> +
> +	mutex_unlock(&md->lock);
> +
> +	return slot;
> +}
> +
> +static void meson_free_irq_slot(struct meson_data *md, unsigned int virq)
> +{
> +	int i;
> +
> +	mutex_lock(&md->lock);
> +
> +	for (i = 0; i < md->num_slots; i++)
> +		if (md->slots[i].owner == virq) {
> +			md->slots[i].owner = 0;
> +			break;
> +		}
> +
> +	mutex_unlock(&md->lock);
> +}
> +
> +static int meson_find_irq_slot(struct meson_data *md, unsigned int virq)
> +{
> +	int i, slot = -EINVAL;
> +
> +	mutex_lock(&md->lock);
> +
> +	for (i = 0; i < md->num_slots && slot < 0; i++)
> +		if (md->slots[i].owner == virq)
> +			slot = i;
> +
> +	mutex_unlock(&md->lock);
> +
> +	return slot;
> +}
> +
> +static void meson_set_hwirq(struct meson_data *md, int idx, unsigned int hwirq)
> +{
> +	int reg = idx > 3 ? REG_PIN_47_SEL : REG_PIN_03_SEL;
> +	int shift = 8 * (idx % 4);
> +
> +	regmap_update_bits(md->regmap, reg, 0xff << shift,
> +			   hwirq << shift);
> +}
> +
> +static void meson_irq_set_hwirq(struct irq_data *data, unsigned int hwirq)
> +{
> +	struct meson_data *md = data->domain->host_data;
> +	int slot = meson_find_irq_slot(md, data->irq);
> +
> +	if (slot >= 0)
> +		meson_set_hwirq(md, slot, hwirq);
> +}
> +
> +static int meson_irq_set_type(struct irq_data *data, unsigned int type)
> +{
> +	struct meson_data *md = data->domain->host_data;
> +	int slot;
> +	unsigned int val = 0;
> +
> +	if (type == IRQ_TYPE_EDGE_BOTH)
> +		return -EINVAL;
> +
> +	slot = meson_find_irq_slot(md, data->irq);
> +	if (slot < 0)
> +		return slot;
> +
> +	if (type & IRQ_TYPE_EDGE_BOTH)
> +		val |= REG_EDGE_POL_EDGE(slot);
> +
> +	if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_EDGE_FALLING))
> +		val |= REG_EDGE_POL_LOW(slot);
> +
> +	regmap_update_bits(md->regmap, REG_EDGE_POL,
> +			   REG_EDGE_POL_MASK(slot), val);
> +
> +	if (type & IRQ_TYPE_EDGE_BOTH)
> +		val = IRQ_TYPE_EDGE_RISING;
> +	else
> +		val = IRQ_TYPE_LEVEL_HIGH;
> +
> +	return irq_chip_set_type_parent(data, val);
> +}
> +
> +static unsigned int meson_irq_startup(struct irq_data *data)
> +{
> +	irq_chip_unmask_parent(data);
> +	/*
> +	 * An extra bit was added to allow having the same gpio hwirq twice
> +	 * for handling IRQ_TYPE_EDGE_BOTH. Remove this bit to get the
> +	 * gpio hwirq.
> +	 */
> +	meson_irq_set_hwirq(data, data->hwirq >> 1);
> +
> +	return 0;
> +}
> +
> +static void meson_irq_shutdown(struct irq_data *data)
> +{
> +	meson_irq_set_hwirq(data, 0xff);
> +	irq_chip_mask_parent(data);
> +}
> +
> +static struct irq_chip meson_irq_chip = {
> +	.name = "meson_gpio_intc",
> +	.irq_set_type = meson_irq_set_type,
> +	.irq_eoi = irq_chip_eoi_parent,
> +	.irq_mask = irq_chip_mask_parent,
> +	.irq_unmask = irq_chip_unmask_parent,
> +	.irq_startup = meson_irq_startup,
> +	.irq_shutdown = meson_irq_shutdown,
> +	.irq_set_affinity = irq_chip_set_affinity_parent,
> +};
> +
> +static int meson_irq_alloc(struct irq_domain *d, unsigned int virq,
> +			   unsigned int nr_irqs, void *data)
> +{
> +	struct irq_fwspec parent_fwspec, *fwspec = data;
> +	struct meson_data *md = d->host_data;
> +	irq_hw_number_t hwirq;
> +	int ret, slot;
> +
> +	slot = meson_alloc_irq_slot(md, virq);
> +	if (slot < 0)
> +		return slot;
> +
> +	hwirq = fwspec->param[0];
> +	irq_domain_set_hwirq_and_chip(d, virq, hwirq, &meson_irq_chip, NULL);
> +
> +	parent_fwspec.fwnode = d->parent->fwnode;
> +	parent_fwspec.param_count = 3;
> +	parent_fwspec.param[0] = 0; /* SPI */
> +	parent_fwspec.param[1] = md->slots[slot].irq;
> +	parent_fwspec.param[2] = IRQ_TYPE_NONE;
> +
> +	ret = irq_domain_alloc_irqs_parent(d, virq, nr_irqs, &parent_fwspec);
> +	if (ret)
> +		meson_free_irq_slot(md, virq);
> +
> +	return ret;
> +}
> +
> +static void meson_irq_free(struct irq_domain *d, unsigned int virq,
> +			   unsigned int nr_irqs)
> +{
> +	struct meson_data *md = d->host_data;
> +
> +	irq_domain_free_irqs_common(d, virq, nr_irqs);
> +	meson_free_irq_slot(md, virq);
> +}
> +
> +static const struct irq_domain_ops meson_irq_ops = {
> +	.alloc = meson_irq_alloc,
> +	.free = meson_irq_free,
> +	.xlate = irq_domain_xlate_twocell,
> +};
> +
> +static int meson_get_irqs(struct meson_data *md, struct device_node *node)
> +{
> +	int ret, i;
> +	u32 irq;
> +
> +	for (i = 0; i < MAX_PARENT_IRQ_NUM; i++) {
> +		ret = of_property_read_u32_index(node, "parent-interrupts", i,
> +						 &irq);
> +		if (ret)
> +			break;
> +		md->slots[i].irq = irq;
> +	}
> +
> +	md->num_slots = i;
> +
> +	return i ? 0 : -EINVAL;
> +}
> +
> +static const struct regmap_config meson_regmap_config = {
> +	.reg_bits       = 32,
> +	.reg_stride     = 4,
> +	.val_bits       = 32,
> +	.max_register	= REG_FILTER_SEL,
> +};
> +
> +static int __init meson_gpio_irq_init(struct device_node *node,
> +				      struct device_node *parent)
> +{
> +	struct irq_domain *meson_irq_domain, *parent_domain;
> +	struct meson_data *md;
> +	void __iomem *io_base;
> +	int ret;
> +
> +	md = kzalloc(sizeof(*md), GFP_KERNEL);
> +	if (!md)
> +		return -ENOMEM;
> +
> +	mutex_init(&md->lock);
> +
> +	io_base = of_iomap(node, 0);
> +	if (!io_base)
> +		return -EINVAL;
> +
> +	md->regmap = regmap_init_mmio(NULL, io_base, &meson_regmap_config);
> +	if (IS_ERR(md->regmap))
> +		return PTR_ERR(md->regmap);
> +
> +	/* initialize to IRQ_TYPE_LEVEL_HIGH */
> +	regmap_write(md->regmap, REG_EDGE_POL, 0);
> +	/* disable all GPIO interrupt sources */
> +	regmap_write(md->regmap, REG_PIN_03_SEL, 0xffffffff);
> +	regmap_write(md->regmap, REG_PIN_47_SEL, 0xffffffff);
> +	/* disable filtering */
> +	regmap_write(md->regmap, REG_FILTER_SEL, 0);
> +
> +	ret = meson_get_irqs(md, node);
> +	if (ret)
> +		return ret;
> +
> +	parent_domain = irq_find_host(parent);
> +	if (!parent_domain)
> +		return -ENXIO;
> +
> +	meson_irq_domain = irq_domain_add_hierarchy(parent_domain, 0, 2 * 256,
> +						    node, &meson_irq_ops, md);

While I understand why you reserve twice the numbers on logical interrupts,
please add a define for 256 and add a comment in the head of the driver explaining why
and how do you can handle the IRQ_BOTH in the pinctrl driver or elsewhere.


> +
> +	return meson_irq_domain ? 0 : -EINVAL;
> +}
> +
> +IRQCHIP_DECLARE(meson_gpio_irq, "amlogic,meson-gpio-intc", meson_gpio_irq_init);
> 

Thanks,
Neil
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
