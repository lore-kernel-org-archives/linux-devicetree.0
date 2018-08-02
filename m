From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 5/9] RISC-V: implement low-level interrupt handling
Date: Thu, 2 Aug 2018 11:59:11 +0200
Message-ID: <20180802095911.GA14841@lst.de>
References: <20180726143723.16585-1-hch@lst.de> <20180726143723.16585-6-hch@lst.de> <alpine.DEB.2.21.1808021147540.2037@nanos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1808021147540.2037@nanos.tec.linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Christoph Hellwig <hch@lst.de>, palmer@sifive.com, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, anup@brainfault.org, atish.patra@wdc.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, shorne@gmail.com
List-Id: devicetree@vger.kernel.org

On Thu, Aug 02, 2018 at 11:48:55AM +0200, Thomas Gleixner wrote:
> > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > index 9aaf6c986771..fa2c08e3c05e 100644
> > --- a/arch/riscv/kernel/entry.S
> > +++ b/arch/riscv/kernel/entry.S
> > @@ -168,8 +168,8 @@ ENTRY(handle_exception)
> >  
> >  	/* Handle interrupts */
> >  	move a0, sp /* pt_regs */
> > -	REG_L a1, handle_arch_irq
> > -	jr a1
> > +	move a1, s4 /* scause */
> > +	tail do_IRQ
> 
> What's the reason for doing the whole exception dance in ASM ?

I'll let Palmer defend it.  But for now I just want minimal changes
to actually get a booting system..
