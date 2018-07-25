From: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH 3/6] irqchip: RISC-V Local Interrupt Controller Driver
Date: Wed, 25 Jul 2018 10:54:41 -0700
Message-ID: <afef2fc3-de3a-66f5-36c7-7341931b8a29@wdc.com>
References: <20180725093649.32332-1-hch@lst.de>
 <20180725093649.32332-4-hch@lst.de>
 <c3ccb953-cd75-4a37-636a-ca643602053a@arm.com>
 <20180725112457.GA24502@lst.de>
 <53518395-83bb-9c2f-bd96-287cc83a1c63@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53518395-83bb-9c2f-bd96-287cc83a1c63@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, Christoph Hellwig <hch@lst.de>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "palmer@sifive.com" <palmer@sifive.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "shorne@gmail.com" <shorne@gmail.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 7/25/18 4:37 AM, Marc Zyngier wrote:
> On 25/07/18 12:24, Christoph Hellwig wrote:
>> On Wed, Jul 25, 2018 at 12:18:39PM +0100, Marc Zyngier wrote:
>>> This feels odd. It means that you cannot have the following sequence:
>>>
>>> 	local_irq_disable();
>>> 	enable_irq(x); // where x is owned by a remote hart
>>>
>>> as smp_call_function_single() requires interrupts to be enabled.
>>>
>>> More fundamentally, why are you trying to make these interrupts look
>>> global while they aren't? arm/arm64 have similar restrictions with GICv2
>>> and earlier, and treats these interrupts as per-cpu.
>>>
>>> Given that the drivers that deal with drivers connected to the per-hart
>>> irqchip are themselves likely to be aware of the per-cpu aspect, it
>>> would make sense to align things (we've been through that same
>>> discussion about the clocksource driver a few weeks back).
>>
>> Right now the only direct consumers are said clocksource, the PLIC
>> driver later in this series and the RISC-V arch IPI code.  None of them
>> is going to do a manual enable_irq, so I guess the remote case of the
>> code is simply dead code.  I'll take a look at converting them to
>> per-cpu.  I guess the GICv2 driver is the best template?
> 
> I think you can do a much better job than the GICv2 driver ;-). You have
> the chance of a clean slate, and no legacy (or ACPI) junk to deal with!
> 
> I think this is just a matter of moving the HLIC declaration in DT to be
> outside of the cpu nodes (you just have a single HLIC node that is valid
> for all the CPUs in the system), and making the interrupts percpu_devid
> in your mapping function (see gic_irq_domain_map for reference).
> 

If I am not wrong, we need to change the interrupt-extended property in 
PLIC DT entry as well. Currently, there are 5 entries corresponding to 
individual HLIC. I was also planning to start working on converting HLIC 
to per-cpu but it got delayed because of travel.

Christoph: I am not sure if you have access to HighFive Unleashed board. 
If not I would be happy to test it on the board whenever your patches 
are ready.

Regards,
Atish
> Thanks,
> 
> 	M.
> 
