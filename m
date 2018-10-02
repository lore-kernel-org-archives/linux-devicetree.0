From: Guo Ren <ren_guo@c-sky.com>
Subject: Re: [PATCH V9 3/8] clocksource: add C-SKY SMP timer
Date: Tue, 2 Oct 2018 13:40:25 +0800
Message-ID: <20181002054024.GA12645@guoren>
References: <cover.1538355281.git.ren_guo@c-sky.com>
 <eee964dd57d12bc630280ab84235b5356799b1fb.1538355281.git.ren_guo@c-sky.com>
 <88e320f2-8cf0-fdb9-c9b0-ee25d7a4d00f@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <88e320f2-8cf0-fdb9-c9b0-ee25d7a4d00f@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, anurup.m@huawei.com, Jonathan.Cameron@huawei.com, will.deacon@arm.com, zhangshaokun@hisilicon.com, jhogan@kernel.org, paul.burton@mips.com, peterz@infradead.org, f.fainelli@gmail.com, arnd@arndb.de, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 01, 2018 at 11:14:14AM +0200, Daniel Lezcano wrote:
> On 01/10/2018 03:35, Guo Ren wrote:
> > This timer is used by SMP system and use mfcr/mtcr instruction
> > to access the regs.
> > 
> > Changelog:
> >  - Remove #define CPUHP_AP_CSKY_TIMER_STARTING
> >  - Add CPUHP_AP_CSKY_TIMER_STARTING in cpuhotplug.h
> >  - Support csky mp timer alpha version.
> >  - Just use low-counter with 32bit width as clocksource.
> >  - Coding convention with upstream feed-back.
> > 
> > Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> > ---
> >  drivers/clocksource/Kconfig        |   8 ++
> >  drivers/clocksource/Makefile       |   1 +
> >  drivers/clocksource/csky_mptimer.c | 176 +++++++++++++++++++++++++++++++++++++
> >  include/linux/cpuhotplug.h         |   1 +
> >  4 files changed, 186 insertions(+)
> >  create mode 100644 drivers/clocksource/csky_mptimer.c
> > 
> > diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> > index a11f4ba..a28043f 100644
> > --- a/drivers/clocksource/Kconfig
> > +++ b/drivers/clocksource/Kconfig
> > @@ -620,4 +620,12 @@ config RISCV_TIMER
> >  	  is accessed via both the SBI and the rdcycle instruction.  This is
> >  	  required for all RISC-V systems.
> >  
> > +config CSKY_MPTIMER
> > +	bool "C-SKY Multi Processor Timer"
> > +	depends on CSKY
> > +	select TIMER_OF
> > +	help
> > +	  Say yes here to enable C-SKY SMP timer driver used for C-SKY SMP
> > +	  system.
> > +
> >  endmenu
> 
> The same rule applies here for COMPILE_TEST.
Ok

> And please rename the file: timer-mp-csky.c
Ok

> > +	return (u64) mfcr(PTIM_CCVR);
> 
> extra space
Ok

> 
> > +}
> > +
> > +static u64 clksrc_read(struct clocksource *c)
> > +{
> > +	return (u64) mfcr(PTIM_CCVR);
> 
> extra space
Ok

> > +	 */
> > +
> 
> extra line
Ok

> 
> > +	for_each_possible_cpu(cpu) {
> > +		to = per_cpu_ptr(&csky_to, cpu);
> > +
> > +		if (cpu == 0) {
> > +			to->flags	  |= TIMER_OF_IRQ;
> > +			to->of_irq.handler = timer_interrupt;
> > +
> > +			ret = timer_of_init(np, to);
> > +			if (ret)
> > +				return ret;
> > +
> > +			rate	= timer_of_rate(to);
> > +			irq	= to->of_irq.irq;
> > +		} else {
> > +			ret = timer_of_init(np, to);
> > +			if (ret)
> > +				return ret;
> > +
> > +			to->of_clk.rate	= rate;
> > +			to->of_irq.irq	= irq;
> > +		}
> > +	}
> 
> 
> Isn't possible to replace this loop which is a bit confusing by:
> 
>  - no irq flag specified for timer-of
>  - request irq before
Ok, but I've a bit different :)
 
> So we end up with:
> 
> 	irq = irq_of_parse_and_map(np, 0);
> 	if (irq <= 0)
> 		return -EINVAL;
		panic();
I want a panic here. Return will make debug confused and directly tell
the people where is wrong. It's root-timer for us and it must bootup.

If it's a co-timer, I also think return is good.

> 
> 	ret = request_irq(irq, csky_timer_interrupt,
> 			IRQF_TIMER | IRQF_PERCPU,
>                         "csky_mp_timer", &csky_to));
	ret = request_percpu_irq(irq, csky_timer_interrupt,
			"csky_mp_timer", &csky_to);
I'll use request_percpu_irq the same as in timer_of and I've tested it's
Ok.

> 	if (ret)
> 		return ret;
Pls let me panic here.

> 
> 	for_each_possible_cpu(cpu) {
> 		to = per_cpu_ptr(&csky_to, cpu);
> 		ret = timer_of_init(np, to);
> 		if (ret)
> 			goto rollback;
		Pls let me panic here.
> 	}

Best Regards
 Guo Ren
