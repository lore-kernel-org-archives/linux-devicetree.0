From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH v3 03/12] irqchip: vf610-mscm: support NVIC parent
Date: Mon, 23 Mar 2015 09:44:35 +0100
Message-ID: <da032151f0c92c8550053e959ff1ffa4@agner.ch>
References: <1426203380-7155-1-git-send-email-stefan@agner.ch>
 <1426203380-7155-4-git-send-email-stefan@agner.ch>
 <20150323001128.GL15137@io.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150323001128.GL15137-fahSIxCzskDQ+YiMSub0/l6hYfS7NtTn@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2015-03-23 01:11, Jason Cooper wrote:
> Stefan,
> 
> On Fri, Mar 13, 2015 at 12:36:11AM +0100, Stefan Agner wrote:
>> Support the NVIC interrupt controller as node parent of the MSCM
>> interrupt router. On the dual-core variants of Vybird (VF6xx), the
>> NVIC interrupt controller is used by the Cortex-M4. To support
>> running Linux on this core too, MSCM needs NVIC parent support too.
>>
>> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
>> ---
>>  drivers/irqchip/irq-vf610-mscm-ir.c | 32 ++++++++++++++++++++++++++------
>>  1 file changed, 26 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-vf610-mscm-ir.c b/drivers/irqchip/irq-vf610-mscm-ir.c
>> index 9521057..bb0e1a3 100644
>> --- a/drivers/irqchip/irq-vf610-mscm-ir.c
>> +++ b/drivers/irqchip/irq-vf610-mscm-ir.c
> ...
>> @@ -101,17 +103,25 @@ static void vf610_mscm_ir_enable(struct irq_data *data)
>>  	writew_relaxed(chip_data->cpu_mask,
>>  		       chip_data->mscm_ir_base + MSCM_IRSPRC(hwirq));
>>
>> -	irq_chip_unmask_parent(data);
>> +	if (parent->chip->irq_enable)
>> +		parent->chip->irq_enable(parent);
>> +	else
>> +		parent->chip->irq_unmask(parent);
>> +
>>  }
>>
>>  static void vf610_mscm_ir_disable(struct irq_data *data)
>>  {
>>  	irq_hw_number_t hwirq = data->hwirq;
>>  	struct vf610_mscm_ir_chip_data *chip_data = data->chip_data;
>> +	struct irq_data *parent = data->parent_data;
>>
>>  	writew_relaxed(0x0, chip_data->mscm_ir_base + MSCM_IRSPRC(hwirq));
>>
>> -	irq_chip_mask_parent(data);
>> +	if (parent->chip->irq_enable)
>> +		parent->chip->irq_disable(parent);
> 
> copy/paste?

Looks like, will fix that.

> 
>> @@ -143,10 +153,17 @@ static int vf610_mscm_ir_domain_alloc(struct irq_domain *domain, unsigned int vi
>>  					      domain->host_data);
>>
>>  	gic_data.np = domain->parent->of_node;
>> -	gic_data.args_count = 3;
>> -	gic_data.args[0] = GIC_SPI;
>> -	gic_data.args[1] = irq_data->args[0];
>> -	gic_data.args[2] = irq_data->args[1];
>> +
>> +	if (mscm_ir_data->is_nvic) {
>> +		gic_data.args_count = 1;
>> +		gic_data.args[0] = irq_data->args[0];
>> +	} else {
>> +		gic_data.args_count = 3;
>> +		gic_data.args[0] = GIC_SPI;
>> +		gic_data.args[1] = irq_data->args[0];
>> +		gic_data.args[2] = irq_data->args[1];
>> +	}
>> +
>>  	return irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, &gic_data);
>>  }
>>
>> @@ -199,6 +216,9 @@ static int __init vf610_mscm_ir_of_init(struct device_node *node,
>>  		goto out_unmap;
>>  	}
>>
>> +	if (of_device_is_compatible(domain->parent->of_node, "arm,armv7m-nvic"))
>> +		mscm_ir_data->is_nvic = true;
>> +
> 
> Could you walk me through how DT backwards compatibility is being
> preserved/broken here?  I'm not saying it's wrong, but every other conversion
> to stacked domains involves a compatibility break.  At the very least, I'd like
> to see it discussed in the commit log.

The MSCM interrupt register driver built on-top of stacked domains since
it was initially merged:
https://lkml.org/lkml/2015/3/1/200

A MSCM interrupt router is required for both CPU's to actually receive
interrupts. However, traditionally the bootloader configured the
interrupter router to route all interrupts to the Cortex-A5.

The introduction of the MSCM interrupt router broke the backward
compatibility for Linux on the Cortex-A5/GIC of Freescale Vybrid (a new
device tree only work with a new kernels, old kernel with a new device
tree refuse to boot due to missing interrupts). However, it makes sure
that Linux does not depend on the bootloader configuration anymore.

However, this patch enables the use of stacked domain for NVIC, to make
the combination MSCM interrupt router/NVIC for the Cortex-M4 work.
However, since the bootloader preconfigure the MSCM interrupt router for
the A5 (GIC), the M4 (NVIC) would never receive an interrupt without
this... Also, we did not had a device tree which makes use of
Cortex-M4/NVIC on Vybrid so far.

--
Stefan

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
