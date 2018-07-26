From: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH 3/6] irqchip: RISC-V Local Interrupt Controller Driver
Date: Thu, 26 Jul 2018 09:08:00 +0530
Message-ID: <CAAhSdy31=D3jOgvrc+Td-TeKQMazPA-suFjOy9XwEuima1WdeA@mail.gmail.com>
References: <20180725093649.32332-1-hch@lst.de> <20180725093649.32332-4-hch@lst.de>
 <c3ccb953-cd75-4a37-636a-ca643602053a@arm.com> <20180725112457.GA24502@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180725112457.GA24502@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, palmer@sifive.com, jason@lakedaemon.net, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org, shorne@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 25, 2018 at 4:54 PM, Christoph Hellwig <hch@lst.de> wrote:
> On Wed, Jul 25, 2018 at 12:18:39PM +0100, Marc Zyngier wrote:
>> This feels odd. It means that you cannot have the following sequence:
>>
>>       local_irq_disable();
>>       enable_irq(x); // where x is owned by a remote hart
>>
>> as smp_call_function_single() requires interrupts to be enabled.
>>
>> More fundamentally, why are you trying to make these interrupts look
>> global while they aren't? arm/arm64 have similar restrictions with GICv2
>> and earlier, and treats these interrupts as per-cpu.
>>
>> Given that the drivers that deal with drivers connected to the per-hart
>> irqchip are themselves likely to be aware of the per-cpu aspect, it
>> would make sense to align things (we've been through that same
>> discussion about the clocksource driver a few weeks back).
>
> Right now the only direct consumers are said clocksource, the PLIC
> driver later in this series and the RISC-V arch IPI code.  None of them
> is going to do a manual enable_irq, so I guess the remote case of the
> code is simply dead code.  I'll take a look at converting them to
> per-cpu.  I guess the GICv2 driver is the best template?

Actually, RISCV HLIC and PLIC are very similar to RPi2 and RPi3 SOCs.

On RPi2 and RPi3, we have per-CPU BCM2836 local intc and the global
interrupts are managed using BCM2835 intc. You should certainly have
a look a this drivers because these very simple compared to GICv2 and
GICv3 drivers.

Regards,
Anup
