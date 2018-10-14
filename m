From: Guo Ren <ren_guo@c-sky.com>
Subject: Re: [PATCH V12 0/8] C-SKY(csky) Linux Kernel Driver
Date: Mon, 15 Oct 2018 00:26:31 +0800
Message-ID: <20181014162631.GA13374@guoren-Inspiron-7460>
References: <cover.1539315341.git.ren_guo@c-sky.com>
 <dfe56d38-cfa5-2be1-114e-c6721d6c92a3@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <dfe56d38-cfa5-2be1-114e-c6721d6c92a3@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, will.deacon@arm.com, jhogan@kernel.org, paul.burton@mips.com, peterz@infradead.org, arnd@arndb.de, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Daniel,

Thx for reply and review.

On Sat, Oct 13, 2018 at 10:50:34PM +0200, Daniel Lezcano wrote:
> On 12/10/2018 14:02, Guo Ren wrote:
> > This is about 12th patchset for C-SKY linux drivers and it should pair
> > with 8th kernel patchset.
> 
> Guo,
> 
> I'm willing to take your timer related patches but you have to put a
> proper description.

Ok, I've improved all my comment for the drivers. Here is my modification:

commit 6b465856936cb8f7eda31b20eb59fb5c8a19d468
Author: Guo Ren <ren_guo@c-sky.com>
Date:   Tue Oct 2 16:43:18 2018 +0800

    clocksource: add gx6605s SOC system timer
    
    The driver is for gx6605s SOC system timer and there are two
    same timers in gx6605s. We use one for clkevt and another one for
    clksrc.
    
    The timer is mmio map to access, so we need give mmio address in dts.
    
    The counter at 0x0  offset is clock event.
    The counter at 0x40 offset is clock source.
    
    Changelog:
     - pass checkpatch.pl
     - Add COMIPLE_TEST in Kconfig
     - no cast is needed for "struct clock_event_device *ce = dev"
     - remove: extra space after (u64)
     - Add License and Copyright
     - Use timer-of framework
     - Change name with upstream feedback
     - Use clksource_mmio framework
    
    Signed-off-by: Guo Ren <ren_guo@c-sky.com>
    Cc: Daniel Lezcano <daniel.lezcano@linaro.org>

commit d89522b23ff8f2d5b6f33200db110c758d28ecc1
Author: Guo Ren <ren_guo@c-sky.com>
Date:   Wed Sep 5 14:25:24 2018 +0800

    clocksource: add C-SKY SMP timer
    
    The driver is for C-SKY SMP timer. It only support oneshot event
    and 32bit overflow for clocksource. Per cpu core has one timer and
    all timers share one clock-counter-input the same clocksource.
    
    This use mfcr&mtcr instructions to access the regs.
    
    Changelog:
     - Add COMPILE_TEST
     - Fixup smp boot error, cpuhp_setup_state must after timer_of_init()
     - Add rollback for timer_of_cleanup.
     - Use request_percpu_irq separate from time_of.
     - Remove #define CPUHP_AP_CSKY_TIMER_STARTING.
     - Add CPUHP_AP_CSKY_TIMER_STARTING in cpuhotplug.h.
     - Support csky mp timer alpha version.
     - Just use low-counter with 32bit width as clocksource.
     - Coding convention with upstream feed-back.
    
    Signed-off-by: Guo Ren <ren_guo@c-sky.com>
    Cc: Daniel Lezcano <daniel.lezcano@linaro.org>

===> It's interrupt controller comment, perhaps you won't care. <===

commit 65f4acd1df08c1c5ad1b0e8f46822b114c539f11
Author: Guo Ren <ren_guo@c-sky.com>
Date:   Sun Sep 16 15:57:14 2018 +0800

    irqchip: add C-SKY APB bus interrupt controller
    
    The driver is for C-SKY APB bus interrupt controller. It's a simple
    interrupt controller which use pending reg to detect the irq and use
    enable/disable reg to mask/unmask interrupt sources.
    
    A lot of SOCs based on C-SKY CPU use the interrupt controller as root
    controller.
    
    Changelog:
     - pass checkpatch.pl.
     - use "bool ret" instead of "int ret"
     - add support-pulse-signal in irq-csky-apb-intc.c
     - change name with upstream feed-back
     - add INTC_IFR to clear irq-pending
     - remove CSKY_VECIRQ_LEGENCY
     - change to generic irq chip framework
     - add License and Copyright
     - use irq_domain_add_linear instead of leagcy
    
    Signed-off-by: Guo Ren <ren_guo@c-sky.com>
    Cc: Mark Rutland <mark.rutland@arm.com>

commit ef790431a885d37766200c7968d47370ed8be251
Author: Guo Ren <ren_guo@c-sky.com>
Date:   Sun Sep 16 15:57:14 2018 +0800

    irqchip: add C-SKY SMP interrupt controller
    
    The driver is for C-SKY SMP interrupt controller. It support 16
    soft-irqs, 16 private-irqs, and 992 max external-irqs, a total of
    1024 interrupts.
    
    C-SKY CPU 807/810/860 SMP/non-SMP could use it.
    
    Changelog:
     - Remove set_ipi_irq_mapping.
     - Convert the cpumask to an interrupt-controller specific representation
       in driver's code, and not the SMP code's.
     - pass checkpatch.pl
     - Move IPI_IRQ into the driver
     - Remove irq_set_default_host() and use set_ipi_irq_mapping()
     - Change name with upstream feed-back
     - Change irq map, reserve soft_irq & private_irq space
     - Add License and Copyright
     - Support set_affinity for irq balance in SMP
    
    Signed-off-by: Guo Ren <ren_guo@c-sky.com>
    Cc: Marc Zyngier <marc.zyngier@arm.com>

Best Regards
 Guo Ren
