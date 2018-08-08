From: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: simplified RISC-V interrupt and clocksource handling v3
Date: Tue, 07 Aug 2018 19:23:19 -0700 (PDT)
Message-ID: <mhng-d7c67842-dff7-4200-bc2e-c3eed1a0a7bf@palmer-si-x1c4>
References: <20180804082319.5711-1-hch@lst.de>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180804082319.5711-1-hch@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>, robh+dt@kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, mark.rutland@arm.com, anup@brainfault.org, atish.patra@wdc.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, shorne@gmail.com
List-Id: devicetree@vger.kernel.org

On Sat, 04 Aug 2018 01:23:11 PDT (-0700), Christoph Hellwig wrote:
> This series tries adds support for interrupt handling and timers
> for the RISC-V architecture.
>
> The basic per-hart interrupt handling implemented by the scause
> and sie CSRs is extremely simple and implemented directly in
> arch/riscv/kernel/irq.c.  In addition there is a irqchip driver
> for the PLIC external interrupt controller, which is called through
> the set_handle_irq API, and a clocksource driver that gets its
> timer interrupt directly from the low-level interrupt handling.
>
> Compared to previous iterations this version does not try to use an
> irqchip driver for the low-level interrupt handling.  This saves
> a couple indirect calls and an additional read of the scause CSR
> in the hot path, makes the code much simpler and last but not least
> avoid the dependency on a device tree for a mandatory architectural
> feature.
>
> A git tree is available here (contains a few more patches before
> the ones in this series)
>
>     git://git.infradead.org/users/hch/riscv.git riscv-irq-simple.3
>
> Gitweb:
>
>     http://git.infradead.org/users/hch/riscv.git/shortlog/refs/heads/riscv-irq-simple.3
>
> Changes since v2:
>  - actually use SEIE instead of STIE in the plic driver
>  - rename the default compat string for the plic to sifive,u5-plic
>  - various spelling fixes
>  - drop a superflous derefence in the plic driver that is taken care of
>    by the following loop
>  - drop the patch to document the enable method - not relevant for the
>    rest of the series
>  - drop the patches for the per-hart timebase frequency - not relevant
>    for the rest of the series.
>  - use riscv_of_processor_hart in the timer driver
>
> Changes since v1:
>  - rename the plic driver to irq-sifive-plic
>  - switch to a default compatible of sifive,plic0 (still supporting the
>    riscv,plic0 name for compatibility)
>  - add a reference for the SiFive PLIC register layout
>  - fix plic_toggle addressing for large numbers of hwirqs
>  - remove the call to ack_bad_irq
>  - use a raw spinlock for plic_toggle_lock
>  - use the irq_desc cpumask in the plic enable/disable methods
>  - add back OF contexid parsing in the plic driver
>  - don't allow COMPILE_TEST builds of the clocksource driver, as it
>    depends on <asm/sbi.h>
>  - default the clocksource driver to y
>  - clean up naming in the clocksource driver
>  - remove the MINDELTA and MAXDELTA #defines
>  - various DT binding fixes

Thanks!  Modulo the one device tree issue I replied to in patch 3 this looks 
great!  We've already gotten the ACKs to take this through the RISC-V tree, so 
I'm going to put this along with the queued RISC-V patches on our for-next 
branch, including my proposed change for "sifive,plic-1.0" but leaving the 
device tree bindings with #{address,size}-cells=1.

We can always change this, but I'd like to get this out so people can start 
playing with it earlier rather than later.

Thanks to everyone for all the help!
