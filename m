From: Christoph Hellwig <hch@lst.de>
Subject: Re: RFC: simplified RISC-V interrupt and clocksource handling
Date: Fri, 27 Jul 2018 16:44:05 +0200
Message-ID: <20180727144405.GB29626@lst.de>
References: <20180726143723.16585-1-hch@lst.de> <dc346650-0b48-3c2b-9190-b87ea6987e37@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <dc346650-0b48-3c2b-9190-b87ea6987e37@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Atish Patra <atish.patra@wdc.com>
Cc: Christoph Hellwig <hch@lst.de>, "tglx@linutronix.de" <tglx@linutronix.de>, "palmer@sifive.com" <palmer@sifive.com>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "marc.zyngier@arm.com" <marc.zyngier@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "anup@brainfault.org" <anup@brainfault.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "shorne@gmail.com" <shorne@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 26, 2018 at 04:38:43PM -0700, Atish Patra wrote:
> 1. As per my understanding, timer interrupt now can't be registered as a 
> Linux IRQ now. Thus, /proc/interrupts will not be automatically populated 
> for timer interrupt stats. Am I wrong in my assumption?

Yes, with this code the timer interrupt does not show up in
/proc/interrupts.  I wonder if that is an issue and if there is any
precedence for it?

> 2. The future version of local interrupt controller known as Core Level 
> Interrupt Controller aka CLIC. Do we have to change the current design
> again for CLIC in future?
>
> Here are the docs:
> https://github.com/sifive/clic-spec/blob/master/clic.adoc

This doesn't really look like 'the future' version but a proposal for
something more like low end realtime microcontrollers ala ARM Cortex M*.
At least the priorities don't really make much sense for a general
purpose SOC.

Either way the existing architectural scause/sie interrupt handling will
remain but can be opted out, but if we really want to support the CLIC
it would have to grow a new irqchip driver, and the PLIC driver would
require a few dozend new lines of glue code to chain underneath it.
