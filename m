From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH 6/7] [PATCH] MIPS: OCTEON: Add support for OCTEON III
 interrupt controller.
Date: Fri, 5 Feb 2016 10:06:34 +0100 (CET)
Message-ID: <alpine.DEB.2.11.1602050954480.25254@nanos>
References: <1454632974-7686-1-git-send-email-ddaney.cavm@gmail.com> <1454632974-7686-7-git-send-email-ddaney.cavm@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454632974-7686-7-git-send-email-ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 4 Feb 2016, David Daney wrote:
> +static int octeon_irq_ciu_set_type(struct irq_data *data, unsigned int t)
> +{
> +	irqd_set_trigger_type(data, t);
> +
> +	if (irqd_get_trigger_type(data) & IRQ_TYPE_EDGE_BOTH)
> +		irq_set_handler_locked(data, handle_edge_irq);
> +	else
> +		irq_set_handler_locked(data, handle_level_irq);
> +
> +	return IRQ_SET_MASK_OK;

That doesn't make any sense. First you store the type 't' in irq data, then
you query irq data for the type and at the end you tell the core to set the
type in irq data.

     if (t & IRQ_TYPE_EDGE_BOTH)
     	...
     else
        ...
     return IRQ_SET_MASK_OK;

does the same, right?

> +int octeon_irq_ciu3_xlat(struct irq_domain *d,

static ?

> +			 struct device_node *node,
> +			 const u32 *intspec,
> +			 unsigned int intsize,
> +			 unsigned long *out_hwirq,
> +			 unsigned int *out_type)
> +{
> +
> +void octeon_irq_ciu3_enable(struct irq_data *data)

static 

> +void octeon_irq_ciu3_disable(struct irq_data *data)
> +void octeon_irq_ciu3_ack(struct irq_data *data)
> +void octeon_irq_ciu3_mask(struct irq_data *data)
> +void octeon_irq_ciu3_mask_ack(struct irq_data *data)
> +int octeon_irq_ciu3_set_affinity(struct irq_data *data,
> +				 const struct cpumask *dest, bool force)

ditto

> +int octeon_irq_ciu3_mapx(struct irq_domain *d, unsigned int virq,
> +			 irq_hw_number_t hw, struct irq_chip *chip)

....

> +void octeon_ciu3_mbox_send(int cpu, unsigned int mbox)
> +{
> +	struct octeon_ciu3_info *ciu3_info;
> +	unsigned int intsn;
> +	union cvmx_ciu3_iscx_w1s isc_w1s;
> +	u64 isc_w1s_addr;
> +
> +	if (WARN_ON_ONCE(mbox >= CIU3_MBOX_PER_CORE))
> +		return;
> +
> +	intsn = octeon_irq_ciu3_mbox_intsn_for_cpu(cpu, mbox);
> +	ciu3_info = per_cpu(octeon_ciu3_info, cpu);
> +	isc_w1s_addr = ciu3_info->ciu3_addr + CIU3_ISC_W1S(intsn);
> +
> +	isc_w1s.u64 = 0;
> +	isc_w1s.s.raw = 1;
> +
> +	cvmx_write_csr(isc_w1s_addr, isc_w1s.u64);
> +	cvmx_read_csr(isc_w1s_addr);
> +}
> +EXPORT_SYMBOL(octeon_ciu3_mbox_send);

Why need modules that function?

Thanks,

	tglx
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
