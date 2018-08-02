From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/6] irqchip: RISC-V Local Interrupt Controller Driver
Date: Thu, 2 Aug 2018 09:34:52 +0200
Message-ID: <20180802073452.GA11693@lst.de>
References: <20180725093649.32332-1-hch@lst.de> <20180725093649.32332-4-hch@lst.de> <c3ccb953-cd75-4a37-636a-ca643602053a@arm.com> <20180725112457.GA24502@lst.de> <alpine.DEB.2.21.1808012049170.1835@nanos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1808012049170.1835@nanos.tec.linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Christoph Hellwig <hch@lst.de>, Marc Zyngier <marc.zyngier@arm.com>, palmer@sifive.com, jason@lakedaemon.net, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, shorne@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 01, 2018 at 08:55:06PM +0200, Thomas Gleixner wrote:
> Confused. The timer and the IPI are separate causes and have nothing to do
> with the per cpu irq domain. That's what the low level interrupt handling
> code tells me.

Yes.

> If I understand correctly then the per cpu irq domain is for device
> interrupts, right? If so, then this simply cannot work and there is no way
> to make it work with per cpu interrupts either.

Actually I don't think we even need the per cpu irq domain, see my
latest version of these patches here (which I'll send out again after
fixing up the remaining device tree binding review comments):

http://git.infradead.org/users/hch/riscv.git/shortlog/refs/heads/riscv-irq-simple.2

> Is there some high level documentation about the design (or the lack of) or
> can someone give a concise explanation how this stuff is supposed to work?

All of the current RISC-V irq handling concepts are document in the RISC-V
privile spec:

https://content.riscv.org/wp-content/uploads/2017/05/riscv-privileged-v1.10.pdf

The cpu local interrupt handling, which was irq-riscv-intc.c in this
series and has been moved to arch/riscv/kernel/irq.c in my new series
is split over a few control registers (CSRs in RISC-V speak):

The exception handler, which includes the delivery of interrupts to
the CPU is set up using the stvec CSR (Section 4.1.4).  The vector mode
mentioned there is not supported by Linux (and not by any hardware known
to me), so ignore it.

Once an exception has been triggered Linux reads the scause CSR
(Section 4.1.10) to check the exception cause.  If the interrupt
bit is set we have three possible exception causes that matter for
the kernel: Supervisor software interrupt, Supervisor timer interrupt,
Supervisor external interrupt (ignore the user versions, I'm not even
sure they are implementable, and they certainly are not at the moment).

To enable / disable any of these logical interrupt sources the sie
CSR (Section 4.1.5) has a bit for each kind thast can be set/cleared.

Also there is the sip CSR (also section 4.1.5) which tells if any of those
is pending at the moment.

The PLIC itself is only described logically in the RISC-V privileged
spec (Section 7), the actual register layout is left to implementations.
The one implemented here is documented in Chaper 5 of this document:

https://static.dev.sifive.com/SiFive-E3-Coreplex-v1.2.pdf
