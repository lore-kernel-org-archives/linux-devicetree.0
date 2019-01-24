From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [PATCH v4 07/13] irqchip: ti-sci-intr: Add support for Interrupt
 Router driver
Date: Thu, 24 Jan 2019 15:49:52 +0530
Message-ID: <2f41b033-bee7-34b8-5290-9509b21b6ace@ti.com>
References: <20181227060829.5080-1-lokeshvutla@ti.com>
 <20181227061313.5451-1-lokeshvutla@ti.com>
 <20181227061313.5451-7-lokeshvutla@ti.com>
 <96ae4b44-0331-b11d-c67a-515afd88dee5@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <96ae4b44-0331-b11d-c67a-515afd88dee5@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, tglx@linutronix.de, jason@lakedaemon.net
Cc: Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>
List-Id: devicetree@vger.kernel.org

Hi Marc,

On 16/01/19 10:46 PM, Marc Zyngier wrote:
> [Still in the process of sorting out my email - don't ask]
> 
> On 27/12/2018 06:13, Lokesh Vutla wrote:
>> Texas Instruments' K3 generation SoCs has an IP Interrupt Router
>> that does allows for redirection of input interrupts to host
>> interrupt controller. Interrupt Router inputs are either from a
>> peripheral or from an Interrupt Aggregator which is another
>> interrupt controller.
>>
>> Configuration of the interrupt router registers can only be done by
>> a system co-processor and the driver needs to send a message to this
>> co processor over TISCI protocol.
>>
>> Add support for Interrupt Router driver over TISCI protocol.
>>
>> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
>> ---
>>  MAINTAINERS                       |   1 +
>>  drivers/irqchip/Kconfig           |  11 ++
>>  drivers/irqchip/Makefile          |   1 +
>>  drivers/irqchip/irq-ti-sci-intr.c | 310 ++++++++++++++++++++++++++++++
>>  4 files changed, 323 insertions(+)
>>  create mode 100644 drivers/irqchip/irq-ti-sci-intr.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 8c7513b02d50..4480eb2fe851 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -15024,6 +15024,7 @@ F:	Documentation/devicetree/bindings/clock/ti,sci-clk.txt
>>  F:	drivers/clk/keystone/sci-clk.c
>>  F:	drivers/reset/reset-ti-sci.c
>>  F:	Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt
>> +F:	drivers/irqchip/irq-ti-sci-intr.c
>>  
>>  Texas Instruments ASoC drivers
>>  M:	Peter Ujfalusi <peter.ujfalusi@ti.com>
>> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
>> index 3d1e60779078..a8d9bed0254b 100644
>> --- a/drivers/irqchip/Kconfig
>> +++ b/drivers/irqchip/Kconfig
>> @@ -406,6 +406,17 @@ config IMX_IRQSTEER
>>  	help
>>  	  Support for the i.MX IRQSTEER interrupt multiplexer/remapper.
>>  
>> +config TI_SCI_INTR_IRQCHIP
>> +	bool
>> +	depends on TI_SCI_PROTOCOL && ARCH_K3
>> +	select IRQ_DOMAIN
>> +	select IRQ_DOMAIN_HIERARCHY
>> +	help
>> +	  This enables the irqchip driver support for K3 Interrupt router
>> +	  over TI System Control Interface available on some new TI's SoCs.
>> +	  If you wish to use interrupt router irq resources managed by the
>> +	  TI System Controller, say Y here. Otherwise, say N.
>> +
>>  endmenu
>>  
>>  config SIFIVE_PLIC
>> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
>> index c93713d24b86..b4ff376a08ef 100644
>> --- a/drivers/irqchip/Makefile
>> +++ b/drivers/irqchip/Makefile
>> @@ -94,3 +94,4 @@ obj-$(CONFIG_CSKY_APB_INTC)		+= irq-csky-apb-intc.o
>>  obj-$(CONFIG_SIFIVE_PLIC)		+= irq-sifive-plic.o
>>  obj-$(CONFIG_IMX_IRQSTEER)		+= irq-imx-irqsteer.o
>>  obj-$(CONFIG_MADERA_IRQ)		+= irq-madera.o
>> +obj-$(CONFIG_TI_SCI_INTR_IRQCHIP)	+= irq-ti-sci-intr.o
>> diff --git a/drivers/irqchip/irq-ti-sci-intr.c b/drivers/irqchip/irq-ti-sci-intr.c
>> new file mode 100644
>> index 000000000000..a5396e08412c
>> --- /dev/null
>> +++ b/drivers/irqchip/irq-ti-sci-intr.c
>> @@ -0,0 +1,310 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Texas Instruments' K3 Interrupt Router irqchip driver
>> + *
>> + * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
>> + *	Lokesh Vutla <lokeshvutla@ti.com>
>> + */
>> +
>> +#include <linux/err.h>
>> +#include <linux/io.h>
>> +#include <linux/irqchip.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/of_address.h>
>> +#include <linux/of_irq.h>
>> +#include <linux/module.h>
>> +#include <linux/moduleparam.h>
>> +#include <linux/irqdomain.h>
>> +#include <linux/soc/ti/ti_sci_protocol.h>
>> +
>> +#define TI_SCI_DEV_ID_MASK	0xffff
>> +#define TI_SCI_DEV_ID_SHIFT	16
>> +#define TI_SCI_IRQ_ID_MASK	0xffff
>> +#define TI_SCI_IRQ_ID_SHIFT	0
>> +#define TI_SCI_EVENT_IRQ	BIT(0)
>> +
>> +#define HWIRQ_TO_DEVID(hwirq)	(((hwirq) >> (TI_SCI_DEV_ID_SHIFT)) & \
>> +				 (TI_SCI_DEV_ID_MASK))
>> +#define HWIRQ_TO_IRQID(hwirq)	((hwirq) & (TI_SCI_IRQ_ID_MASK))
>> +#define FWSPEC_TO_HWIRQ(fwspec)	(((fwspec->param[0] & TI_SCI_DEV_ID_MASK) << \
>> +				 TI_SCI_DEV_ID_SHIFT) | \
>> +				(fwspec->param[1] & TI_SCI_IRQ_ID_MASK))
>> +
>> +/**
>> + * struct ti_sci_intr_irq_domain - Structure representing a TISCI based
>> + *				   Interrupt Router IRQ domain.
>> + * @sci:	Pointer to TISCI handle
>> + * @dst_irq:	TISCI resource pointer representing destination irq controller.
>> + * @dst_id:	TISCI device ID of the destination irq controller.
>> + */
>> +struct ti_sci_intr_irq_domain {
>> +	const struct ti_sci_handle *sci;
>> +	struct ti_sci_resource *dst_irq;
>> +	u16 dst_id;
>> +};
>> +
>> +static struct irq_chip ti_sci_intr_irq_chip = {
>> +	.name			= "INTR",
>> +	.irq_eoi		= irq_chip_eoi_parent,
>> +	.irq_mask		= irq_chip_mask_parent,
>> +	.irq_unmask		= irq_chip_unmask_parent,
>> +	.irq_retrigger		= irq_chip_retrigger_hierarchy,
>> +	.irq_set_type		= irq_chip_set_type_parent,
>> +	.irq_set_affinity	= irq_chip_set_affinity_parent,
>> +};
>> +
>> +/**
>> + * ti_sci_intr_irq_domain_translate() - Retrieve hwirq and type from
>> + *					IRQ firmware specific handler.
>> + * @domain:	Pointer to IRQ domain
>> + * @fwspec:	Pointer to IRQ specific firmware structure
>> + * @hwirq:	IRQ number identified by hardware
>> + * @type:	IRQ type
>> + *
>> + * Return 0 if all went ok else appropriate error.
>> + */
>> +static int ti_sci_intr_irq_domain_translate(struct irq_domain *domain,
>> +					    struct irq_fwspec *fwspec,
>> +					    unsigned long *hwirq,
>> +					    unsigned int *type)
>> +{
>> +	if (is_of_node(fwspec->fwnode)) {
>> +		if (fwspec->param_count != 4)
>> +			return -EINVAL;
>> +
>> +		*hwirq = FWSPEC_TO_HWIRQ(fwspec);
>> +		*type = fwspec->param[2];
>> +
>> +		return 0;
>> +	}
> 
> From what I can see in the code used by this platform, there is
> absolutely no chance this will ever support any firmware interface other
> than DT. So I think you can loose the is_of_node check here.

Sure will drop it in next version.

> 
> Another thing is that you do not seem to use the 4th parameter to the
> intspec. So what is it used for here?
> 
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +static inline void ti_sci_intr_delete_desc(struct ti_sci_intr_irq_domain *intr,
> 
> So this is called "delete desc". What is desc? It seems to free an irq
> in the resource manager, so please call it something that matches what
> this does.

will change it to delete_irq.

> 
>> +					   u16 src_id, u16 src_index,
>> +					   u16 dst_irq)
>> +{
>> +	intr->sci->ops.rm_irq_ops.free_direct_irq(intr->sci, src_id, src_index,
>> +						  intr->dst_id, dst_irq);
>> +}
>> +
>> +/**
>> + * ti_sci_intr_irq_domain_free() - Free the specified IRQs from the domain.
>> + * @domain:	Domain to which the irqs belong
>> + * @virq:	Linux virtual IRQ to be freed.
>> + * @nr_irqs:	Number of continuous irqs to be freed
>> + */
>> +static void ti_sci_intr_irq_domain_free(struct irq_domain *domain,
>> +					unsigned int virq, unsigned int nr_irqs)
>> +{
>> +	struct ti_sci_intr_irq_domain *intr = domain->host_data;
>> +	struct irq_data *data, *parent_data;
>> +	u64 flags;
>> +	int i;
>> +
>> +	intr = domain->host_data;
>> +
>> +	for (i = 0; i < nr_irqs; i++) {
>> +		data = irq_domain_get_irq_data(domain, virq + i);
>> +		flags = (u64)irq_data_get_irq_chip_data(data);
> 
> Are you guaranteed that this will only exist on a 64bit architecture?

most likely yes. But will use phys_addr_t to be more specific

> 
>> +		parent_data = irq_domain_get_irq_data(domain->parent, virq + i);
>> +
>> +		if (!(flags & TI_SCI_EVENT_IRQ))
>> +			ti_sci_intr_delete_desc(intr,
>> +						HWIRQ_TO_DEVID(data->hwirq),
>> +						HWIRQ_TO_IRQID(data->hwirq),
>> +						parent_data->hwirq);
>> +		ti_sci_release_resource(intr->dst_irq, parent_data->hwirq);
>> +		irq_domain_free_irqs_parent(domain, virq + i, 1);
> 
> Couldn't this be moved out of the loop so that you free nr_irqs directly
> since you seem to be assuming that they are continuous? But are they?
> 
> Also, and depending on the context this is called from, it is pretty
> unlikely that you'll see nr_irqs!=1, the only case I know about being
> the PCI Multi-MSI train-wreck.

okay, ill drop the loop and consider only the case nr_irqs == 1

> 
>> +		irq_domain_reset_irq_data(data);
>> +	}
>> +}
>> +
>> +/**
>> + * ti_sci_intr_allocate_gic_irq() - Allocate GIC specific IRQ
>> + * @domain:	Point to the interrupt router IRQ domain
>> + * @dev:	TISCI device IRQ generating the IRQ
>> + * @irq:	IRQ offset within the device
>> + * @flags:	Corresponding flags to the IRQ
>> + * @event_irq:	Flag to tell if requested irq is from interrupt aggregator.
>> + *
>> + * Returns 0 if all went well else appropriate error pointer.
>> + */
>> +static int ti_sci_intr_allocate_gic_irq(struct irq_domain *domain,
>> +					unsigned int virq, u16 dev, u16 irq,
>> +					u32 flags, u8 event_irq)
>> +{
>> +	struct ti_sci_intr_irq_domain *intr = domain->host_data;
>> +	struct irq_fwspec fwspec;
>> +	u16 dst_irq;
>> +	int err;
>> +
>> +	if (!irq_domain_get_of_node(domain->parent))
>> +		return -EINVAL;
>> +
>> +	dst_irq = ti_sci_get_free_resource(intr->dst_irq);
>> +	if (dst_irq == TI_SCI_RESOURCE_NULL)
>> +		return -EINVAL;
>> +
>> +	fwspec.fwnode = domain->parent->fwnode;
>> +	fwspec.param_count = 3;
>> +	fwspec.param[0] = 0;	/* SPI */
>> +	fwspec.param[1] = dst_irq - 32; /* SPI offset */
>> +	fwspec.param[2] = flags & IRQ_TYPE_SENSE_MASK;
>> +
>> +	err = irq_domain_alloc_irqs_parent(domain, virq, 1, &fwspec);
>> +	if (err)
>> +		goto err_irqs;
>> +
>> +	/* If event is requested then return */
>> +	if (event_irq == TI_SCI_EVENT_IRQ)
>> +		return 0;
>> +
>> +	err = intr->sci->ops.rm_irq_ops.set_direct_irq(intr->sci, dev, irq,
>> +						       intr->dst_id, dst_irq);
>> +	if (err) {
>> +		pr_err("%s: IRQ allocation failed from src = %d, src_index = %d to dst_id = %d, dst_irq = %d",
>> +		       __func__, dev, irq, intr->dst_id, dst_irq);
> 
> Do we really needs this error message? It doesn't seem to provide any
> useful information at this stage. I'd rather the terrible callback does
> the screaming if required.

okay will drop this error message.

> 
>> +		goto err_msg;
>> +	}
>> +
>> +	return 0;
>> +
>> +err_msg:
>> +	irq_domain_free_irqs_parent(domain, virq, 1);
>> +err_irqs:
>> +	ti_sci_release_resource(intr->dst_irq, dst_irq);
>> +	return err;
>> +}
>> +
>> +/**
>> + * ti_sci_intr_irq_domain_alloc() - Allocate Interrupt router IRQs
>> + * @domain:	Point to the interrupt router IRQ domain
>> + * @virq:	Corresponding Linux virtual IRQ number
>> + * @nr_irqs:	Continuous irqs to be allocated
>> + * @data:	Pointer to firmware specifier
>> + *
>> + * Return 0 if all went well else appropriate error value.
>> + */
>> +static int ti_sci_intr_irq_domain_alloc(struct irq_domain *domain,
>> +					unsigned int virq, unsigned int nr_irqs,
>> +					void *data)
>> +{
>> +	struct irq_fwspec *fwspec = data;
>> +	u16 src_id, src_index;
>> +	unsigned long hwirq;
>> +	u8 event_irq;
>> +	int i, err;
>> +	u32 type;
>> +
>> +	err = ti_sci_intr_irq_domain_translate(domain, fwspec, &hwirq, &type);
>> +	if (err)
>> +		return err;
>> +
>> +	src_id = HWIRQ_TO_DEVID(hwirq);
>> +	src_index = HWIRQ_TO_IRQID(hwirq);
>> +	event_irq = fwspec->param[3];
> 
> Ah, so this is where it is used. You could perform some sanitization,
> given that you're feeding this to other part of the system.

sure will add a check for fwspec->param[3].

Thanks and regards,
Lokesh
