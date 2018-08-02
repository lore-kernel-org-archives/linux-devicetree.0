From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 7/9] irqchip: add a RISC-V PLIC driver
Date: Thu, 2 Aug 2018 13:51:18 +0200
Message-ID: <20180802115118.GB21984@lst.de>
References: <20180726143723.16585-1-hch@lst.de> <20180726143723.16585-8-hch@lst.de> <alpine.DEB.2.21.1808021149470.2037@nanos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1808021149470.2037@nanos.tec.linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Christoph Hellwig <hch@lst.de>, palmer@sifive.com, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, anup@brainfault.org, atish.patra@wdc.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, shorne@gmail.com
List-Id: devicetree@vger.kernel.org

On Thu, Aug 02, 2018 at 12:04:04PM +0200, Thomas Gleixner wrote:
> 
> On Thu, 26 Jul 2018, Christoph Hellwig wrote:
> 
> > This patch adds a driver for the Platform Level Interrupt Controller (PLIC)
> 
> See Documentation/process/submitting-patches.rst and search for 'This patch'

Fixed.

> > +static DEFINE_SPINLOCK(plic_toggle_lock);
> 
> RAW_SPINLOCK please.

Done.

> > +static inline void plic_irq_toggle(struct irq_data *d, int enable)
> > +{
> > +	int cpu;
> > +
> > +	writel(enable, plic_regs + PRIORITY_BASE + d->hwirq * PRIORITY_PER_ID);
> > +	for_each_present_cpu(cpu)
> > +		plic_toggle(cpu, d->hwirq, enable);
> 
> I suggest to make that:
> 
> 	for_each_cpu(cpu, irq_data_get_affinity_mask(d))
> 		plic_toggle(cpu, d->hwirq, enable);

Done.

> That gives you immediately support for interrupt affinity. And then it's
> trivial to do the actual irq_chip::irq_set_affinity() magic as well.

I'll defer that to an incremental patch (added to my todo list).

> > +static void plic_handle_irq(struct pt_regs *regs)
> > +{
> > +	void __iomem *claim =
> > +		plic_hart_offset(smp_processor_id()) + CONTEXT_CLAIM;
> 
> Either ignore the 80 char thing or just move the assignment into the code
> section please. That line break is horrible to read.

That area has been rewritten anyway as we need a cpuid to context
lookup to cover real SOCs vs just qemu.
