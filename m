From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 5/9] RISC-V: implement low-level interrupt handling
Date: Thu, 2 Aug 2018 11:48:55 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1808021147540.2037@nanos.tec.linutronix.de>
References: <20180726143723.16585-1-hch@lst.de> <20180726143723.16585-6-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180726143723.16585-6-hch@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: palmer@sifive.com, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, anup@brainfault.org, atish.patra@wdc.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, shorne@gmail.com
List-Id: devicetree@vger.kernel.org

On Thu, 26 Jul 2018, Christoph Hellwig wrote:
> Add support for a routine that dispatches exceptions with the interrupt
> flags set to either the IPI or irqdomain code (and the clock source in the
> future).
> 
> Loosely based on the irq-riscv-int.c irqchip driver from the RISC-V tree.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/riscv/kernel/entry.S |  4 +--
>  arch/riscv/kernel/irq.c   | 52 ++++++++++++++++++++++++++++++++-------
>  2 files changed, 45 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 9aaf6c986771..fa2c08e3c05e 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -168,8 +168,8 @@ ENTRY(handle_exception)
>  
>  	/* Handle interrupts */
>  	move a0, sp /* pt_regs */
> -	REG_L a1, handle_arch_irq
> -	jr a1
> +	move a1, s4 /* scause */
> +	tail do_IRQ

What's the reason for doing the whole exception dance in ASM ?

>  1:
>  	/* Exceptions run with interrupts enabled */
>  	csrs sstatus, SR_SIE

> +asmlinkage void __irq_entry do_IRQ(struct pt_regs *regs, unsigned long cause)
> +{
> +	struct pt_regs *old_regs = set_irq_regs(regs);
> +
> +	irq_enter();
> +	switch (cause & ~INTERRUPT_CAUSE_FLAG) {
> +#ifdef CONFIG_SMP
> +	case INTERRUPT_CAUSE_SOFTWARE:
> +		/*
> +		 * We only use software interrupts to pass IPIs, so if a non-SMP
> +		 * system gets one, then we don't know what to do.
> +		 */
> +		riscv_software_interrupt();
> +		break;
> +#endif
> +	case INTERRUPT_CAUSE_EXTERNAL:
> +		handle_arch_irq(regs);
> +		break;
> +	default:
> +		panic("unexpected interrupt cause");
> +	}
> +	irq_exit();

Looks about right.

Thanks,

	tglx
