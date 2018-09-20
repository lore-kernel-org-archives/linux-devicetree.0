From: Guo Ren <ren_guo@c-sky.com>
Subject: Re: [PATCH V8 1/2] clocksource: add gx6605s SOC system timer
Date: Fri, 21 Sep 2018 07:31:04 +0800
Message-ID: <20180920233103.GA8891@guoren-Inspiron-7460>
References: <cover.1537412072.git.ren_guo@c-sky.com>
 <4d409a1fdecf1c376e8cc6b55308cd3c522047b0.1537412072.git.ren_guo@c-sky.com>
 <6c31f9b2-d536-1cee-8024-b52eb862fd9d@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6c31f9b2-d536-1cee-8024-b52eb862fd9d@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, c-sky_gcc_upstream@c-sky.com, green.hu@gmail.com
List-Id: devicetree@vger.kernel.org

On Thu, Sep 20, 2018 at 06:06:19PM +0200, Daniel Lezcano wrote:
> On 20/09/2018 10:03, Guo Ren wrote:
> > Changelog:
> >  - Add License and Copyright
> >  - Use timer-of framework
> >  - Change name with upstream feedback
> >  - Use clksource_mmio framework
> > 
> > Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> > ---
> >  drivers/clocksource/Kconfig         |   8 ++
> >  drivers/clocksource/Makefile        |   1 +
> >  drivers/clocksource/timer-gx6605s.c | 150 ++++++++++++++++++++++++++++++++++++
> >  3 files changed, 159 insertions(+)
> >  create mode 100644 drivers/clocksource/timer-gx6605s.c
> > 
> > diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> > index a11f4ba..6d0f18d 100644
> > --- a/drivers/clocksource/Kconfig
> > +++ b/drivers/clocksource/Kconfig
> > @@ -620,4 +620,12 @@ config RISCV_TIMER
> >  	  is accessed via both the SBI and the rdcycle instruction.  This is
> >  	  required for all RISC-V systems.
> >  
> > +config GX6605S_TIMER
> > +	bool "Gx6605s SOC system timer driver"
> > +	depends on CSKY
> > +	select CLKSRC_MMIO
> > +	select TIMER_OF
> > +	help
> > +	  This option enables support for gx6605s SOC's timer.
> > +
> >  endmenu
> 
> Please make the option not visible as default. There are currently two
> approaches look at MTK_TIMER and SPRD_TIMER.
Em ... (ot sure why COMPILE_TEST?):
	bool "Gx6605s SOC system timer driver" if COMPILE_TEST
Hmm?

> > +static irqreturn_t gx6605s_timer_interrupt(int irq, void *dev)
> > +{
> > +	struct clock_event_device *ce = (struct clock_event_device *) dev;
> 
> nit: no cast is needed.
Yes, change to:
	struct clock_event_device *ce = dev;


> > +static u64 notrace gx6605s_sched_clock_read(void)
> > +{
> > +	void __iomem *base;
> > +
> > +	base = timer_of_base(&to) + CLKSRC_OFFSET;
> > +
> > +	return (u64) readl_relaxed(base + TIMER_VALUE);
> 
> nit: extra space after '(u64)'
Ok
	return (u64)readl_relaxed(base + TIMER_VALUE);

Best Regards
 Guo Ren
