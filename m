From: Atish Patra <atish.patra@wdc.com>
Subject: Re: RFC: simplified RISC-V interrupt and clocksource handling
Date: Thu, 26 Jul 2018 16:38:43 -0700
Message-ID: <dc346650-0b48-3c2b-9190-b87ea6987e37@wdc.com>
References: <20180726143723.16585-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180726143723.16585-1-hch@lst.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>, "tglx@linutronix.de" <tglx@linutronix.de>, "palmer@sifive.com" <palmer@sifive.com>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "marc.zyngier@arm.com" <marc.zyngier@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "anup@brainfault.org" <anup@brainfault.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "shorne@gmail.com" <shorne@gmail.com>
List-Id: devicetree@vger.kernel.org

On 7/26/18 7:37 AM, Christoph Hellwig wrote:
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
I agree that this code is much simpler than HLIC code.
Few doubts though

1. As per my understanding, timer interrupt now can't be registered as a 
Linux IRQ now. Thus, /proc/interrupts will not be automatically 
populated for timer interrupt stats. Am I wrong in my assumption?

2. The future version of local interrupt controller known as Core Level 
Interrupt Controller aka CLIC. Do we have to change the current design
again for CLIC in future?

Here are the docs:
https://github.com/sifive/clic-spec/blob/master/clic.adoc

Regards,
Atish
> A git tree is available here (contains a few more patches before
> the ones in this series)
> 
>      git://git.infradead.org/users/hch/riscv.git riscv-irq-simple
> 
> Gitweb:
> 
>      http://git.infradead.org/users/hch/riscv.git/shortlog/refs/heads/riscv-irq-simple
> 
