From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v7 11/14] irqchip: ti-sci-inta: Add support for Interrupt
 Aggregator driver
Date: Mon, 29 Apr 2019 14:11:39 +0100
Message-ID: <36b8bc62-fff2-c015-8140-cda625efdabc@arm.com>
References: <20190420100950.7997-1-lokeshvutla@ti.com>
 <20190420100950.7997-12-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190420100950.7997-12-lokeshvutla@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Lokesh Vutla <lokeshvutla@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, Nishanth Menon <nm@ti.com>, tglx@linutronix.de, jason@lakedaemon.net
Cc: Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>, linus.walleij@linaro.org, Peter Ujfalusi <peter.ujfalusi@ti.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 20/04/2019 11:09, Lokesh Vutla wrote:
> Texas Instruments' K3 generation SoCs has an IP Interrupt Aggregator
> which is an interrupt controller that does the following:
> - Converts events to interrupts that can be understood by
>   an interrupt router.
> - Allows for multiplexing of events to interrupts.
> 
> Configuration of the interrupt aggregator registers can only be done by
> a system co-processor and the driver needs to send a message to this
> co processor over TISCI protocol. This patch adds support for Interrupt
> Aggregator irqdomain.
> 
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
> Changes since v6:
> - Updated commit message.
> - Arranged header files in alphabetical order
> - Included vint_bit in struct ti_sci_inta_event_desc
> - With the above change now the chip_data is event_desc instead of vint_desc
> - No loops are used in atomic contexts.
> - Fixed locking issue while freeing parent virq
> - Fixed few other cosmetic changes.
> 
>  MAINTAINERS                       |   1 +
>  drivers/irqchip/Kconfig           |  11 +
>  drivers/irqchip/Makefile          |   1 +
>  drivers/irqchip/irq-ti-sci-inta.c | 589 ++++++++++++++++++++++++++++++
>  4 files changed, 602 insertions(+)
>  create mode 100644 drivers/irqchip/irq-ti-sci-inta.c
> 

[...]

> +/**
> + * ti_sci_inta_alloc_irq() -  Allocate an irq within INTA domain
> + * @domain:	irq_domain pointer corresponding to INTA
> + * @hwirq:	hwirq of the input event
> + *
> + * Note: Allocation happens in the following manner:
> + *	- Find a free bit available in any of the vints available in the list.
> + *	- If not found, allocate a vint from the vint pool
> + *	- Attach the free bit to input hwirq.
> + * Return event_desc if all went ok else appropriate error value.
> + */
> +static struct ti_sci_inta_event_desc *ti_sci_inta_alloc_irq(struct irq_domain *domain,
> +							    u32 hwirq)
> +{
> +	struct ti_sci_inta_irq_domain *inta = domain->host_data;
> +	struct ti_sci_inta_vint_desc *vint_desc = NULL;
> +	u16 free_bit;
> +
> +	mutex_lock(&inta->vint_mutex);
> +	list_for_each_entry(vint_desc, &inta->vint_list, list) {
> +		mutex_lock(&vint_desc->event_mutex);
> +		free_bit = find_first_zero_bit(vint_desc->event_map,
> +					       MAX_EVENTS_PER_VINT);
> +		if (free_bit != MAX_EVENTS_PER_VINT) {
> +			set_bit(free_bit, vint_desc->event_map);
> +			mutex_unlock(&vint_desc->event_mutex);
> +			mutex_unlock(&inta->vint_mutex);
> +			goto alloc_event;
> +		}
> +		mutex_unlock(&vint_desc->event_mutex);
> +	}
> +	mutex_unlock(&inta->vint_mutex);
> +
> +	/* No free bits available. Allocate a new vint */
> +	vint_desc = ti_sci_inta_alloc_parent_irq(domain);
> +	if (IS_ERR(vint_desc))
> +		return ERR_PTR(PTR_ERR(vint_desc));
> +
> +	mutex_lock(&vint_desc->event_mutex);
> +	free_bit = find_first_zero_bit(vint_desc->event_map,
> +				       MAX_EVENTS_PER_VINT);
> +	set_bit(free_bit, vint_desc->event_map);
> +	mutex_unlock(&vint_desc->event_mutex);

This code is still quite racy: you can have two parallel allocations
failing to get a free bit in any of the already allocated vint_desc, and
then both allocating a new vint_desc. If there was only one left, one of
the allocation will fail despite having at least 63 free interrupts.

	M.
-- 
Jazz is not dead. It just smells funny...
