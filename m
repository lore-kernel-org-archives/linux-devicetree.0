From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/6] irqchip: RISC-V Local Interrupt Controller Driver
Date: Wed, 25 Jul 2018 13:24:57 +0200
Message-ID: <20180725112457.GA24502@lst.de>
References: <20180725093649.32332-1-hch@lst.de> <20180725093649.32332-4-hch@lst.de> <c3ccb953-cd75-4a37-636a-ca643602053a@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c3ccb953-cd75-4a37-636a-ca643602053a@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Christoph Hellwig <hch@lst.de>, tglx@linutronix.de, palmer@sifive.com, jason@lakedaemon.net, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, shorne@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 25, 2018 at 12:18:39PM +0100, Marc Zyngier wrote:
> This feels odd. It means that you cannot have the following sequence:
> 
> 	local_irq_disable();
> 	enable_irq(x); // where x is owned by a remote hart
> 
> as smp_call_function_single() requires interrupts to be enabled.
> 
> More fundamentally, why are you trying to make these interrupts look
> global while they aren't? arm/arm64 have similar restrictions with GICv2
> and earlier, and treats these interrupts as per-cpu.
> 
> Given that the drivers that deal with drivers connected to the per-hart
> irqchip are themselves likely to be aware of the per-cpu aspect, it
> would make sense to align things (we've been through that same
> discussion about the clocksource driver a few weeks back).

Right now the only direct consumers are said clocksource, the PLIC
driver later in this series and the RISC-V arch IPI code.  None of them
is going to do a manual enable_irq, so I guess the remote case of the
code is simply dead code.  I'll take a look at converting them to
per-cpu.  I guess the GICv2 driver is the best template?
