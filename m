From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 3/3] irqchip: RISC-V Local Interrupt Controller Driver
Date: Sat, 23 Jun 2018 10:56:29 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1806231041110.8650@nanos.tec.linutronix.de>
References: <20180622232006.12158-1-palmer@sifive.com> <20180622232006.12158-4-palmer@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180622232006.12158-4-palmer@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Palmer Dabbelt <palmer@sifive.com>
Cc: jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, aou@eecs.berkeley.edu, shorne@gmail.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Michael Clark <mjc@sifive.com>
List-Id: devicetree@vger.kernel.org

On Fri, 22 Jun 2018, Palmer Dabbelt wrote:
> +struct riscv_irq_data {
> +	struct irq_chip		chip;
> +	struct irq_domain	*domain;
> +	int			hart;
> +	char			name[20];
> +};
> +DEFINE_PER_CPU(struct riscv_irq_data, riscv_irq_data);

static ?

> +static void riscv_intc_irq(struct pt_regs *regs)
> +{
> +	struct pt_regs *old_regs = set_irq_regs(regs);
> +	struct irq_domain *domain;
> +	unsigned long cause = csr_read(scause);
> +
> +	/*
> +	 * The high order bit of the trap cause register is always set for
> +	 * interrupts, which allows us to differentiate them from exceptions
> +	 * quickly.  The INTERRUPT_CAUSE_* macros don't contain that bit, so we
> +	 * need to mask it off here.
> +	 */
> +	WARN_ON((cause & (1UL << (PTR_BITS - 1))) == 0);

So what's the point of continuing here? 


> +	cause = cause & ~(1UL << (PTR_BITS - 1));

Please define a proper CAUSE_MASK or such as this is really hard to read.

> +/*
> + * On RISC-V systems local interrupts are masked or unmasked by writing the SIE
> + * (Supervisor Interrupt Enable) CSR.  As CSRs can only be written on the local
> + * hart, these functions can only be called on the hart that corresponds to the
> + * IRQ chip.  They are only called internally to this module, so they BUG_ON if
> + * this condition is violated rather than attempting to handle the error by
> + * forwarding to the target hart, as that's already expected to have been done.
> + */
> +static void riscv_irq_mask(struct irq_data *d)
> +{
> +	struct riscv_irq_data *data = irq_data_get_irq_chip_data(d);
> +
> +	BUG_ON(smp_processor_id() != data->hart);
> +	csr_clear(sie, 1 << (long)d->hwirq);

What's the point of this type cast? Whether you shift by unsigned long or by
long does not really matter, right? I'd rather expected to see 1U << d->hwirq

> +static int __init riscv_intc_init(struct device_node *node, struct device_node *parent)
> +{
> +	int hart;
> +	struct riscv_irq_data *data;

Nit. Reverse fir tree ordering please

	struct riscv_irq_data *data;
	int hart;

Simpler to parse.

> +
> +	if (parent)
> +		return 0;

Hmm, that wants a comment because it's not clear why this is done for the
casual reader.

> +
> +	hart = riscv_of_processor_hart(node->parent);
> +	if (hart < 0)
> +		return -EIO;
> +
> +	data = &per_cpu(riscv_irq_data, hart);
> +	snprintf(data->name, sizeof(data->name), "riscv,cpu_intc,%d", hart);
> +	data->hart = hart;
> +	data->chip.name = data->name;
> +	data->chip.irq_mask = riscv_irq_mask;
> +	data->chip.irq_unmask = riscv_irq_unmask;
> +	data->chip.irq_enable = riscv_irq_enable;
> +	data->chip.irq_disable = riscv_irq_disable;
> +	data->domain = irq_domain_add_linear(node, PTR_BITS,
> +					     &riscv_irqdomain_ops, data);
> +	if (!data->domain)
> +		goto error_add_linear;
> +
> +	set_handle_irq(&riscv_intc_irq);
> +
> +	pr_info("%s: %lu local interrupts mapped\n", data->name, PTR_BITS);
> +	return 0;
> +
> +error_add_linear:
> +	pr_warning("%s: unable to add IRQ domain\n",
> +		   data->name);

One line please.

> +	return -ENXIO;

Thanks,

	tglx
