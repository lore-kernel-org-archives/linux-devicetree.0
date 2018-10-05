From: Guo Ren <ren_guo@c-sky.com>
Subject: Re: [PATCH V10 5/8] clocksource: add C-SKY SMP timer
Date: Fri, 5 Oct 2018 22:03:19 +0800
Message-ID: <20181005140319.GA6789@guoren-Inspiron-7460>
References: <cover.1538672812.git.ren_guo@c-sky.com>
 <76f127a22faf8f110f102ee3534792b2b84a7d78.1538672812.git.ren_guo@c-sky.com>
 <4ec284a4-0cff-91b8-bd0a-6eb578b28432@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4ec284a4-0cff-91b8-bd0a-6eb578b28432@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, anurup.m@huawei.com, Jonathan.Cameron@huawei.com, will.deacon@arm.com, zhangshaokun@hisilicon.com, jhogan@kernel.org, paul.burton@mips.com, peterz@infradead.org, arnd@arndb.de, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Daniel,

On Fri, Oct 05, 2018 at 03:48:58PM +0200, Daniel Lezcano wrote:
> On 04/10/2018 19:22, Guo Ren wrote:
> > This timer is used by SMP system and use mfcr/mtcr instruction
> > to access the regs.
> > 
> > Changelog:
> >  - Add rollback for timer_of_cleanup.
> >  - Use request_percpu_irq separate from time_of.
> >  - Remove #define CPUHP_AP_CSKY_TIMER_STARTING.
> >  - Add CPUHP_AP_CSKY_TIMER_STARTING in cpuhotplug.h.
> >  - Support csky mp timer alpha version.
> >  - Just use low-counter with 32bit width as clocksource.
> >  - Coding convention with upstream feed-back.
> > 
> > Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> > ---
> >  drivers/clocksource/Kconfig         |  10 +++
> >  drivers/clocksource/Makefile        |   1 +
> >  drivers/clocksource/timer-mp-csky.c | 173 ++++++++++++++++++++++++++++++++++++
> >  include/linux/cpuhotplug.h          |   1 +
> >  4 files changed, 185 insertions(+)
> >  create mode 100644 drivers/clocksource/timer-mp-csky.c
> > 
> > diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> > index a11f4ba..826a2e8 100644
> > --- a/drivers/clocksource/Kconfig
> > +++ b/drivers/clocksource/Kconfig
> > @@ -620,4 +620,14 @@ config RISCV_TIMER
> >  	  is accessed via both the SBI and the rdcycle instruction.  This is
> >  	  required for all RISC-V systems.
> >  
> > +config CSKY_MP_TIMER
> > +	bool "SMP Timer for the C-SKY platform"
> > +	depends on CSKY
> > +	select TIMER_OF
> > +	help
> > +	  Say yes here to enable C-SKY SMP timer driver used for C-SKY SMP
> > +	  system.
> > +	  csky,mptimer is not only used in SMP system, it also could be used
> > +	  single core system. It's not a mmio reg and it use mtcr/mfcr instruction.
> 
> 
> ... COMPILE_TEST :)
Ops... I forgot it, should be: 
	bool "SMP Timer for the C-SKY platform" if COMPILE_TEST

Thx for remind and any other review is welcome.

Best Regards
 Guo Ren
