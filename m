From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v1 1/2] clocksource: npcm: add NPCM7xx timer driver
Date: Sun, 1 Oct 2017 18:44:58 +0200
Message-ID: <20171001164458.GA2290@mai>
References: <1506849098-18290-1-git-send-email-tmaimon77@gmail.com>
 <1506849098-18290-2-git-send-email-tmaimon77@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1506849098-18290-2-git-send-email-tmaimon77@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de, avifishman70@gmail.com, brendanhiggins@google.com, raltherr@google.com, joel@jms.id.au, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Hi Tomer,

On Sun, Oct 01, 2017 at 12:11:37PM +0300, Tomer Maimon wrote:
> Add Nuvoton BMC NPCM7xx timer driver.

Give a more detailed description of the timer please.

> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  drivers/clocksource/Kconfig         |   9 ++
>  drivers/clocksource/Makefile        |   1 +
>  drivers/clocksource/npcm7xx_timer.c | 205 ++++++++++++++++++++++++++++++++++++

Rename the driver to timer-npcm7xx.c

>  3 files changed, 215 insertions(+)
>  create mode 100644 drivers/clocksource/npcm7xx_timer.c
> 
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index cc6062049170..e26a203ce4ab 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -140,6 +140,15 @@ config VT8500_TIMER
>  	help
>  	  Enables support for the VT8500 driver.
>  
> +config NPCM7XX_TIMER
> +	bool "NPCM7xx timer driver" if (COMPILE_TEST || ARCH_NPCM7XX)

Remove the ARCH_NPCM7XX dependency, we want to have the timer selection hidden.

> +	depends on GENERIC_CLOCKEVENTS

You can remove this dependency, there is a patch in the queue moving the
dependency up for all the timers.

> +	depends on HAS_IOMEM
> +	select CLKSRC_MMIO
> +	help
> +	  Enable 24-bit TIMER0 and TIMER1 counters in the NPCM7xx arcithcture,
> +	  While TIMER0 serves as clockevent and TIMER1 serves as clocksource.
> +
>  config CADENCE_TTC_TIMER
>  	bool "Cadence TTC timer driver" if COMPILE_TEST
>  	depends on COMMON_CLK
> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
> index dbc1ad14515e..fd3a1c33364b 100644
> --- a/drivers/clocksource/Makefile
> +++ b/drivers/clocksource/Makefile
> @@ -53,6 +53,7 @@ obj-$(CONFIG_CLKSRC_TI_32K)	+= timer-ti-32k.o
>  obj-$(CONFIG_CLKSRC_NPS)	+= timer-nps.o
>  obj-$(CONFIG_OXNAS_RPS_TIMER)	+= timer-oxnas-rps.o
>  obj-$(CONFIG_OWL_TIMER)		+= owl-timer.o
> +obj-$(CONFIG_NPCM7XX_TIMER)	+= npcm7xx_timer.o
>  
>  obj-$(CONFIG_ARC_TIMERS)		+= arc_timer.o
>  obj-$(CONFIG_ARM_ARCH_TIMER)		+= arm_arch_timer.o
> diff --git a/drivers/clocksource/npcm7xx_timer.c b/drivers/clocksource/npcm7xx_timer.c
> new file mode 100644
> index 000000000000..6da77202a22d
> --- /dev/null
> +++ b/drivers/clocksource/npcm7xx_timer.c
> @@ -0,0 +1,205 @@
> +/*
> + * Copyright (c) 2017 Nuvoton Technology corporation.
> + * Copyright 2017 Google, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation;version 2 of the License.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/sched.h>
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/err.h>
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/clockchips.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_address.h>
> +
> +struct npcm7xx_clockevent_data {
> +	struct clock_event_device cvd;
> +	void __iomem *timer_base;
> +	unsigned int rate;
> +};
> +
> +/* Timers registers */
> +#define REG_TCSR0	0x0 /* Timer 0 Control and Status Register */
> +#define REG_TICR0	0x8 /* Timer 0 Initial Count Register */
> +#define REG_TCSR1	0x4 /* Timer 1 Control and Status Register */
> +#define REG_TICR1	0xc /* Timer 1 Initial Count Register */
> +#define REG_TDR1	0x14 /* Timer 1 Data Register */
> +#define REG_TISR	0x18 /* Timer Interrupt Status Register */
> +
> +#define RESETINT	0x1f
> +#define PERIOD		BIT(27)
> +#define INTEN		BIT(29)
> +#define COUNTEN		BIT(30)
> +#define ONESHOT		0x0
> +#define TIMER_OPER	GENMASK(3, 27)
> +#define MIN_PRESCALE	0x1 /* minimal timer prescale */
> +#define	TDR_MASK_BITS	24

