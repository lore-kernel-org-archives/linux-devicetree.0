From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH REBASE] irqchip: Add TB10x interrupt controller driver
Date: Mon, 27 May 2013 14:26:36 +0200 (CEST)
Message-ID: <alpine.LFD.2.02.1305271414270.4220@ionos>
References: <1365686252-9828-1-git-send-email-christian.ruppert@abilis.com> <1367930258-27056-1-git-send-email-christian.ruppert@abilis.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1367930258-27056-1-git-send-email-christian.ruppert@abilis.com>
Sender: linux-doc-owner@vger.kernel.org
To: Christian Ruppert <christian.ruppert@abilis.com>
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Pierrick Hascoet <pierrick.hascoet@abilis.com>
List-Id: devicetree@vger.kernel.org

On Tue, 7 May 2013, Christian Ruppert wrote:
> +#include <linux/interrupt.h>
> +#include <linux/irqdomain.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_address.h>
> +#include <linux/of_platform.h>
> +#include <linux/io.h>
> +#include <linux/slab.h>
> +#include "../../drivers/irqchip/irqchip.h"

#include "irqchip.h" perhaps?

> +#define AB_IRQCTL_INT_ENABLE   (0x00)

What's the purpose of the parens? Decrease readability?

> +static void tb10x_irq_unmask(struct irq_data *data)
> +{
> +	struct tb10x_ictl *ictl = irq_data_get_irq_chip_data(data);
> +	unsigned int hwirq = irqd_to_hwirq(data);
> +
> +	ab_irqctl_writereg(ictl, AB_IRQCTL_INT_ENABLE,
> +		ab_irqctl_readreg(ictl, AB_IRQCTL_INT_ENABLE) | (1 << hwirq));

Another implementation of the generic interrupt chip functionality.

> +static int tb10x_irq_map(struct irq_domain *d, unsigned int irq,
> +				irq_hw_number_t hw)
> +{
> +	irq_set_chip_data(irq, d->host_data);
> +	irq_set_chip_and_handler(irq, &irq_tb10x_chip, handle_level_irq);
> +
> +	return 0;
> +}
> +
> +static int tb10x_irq_xlate(struct irq_domain *d, struct device_node *node,
> +			const u32 *intspec, unsigned int intsize,
> +			unsigned long *out_hwirq, unsigned int *out_type)
> +{
> +	static const unsigned int tb10x_xlate_types[] = {
> +		IRQ_TYPE_EDGE_RISING,
> +		IRQ_TYPE_LEVEL_LOW,
> +		IRQ_TYPE_LEVEL_HIGH,
> +		IRQ_TYPE_EDGE_FALLING,

Why do you need to introduce another format for specifying the
interrupt type instead of using the IRQ_TYPE values and
irq_domain_xlate_twocell()?

> +static void tb10x_irq_cascade(unsigned int irq, struct irq_desc *desc)
> +{
> +	struct tb10x_ictl *ictl = irq_desc_get_handler_data(desc);
> +
> +	generic_handle_irq(irq_find_mapping(ictl->domain, irq));
> +}
> +
> +static int __init of_tb10x_init_irq(struct device_node *ictl,
> +					struct device_node *parent)
> +{
> +	int i;
> +	int ret;
> +	int nrirqs = of_irq_count(ictl);

One line for all those ints please

> +	ic->domain = irq_domain_add_tree(ictl, &irq_tb10x_domain_ops, ic);

Why do you want a tree, if you require that the interrupts are mapped
1:1 to the hardware interrupt numbers? This doesn't make any sense at
all and makes the above cascade handler a pointless waste of cpu cycles.

Thanks,

	tglx
