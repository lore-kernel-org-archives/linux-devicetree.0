From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 6/9] irqchip: Add the ingenic-tcu-intc driver
Date: Thu, 11 Jan 2018 17:25:45 +0100
Message-ID: <1515687945.2170.1@smtp.crapouillou.net>
References: <20180101143344.2099-1-paul@crapouillou.net>
        <20180110224838.16711-1-paul@crapouillou.net>
        <20180110224838.16711-6-paul@crapouillou.net>
        <58349291-93cd-f803-52a9-f88120ace4dc@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <58349291-93cd-f803-52a9-f88120ace4dc@arm.com>
Sender: linux-clk-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


Hi Marc,

>>  +static int __init ingenic_tcu_intc_of_init(struct device_node 
>> *node,
>>  +	struct device_node *parent)
>>  +{
>>  +	struct irq_domain *domain;
>>  +	struct irq_chip_generic *gc;
>>  +	struct irq_chip_type *ct;
>>  +	int err, i, num_parent_irqs;
>>  +	unsigned int parent_irqs[3];
> 
> 3 parent interrupts? Really? How do you pick one? Also, given the 
> useage
> model below, "int" is the wrong type. Probably should be u32.

See below.

>>  +	struct regmap *map;
>>  +
>>  +	num_parent_irqs = of_property_count_elems_of_size(
>>  +			node, "interrupts", 4);
> 
> Nit: on a single line, as here is nothing that hurts my eyes more than
> reading something like(
> this). Also, 4 is better expressed as sizeof(u32).

That will make checkpatch.pl unhappy :(

>>  +	if (num_parent_irqs < 0 || num_parent_irqs > 
>> ARRAY_SIZE(parent_irqs))
>>  +		return -EINVAL;
>>  +
>>  +	map = syscon_node_to_regmap(node->parent);
>>  +	if (IS_ERR(map))
>>  +		return PTR_ERR(map);
>>  +
>>  +	domain = irq_domain_add_linear(node, 32, &irq_generic_chip_ops, 
>> NULL);
>>  +	if (!domain)
>>  +		return -ENOMEM;
>>  +
>>  +	err = irq_alloc_domain_generic_chips(domain, 32, 1, "TCU",
>>  +			handle_level_irq, 0, IRQ_NOPROBE | IRQ_LEVEL, 0);
>>  +	if (err)
>>  +		goto out_domain_remove;
>>  +
>>  +	gc = irq_get_domain_generic_chip(domain, 0);
>>  +	ct = gc->chip_types;
>>  +
>>  +	gc->wake_enabled = IRQ_MSK(32);
>>  +	gc->private = map;
>>  +
>>  +	ct->regs.disable = TCU_REG_TMSR;
>>  +	ct->regs.enable = TCU_REG_TMCR;
>>  +	ct->regs.ack = TCU_REG_TFCR;
>>  +	ct->chip.irq_unmask = ingenic_tcu_gc_unmask_enable_reg;
>>  +	ct->chip.irq_mask = ingenic_tcu_gc_mask_disable_reg;
>>  +	ct->chip.irq_mask_ack = ingenic_tcu_gc_mask_disable_reg_and_ack;
>>  +	ct->chip.flags = IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_SKIP_SET_WAKE;
>>  +
>>  +	/* Mask all IRQs by default */
>>  +	regmap_write(map, TCU_REG_TMSR, IRQ_MSK(32));
>>  +
>>  +	for (i = 0; i < num_parent_irqs; i++) {
>>  +		parent_irqs[i] = irq_of_parse_and_map(node, i);
>>  +		if (!parent_irqs[i]) {
>>  +			err = -EINVAL;
>>  +			goto out_unmap_irqs;
>>  +		}
>>  +
>>  +		irq_set_chained_handler_and_data(parent_irqs[i],
>>  +				ingenic_tcu_intc_cascade, domain);
>>  +	}
> 
> I don't get the multiple parent irq at all. How are the source 
> interrupt
> routed to the various cascades?

On JZ4740, channels 0 and 1 have their own interrupt, and channels 2-7 
share
one interrupt line.
On JZ4770 and JZ4780, the OST (OS timer) channel has its own interrupt,
channel 5 has its own interrupt, and channels 0-4 and 6-7 share one
interrupt line.

To keep things simple, we register the same interrupt handler for the 
three
parent interrupts.

-Paul

