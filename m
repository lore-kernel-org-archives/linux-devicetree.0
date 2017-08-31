From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 05/13] irqchip: add initial support for ompic
Date: Thu, 31 Aug 2017 11:59:40 +0100
Message-ID: <20170831105940.GE15031@leverpostej>
References: <cover.1504129273.git.shorne@gmail.com>
 <538699c64b5601e8800b77da29f7951bf23f57ce.1504129273.git.shorne@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <538699c64b5601e8800b77da29f7951bf23f57ce.1504129273.git.shorne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stafford Horne <shorne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Openrisc <openrisc-cunTk1MwBs9a3B2Vnqf2dGD2FQJk+8+b@public.gmane.org>, Stefan Kristiansson <stefan.kristiansson-MbMCFXIvDHJFcC0YU169RA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonas Bonn <jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 31, 2017 at 06:58:36AM +0900, Stafford Horne wrote:
> From: Stefan Kristiansson <stefan.kristiansson-MbMCFXIvDHJFcC0YU169RA@public.gmane.org>
> 
> IPI driver for OpenRISC Multicore programmable interrupt controller as
> described in the Multicore support section of the OpenRISC 1.2
> proposed architecture specification:
> 
>   https://github.com/stffrdhrn/doc/raw/arch-1.2-proposal/openrisc-arch-1.2-rev0.pdf
> 
> Each OpenRISC core contains a full interrupt controller which is used in
> the SMP architecture for interrupt balancing.  This IPI device is the
> only external device required for enabling SMP on OpenRISC.

I'm a little confused. Is this device the whole "ompic", a sub-device
thereof, or an independent IP block connected to it?

> Pending ops are stored in a memory bit mask which can allow multiple
> pending operations to be set and serviced at a time. This is mostly
> borrowed from the alpha IPI implementation.
> 
> Signed-off-by: Stefan Kristiansson <stefan.kristiansson-MbMCFXIvDHJFcC0YU169RA@public.gmane.org>
> [shorne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org: converted ops to bitmask, wrote commit message]
> Signed-off-by: Stafford Horne <shorne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../bindings/interrupt-controller/ompic.txt        |  22 ++++
>  arch/openrisc/Kconfig                              |   1 +
>  drivers/irqchip/Kconfig                            |   4 +
>  drivers/irqchip/Makefile                           |   1 +
>  drivers/irqchip/irq-ompic.c                        | 117 +++++++++++++++++++++
>  5 files changed, 145 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ompic.txt
>  create mode 100644 drivers/irqchip/irq-ompic.c
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/ompic.txt b/Documentation/devicetree/bindings/interrupt-controller/ompic.txt
> new file mode 100644
> index 000000000000..4176ecc3366d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/ompic.txt
> @@ -0,0 +1,22 @@
> +OpenRISC Multicore Programmable Interrupt Controller
> +
> +Required properties:
> +
> +- compatible : This should be "ompic"

This needs a vendor prefix.

Presumably, this should be "opencores,ompic"? (pending whether this is
actually the whole ompic, as above).

> +- reg : Specifies base physical address and size of the register space. The
> +  size can be arbitrary based on the number of cores the controller has
> +  been configured to handle, typically 8 bytes per core.

How are those regions correlated with CPUs?

e.g. is there a fixed relationship with a physical CPU id, or some
mechanism by which the relationship can be probed dynamically?

> +- interrupt-controller : Identifies the node as an interrupt controller
> +- #interrupt-cells : Specifies the number of cells needed to encode an
> +  interrupt source. The value shall be 1.

No flags? Does this not need edge/level configuration or active high/low
configuration?

> +- interrupts : Specifies the interrupt line to which the ompic is wired.

What is this interrupt used for?

Is this some percpu interrupt used to proxy the IPI? It feels very odd
to assume such a thing from the parent irqchip. Surely this is
intimately coupled with that?

> +
> +Example:
> +
> +ompic: ompic {
> +	compatible = "ompic";
> +	reg = <0x98000000 16>;
> +	#interrupt-cells = <1>;
> +	interrupt-controller;
> +	interrupts = <1>;
> +};

[...]

> +static struct {
> +	unsigned long ops;
> +} ipi_data[NR_CPUS];
> +
> +static void __iomem *ompic_base;

Is there guaranteed to only be one of these system-wide?

[...]

> +void ompic_raise_softirq(const struct cpumask *mask, unsigned int irq)
> +{
> +	unsigned int dst_cpu;
> +	unsigned int src_cpu = smp_processor_id();
> +
> +	for_each_cpu(dst_cpu, mask) {
> +		set_bit(irq, &ipi_data[dst_cpu].ops);
> +
> +		ompic_writereg(ompic_base, OMPIC_IPI_CTRL(src_cpu),
> +			       OMPIC_IPI_CTRL_IRQ_GEN |
> +			       OMPIC_IPI_CTRL_DST(dst_cpu) |
> +			       OMPIC_IPI_DATA(1));
> +	}

Here you assume that the mapping is big enough to cover these registers,
but the ompic_of_init() function didn't sanity-check the size, so this
is not guaranteed.

[...]

> +int __init ompic_of_init(struct device_node *node, struct device_node *parent)
> +{
> +	int irq;
> +
> +	if (WARN_ON(!node))
> +		return -ENODEV;

Given this function is only invoked if the kernel found a node with a
matching compatible string, how can this possibly happen?

> +	memset(ipi_data, 0, sizeof(ipi_data));

As ipi_data was static, it is already zeroed.

> +
> +	ompic_base = of_iomap(node, 0);

What if this failed?

> +
> +	irq = irq_of_parse_and_map(node, 0);

What if this is missing?

> +	setup_irq(irq, &ompi_ipi_irqaction);

As covered earlier, I;m confused by this. I'd expect that your root
irqchip would handle the IPIs, and hence need to probe nothing from the
DT for those.

Here we're assuming the IRQ is wired up to some per-cpu interrupt that
we can treat as an IPI, and that the parent irqchip handles that
appropriately, which seems very odd.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
