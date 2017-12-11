From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: Re: [RFC] irqchip: add support for LS1021A external interrupt lines
Date: Mon, 11 Dec 2017 10:08:20 +0100
Message-ID: <58297576-cc32-819d-c6b3-7d1355095482@prevas.dk>
References: <48d2d08c-c57a-ce49-5958-0fd5ad4a2dc7@arm.com>
 <1512743580-15358-1-git-send-email-rasmus.villemoes@prevas.dk>
 <2278177.dEyeroM47a@ws-stein> <9eab29c0-3347-635c-af92-4e8429064ed3@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9eab29c0-3347-635c-af92-4e8429064ed3@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2017-12-08 17:09, Marc Zyngier wrote:
> On 08/12/17 15:11, Alexander Stein wrote:
>> Hi Rasmus,
>>
>>> +
>>> +Required properties:
>>> +- compatible: should be "fsl,ls1021a-extirq"
>>> +- interrupt-controller: Identifies the node as an interrupt controller
>>> +- #interrupt-cells: Use the same format as specified by GIC in arm,gic.txt.
>>
>> Do you really need 3 interrupt-cells here? As you've written below you don't
>> support PPI anyway the 1st flag might be dropped then. So support just 2 cells:
>> * IRQ number (IRQ0 - IRQ5)
>> * IRQ flags
> 
> The convention for irqchip stacked on top of a GIC is to keep the
> interrupt specifier the same. It makes the maintenance if the DT much
> easier, and doesn't hurt at all.

Yes, I just followed the lead of existing drivers.

>>> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
>>> index b842dfdc903f..d4576dce24b2 100644
>>> --- a/drivers/irqchip/Makefile
>>> +++ b/drivers/irqchip/Makefile
>>> @@ -80,3 +80,4 @@ obj-$(CONFIG_ARCH_ASPEED)		+= irq-aspeed-vic.o irq-aspeed-i2c-ic.o
>>>  obj-$(CONFIG_STM32_EXTI) 		+= irq-stm32-exti.o
>>>  obj-$(CONFIG_QCOM_IRQ_COMBINER)		+= qcom-irq-combiner.o
>>>  obj-$(CONFIG_IRQ_UNIPHIER_AIDET)	+= irq-uniphier-aidet.o
>>> +obj-$(CONFIG_SOC_LS1021A)		+= irq-ls1021a.o
>>
>> I guess this should be kept sorted alphabetically.
> 
> There is no such requirement. But grouping it next to the other FSL
> irqchip would make more sense.

Yeah, if the Makefile had been at least somewhat sorted already I'd have
followed that. I'll move it next to LS_SCFG_MSI in next version.

>>> +static int
>>> +ls1021a_extirq_set_type(struct irq_data *data, unsigned int type)
>>> +{
>>> +	irq_hw_number_t hwirq = data->hwirq;
>>> +	struct extirq_chip_data *chip_data = data->chip_data;
>>> +	u32 value, mask;
>>> +	int ret;
>>> +
>>> +	mask = 1U << (31 - hwirq);
>>
>> Is this really correct? IRQ0 is still at bit position 0. Don't be mislead
>> by the left most position in the register layout. This is just strange way
>> to express bit-endian access.

Yes, I'm sure. The 26 unused bits in the INTPCR register are marked as
reserved with a POR value of 0. Fortunately, they can still be set and
read back, and when I did 1U << hwirq it was some of those bits that got
set (the POR value of the six used bits are all 1, so the hardware still
worked on my board because all the lines happen to be of negative polarity).

>> Anyway, please use BIT(x) instead.

I really prefer not to, that macro obfuscates the type, and unsigned
long is the wrong thing to use for something that must be a 32 bit
quantity. Sure, BITS_PER_LONG==32 in this case, but I don't think
BIT(foo) is any easier to read than 1U << (foo).

>>> +
>>> +	/* Don't do the INTPCR_REG update if the parent irq_set_type will EINVAL. */
>>> +	if (type != IRQ_TYPE_LEVEL_HIGH && type != IRQ_TYPE_EDGE_RISING)
>>> +		return -EINVAL;
>>
>> I wonder if it is better to call data->parent_data->chip->irq_set_type(data, type)
>> here instead and call regmap if this suceeded.
> 
> Not really. In both cases, you need to evaluate the failure (which is
> not don here). So ordering doesn't matter. What actually matters is
> error handling and atomicity (in this case, making sure that drivers
> cannot observe an interrupt flood between the two reconfigurations).

I'm not really sure when the interrupt gets unmasked, but if it happens
during the parent ->set_type, we must have set the polarity beforehand.
Also, I don't see why one would need to undo the INTPCR update - the
polarity of the external line is a property of whatever hardware is
attached (right?), so setting the INTPCR according to the DT just
ensures the GIC gets a positive signal. Anyway, if I do need to add
unwind code, I suppose the answer to

>>> +	/* regmap does internal locking, but do we need to provide our
>>> +	 * own across the parent irq_set_type call? */

is yes.

>>> +	*hwirq = fwspec->param[1];
>>
>> Is a check for the hwirq value required here? I'm not an expert on
>> irqchip API, so I just wonder.
> 
> In general, the driver is not in the business of validating the DT. But
> that wouldn't hurt...

Yeah, wasn't sure about this, but I can certainly add a check.

>>
>>> +	*type = fwspec->param[2] & IRQ_TYPE_SENSE_MASK;
>>> +	return 0;
>>> +}
>>> +
>>> +static int
>>> +ls1021a_extirq_domain_alloc(struct irq_domain *domain, unsigned int virq,
>>> +			    unsigned int nr_irqs, void *arg)
>>> +{
>>> +	static const unsigned xlate[NIRQ] = {163,164,165,167,168,169};
>>     ^^^^^^
>> No need for static here.
> 
> Why would you store this on the stack each time you enter the function?

Exactly, it takes a lot less .rodata to make this static than having gcc
generate .text to build this array on the stack.

> That's the wrong construct (these values should come from DT), but
> static is perfectly fine.

OK.

> [...]
> 
>>> +	domain_parent = irq_find_host(parent);
>>> +	if (!domain_parent) {
>>> +		pr_err("interrupt-parent not found\n");
>>> +		return -EINVAL;
>>> +	}
>>
>> Mh, does this mean if GIC has not been probed, this probe is not deferred?
>> Is there an API to check for that?
> 
> This is not a normal driver, there is not deferred probing. You'd get
> this error if the kernel had gone really wrong.

Yes, isn't this what the code in of_irq_init does? Initialize parent
interrupt controllers before their children (even if this maybe doesn't
qualify as a real interrupt controller)?

Rasmus
