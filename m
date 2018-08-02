From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 7/9] irqchip: add a RISC-V PLIC driver
Date: Thu, 2 Aug 2018 12:04:04 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1808021149470.2037@nanos.tec.linutronix.de>
References: <20180726143723.16585-1-hch@lst.de> <20180726143723.16585-8-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180726143723.16585-8-hch@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: palmer@sifive.com, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, anup@brainfault.org, atish.patra@wdc.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, shorne@gmail.com
List-Id: devicetree@vger.kernel.org


On Thu, 26 Jul 2018, Christoph Hellwig wrote:

> This patch adds a driver for the Platform Level Interrupt Controller (PLIC)

See Documentation/process/submitting-patches.rst and search for 'This patch'

> +static inline void __iomem *plic_hart_offset(int ctxid)
> +{
> +	return plic_regs + CONTEXT_BASE + ctxid * CONTEXT_PER_HART;
> +}
> +
> +/*
> + * Protect mask operations on the registers given that we can't assume that
> + * atomic memory operations work on them.
> + */
> +static DEFINE_SPINLOCK(plic_toggle_lock);

RAW_SPINLOCK please.

> +
> +static inline void plic_toggle(int ctxid, int hwirq, int enable)
> +{
> +	u32 __iomem *reg = plic_regs + ENABLE_BASE + ctxid * ENABLE_PER_HART;
> +	u32 hwirq_mask = 1 << (hwirq % 32);
> +
> +	spin_lock(&plic_toggle_lock);
> +	if (enable)
> +		writel(readl(reg) | hwirq_mask, reg);
> +	else
> +		writel(readl(reg) & ~hwirq_mask, reg);
> +	spin_unlock(&plic_toggle_lock);
> +}
> +
> +static inline void plic_irq_toggle(struct irq_data *d, int enable)
> +{
> +	int cpu;
> +
> +	writel(enable, plic_regs + PRIORITY_BASE + d->hwirq * PRIORITY_PER_ID);
> +	for_each_present_cpu(cpu)
> +		plic_toggle(cpu, d->hwirq, enable);

I suggest to make that:

	for_each_cpu(cpu, irq_data_get_affinity_mask(d))
		plic_toggle(cpu, d->hwirq, enable);
       
That gives you immediately support for interrupt affinity. And then it's
trivial to do the actual irq_chip::irq_set_affinity() magic as well.

> +/*
> + * Handling an interrupt is a two-step process: first you claim the interrupt
> + * by reading the claim register, then you complete the interrupt by writing
> + * that source ID back to the same claim register.  This automatically enables
> + * and disables the interrupt, so there's nothing else to do.
> + */
> +static void plic_handle_irq(struct pt_regs *regs)
> +{
> +	void __iomem *claim =
> +		plic_hart_offset(smp_processor_id()) + CONTEXT_CLAIM;

Either ignore the 80 char thing or just move the assignment into the code
section please. That line break is horrible to read.

> +	irq_hw_number_t hwirq;
> +

Other than that this looks halfways sane.

Thanks,

	tglx
