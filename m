From: Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>
Subject: Re: [RFC] irqchip: add support for LS1021A external interrupt lines
Date: Mon, 11 Dec 2017 10:45:09 +0100
Message-ID: <5117875.4tMaEC1223@ws-stein>
References: <48d2d08c-c57a-ce49-5958-0fd5ad4a2dc7@arm.com> <9eab29c0-3347-635c-af92-4e8429064ed3@arm.com> <58297576-cc32-819d-c6b3-7d1355095482@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <58297576-cc32-819d-c6b3-7d1355095482-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <rasmus.villemoes-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday, December 11, 2017, 10:08:20 AM CET Rasmus Villemoes wrote:
> >>> +static int
> >>> +ls1021a_extirq_set_type(struct irq_data *data, unsigned int type)
> >>> +{
> >>> +	irq_hw_number_t hwirq = data->hwirq;
> >>> +	struct extirq_chip_data *chip_data = data->chip_data;
> >>> +	u32 value, mask;
> >>> +	int ret;
> >>> +
> >>> +	mask = 1U << (31 - hwirq);
> >>
> >> Is this really correct? IRQ0 is still at bit position 0. Don't be mislead
> >> by the left most position in the register layout. This is just strange way
> >> to express bit-endian access.
> 
> Yes, I'm sure. The 26 unused bits in the INTPCR register are marked as
> reserved with a POR value of 0. Fortunately, they can still be set and
> read back, and when I did 1U << hwirq it was some of those bits that got
> set (the POR value of the six used bits are all 1, so the hardware still
> worked on my board because all the lines happen to be of negative polarity).

Which functions do reg_read and reg_write in chip_data->syscon->bus_context
actually point to?
bus_context is actually a struct regmap_mmio_context *.

> >> Anyway, please use BIT(x) instead.
> 
> I really prefer not to, that macro obfuscates the type, and unsigned
> long is the wrong thing to use for something that must be a 32 bit
> quantity. Sure, BITS_PER_LONG==32 in this case, but I don't think
> BIT(foo) is any easier to read than 1U << (foo).

Well, there a lots of other places where BIT(x) is used for u32 data types,
or even 16 Bit types. IMHO BIT(x) is more obvious as it already says set Bit x

> >>> +	*type = fwspec->param[2] & IRQ_TYPE_SENSE_MASK;
> >>> +	return 0;
> >>> +}
> >>> +
> >>> +static int
> >>> +ls1021a_extirq_domain_alloc(struct irq_domain *domain, unsigned int virq,
> >>> +			    unsigned int nr_irqs, void *arg)
> >>> +{
> >>> +	static const unsigned xlate[NIRQ] = {163,164,165,167,168,169};
> >>     ^^^^^^
> >> No need for static here.
> > 
> > Why would you store this on the stack each time you enter the function?
> 
> Exactly, it takes a lot less .rodata to make this static than having gcc
> generate .text to build this array on the stack.
> 
> > That's the wrong construct (these values should come from DT), but
> > static is perfectly fine.
> 
> OK.

Intresting. Thanks for the info.

Regards,
Alexander
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
