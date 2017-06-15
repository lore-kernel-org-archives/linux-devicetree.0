From: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 1/9] irqchip: add Amlogic Meson GPIO irqchip driver
Date: Thu, 15 Jun 2017 17:24:17 +0200
Message-ID: <c04dce8b-f3b9-e49e-47e8-0b24f3b66974@gmail.com>
References: <5b352c8d-a426-fa73-58b7-0c935979492b@gmail.com>
 <b33ccc5c-f383-97e7-44e6-d6e1f104e26c@gmail.com>
 <91b20fc4-4969-02a6-cc47-ff711f604342@arm.com>
 <1510ca1c-0a50-283d-42d5-b5710700460f@gmail.com>
 <9129464d-b7b6-a8f6-8671-091fc30e3161@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9129464d-b7b6-a8f6-8671-091fc30e3161-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 15.06.2017 um 15:27 schrieb Marc Zyngier:
> On 15/06/17 14:10, Heiner Kallweit wrote:
>> Am 13.06.2017 um 10:31 schrieb Marc Zyngier:
>>> On 10/06/17 22:57, Heiner Kallweit wrote:
>>>> Add a driver supporting the GPIO interrupt controller on certain
>>>> Amlogic meson SoC's.
>>>>
>>>> Signed-off-by: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>> ---
>>>> v5:
>>>> - changed Kconfig entry based on Neil's suggestion
>>>> - added authors
>>>> - extended explanation why 2 * n hwirqs are used
>>>> v6:
>>>> - change DT property parent-interrupts to interrupts
>>>> v7:
>>>> - no changes
>>>> ---
>>>>  drivers/irqchip/Kconfig          |   5 +
>>>>  drivers/irqchip/Makefile         |   1 +
>>>>  drivers/irqchip/irq-meson-gpio.c | 295 +++++++++++++++++++++++++++++++++++++++
>>>>  3 files changed, 301 insertions(+)
>>>>  create mode 100644 drivers/irqchip/irq-meson-gpio.c
>>>>
>>>> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
>>>> index 478f8ace..bdc86e14 100644
>>>> --- a/drivers/irqchip/Kconfig
>>>> +++ b/drivers/irqchip/Kconfig
>>>> @@ -301,3 +301,8 @@ config QCOM_IRQ_COMBINER
>>>>  	help
>>>>  	  Say yes here to add support for the IRQ combiner devices embedded
>>>>  	  in Qualcomm Technologies chips.
>>>> +
>>>> +config MESON_GPIO_INTC
>>>> +	bool
>>>> +	depends on ARCH_MESON
>>>> +	default y
>>>> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
>>>> index b64c59b8..1be482bd 100644
>>>> --- a/drivers/irqchip/Makefile
>>>> +++ b/drivers/irqchip/Makefile
>>>> @@ -76,3 +76,4 @@ obj-$(CONFIG_EZNPS_GIC)			+= irq-eznps.o
>>>>  obj-$(CONFIG_ARCH_ASPEED)		+= irq-aspeed-vic.o
>>>>  obj-$(CONFIG_STM32_EXTI) 		+= irq-stm32-exti.o
>>>>  obj-$(CONFIG_QCOM_IRQ_COMBINER)		+= qcom-irq-combiner.o
>>>> +obj-$(CONFIG_MESON_GPIO_INTC)		+= irq-meson-gpio.o
>>>> diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
>>>> new file mode 100644
>>>> index 00000000..925d00c2
>>>> --- /dev/null
>>>> +++ b/drivers/irqchip/irq-meson-gpio.c
>>>> @@ -0,0 +1,295 @@
>>>> +/*
>>>> + * Amlogic Meson GPIO IRQ chip driver
>>>> + *
>>>> + * Copyright (c) 2015 Endless Mobile, Inc.
>>>> + * Author: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
>>>> + * Copyright (c) 2016 BayLibre, SAS.
>>>> + * Author: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>>>> + * Copyright (c) 2017 Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>> + *
>>>> + * This program is free software; you can redistribute it and/or
>>>> + * modify it under the terms of the GNU General Public License as
>>>> + * published by the Free Software Foundation, version 2.
>>>> + */
>>>> +
>>>> +#include <linux/device.h>
>>>> +#include <linux/init.h>
>>>> +#include <linux/interrupt.h>
>>>> +#include <linux/irqchip.h>
>>>> +#include <linux/of.h>
>>>> +#include <linux/of_irq.h>
>>>> +#include <linux/of_address.h>
>>>> +#include <linux/regmap.h>
>>>> +
>>>> +#define REG_EDGE_POL		0x00
>>>> +#define REG_PIN_03_SEL		0x04
>>>> +#define REG_PIN_47_SEL		0x08
>>>> +#define REG_FILTER_SEL		0x0c
>>>> +
>>>> +#define REG_EDGE_POL_MASK(x)	(BIT(x) | BIT(16 + (x)))
>>>> +#define REG_EDGE_POL_EDGE(x)	BIT(x)
>>>> +#define REG_EDGE_POL_LOW(x)	BIT(16 + (x))
>>>> +
>>>> +#define MAX_PARENT_IRQ_NUM	8
>>>> +
>>>> +/* maximum number of GPIO IRQs on supported platforms */
>>>> +#define MAX_NUM_GPIO_IRQ	133
>>>
>>> Why aren't these values coming from DT? I bet that a future revision of
>>> the same HW will double these. Or at least, you could match it on the
>>> compatible string.
>>>
>> Alternatively this value can be set to 255. The GPIO source is an 8 bit
>> value with 255 being reserved for "no interrupt source assigned".
> 
> Who is reserving it? The HW? Or is that your own defined convention?
> 
>> This way we cover all chips based on the same IP.
> 
> Why? Where is that 8bit limit coming from?
> 
The 8 bit limit is in the HW.

