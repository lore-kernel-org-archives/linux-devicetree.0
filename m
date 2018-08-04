From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH 3/6] irqchip: RISC-V Local Interrupt Controller Driver
Date: Fri, 03 Aug 2018 21:03:02 -0700 (PDT)
Message-ID: <mhng-f79111da-51d4-483e-86ce-ff0a41c3b5bc@palmer-si-x1c4>
References: <alpine.DEB.2.21.1808012049170.1835@nanos.tec.linutronix.de>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.1808012049170.1835@nanos.tec.linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de
Cc: Christoph Hellwig <hch@lst.de>, marc.zyngier@arm.com, jason@lakedaemon.net, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, shorne@gmail.com
List-Id: devicetree@vger.kernel.org

On Wed, 01 Aug 2018 11:55:06 PDT (-0700), tglx@linutronix.de wrote:
>
> On Wed, 25 Jul 2018, Christoph Hellwig wrote:
>
>> On Wed, Jul 25, 2018 at 12:18:39PM +0100, Marc Zyngier wrote:
>> > This feels odd. It means that you cannot have the following sequence:
>> >
>> > 	local_irq_disable();
>> > 	enable_irq(x); // where x is owned by a remote hart
>> >
>> > as smp_call_function_single() requires interrupts to be enabled.
>> >
>> > More fundamentally, why are you trying to make these interrupts look
>> > global while they aren't? arm/arm64 have similar restrictions with GICv2
>> > and earlier, and treats these interrupts as per-cpu.
>> >
>> > Given that the drivers that deal with drivers connected to the per-hart
>> > irqchip are themselves likely to be aware of the per-cpu aspect, it
>> > would make sense to align things (we've been through that same
>> > discussion about the clocksource driver a few weeks back).
>>
>> Right now the only direct consumers are said clocksource, the PLIC
>> driver later in this series and the RISC-V arch IPI code.  None of them
>> is going to do a manual enable_irq, so I guess the remote case of the
>> code is simply dead code.  I'll take a look at converting them to
>> per-cpu.  I guess the GICv2 driver is the best template?
>
> Confused. The timer and the IPI are separate causes and have nothing to do
> with the per cpu irq domain. That's what the low level interrupt handling
> code tells me.
>
> If I understand correctly then the per cpu irq domain is for device
> interrupts, right? If so, then this simply cannot work and there is no way
> to make it work with per cpu interrupts either.
>
> Is there some high level documentation about the design (or the lack of) or
> can someone give a concise explanation how this stuff is supposed to work?

The ISA spec defines this, and I'm not sure I can be a whole lot more concise 
than what's there but I'll try:

This driver is for the ISA-mandated interrupts present on all RISC-V systems.  
These interrupts are tracked on a per-hart (hart is a RISC-V term that means 
hardware thread, it a hyperthread in Intel land) basis.

On RISC-V systems there is a set of CSRs (control and status registers) local 
to each hart.  These registers can be accessed by special instructions, and are 
used to perform hart-local actions that are of a medium speed: things like 
accessing the floating point exception state or changing the page table base 
pointer.  When a hart is in supervisor mode, it has access to a handful of CSRs 
that are related to interrupts:

* stvec: The trap vector, which is the entry point for both interrupts and 
  exceptions.
* sie: Supervisor Interrupts Enabled.  This is a bit mask of enabled 
  interrupts.
* sip: Supervisor Interrupts Pending.  This is a bit mask of pending 
  interrupts, which can be polled when interrupts are disabled (or I guess when 
  they're enabled too, but that's not particularly useful).
* scause: Supervisor Trap Cause.  This allows code to determine what sort of 
  trap was taken.
* sepc: Supervisor Exception PC (actually the PC for all traps).  This allows 
  code to determine how to get back to where it needs to continue after 
  handling a trap.
* stval: Supervisor Trap VALue.  This provides additional trap-specific 
  information: for example, if a trap says "you attempted to write to an 
  address that isn't mapped or is read only" then stval contains the address 
  that the write was directed at.

As such, the ISA itself doesn't really differentiate between exceptions and 
interrupts: they both cause a privilege transition to happen, redirect 
execution to stvec, and write a handful of CSRs as side effects.  It's up to 
software to determine the difference.

In order to make it fast for software to determine if a scause value is an 
exception or an interrupt that is encoded in the high bit.  There are 11 
defined exceptions, which include system calls, breakpoints, page faults, and 
access faults -- that's all handled in core RISC-V arch code.  Additionally, 
there are 6 defined interrupt types:

* User software interrupt
* User timer interrupt
* User external interrupt
* Supervisor software interrupt
* Supervisor timer interrupt
* Supervisor external interrupt

The user interrupts are unsupported by Linux and thus never happen -- they're 
really designed for real-time embedded code, in POSIX land we use the standard 
signal delivery mechanisms as it'd be insane to put that in an ISA.  Thus, 
functionally there are three interrupt types:

* Supervisor software interrupt: These are never triggered by a hardware 
  device, and are therefor left for software use.  On Linux we use these to 
  indicate that a message may have arrived in the per-hart message queue, which 
  is used to implement IPIs.
* Supervisor timer interrupt: When the RISC-V ISA was originally defined we 
  thought that it was important to mandate that accurate real-time facilities 
  exist, so there's a handful of time-related bits encoded into the ISA.  In 
  retrospect it seems like this didn't end up being so clean as it's becoming a 
  burden when doing things like formally specifying the ISA, but we have 
  workarounds for these issues so we don't deem it worth re-spinning the ISA.  
  On Linux this is attached to a clocksource driver, with the only extant 
  example being SiFive's clock driver.
* Supervisor external interrupt: Essentially all the interrupts, aside from the 
  timer being a special case.  This is what's attached to the proper interrupt 
  controller, with the only extant example being SiFive's PLIC (which was 
  mistakenly called a RISC-V plic in the device tree, but there's another 
  thread going about fixing that).

Originally this hart-local interrupt code was included in the RISC-V arch port, 
right along our exception handling code.  This matches up well because RISC-V 
systems don't really differentiate between interrupts and exceptions, so it 
fits in well.  The trouble is that it smells like an interrupt controller and 
doesn't follow the standard mechanisms in Linux.

As part of our original push to upstream the arch code it was suggested that we 
move this out to an irqchip driver, but after actually attempting to do that it 
appears that the mechanics of doing so have overshadowed the complexity of the 
actual interrupt handling code, which is only a dozen or so instructions.  In 
retrospect this is just another instance of me not knowing what I'm doing, 
sorry!

I like Christoph's approach of merging the ISA-mandated interrupt handling code 
back into arch/riscv, as it's much saner that way.  The one big headache is 
that because we special-cased timer interrupts in the ISA they now disappear 
from the standard Linux mechanisms for handling these.

That said, I'd rather have this warts and all then wait around for something 
perfect, as maintaining a dozen or so out of tree drivers that are tightly 
coupled to the core arch code has proven to be a mess.  If we can get the code 
upstream then everyone will be on the same page so we can work on actually 
improving this, as opposed to just spinning our wheels keeping this big mess 
alive.

Hopefully that makes some amount of sense...
