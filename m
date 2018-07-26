From: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH 3/6] irqchip: RISC-V Local Interrupt Controller Driver
Date: Thu, 26 Jul 2018 19:09:57 +0530
Message-ID: <CAAhSdy0JAmd=ma82yWTwQYMi2T-G8SLriV5tPyScWxOm8rCpjw@mail.gmail.com>
References: <20180725093649.32332-1-hch@lst.de> <20180725093649.32332-4-hch@lst.de>
 <c3ccb953-cd75-4a37-636a-ca643602053a@arm.com> <20180725112457.GA24502@lst.de>
 <CAAhSdy31=D3jOgvrc+Td-TeKQMazPA-suFjOy9XwEuima1WdeA@mail.gmail.com> <20180726082706.GA22868@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180726082706.GA22868@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, palmer@sifive.com, jason@lakedaemon.net, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org, Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 26, 2018 at 1:57 PM, Christoph Hellwig <hch@lst.de> wrote:
> On Thu, Jul 26, 2018 at 09:08:00AM +0530, Anup Patel wrote:
>> Actually, RISCV HLIC and PLIC are very similar to RPi2 and RPi3 SOCs.
>>
>> On RPi2 and RPi3, we have per-CPU BCM2836 local intc and the global
>> interrupts are managed using BCM2835 intc. You should certainly have
>> a look a this drivers because these very simple compared to GICv2 and
>> GICv3 drivers.
>
> Yes, using that model makes writing the per-cpu irq controller driver
> trivial.  But retrofitting it into the device tree, where the existing
> bootloader (bbl) assumes the old DT layout is a giant pain in the neck.

This can also be taken care in HLIC driver probe function with something
like below:

if (parent)
return 0;

if (of_is_compatible(parent, "riscv,cpu")) {
/*
* Legacy DT binding so we have HLIC DT node
* under each CPU DT node. To provide backwared
* compatiblity we go forward for only one HLIC
* DT node
*/
if (atomic_inc_return(&hlic_lottery) > 1)
return 0;
}

In PLIC driver probe, register nested IRQ handler for only first two
entries of interrupts-extended because it is HLIC IRQs are per-CPU. We
can happily ignore other entries in interrupts-extended of Legacy DTS.

>
> At the same time I'm still not conveninced RISC-V really needs a full
> irqchip driver for the per-cpu interrupt 'controller' really is nothing
> but 1 and a half architectural control registers:
>
>   - the scause register that contains the reason for an exception
>     (any exception including syscalls and page faults) for the entry
>     into supervisor mode.  This includes a bit to indicate interrupts,
>     and then logical interrupt reason, out of which only three are
>     interesting for supervisor mode (timer, software, external)
>   - the sie register that allows to to enable/disable each of the above
>     causes individually

Biggest plus is the ability show stats for per-CPU interrupts via
"cat /proc/interrupts" (just like other architectures).

Currently, we have only three per-CPU interrupts (timer, software,
and external) but in-future people might come-up with interesting
devices which might have per-CPU interrupts.

>
> So after burning out on DT hacking (never mind retrofitting that into
> actual shipping SOCs vs just qemu) I'm going to try a version that
> doesn't add an irqchip for this but just handles it hardcoded in
> RISC-V do_IRQ.  I'll still keep the irqchip for the PLIC, which while
> specificed in the RISC-V spec isn't architectural but an actual
> periphal.

I believe it possible to have RICV HLIC driver which maintains
backward compatibility with legacy DTS. I haven't tried above
approach myself on QEMU so I will let you decide.

Regards,
Anup
