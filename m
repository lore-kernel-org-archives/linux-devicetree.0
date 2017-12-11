From: Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>
Subject: Re: [RFC] irqchip: add support for LS1021A external interrupt lines
Date: Mon, 11 Dec 2017 11:02:51 +0100
Message-ID: <2475814.YIHTfursNv@ws-stein>
References: <48d2d08c-c57a-ce49-5958-0fd5ad4a2dc7@arm.com> <58297576-cc32-819d-c6b3-7d1355095482@prevas.dk> <5117875.4tMaEC1223@ws-stein>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5117875.4tMaEC1223@ws-stein>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>
Cc: Rasmus Villemoes <rasmus.villemoes-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday, December 11, 2017, 10:45:09 AM CET Alexander Stein wrote:
> On Monday, December 11, 2017, 10:08:20 AM CET Rasmus Villemoes wrote:
> > >>> +static int
> > >>> +ls1021a_extirq_set_type(struct irq_data *data, unsigned int type)
> > >>> +{
> > >>> +	irq_hw_number_t hwirq = data->hwirq;
> > >>> +	struct extirq_chip_data *chip_data = data->chip_data;
> > >>> +	u32 value, mask;
> > >>> +	int ret;
> > >>> +
> > >>> +	mask = 1U << (31 - hwirq);
> > >>
> > >> Is this really correct? IRQ0 is still at bit position 0. Don't be mislead
> > >> by the left most position in the register layout. This is just strange way
> > >> to express bit-endian access.
> > 
> > Yes, I'm sure. The 26 unused bits in the INTPCR register are marked as
> > reserved with a POR value of 0. Fortunately, they can still be set and
> > read back, and when I did 1U << hwirq it was some of those bits that got
> > set (the POR value of the six used bits are all 1, so the hardware still
> > worked on my board because all the lines happen to be of negative polarity).
> 
> Which functions do reg_read and reg_write in chip_data->syscon->bus_context
> actually point to?
> bus_context is actually a struct regmap_mmio_context *.

Oh, and what is the content of register SCFG_SCFGREVCR?

Alexander

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
