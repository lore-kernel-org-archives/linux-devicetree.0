From: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: simplified RISC-V interrupt and clocksource handling v2
Date: Thu, 02 Aug 2018 10:24:11 -0700 (PDT)
Message-ID: <mhng-1a7030e5-19c4-481b-9f7c-e0976214eb18@palmer-si-x1c4>
References: <20180802115008.4031-1-hch@lst.de>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180802115008.4031-1-hch@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, anup@brainfault.org, atish.patra@wdc.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, shorne@gmail.com
List-Id: devicetree@vger.kernel.org

On Thu, 02 Aug 2018 04:49:57 PDT (-0700), Christoph Hellwig wrote:
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
>     git://git.infradead.org/users/hch/riscv.git riscv-irq-simple.2
>
> Gitweb:
>
>     http://git.infradead.org/users/hch/riscv.git/shortlog/refs/heads/riscv-irq-simple.2
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

Ah, thank you so much.  This is great!  With this patch set applied on top of 
rc7 I can boot QEMU master and get to the Fedora root file system.  I'll review 
the patch set properly, but at least for now I think a

Tested-by: Palmer Dabbelt <palmer@sifive.com>

is warranted.  What's the best way to go about merging this?  There's quite a 
bit of arch/riscv diff here so I don't mind taking it through the RISC-V tree, 
but there's also some irqchip and clocksource stuff as well so I'm not sure if 
that's OK to do.
