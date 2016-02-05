From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: [PATCH 6/7] [PATCH] MIPS: OCTEON: Add support for OCTEON III
 interrupt controller.
Date: Fri, 5 Feb 2016 09:22:03 -0800
Message-ID: <56B4DA3B.40607@caviumnetworks.com>
References: <1454632974-7686-1-git-send-email-ddaney.cavm@gmail.com> <1454632974-7686-7-git-send-email-ddaney.cavm@gmail.com> <alpine.DEB.2.11.1602050954480.25254@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <alpine.DEB.2.11.1602050954480.25254@nanos>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: David Daney <ddaney.cavm@gmail.com>, linux-mips@linux-mips.org, ralf@linux-mips.org, linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 02/05/2016 01:06 AM, Thomas Gleixner wrote:
> On Thu, 4 Feb 2016, David Daney wrote:
>> +static int octeon_irq_ciu_set_type(struct irq_data *data, unsigned int t)
>> +{
>> +	irqd_set_trigger_type(data, t);
>> +
>> +	if (irqd_get_trigger_type(data) & IRQ_TYPE_EDGE_BOTH)
>> +		irq_set_handler_locked(data, handle_edge_irq);
>> +	else
>> +		irq_set_handler_locked(data, handle_level_irq);
>> +
>> +	return IRQ_SET_MASK_OK;
>
> That doesn't make any sense. First you store the type 't' in irq data, then
> you query irq data for the type and at the end you tell the core to set the
> type in irq data.
>
>       if (t & IRQ_TYPE_EDGE_BOTH)
>       	...
>       else
>          ...
>       return IRQ_SET_MASK_OK;
>
> does the same, right?

Yes, clearly that is better.  I don't know what we were thinking there.


>
>> +int octeon_irq_ciu3_xlat(struct irq_domain *d,
>
> static ?

To be used in follow-on patch for MSI-X irq_chip driver residing in a 
separate file.

The idea was to not be changing the to/from static multiple times as the 
new patches were merged.  If you think it preferable, I can make them 
all static and then remove the static later, when needed.

>
>> +			 struct device_node *node,
>> +			 const u32 *intspec,
>> +			 unsigned int intsize,
>> +			 unsigned long *out_hwirq,
>> +			 unsigned int *out_type)
>> +{
>> +
>> +void octeon_irq_ciu3_enable(struct irq_data *data)
>
> static
>
>> +void octeon_irq_ciu3_disable(struct irq_data *data)
>> +void octeon_irq_ciu3_ack(struct irq_data *data)
>> +void octeon_irq_ciu3_mask(struct irq_data *data)
>> +void octeon_irq_ciu3_mask_ack(struct irq_data *data)
>> +int octeon_irq_ciu3_set_affinity(struct irq_data *data,
>> +				 const struct cpumask *dest, bool force)
>
> ditto

Same, see above.


>
>> +int octeon_irq_ciu3_mapx(struct irq_domain *d, unsigned int virq,
>> +			 irq_hw_number_t hw, struct irq_chip *chip)
>
> ....

Yep.

>
>> +void octeon_ciu3_mbox_send(int cpu, unsigned int mbox)
>> +{
>> +	struct octeon_ciu3_info *ciu3_info;
>> +	unsigned int intsn;
>> +	union cvmx_ciu3_iscx_w1s isc_w1s;
>> +	u64 isc_w1s_addr;
>> +
>> +	if (WARN_ON_ONCE(mbox >= CIU3_MBOX_PER_CORE))
>> +		return;
>> +
>> +	intsn = octeon_irq_ciu3_mbox_intsn_for_cpu(cpu, mbox);
>> +	ciu3_info = per_cpu(octeon_ciu3_info, cpu);
>> +	isc_w1s_addr = ciu3_info->ciu3_addr + CIU3_ISC_W1S(intsn);
>> +
>> +	isc_w1s.u64 = 0;
>> +	isc_w1s.s.raw = 1;
>> +
>> +	cvmx_write_csr(isc_w1s_addr, isc_w1s.u64);
>> +	cvmx_read_csr(isc_w1s_addr);
>> +}
>> +EXPORT_SYMBOL(octeon_ciu3_mbox_send);
>
> Why need modules that function?

Similar to the MSI-X irq_chip thing, but this time for follow-on 
kexec/kdump patches which may be implemented as a module.

I will remove the EXPORT_SYMBOL().

>
> Thanks,
>
> 	tglx
>
