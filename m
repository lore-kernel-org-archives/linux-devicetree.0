From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] irqchip: add support for Sigma Designs SMP86xx interrupt controller
Date: Fri, 20 Nov 2015 12:00:28 +0000
Message-ID: <yw1xfv00ev8j.fsf@unicorn.mansr.com>
References: <1447958026-3015-1-git-send-email-mans@mansr.com>
	<1447958026-3015-3-git-send-email-mans@mansr.com>
	<564EF235.7030207@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <564EF235.7030207-5wv7dgnIgG8@public.gmane.org> (Marc Zyngier's message of "Fri, 20
	Nov 2015 10:13:09 +0000")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org> writes:

>> +static void tangox_dispatch_irqs(struct irq_domain *dom, unsigned i=
nt status,
>> +				 int base)
>> +{
>> +	unsigned int hwirq;
>> +	unsigned int virq;
>> +
>> +	while (status) {
>> +		hwirq =3D __ffs(status);
>> +		virq =3D irq_find_mapping(dom, base + hwirq);
>
> You may want to check virq in case you get interrupts from unexpected
> sources (unlikely, but still).

Sure, never hurts to be safe.

>> +		generic_handle_irq(virq);
>> +		status &=3D ~BIT(hwirq);
>> +	}
>> +}

[...]

>> +static int __init tangox_irq_init(void __iomem *base, struct device=
_node *node)
>> +{
>> +	struct tangox_irq_chip *chip;
>> +	struct irq_domain *dom;
>> +	const char *name;
>> +	u32 ctl;
>> +	int irq;
>> +	int err;
>> +	int i;
>> +
>> +	irq =3D irq_of_parse_and_map(node, 0);
>> +	if (!irq)
>> +		panic("%s: failed to get IRQ", node->name);
>> +
>> +	if (of_property_read_u32(node, "sigma,reg-offset", &ctl))
>> +		panic("%s: failed to get reg base", node->name);
>
> My DT foo is a bit crap, but I'm sure there is ways to express ranges
> inside a region that do not require to have vendor-specific propertie=
s.
> Mark?

I wasn't happy about that either.  The usual way is to use a "ranges"
property in the parent node and "reg" in the child node.  That makes it
easy to obtain a mapping of the child range using of_iomap() or
whatever.  The problem is that that's not what I need here.  The type
and ack registers are common while the enable/disable registers are per
sub-block, and the generic irqchip structs use a single base address an=
d
offsets for the various registers, so I need the offset from the common
base to the start of the per-block registers, not the actual full
address.  I could use of_address_to_resource() and subtract one from th=
e
other, I suppose.

>> +
>> +	if (of_property_read_string(node, "label", &name))
>> +		name =3D node->name;
>
> Do you really need this cosmetic thing? node->name should be enough f=
or
> everybody, and the "label" has nothing to do with the HW description.

No, it's not needed.  I'll get rid of it.

>> +
>> +	chip =3D kzalloc(sizeof(*chip), GFP_KERNEL);
>> +	chip->ctl =3D ctl;
>> +	chip->base =3D base;
>> +
>> +	dom =3D irq_domain_add_linear(node, 64, &irq_generic_chip_ops, chi=
p);
>> +	if (!dom)
>> +		panic("%s: failed to create irqdomain", node->name);
>> +
>> +	err =3D irq_alloc_domain_generic_chips(dom, 32, 2, name, handle_le=
vel_irq,
>> +					     0, 0, 0);
>> +	if (err)
>> +		panic("%s: failed to allocate irqchip", node->name);
>> +
>> +	tangox_irq_domain_init(dom);
>> +
>> +	for (i =3D 0; i < 64; i++)
>> +		irq_create_mapping(dom, i);
>
> /me puzzled. What's that for? You really should never need something
> like this.

I had some reason for doing when I first wrote this code (MIPS, no DT),
but it's not needed now.

--=20
M=E5ns Rullg=E5rd
mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