Extra tab.

The macro names are too generic, please prefix them, eg. NPCM7XX_PERIOD

> +#define MAX_TIMER_CNT	0xFFFFFF
> +#define CLR_TIMER0_INT	0x1
> +#define CLR_TIMER_CSR	0x0
>
> +static int npcm7xx_timer_oneshot(struct clock_event_device *evt)
> +{
> +	u32 val;
> +	struct npcm7xx_clockevent_data *cevtd =
> +	 container_of(evt, struct npcm7xx_clockevent_data, cvd);

nit: alignment

> +
> +	val = readl(cevtd->timer_base + REG_TCSR0);
> +	val &= ~TIMER_OPER;
> +
> +	val = readl(cevtd->timer_base + REG_TCSR0);
> +	val |= (ONESHOT | COUNTEN | INTEN | MIN_PRESCALE);

These flags combination may deserve a macro.

> +	writel(val, cevtd->timer_base + REG_TCSR0);
> +
> +	return 0;
> +}
> +
> +static int npcm7xx_timer_periodic(struct clock_event_device *evt)
> +{
> +	struct npcm7xx_clockevent_data *cevtd =
> +		container_of(evt, struct npcm7xx_clockevent_data, cvd);
> +	u32 val;
> +
> +	val = readl(cevtd->timer_base + REG_TCSR0);
> +	val &= ~TIMER_OPER;
> +
> +	writel((cevtd->rate / HZ), cevtd->timer_base + REG_TICR0);
> +	val |= (PERIOD | COUNTEN | INTEN | MIN_PRESCALE);
> +
> +	writel(val, cevtd->timer_base + REG_TCSR0);
> +
> +	return 0;
> +}
> +
> +static int npcm7xx_clockevent_setnextevent(unsigned long evt,
> +		struct clock_event_device *clk)
> +{
> +	struct npcm7xx_clockevent_data *cevtd =
> +		container_of(clk, struct npcm7xx_clockevent_data, cvd);
> +	u32 val;
> +
> +	writel(evt, cevtd->timer_base + REG_TICR0);
> +	val = readl(cevtd->timer_base + REG_TCSR0);
> +	val |= (COUNTEN | INTEN | MIN_PRESCALE);
> +	writel(val, cevtd->timer_base + REG_TCSR0);
> +
> +	return 0;
> +}
> +
> +static struct npcm7xx_clockevent_data npcm7xx_clockevent_data = {
> +	.cvd = {
> +		.name		    = "npcm7xx-timer0",
> +		.features	    = CLOCK_EVT_FEAT_PERIODIC |
> +				      CLOCK_EVT_FEAT_ONESHOT,
> +		.set_next_event	    = npcm7xx_clockevent_setnextevent,
> +		.set_state_shutdown = npcm7xx_timer_oneshot,
> +		.set_state_periodic = npcm7xx_timer_periodic,
> +		.set_state_oneshot  = npcm7xx_timer_oneshot,
> +		.tick_resume	    = npcm7xx_timer_oneshot,
> +		.rating		    = 300
> +	},
> +};
> +
> +static irqreturn_t npcm7xx_timer0_interrupt(int irq, void *dev_id)
> +{
> +	struct npcm7xx_clockevent_data *cevtd = dev_id;
> +	struct clock_event_device *evt = &cevtd->cvd;
> +
> +	writel(CLR_TIMER0_INT, cevtd->timer_base + REG_TISR);
> +
> +	if (evt->event_handler)
> +		evt->event_handler(evt);

In which scenario it is possible to have this condition false?

> +	return IRQ_HANDLED;
> +}
> +
> +static struct irqaction npcm7xx_timer0_irq = {
> +	.name		= "npcm7xx-timer0",
> +	.flags		= IRQF_TIMER | IRQF_IRQPOLL,
> +	.handler	= npcm7xx_timer0_interrupt,
> +	.dev_id		= &npcm7xx_clockevent_data,
> +};
> +
> +static void __init npcm7xx_clockevents_init(int irq, u32 rate)
> +{
> +	writel(CLR_TIMER_CSR, npcm7xx_clockevent_data.timer_base + REG_TCSR0);
> +
> +	writel(RESETINT, npcm7xx_clockevent_data.timer_base + REG_TISR);
> +	setup_irq(irq, &npcm7xx_timer0_irq);

Consider using request_irq instead of setup_irq or, see below, timer-of.c API.

> +	npcm7xx_clockevent_data.cvd.cpumask = cpumask_of(0);
> +
> +	clockevents_config_and_register(&npcm7xx_clockevent_data.cvd, rate,
> +					0x1, MAX_TIMER_CNT);
> +}
> +
> +static void __init npcm7xx_clocksource_init(u32 rate)
> +{
> +	u32 val;
> +
> +	writel(CLR_TIMER_CSR, npcm7xx_clockevent_data.timer_base + REG_TCSR1);
> +	writel(MAX_TIMER_CNT, npcm7xx_clockevent_data.timer_base + REG_TICR1);
> +
> +	val = readl(npcm7xx_clockevent_data.timer_base + REG_TCSR1);
> +	val |= (COUNTEN | PERIOD | MIN_PRESCALE);
> +	writel(val, npcm7xx_clockevent_data.timer_base + REG_TCSR1);
> +
> +	clocksource_mmio_init(npcm7xx_clockevent_data.timer_base + REG_TDR1,
> +				"npcm7xx-timer1", rate,
> +				300, (unsigned int)TDR_MASK_BITS,
> +				clocksource_mmio_readl_down);
> +}
> +
> +static int __init npcm7xx_timer_init(struct device_node *np)
> +{
> +	struct clk *clk;
> +	int irq, ret;
> +	u32 rate;
> +
> +	irq = irq_of_parse_and_map(np, 0);
> +	if (!irq)
> +		return -EINVAL;
> +
> +	npcm7xx_clockevent_data.timer_base = of_iomap(np, 0);
> +	if (!npcm7xx_clockevent_data.timer_base)
> +		return -ENXIO;
> +
> +	clk = of_clk_get(np, 0);
> +
> +	if (IS_ERR(clk)) {
> +		ret = of_property_read_u32(np, "clock-frequency", &rate);
> +		if (ret)
> +			goto err_iounmap;
> +	} else {
> +		clk_prepare_enable(clk);
> +		rate = clk_get_rate(clk);
> +	}
> +
> +	/* Clock input is divided by PRESCALE + 1 before it is fed */
> +	/* to the counter */
> +	rate = rate / (MIN_PRESCALE + 1);
> +
> +	npcm7xx_clockevent_data.rate = rate;

Can you consider using the timer-of.c API? It should simplify the code.

> +
> +	npcm7xx_clocksource_init(rate);
> +	npcm7xx_clockevents_init(irq, rate);
> +
> +	pr_info("Enabling NPCM7xx clocksource timer base: %p, IRQ: %u\n",
> +		npcm7xx_clockevent_data.timer_base, irq);
> +
> +	return 0;
> +
> +err_iounmap:
> +	iounmap(npcm7xx_clockevent_data.timer_base);
> +	return ret;
> +
> +}
> +
> +TIMER_OF_DECLARE(npcm7xx, "nuvoton,npcm7xx-timer", npcm7xx_timer_init);
> +
> -- 
> 2.14.1
> 

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
