From: Rasmus Villemoes <rasmus.villemoes-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Subject: Re: [RFC] irqchip: add support for LS1021A external interrupt lines
Date: Mon, 11 Dec 2017 10:30:14 +0100
Message-ID: <563e0aaa-faf9-ae6a-ccd4-2aa89d7e457b@prevas.dk>
References: <48d2d08c-c57a-ce49-5958-0fd5ad4a2dc7@arm.com>
 <1512743580-15358-1-git-send-email-rasmus.villemoes@prevas.dk>
 <da843420-cede-e787-838d-1fd48e3ca7dd@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <da843420-cede-e787-838d-1fd48e3ca7dd-5wv7dgnIgG8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2017-12-08 17:02, Marc Zyngier wrote:
>> +
>> +#define INTPCR_REG 0x01ac
>> +#define NIRQ 6
> 
> These should come from the DT, specially if as suggested above, there
> are other similar HW in the wild.

OK, but see below.

>> +static int
>> +ls1021a_extirq_set_type(struct irq_data *data, unsigned int type)
>> +{
>> +	irq_hw_number_t hwirq = data->hwirq;
>> +	struct extirq_chip_data *chip_data = data->chip_data;
>> +	u32 value, mask;
>> +	int ret;
>> +
>> +	mask = 1U << (31 - hwirq);
>> +	if (type == IRQ_TYPE_LEVEL_LOW || type == IRQ_TYPE_EDGE_FALLING) {
>> +		if (type == IRQ_TYPE_LEVEL_LOW)
>> +			type = IRQ_TYPE_LEVEL_HIGH;
>> +		else
>> +			type = IRQ_TYPE_EDGE_RISING;
>> +		value = mask;
>> +	} else {
>> +		value = 0;
>> +	}
>> +
>> +	/* Don't do the INTPCR_REG update if the parent irq_set_type will EINVAL. */
>> +	if (type != IRQ_TYPE_LEVEL_HIGH && type != IRQ_TYPE_EDGE_RISING)
>> +		return -EINVAL;
> 
> How about starting by rejecting the values that you cannot handle (which
> seems to only be IRQ_TYPE_EDGE_BOTH)? Actually, if you wrote the whole
> thing as a swtch/case, it'd be a lot more readable.

OK, will try that.

>> +
>> +	/* regmap does internal locking, but do we need to provide our
>> +	 * own across the parent irq_set_type call? */
> 
> Comment format.

[Somewhat deliberate, I never meant for that comment to stay in a final
version. It's gone once I figure out the answer.]

>> +	regmap_update_bits(chip_data->syscon, INTPCR_REG, mask, value);
>> +
>> +	data = data->parent_data;
>> +	ret = data->chip->irq_set_type(data, type);
> 
> Restore the previous regmap configuration on failure?

Not sure what one would get from that?

> Also, given that
> you end-up changing the interrupt polarity in a non-atomic way (you have
> two independent irqchips), it'd feel safer if you'd use
> IRQCHIP_SET_TYPE_MASKED.

Ah, yes, makes sense. Will do.

>> +
>> +	return ret;
>> +}
>> +
>> +static struct irq_chip extirq_chip = {
>> +	.name			= "LS1021A_EXTIRQ",
> 
> Care to make this shorter?

Sure, I'll just call it extirq.

>> +static int
>> +ls1021a_extirq_domain_alloc(struct irq_domain *domain, unsigned int virq,
>> +			    unsigned int nr_irqs, void *arg)
>> +{
>> +	static const unsigned xlate[NIRQ] = {163,164,165,167,168,169};
> 
> This should really come from your DT.
> 
>> +	int i;
>> +	irq_hw_number_t hwirq;
>> +	struct irq_fwspec *fwspec = arg;
>> +	struct irq_fwspec gic_fwspec;
>> +
>> +	if (fwspec->param_count != 3)
>> +		return -EINVAL;
>> +
>> +	if (fwspec->param[0])
>> +		return -EINVAL;
>> +
>> +	hwirq = fwspec->param[1];
>> +	for (i = 0; i < nr_irqs; i++)
> 
> This loop is pointless, as nr_irqs can only be >1 in the multi-MSI case.

OK, thanks.

>> +static int __init
>> +ls1021a_extirq_of_init(struct device_node *node, struct device_node *parent)
>> +{
>> +
>> +	struct irq_domain *domain, *domain_parent;
>> +	struct extirq_chip_data *chip_data;
>> +	int ret;
>> +
>> +	domain_parent = irq_find_host(parent);
>> +	if (!domain_parent) {
>> +		pr_err("interrupt-parent not found\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	chip_data = kzalloc(sizeof(*chip_data), GFP_KERNEL);
>> +	if (!chip_data)
>> +		return -ENOMEM;
>> +
>> +	chip_data->syscon = syscon_regmap_lookup_by_phandle(node, "syscon");
>> +	if (IS_ERR(chip_data->syscon)) {
>> +		ret = PTR_ERR(chip_data->syscon);
>> +		goto out_free_chip;
>> +	}
>> +
>> +	domain = irq_domain_add_hierarchy(domain_parent, 0, NIRQ, node,
>> +					  &extirq_domain_ops, chip_data);
>> +	if (!domain) {
>> +		ret = -ENOMEM;
>> +		goto out_free_chip;
>> +	}
>> +
>> +	return 0;
>> +
>> +out_free_chip:
>> +	kfree(chip_data);
>> +	return ret;
>> +}
>> +
>> +IRQCHIP_DECLARE(ls1021a_extirq, "fsl,ls1021a-extirq", ls1021a_extirq_of_init);
>>
> 
> Overall, it is a bit annoying that you just copied the driver altogether
> instead of trying to allow the common stuff to be shared between
> drivers. Most of this is just boilerplate code...

Yes, it did annoy me as well. However, the real meat of this is which
bits of which register to poke to support a negative polarity irq, and
there doesn't seem to be a good way to express that in DT. The register
offset and the mapping from external irq# to the GIC one is reasonably
easy (and would thus get rid of my NIRQ and INTPCR macros), but
describing the mapping from IRQ# to the bit that needs to be set (or
cleared) seems much harder. I cannot generalize from one example, so
lacking documentation for any other Layerscape SOC, whatever I might
come up with might not actually be useful for other hardware, making it
rather pointless. But if you have any suggestions for how the DT
bindings might look, I'm all ears.

Thanks a lot for your feedback!

Rasmus
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
