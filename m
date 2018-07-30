From: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH 7/9] irqchip: add a RISC-V PLIC driver
Date: Mon, 30 Jul 2018 21:21:58 +0530
Message-ID: <CAAhSdy1rGMqhLDKMipGgP+4sYyNc_ckuHREy+Y8zb-hJeeZPog@mail.gmail.com>
References: <20180726143723.16585-1-hch@lst.de> <20180726143723.16585-8-hch@lst.de>
 <1b3f6066-0c7c-a5f5-75ad-559fe81091ee@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1b3f6066-0c7c-a5f5-75ad-559fe81091ee@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Atish Patra <atish.patra@wdc.com>
Cc: Christoph Hellwig <hch@lst.de>, Thomas Gleixner <tglx@linutronix.de>, "palmer@sifive.com" <palmer@sifive.com>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "marc.zyngier@arm.com" <marc.zyngier@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "shorne@gmail.com" <shorne@gmail.com>
List-Id: devicetree@vger.kernel.org

On Sat 28 Jul, 2018, 5:34 AM Atish Patra, <atish.patra@wdc.com> wrote:
>
> On 7/26/18 7:38 AM, Christoph Hellwig wrote:
> > This patch adds a driver for the Platform Level Interrupt Controller (PLIC)
> > specified as part of the RISC-V supervisor level ISA manual, in the memory
> > layout implemented by SiFive and qemu.
> >
> > The PLIC connects global interrupt sources to the local interrupt controller
> > on each hart.
> >
> > This driver is based on the driver in the RISC-V tree from Palmer Dabbelt,
> > but has been almost entirely rewritten since.
> >
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
>
> I tried to boot HighFive Unleashed with the patch series after applying
> all the patches from riscv-all branch except timer & irq patches. It
> gets stuck pretty early.
>
> Here is my github repo with all the changes:
> https://github.com/atishp04/riscv-linux/commits/master_chris_cleanup_hifive
>
> I am still looking into it.
> Palmer: Did I miss something?
>
> FWIW, here is the boot log.
> --------- Boot log -------------------------------------------
> [    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=5
> [    0.000000] NR_IRQS: 0, nr_irqs: 0, preallocated irqs: 0
> [    0.000000] plic: mapped 53 interrupts to 4 (out of 9) handlers.
> [    0.000000] clocksource: riscv_clocksource: mask: 0xffffffffffffffff
> max_cycles: 0x1d854df40, max_idle_ns: 3526361616960 ns
> [    0.000000] Calibrating delay loop (skipped), value calculated using
> timer frequency.. 2.00 BogoMIPS (lpj=10000)
> [    0.010000] pid_max: default: 32768 minimum: 301
> [    0.010000] Mount-cache hash table entries: 16384 (order: 5, 131072
> bytes)
> [    0.020000] Mountpoint-cache hash table entries: 16384 (order: 5,
> 131072 bytes)
> [    0.020000] Hierarchical SRCU implementation.
> [    0.030000] smp: Bringing up secondary CPUs ...

I have noticed following:

1. plic_irq_toggle() works on all present CPUs which means an
IRQ will be enabled/disabled for all present CPUs. This further
imply that whenever an IRQ is triggered, all online CPUs will take
the interrupt but only one CPU will be successful in claiming the
IRQ and other CPUs will check for IRQ in vain.

2. irq_set_affinity() is not available which means IRQ balancing
will not work.

3. A PLIC context is for a particular HART+MODE. A HW designer
can choose to connect PLIC context only for particular MODE of
HART/CPU whereas this driver assumes that we have context
available for both M-mode and S-mode of all HARTs/CPUs.

Regards,
Anup
