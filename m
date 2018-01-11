From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 6/9] irqchip: Add the ingenic-tcu-intc driver
Date: Thu, 11 Jan 2018 15:38:42 +0000
Message-ID: <58349291-93cd-f803-52a9-f88120ace4dc@arm.com>
References: <20180101143344.2099-1-paul@crapouillou.net>
 <20180110224838.16711-1-paul@crapouillou.net>
 <20180110224838.16711-6-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180110224838.16711-6-paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Content-Language: en-GB
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/01/18 22:48, Paul Cercueil wrote:
> This simple driver handles the IRQ chip of the TCU
> (Timer Counter Unit) of the JZ47xx Ingenic SoCs.
> 
> Signed-off-by: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
> ---
>  drivers/irqchip/Kconfig           |   6 ++
>  drivers/irqchip/Makefile          |   1 +
>  drivers/irqchip/irq-ingenic-tcu.c | 153 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 160 insertions(+)
>  create mode 100644 drivers/irqchip/irq-ingenic-tcu.c
> 
>  v2: - Use SPDX identifier for the license
>      - Make KConfig option select CONFIG_IRQ_DOMAIN since we depend on it
>  v3: - Move documentation to its own patch
>      - Add comment explaining why we only use IRQCHIP_DECLARE
> 
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index c70476b34a53..74668f3605b0 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -267,6 +267,12 @@ config INGENIC_IRQ
>  	depends on MACH_INGENIC
>  	default y
>  
> +config INGENIC_TCU_IRQ
> +	bool
> +	depends on MACH_INGENIC || COMPILE_TEST
> +	select IRQ_DOMAIN
> +	default y
> +
>  config RENESAS_H8300H_INTC
>          bool
>  	select IRQ_DOMAIN
> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> index d2df34a54d38..6effe0271cd6 100644
> --- a/drivers/irqchip/Makefile
> +++ b/drivers/irqchip/Makefile
> @@ -70,6 +70,7 @@ obj-$(CONFIG_RENESAS_H8300H_INTC)	+= irq-renesas-h8300h.o
>  obj-$(CONFIG_RENESAS_H8S_INTC)		+= irq-renesas-h8s.o
>  obj-$(CONFIG_ARCH_SA1100)		+= irq-sa11x0.o
>  obj-$(CONFIG_INGENIC_IRQ)		+= irq-ingenic.o
> +obj-$(CONFIG_INGENIC_TCU_IRQ)		+= irq-ingenic-tcu.o
>  obj-$(CONFIG_IMX_GPCV2)			+= irq-imx-gpcv2.o
>  obj-$(CONFIG_PIC32_EVIC)		+= irq-pic32-evic.o
>  obj-$(CONFIG_MVEBU_GICP)		+= irq-mvebu-gicp.o
> diff --git a/drivers/irqchip/irq-ingenic-tcu.c b/drivers/irqchip/irq-ingenic-tcu.c
> new file mode 100644
> index 000000000000..52e9688b31f6
> --- /dev/null
> +++ b/drivers/irqchip/irq-ingenic-tcu.c
> @@ -0,0 +1,153 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * JZ47xx SoCs TCU IRQ driver
> + * Copyright (C) 2018 Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/irqchip.h>
> +#include <linux/irqchip/chained_irq.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/regmap.h>
> +
> +#include <linux/mfd/syscon/ingenic-tcu.h>
> +
> +static void ingenic_tcu_intc_cascade(struct irq_desc *desc)
> +{
> +	struct irq_chip *irq_chip = irq_data_get_irq_chip(&desc->irq_data);
> +	struct irq_domain *domain = irq_desc_get_handler_data(desc);
> +	struct irq_chip_generic *gc = irq_get_domain_generic_chip(domain, 0);
> +	struct regmap *map = gc->private;
> +	uint32_t irq_reg, irq_mask;
> +	unsigned int i;
> +
> +	regmap_read(map, TCU_REG_TFR, &irq_reg);
> +	regmap_read(map, TCU_REG_TMR, &irq_mask);
> +
> +	chained_irq_enter(irq_chip, desc);
> +
> +	irq_reg &= ~irq_mask;
> +
> +	for (i = 0; i < 32; i++) {
> +		if (irq_reg & BIT(i))
> +			generic_handle_irq(irq_linear_revmap(domain, i));
> +	}
> +
> +	chained_irq_exit(irq_chip, desc);
> +}
> +
> +static void ingenic_tcu_gc_unmask_enable_reg(struct irq_data *d)
> +{
> +	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
> +	struct irq_chip_type *ct = irq_data_get_chip_type(d);
> +	struct regmap *map = gc->private;
> +	u32 mask = d->mask;
> +
> +	irq_gc_lock(gc);
> +	regmap_write(map, ct->regs.ack, mask);
> +	regmap_write(map, ct->regs.enable, mask);
> +	*ct->mask_cache |= mask;
> +	irq_gc_unlock(gc);
> +}
> +
> +static void ingenic_tcu_gc_mask_disable_reg(struct irq_data *d)
> +{
> +	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
> +	struct irq_chip_type *ct = irq_data_get_chip_type(d);
> +	struct regmap *map = gc->private;
> +	u32 mask = d->mask;
> +
> +	irq_gc_lock(gc);
> +	regmap_write(map, ct->regs.disable, mask);
> +	*ct->mask_cache &= ~mask;
> +	irq_gc_unlock(gc);
> +}
> +
> +static void ingenic_tcu_gc_mask_disable_reg_and_ack(struct irq_data *d)
> +{
> +	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
> +	struct irq_chip_type *ct = irq_data_get_chip_type(d);
> +	struct regmap *map = gc->private;
> +	u32 mask = d->mask;
> +
> +	irq_gc_lock(gc);
> +	regmap_write(map, ct->regs.ack, mask);
> +	regmap_write(map, ct->regs.disable, mask);
> +	irq_gc_unlock(gc);
> +}
> +
> +static int __init ingenic_tcu_intc_of_init(struct device_node *node,
> +	struct device_node *parent)
> +{
> +	struct irq_domain *domain;
> +	struct irq_chip_generic *gc;
> +	struct irq_chip_type *ct;
> +	int err, i, num_parent_irqs;
> +	unsigned int parent_irqs[3];

3 parent interrupts? Really? How do you pick one? Also, given the useage
model below, "int" is the wrong type. Probably should be u32.

> +	struct regmap *map;
> +
> +	num_parent_irqs = of_property_count_elems_of_size(
> +			node, "interrupts", 4);

Nit: on a single line, as here is nothing that hurts my eyes more than
reading something like(
this). Also, 4 is better expressed as sizeof(u32).


> +	if (num_parent_irqs < 0 || num_parent_irqs > ARRAY_SIZE(parent_irqs))
> +		return -EINVAL;
> +
> +	map = syscon_node_to_regmap(node->parent);
> +	if (IS_ERR(map))
> +		return PTR_ERR(map);
> +
> +	domain = irq_domain_add_linear(node, 32, &irq_generic_chip_ops, NULL);
> +	if (!domain)
> +		return -ENOMEM;
> +
> +	err = irq_alloc_domain_generic_chips(domain, 32, 1, "TCU",
> +			handle_level_irq, 0, IRQ_NOPROBE | IRQ_LEVEL, 0);
> +	if (err)
> +		goto out_domain_remove;
> +
> +	gc = irq_get_domain_generic_chip(domain, 0);
> +	ct = gc->chip_types;
> +
> +	gc->wake_enabled = IRQ_MSK(32);
> +	gc->private = map;
> +
> +	ct->regs.disable = TCU_REG_TMSR;
> +	ct->regs.enable = TCU_REG_TMCR;
> +	ct->regs.ack = TCU_REG_TFCR;
> +	ct->chip.irq_unmask = ingenic_tcu_gc_unmask_enable_reg;
> +	ct->chip.irq_mask = ingenic_tcu_gc_mask_disable_reg;
> +	ct->chip.irq_mask_ack = ingenic_tcu_gc_mask_disable_reg_and_ack;
> +	ct->chip.flags = IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_SKIP_SET_WAKE;
> +
> +	/* Mask all IRQs by default */
> +	regmap_write(map, TCU_REG_TMSR, IRQ_MSK(32));
> +
> +	for (i = 0; i < num_parent_irqs; i++) {
> +		parent_irqs[i] = irq_of_parse_and_map(node, i);
> +		if (!parent_irqs[i]) {
> +			err = -EINVAL;
> +			goto out_unmap_irqs;
> +		}
> +
> +		irq_set_chained_handler_and_data(parent_irqs[i],
> +				ingenic_tcu_intc_cascade, domain);
> +	}

I don't get the multiple parent irq at all. How are the source interrupt
routed to the various cascades?

> +
> +	return 0;
> +
> +out_unmap_irqs:
> +	for (; i > 0; i--)
> +		irq_dispose_mapping(parent_irqs[i - 1]);
> +out_domain_remove:
> +	irq_domain_remove(domain);
> +	return err;
> +}
> +
> +/* We only probe via devicetree, no need for a platform driver */
> +IRQCHIP_DECLARE(jz4740_tcu_intc, "ingenic,jz4740-tcu-intc",
> +		ingenic_tcu_intc_of_init);
> +IRQCHIP_DECLARE(jz4770_tcu_intc, "ingenic,jz4770-tcu-intc",
> +		ingenic_tcu_intc_of_init);
> +IRQCHIP_DECLARE(jz4780_tcu_intc, "ingenic,jz4780-tcu-intc",
> +		ingenic_tcu_intc_of_init);
> 

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
