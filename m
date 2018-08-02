From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/6] irqchip: RISC-V Local Interrupt Controller Driver
Date: Thu, 2 Aug 2018 11:43:00 +0200
Message-ID: <20180802094300.GA14127@lst.de>
References: <20180725093649.32332-1-hch@lst.de> <20180725093649.32332-4-hch@lst.de> <c3ccb953-cd75-4a37-636a-ca643602053a@arm.com> <20180725112457.GA24502@lst.de> <alpine.DEB.2.21.1808012049170.1835@nanos.tec.linutronix.de> <20180802073452.GA11693@lst.de> <alpine.DEB.2.21.1808021038260.2037@nanos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1808021038260.2037@nanos.tec.linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Christoph Hellwig <hch@lst.de>, Marc Zyngier <marc.zyngier@arm.com>, palmer@sifive.com, jason@lakedaemon.net, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, shorne@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 02, 2018 at 11:35:43AM +0200, Thomas Gleixner wrote:
> On Thu, 2 Aug 2018, Christoph Hellwig wrote:
> > The cpu local interrupt handling, which was irq-riscv-intc.c in this
> > series and has been moved to arch/riscv/kernel/irq.c in my new series
> > is split over a few control registers (CSRs in RISC-V speak):
> > 
> > The exception handler, which includes the delivery of interrupts to
> > the CPU is set up using the stvec CSR (Section 4.1.4).  The vector mode
> > mentioned there is not supported by Linux (and not by any hardware known
> > to me), so ignore it.
> 
> And even if it would be available then it would just avoid the software
> decoding of the cause register. So no fundamental difference.
> 
> > Once an exception has been triggered Linux reads the scause CSR
> > (Section 4.1.10) to check the exception cause.  If the interrupt
> > bit is set we have three possible exception causes that matter for
> > the kernel: Supervisor software interrupt, Supervisor timer interrupt,
> > Supervisor external interrupt (ignore the user versions, I'm not even
> > sure they are implementable, and they certainly are not at the moment).
> 
> Yeah. I would upfront declare the user stuff broken and not supported.
> 
> > To enable / disable any of these logical interrupt sources the sie
> > CSR (Section 4.1.5) has a bit for each kind thast can be set/cleared.
> > 
> > Also there is the sip CSR (also section 4.1.5) which tells if any of those
> > is pending at the moment.
> 
> So that's the low level per cpu interrupt/exception distribution mechanism,
> i.e. a distinct per cpu 'vector' space with fixed functionality. It does
> not make sense to actually handle that as an irq chip. It has absolutely no
> relevance. The software interrupts are enabled when the CPU is started and
> the external ones as well as they are gated by the PLIC.
> 
> The only thing which might need to access the enable register is the local
> timer interrupt. That really does not require an extra irq chip as the
> enable/disable is really just at cpu up/down time and the magic happens on
> the local CPU so no smp functional call hackery is required.
> 
> The PLIC is the beast which wants a proper irqdomain/irqchip
> implementation.

And that is exactly what I've done in the repost.

Local interrupt handling:

http://git.infradead.org/users/hch/riscv.git/commitdiff/149ae0008effe80e1fb79444eb6a03c45bed29ba

PLIC driver:

http://git.infradead.org/users/hch/riscv.git/commitdiff/00f68341fa6dcda9b7c6c4da7eeb52d7ef933368

Clocksource:

http://git.infradead.org/users/hch/riscv.git/commitdiff/51981cbba2fe2a118bb84b4c4aabb0f0d988ed2a

I need to polish the DT binding a little more and will repost later today.

> 
> Thanks,
> 
> 	tglx
---end quoted text---
