From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 05/13] irqchip: add initial support for ompic
Date: Mon, 23 Oct 2017 09:00:09 +0100
Message-ID: <86d15egupi.fsf@arm.com>
References: <20171022031600.29612-1-shorne@gmail.com>
        <20171022031600.29612-6-shorne@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171022031600.29612-6-shorne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> (Stafford Horne's
        message of "Sun, 22 Oct 2017 12:15:52 +0900")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stafford Horne <shorne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Openrisc <openrisc-cunTk1MwBs9a3B2Vnqf2dGD2FQJk+8+b@public.gmane.org>, Stefan Kristiansson <stefan.kristiansson-MbMCFXIvDHJFcC0YU169RA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jonas Bonn <jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Oct 22 2017 at 12:15:52 pm BST, Stafford Horne <shorne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Stefan Kristiansson <stefan.kristiansson-MbMCFXIvDHJFcC0YU169RA@public.gmane.org>
>
> IPI driver for the Open Multi-Processor Interrupt Controller (ompic) as
> described in the Multi-core support section of the OpenRISC 1.2
> proposed architecture specification:
>
>   https://github.com/stffrdhrn/doc/raw/arch-1.2-proposal/openrisc-arch-1.2-rev0.pdf
>
> Each OpenRISC core contains a full interrupt controller which is used in
> the SMP architecture for interrupt balancing.  This IPI device, the
> ompic, is the only external device required for enabling SMP on
> OpenRISC.
>
> Pending ops are stored in a memory bit mask which can allow multiple
> pending operations to be set and serviced at a time. This is mostly
> borrowed from the alpha IPI implementation.
>
> Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Stefan Kristiansson <stefan.kristiansson-MbMCFXIvDHJFcC0YU169RA@public.gmane.org>
> [shorne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org: converted ops to bitmask, wrote commit message]
> Signed-off-by: Stafford Horne <shorne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>
> Changes since v2
>  - Fixed some issues with missing static
>  - Fixed spelling issue with multi-core
>  - Added back #interrupt-cells
>
> Changes since v1
>  - Added openrisc, prefix
>  - Clarified 8 bytes per cpu
>  - Removed #interrupt-cells as this will not be an irq parent
>  - Changed ops to be percpu
>  - Added DTS and intialization failure validations
>
>
>  .../interrupt-controller/openrisc,ompic.txt        |  22 +++
>  MAINTAINERS                                        |   1 +
>  arch/openrisc/Kconfig                              |   1 +
>  drivers/irqchip/Kconfig                            |   3 +
>  drivers/irqchip/Makefile                           |   1 +
>  drivers/irqchip/irq-ompic.c                        | 205 +++++++++++++++++++++
>  6 files changed, 233 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/openrisc,ompic.txt
>  create mode 100644 drivers/irqchip/irq-ompic.c

[...]

> +static struct irqaction ompi_ipi_irqaction = {
> +	.handler =      ompic_ipi_handler,
> +	.flags =        IRQF_PERCPU,
> +	.name =         "ompic_ipi",
> +};
> +
> +static int __init ompic_of_init(struct device_node *node, struct device_node *parent)
> +{
> +	struct resource res;
> +	int irq;
> +	int ret;
> +
> +	/* Validate the DT */
> +	if (ompic_base) {
> +		pr_err("ompic: duplicate ompic's are not supported");
> +		return -EEXIST;
> +	}
> +
> +	if (of_address_to_resource(node, 0, &res)) {
> +		pr_err("ompic: reg property requires an address and size");
> +		return -EINVAL;
> +	}
> +
> +	if (resource_size(&res) < (num_possible_cpus() * OMPIC_CPUBYTES)) {
> +		pr_err("ompic: reg size, currently %d must be at least %d",
> +			resource_size(&res),
> +			(num_possible_cpus() * OMPIC_CPUBYTES));
> +		return -EINVAL;
> +	}
> +
> +	/* Setup the device */
> +	ompic_base = ioremap(res.start, resource_size(&res));
> +	if (IS_ERR(ompic_base)) {
> +		pr_err("ompic: unable to map registers");
> +		return PTR_ERR(ompic_base);
> +	}
> +
> +	irq = irq_of_parse_and_map(node, 0);
> +	if (irq <= 0) {
> +		pr_err("ompic: unable to parse device irq");
> +		ret = -EINVAL;
> +		goto out_unmap;
> +	}
> +
> +	ret = setup_irq(irq, &ompi_ipi_irqaction);
> +	if (ret)
> +		goto out_irq_disp;

Is there a particular reason why this cannot be turned request_irq()
call? setup_irq is something we try to avoid these days...

> +
> +	set_smp_cross_call(ompic_raise_softirq);
> +
> +	return 0;
> +
> +out_irq_disp:
> +	irq_dispose_mapping(irq);
> +out_unmap:
> +	iounmap(ompic_base);
> +	ompic_base = NULL;
> +	return ret;
> +}
> +IRQCHIP_DECLARE(ompic, "openrisc,ompic", ompic_of_init);

Otherwise looks good to me.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