>> I think what we could gain by introducing an additional DT property
>> (saving a few bytes in the irqdomain mapping table) isn't worth the effort.
> 
> It is not about saving or wasting memory. It is about making the driver
> and its binding able to span multiple generation of the HW without too
> much churn. Which is why I'm suggesting that you either define these
> properties in DT *or* match the compatible string to obtain these values.
> 
>>>> +
>>>> +/*
>>>> + * In case of IRQ_TYPE_EDGE_BOTH we need two parent interrupts, one for each
>>>> + * edge. That's due to HW constraints.
>>>> + * We use format 2 * GPIO_HWIRQ +(0|1) for the hwirq, so we can have one
>>>> + * GPIO_HWIRQ twice and derive the GPIO_HWIRQ from hwirq by shifting hwirq
>>>> + * one bit to the right.
>>>
>>> Please expand on how you expect this to work, specially when a random
>>> driver expects a single interrupt.
>>>
>> The gpio interrupt controller in this chip doesn't have native support for
>> IRQ_TYPE_EDGE_BOTH. As a workaround we would need to assign the same gpio
>> to two parent interrupts, one for each edge.
> 
> No, that's horrible, racy, and impractical. It has been proposed in the
> past (for the same HW), and we're not going there again.
> 
IIRC what has been proposed before is to re-program the polarity of edge
detection withing the ISR. This would match your concern that it is racy.

Here it's about using two parent irq's, one programmed to react on the
rising edge whilst the other is triggered in case of falling edge.
Would you consider this to be racy too?

>> There's still no solution to achieve this in a way everybody is happy with.
>> Therefore this feature isn't part of this patch set.
>>
>> However, to be prepared to include this feature later, the interface
>> between pinctrl/gpio and irqchip driver should (IMHO) cater for it already.
>> Else we may have to touch the irqchip driver later and change the interface
>> what I would like to avoid.
> 
> Don't even think of it, and considered it pre-NAKed.
> 
>>
>> If a driver just needs one (parent) interrupt, it can request hwirq
>> (2 * GPIO_HWIRQ) only. There's no issue with that.
> 
> Other than being utterly useless and confusing?
> 
>>>> + */
>>>> +#define NUM_GPIO_HWIRQ		(2 * MAX_NUM_GPIO_IRQ)
>>>> +
>>>> +struct meson_irq_slot {
>>>> +	unsigned int irq;
>>>> +	unsigned int owner;
>>>> +};
>>>> +
>>>> +struct meson_data {
>>>> +	struct regmap *regmap;
>>>> +	struct meson_irq_slot slots[MAX_PARENT_IRQ_NUM];
>>>> +	unsigned int num_slots;
>>>> +	struct mutex lock;
>>>> +};
>>>> +
>>>> +static int meson_alloc_irq_slot(struct meson_data *md, unsigned int virq)
>>>> +{
>>>> +	int i, slot = -ENOSPC;
>>>> +
>>>> +	mutex_lock(&md->lock);
>>>> +
>>>> +	for (i = 0; i < md->num_slots && slot < 0; i++)
>>>> +		if (!md->slots[i].owner) {
>>>> +			md->slots[i].owner = virq;
>>>
>>> Why do you have to deal with the virq? It'd be more logical to deal with
>>> the hwirq. The usual mechanism to reserve a "slot" is to use a bitmap
>>> indexed by the hwirq. Why is that not working for you?
>>>
>> Using the hwirq as owner should also be possible. Will consider this.
>>
>> A slot has two members, the owner and a the associated parent irq number.
>> Of course we could split this into a slot bitmap + an array with parent
>> irq's indexed by slot number. Would you prefer this?
> 
> Again, why do you need to consider the Linux irq number? All you need to
> track is whether a hwirq has been allocated or not, since all the
> irqchip function are called with an irq_data as a parameter, which
> contains both the irq and hwirq values.
> 
>>>> +			slot = i;
>>>> +		}
>>>> +
>>>> +	mutex_unlock(&md->lock);
>>>> +
>>>> +	return slot;
>>>> +}
>>>> +
>>>> +static void meson_free_irq_slot(struct meson_data *md, unsigned int virq)
>>>> +{
>>>> +	int i;
>>>> +
>>>> +	mutex_lock(&md->lock);
>>>> +
>>>> +	for (i = 0; i < md->num_slots; i++)
>>>> +		if (md->slots[i].owner == virq) {
>>>> +			md->slots[i].owner = 0;
>>>> +			break;
>>>> +		}
>>>> +
>>>> +	mutex_unlock(&md->lock);
>>>> +}
>>>
>>> These two functions are basically the same...
>>>
>>>> +
>>>> +static int meson_find_irq_slot(struct meson_data *md, unsigned int virq)
>>>> +{
>>>> +	int i, slot = -EINVAL;
>>>> +
>>>> +	mutex_lock(&md->lock);
>>>> +
>>>> +	for (i = 0; i < md->num_slots && slot < 0; i++)
>>>> +		if (md->slots[i].owner == virq)
>>>> +			slot = i;
>>>> +
>>>> +	mutex_unlock(&md->lock);
>>>> +
>>>> +	return slot;
>>>> +}
>>>
>>> ... and could be expressed in terms of this one.
>>>
>>>> +
>>>> +static void meson_set_hwirq(struct meson_data *md, int idx, unsigned int hwirq)
>>>> +{
>>>> +	int reg = idx > 3 ? REG_PIN_47_SEL : REG_PIN_03_SEL;
>>>> +	int shift = 8 * (idx % 4);
>>>
>>> What's this?
>>>
>> GPIO source for the eight parent irq's can be configured using two 32-bit registers
>> with four 8-bit fields each.
> 
> Consider moving it to an accessor and document the mapping of the hwirqs
> in these registers.
> 
>>>> +
>>>> +	regmap_update_bits(md->regmap, reg, 0xff << shift,
>>>> +			   hwirq << shift);
>>>> +}
>>>> +
>>>> +static void meson_irq_set_hwirq(struct irq_data *data, unsigned int hwirq)
>>>> +{
>>>> +	struct meson_data *md = data->domain->host_data;
>>>> +	int slot = meson_find_irq_slot(md, data->irq);
>>>> +
>>>> +	if (slot >= 0)
>>>> +		meson_set_hwirq(md, slot, hwirq);
>>>> +}
>>>> +
>>>> +static int meson_irq_set_type(struct irq_data *data, unsigned int type)
>>>> +{
>>>> +	struct meson_data *md = data->domain->host_data;
>>>> +	int slot;
>>>> +	unsigned int val = 0;
>>>> +
>>>> +	if (type == IRQ_TYPE_EDGE_BOTH)
>>>> +		return -EINVAL;
>>>
>>> So you reject EDGE_BOTH? So what's the deal with the beginning of the patch?
>>>
>> We reject it in the initial version of the patch set as there's no consensus
>> yet on some details of the workaround needed for EDGE_BOTH support.
> 
> There is a consensus: The HW doesn't support this feature.
> 
Means what? There is no acceptable way to support EDGE_BOTH on this HW?
In this case I could stop here as for me this feature is important.

Would be somewhat a pity as there is a working solution. If it doesn't fit
into the current irq(chip) framework, shouldn't this be considered a gap
in the framework?

>>>> +
>>>> +	slot = meson_find_irq_slot(md, data->irq);
>>>> +	if (slot < 0)
>>>> +		return slot;
>>>
>>> How can this happen?
>>>
>> I see no way how this can happen. It was basically added to be on the safe
>> side and fail nicely in case I miss a scenario which could cause this to fail.
>> I can remove the check.
>>
>>>> +
>>>> +	if (type & IRQ_TYPE_EDGE_BOTH)
>>>> +		val |= REG_EDGE_POL_EDGE(slot);
>>>> +
>>>> +	if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_EDGE_FALLING))
>>>> +		val |= REG_EDGE_POL_LOW(slot);
>>>> +
>>>> +	regmap_update_bits(md->regmap, REG_EDGE_POL,
>>>> +			   REG_EDGE_POL_MASK(slot), val);
>>>> +
>>>> +	if (type & IRQ_TYPE_EDGE_BOTH)
>>>> +		val = IRQ_TYPE_EDGE_RISING;
>>>> +	else
>>>> +		val = IRQ_TYPE_LEVEL_HIGH;
>>>
>>> How does this work? Does this HW have some magic falling->rising and
>>> low->high conversion feature? If it doesn't, I cannot see how this can work.
>>>
>> Exactly, HW has a programmable polarity inverter.
>>
>>>> +
>>>> +	return irq_chip_set_type_parent(data, val);
>>>> +}
>>>> +
>>>> +static unsigned int meson_irq_startup(struct irq_data *data)
>>>> +{
>>>> +	irq_chip_unmask_parent(data);
>>>> +	/*
>>>> +	 * An extra bit was added to allow having the same gpio hwirq twice
>>>> +	 * for handling IRQ_TYPE_EDGE_BOTH. Remove this bit to get the
>>>> +	 * gpio hwirq.
>>>> +	 */
>>>> +	meson_irq_set_hwirq(data, data->hwirq >> 1);
>>>
>>> Again. Do you support EDGE_BOTH or not?
>>>
>>
>> Not yet ..
>>
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static void meson_irq_shutdown(struct irq_data *data)
>>>> +{
>>>> +	meson_irq_set_hwirq(data, 0xff);
>>>
>>> What's special about 0xff?
>>>
>> 0xff is the reserved value indicating the no GPIO source is assigned
>> to the parent irq.
> 
> Then document it, add a #define for this.
> 
>>>> +	irq_chip_mask_parent(data);
>>>> +}
>>>> +
>>>> +static struct irq_chip meson_irq_chip = {
>>>> +	.name = "meson_gpio_intc",
>>>> +	.irq_set_type = meson_irq_set_type,
>>>> +	.irq_eoi = irq_chip_eoi_parent,
>>>> +	.irq_mask = irq_chip_mask_parent,
>>>> +	.irq_unmask = irq_chip_unmask_parent,
>>>> +	.irq_startup = meson_irq_startup,
>>>> +	.irq_shutdown = meson_irq_shutdown,
>>>> +	.irq_set_affinity = irq_chip_set_affinity_parent,
>>>> +};
>>>> +
>>>> +static int meson_irq_alloc(struct irq_domain *d, unsigned int virq,
>>>> +			   unsigned int nr_irqs, void *data)
>>>> +{
>>>> +	struct irq_fwspec parent_fwspec, *fwspec = data;
>>>> +	struct meson_data *md = d->host_data;
>>>> +	irq_hw_number_t hwirq;
>>>> +	int ret, slot;
>>>> +
>>>> +	slot = meson_alloc_irq_slot(md, virq);
>>>> +	if (slot < 0)
>>>> +		return slot;
>>>> +
>>>> +	hwirq = fwspec->param[0];
>>>> +	irq_domain_set_hwirq_and_chip(d, virq, hwirq, &meson_irq_chip, NULL);
>>>> +
>>>> +	parent_fwspec.fwnode = d->parent->fwnode;
>>>> +	parent_fwspec.param_count = 3;
>>>> +	parent_fwspec.param[0] = 0; /* SPI */
>>>> +	parent_fwspec.param[1] = md->slots[slot].irq;
>>>> +	parent_fwspec.param[2] = IRQ_TYPE_NONE;
>>>
>>> Hell no. Look at the GIC DT binding: there is no NONE. It is either
>>> HIGH, or RISING.
>>>
>> OK, will be changed.
>>
>>>> +
>>>> +	ret = irq_domain_alloc_irqs_parent(d, virq, nr_irqs, &parent_fwspec);
>>>> +	if (ret)
>>>> +		meson_free_irq_slot(md, virq);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static void meson_irq_free(struct irq_domain *d, unsigned int virq,
>>>> +			   unsigned int nr_irqs)
>>>> +{
>>>> +	struct meson_data *md = d->host_data;
>>>> +
>>>> +	irq_domain_free_irqs_common(d, virq, nr_irqs);
>>>> +	meson_free_irq_slot(md, virq);
>>>> +}
>>>> +
>>>> +static const struct irq_domain_ops meson_irq_ops = {
>>>> +	.alloc = meson_irq_alloc,
>>>> +	.free = meson_irq_free,
>>>> +	.xlate = irq_domain_xlate_twocell,
>>>> +};
>>>> +
>>>> +static int meson_get_irqs(struct meson_data *md, struct device_node *node)
>>>> +{
>>>> +	int ret, i;
>>>> +	u32 irq;
>>>> +
>>>> +	for (i = 0; i < MAX_PARENT_IRQ_NUM; i++) {
>>>> +		ret = of_property_read_u32_index(node, "interrupts", i, &irq);
>>>> +		if (ret)
>>>> +			break;
>>>> +		md->slots[i].irq = irq;
>>>> +	}
>>>> +
>>>> +	md->num_slots = i;
>>>> +
>>>> +	return i ? 0 : -EINVAL;
>>>> +}
>>>> +
>>>> +static const struct regmap_config meson_regmap_config = {
>>>> +	.reg_bits       = 32,
>>>> +	.reg_stride     = 4,
>>>> +	.val_bits       = 32,
>>>> +	.max_register	= REG_FILTER_SEL,
>>>> +};
>>>> +
>>>> +static int __init meson_gpio_irq_init(struct device_node *node,
>>>> +				      struct device_node *parent)
>>>> +{
>>>> +	struct irq_domain *meson_irq_domain, *parent_domain;
>>>> +	struct meson_data *md;
>>>> +	void __iomem *io_base;
>>>> +	int ret;
>>>> +
>>>> +	md = kzalloc(sizeof(*md), GFP_KERNEL);
>>>> +	if (!md)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	mutex_init(&md->lock);
>>>> +
>>>> +	io_base = of_iomap(node, 0);
>>>> +	if (!io_base)
>>>> +		return -EINVAL;
>>>> +
>>>> +	md->regmap = regmap_init_mmio(NULL, io_base, &meson_regmap_config);
>>>> +	if (IS_ERR(md->regmap))
>>>> +		return PTR_ERR(md->regmap);
>>>> +
>>>> +	/* initialize to IRQ_TYPE_LEVEL_HIGH */
>>>> +	regmap_write(md->regmap, REG_EDGE_POL, 0);
>>>> +	/* disable all GPIO interrupt sources */
>>>> +	regmap_write(md->regmap, REG_PIN_03_SEL, 0xffffffff);
>>>> +	regmap_write(md->regmap, REG_PIN_47_SEL, 0xffffffff);
>>>> +	/* disable filtering */
>>>> +	regmap_write(md->regmap, REG_FILTER_SEL, 0);
>>>> +
>>>> +	ret = meson_get_irqs(md, node);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	parent_domain = irq_find_host(parent);
>>>> +	if (!parent_domain)
>>>> +		return -ENXIO;
>>>
>>> Memory leak on all the return paths.
>>>
>> Indeed. Most likely copy & paste error when I used other irqchip drivers
>> as inspiration. E.g. irq-crossbar faces the same issue, it allocates memory
>> in crossbar_of_init which isn't free'd if irq_domain_add_hierarchy fails.
> 
> Then please submit a patch addressing the defect.
> 
> Thanks,
> 
> 	M.
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
