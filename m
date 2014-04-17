From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [RFC][PATCH 3/3] clocksource: Add Freescale FlexTimer Module
 (FTM) timer support
Date: Thu, 17 Apr 2014 16:22:57 +0200
Message-ID: <534FE3C1.4060509@linaro.org>
References: <1397614787-8300-1-git-send-email-Li.Xiubo@freescale.com> <1397614787-8300-4-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1397614787-8300-4-git-send-email-Li.Xiubo@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Xiubo Li <Li.Xiubo@freescale.com>, tglx@linutronix.de, shawn.guo@linaro.org, b35083@freescale.com, r64188@freescale.com, b40534@freescale.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/16/2014 04:19 AM, Xiubo Li wrote:
> The Freescale FlexTimer Module time reference is a 16-bit counter
> that can be used as an unsigned or signed counter.one 16-bits
> increase counter.
>
> Here using the FTM0 as clock event device and the FTM1 as clock
> source device.

As it is a new driver, please add a more elaborated description of the=20
timer.

> Signed-off-by: Xiubo Li <Li.Xiubo@freescale.com>
> Cc: Shawn Guo <shawn.guo@linaro.org>
> Cc: Jingchang Lu <b35083@freescale.com>
> ---
>   drivers/clocksource/Kconfig         |   5 +
>   drivers/clocksource/Makefile        |   1 +
>   drivers/clocksource/fsl_ftm_timer.c | 238 +++++++++++++++++++++++++=
+++++++++++
>   3 files changed, 244 insertions(+)
>   create mode 100644 drivers/clocksource/fsl_ftm_timer.c
>
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfi=
g
> index cd6950f..28321c5 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -136,6 +136,11 @@ config CLKSRC_SAMSUNG_PWM
>   	  for all devicetree enabled platforms. This driver will be
>   	  needed only on systems that do not have the Exynos MCT available=
=2E
>
> +config FSL_FTM_TIMER
> +	bool
> +	help
> +	  Support for Freescale FlexTimer Module (FTM) timer.
> +
>   config VF_PIT_TIMER
>   	bool
>   	help
> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makef=
ile
> index c7ca50a..ce0a967 100644
> --- a/drivers/clocksource/Makefile
> +++ b/drivers/clocksource/Makefile
> @@ -31,6 +31,7 @@ obj-$(CONFIG_CADENCE_TTC_TIMER)	+=3D cadence_ttc_ti=
mer.o
>   obj-$(CONFIG_CLKSRC_EFM32)	+=3D time-efm32.o
>   obj-$(CONFIG_CLKSRC_EXYNOS_MCT)	+=3D exynos_mct.o
>   obj-$(CONFIG_CLKSRC_SAMSUNG_PWM)	+=3D samsung_pwm_timer.o
> +obj-$(CONFIG_FSL_FTM_TIMER)	+=3D fsl_ftm_timer.o
>   obj-$(CONFIG_VF_PIT_TIMER)	+=3D vf_pit_timer.o
>
>   obj-$(CONFIG_ARM_ARCH_TIMER)		+=3D arm_arch_timer.o
> diff --git a/drivers/clocksource/fsl_ftm_timer.c b/drivers/clocksourc=
e/fsl_ftm_timer.c
> new file mode 100644
> index 0000000..988449e
> --- /dev/null
> +++ b/drivers/clocksource/fsl_ftm_timer.c
> @@ -0,0 +1,238 @@
> +/*
> + * Freescale FlexTimer Module (FTM) timer driver.
> + *
> + * Copyright 2014 Freescale Semiconductor, Inc.
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version 2
> + * of the License, or (at your option) any later version.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clockchips.h>
> +#include <linux/clocksource.h>
> +#include <linux/err.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/sched_clock.h>

Could you check all these headers are effectively needed ?

> +#define FTM_OFFSET(n)	(0x1000 * n)
> +
> +#define FTM_SC		0x00
> +#define FTM_SC_CLK_SHIFT	3
> +#define FTM_SC_CLK_MASK	(0x3 << FTM_SC_CLK_SHIFT)
> +#define FTM_SC_CLK(c)	((c) << FTM_SC_CLK_SHIFT)
> +#define FTM_SC_PS_MASK	0x7
> +#define FTM_SC_TOIE	BIT(6)
> +#define FTM_SC_TOF	BIT(7)
> +
> +#define FTM_CNT		0x04
> +#define FTM_MOD		0x08
> +
> +#define FTM_CSC_BASE	0x0C
> +#define FTM_CSC_MSB	BIT(5)
> +#define FTM_CSC_MSA	BIT(4)
> +#define FTM_CSC_ELSB	BIT(3)
> +#define FTM_CSC_ELSA	BIT(2)
> +
> +#define FTM_CV_BASE	0x10
> +#define FTM_CNTIN	0x4C
> +#define FTM_STATUS	0x50
> +
> +#define FTM_MODE	0x54
> +#define FTM_MODE_FTMEN	BIT(0)
> +#define FTM_MODE_WPDIS	BIT(2)
> +#define FTM_MODE_PWMSYNC	BIT(3)
> +
> +#define FTM_SYNC	0x58
> +#define FTM_OUTINIT	0x5C
> +#define FTM_OUTMASK	0x60
> +#define FTM_COMBINE	0x64
> +#define FTM_DEADTIME	0x68
> +#define FTM_EXTTRIG	0x6C
> +#define FTM_POL		0x70
> +#define FTM_FMS		0x74
> +#define FTM_FILTER	0x78
> +#define FTM_FLTCTRL	0x7C
> +#define FTM_QDCTRL	0x80
> +#define FTM_CONF	0x84
> +#define FTM_FLTPOL	0x88
> +#define FTM_SYNCONF	0x8C
> +#define FTM_INVCTRL	0x90
> +#define FTM_SWOCTRL	0x94
> +#define FTM_PWMLOAD	0x98

Please remove the unused macros.

> +
> +static void __iomem *clksrc_base;
> +static void __iomem *clkevt_base;
> +static unsigned long peroidic_cyc;
> +
> +static inline void __init ftm_timer_enable(void __iomem *base)
> +{
> +	u32 val;
> +
> +	/* select and enable counter clock source */
> +	val =3D __raw_readl(base + FTM_SC);
> +	val &=3D ~FTM_SC_CLK_MASK;
> +	val |=3D FTM_SC_CLK(1);
> +	__raw_writel(val, base + FTM_SC);
> +}
> +
> +static u64 ftm_read_sched_clock(void)
> +{
> +	return __raw_readl(clksrc_base + FTM_CNT);
> +}
> +
> +static int __init ftm_clocksource_init(unsigned long freq)
> +{
> +	int ret;
> +
> +	__raw_writel(0x00, clksrc_base + FTM_CNTIN);
> +	__raw_writel(~0UL, clksrc_base + FTM_MOD);
> +	__raw_writel(0x1, clksrc_base + FTM_CNT);
> +
> +	sched_clock_register(ftm_read_sched_clock, 16, freq);
> +	ret =3D clocksource_mmio_init(clksrc_base + FTM_CNT, "fsl-ftm",
> +				freq, 300, 16, clocksource_mmio_readl_up);
> +	if (ret)
> +		return ret;
> +
> +	ftm_timer_enable(clksrc_base);
> +
> +	return 0;
> +}
> +
> +static inline void ftm_irq_acknowledge(void)
> +{
> +	u32 val;
> +
> +	val =3D __raw_readl(clkevt_base + FTM_SC);
> +	val &=3D ~FTM_SC_TOF;
> +	__raw_writel(val, clkevt_base + FTM_SC);
> +}
> +
> +static int ftm_set_next_event(unsigned long delta,
> +				struct clock_event_device *unused)
> +{
> +	__raw_writel(delta, clkevt_base + FTM_MOD);
> +
> +	return 0;
> +}
> +
> +static void ftm_set_mode(enum clock_event_mode mode,
> +				struct clock_event_device *evt)
> +{
> +	switch (mode) {
> +	case CLOCK_EVT_MODE_PERIODIC:
> +		ftm_set_next_event(peroidic_cyc, evt);
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
> +static irqreturn_t ftm_timer_interrupt(int irq, void *dev_id)
> +{
> +	struct clock_event_device *evt =3D dev_id;
> +
> +	ftm_irq_acknowledge();
> +
> +	evt->event_handler(evt);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static struct clock_event_device clockevent_ftm =3D {
> +	.name		=3D "Freescale ftm timer",
> +	.features	=3D CLOCK_EVT_FEAT_PERIODIC,
> +	.set_mode	=3D ftm_set_mode,
> +	.set_next_event	=3D ftm_set_next_event,
> +	.rating		=3D 300,
> +};
> +
> +static struct irqaction ftm_timer_irq =3D {
> +	.name		=3D "Freescale ftm timer",
> +	.flags		=3D IRQF_TIMER | IRQF_IRQPOLL,
> +	.handler	=3D ftm_timer_interrupt,
> +	.dev_id		=3D &clockevent_ftm,
> +};
> +
> +static int __init ftm_clockevent_init(unsigned long freq, int irq)
> +{
> +	u32 val;
> +
> +	__raw_writel(0x00, clkevt_base + FTM_CNTIN);
> +	__raw_writel(~0UL, clkevt_base + FTM_MOD);
> +	__raw_writel(0x1, clksrc_base + FTM_CNT);
> +
> +	val =3D __raw_readl(clkevt_base + FTM_SC);
> +	val |=3D FTM_SC_TOIE;
> +	__raw_writel(val, clkevt_base + FTM_SC);
> +
> +	BUG_ON(setup_irq(irq, &ftm_timer_irq));
> +
> +	clockevent_ftm.cpumask =3D cpumask_of(0);
> +	clockevent_ftm.irq =3D irq;
> +
> +	clockevents_config_and_register(&clockevent_ftm, freq, 1, 0xffff);
> +
> +	ftm_timer_enable(clkevt_base);
> +
> +	return 0;
> +}
> +
> +static void __init calc_closest_cound_cyc(unsigned long freq)
> +{
> +	unsigned long ps =3D 0;
> +
> +	do {
> +		peroidic_cyc =3D DIV_ROUND_CLOSEST(freq, HZ * (1 << ps++));
> +	} while (peroidic_cyc > 0xFFFF);
> +
> +}
> +
> +static void __init ftm_timer_init(struct device_node *np)
> +{
> +	struct clk *ftm_clk;
> +	void __iomem *timer_base;
> +	unsigned long freq;
> +	int irq;
> +
> +	timer_base =3D of_iomap(np, 0);
> +	BUG_ON(!timer_base);
> +
> +	clksrc_base =3D timer_base + FTM_OFFSET(1);
> +	clkevt_base =3D timer_base + FTM_OFFSET(0);
> +
> +	irq =3D irq_of_parse_and_map(np, 0);
> +	BUG_ON(irq <=3D 0);
> +
> +	ftm_clk =3D of_clk_get_by_name(np, "ftm0_counter_en");
> +	BUG_ON(IS_ERR(ftm_clk));
> +	BUG_ON(clk_prepare_enable(ftm_clk));
> +
> +	ftm_clk =3D of_clk_get_by_name(np, "ftm1_counter_en");
> +	BUG_ON(IS_ERR(ftm_clk));
> +	BUG_ON(clk_prepare_enable(ftm_clk));
> +
> +	ftm_clk =3D of_clk_get_by_name(np, "ftm0");
> +	BUG_ON(IS_ERR(ftm_clk));
> +	BUG_ON(clk_prepare_enable(ftm_clk));
> +
> +	ftm_clk =3D of_clk_get_by_name(np, "ftm1");
> +	BUG_ON(IS_ERR(ftm_clk));
> +	BUG_ON(clk_prepare_enable(ftm_clk));
> +
> +	freq =3D clk_get_rate(ftm_clk);
> +
> +	calc_closest_cound_cyc(freq);
> +
> +	BUG_ON(ftm_clocksource_init(freq));
> +
> +	BUG_ON(ftm_clockevent_init(freq, irq));
> +}
> +CLOCKSOURCE_OF_DECLARE(vf610, "fsl,vf610-ftm-timer", ftm_timer_init)=
;


I am not a big fan of those BUG_ON every line. Could you please replace=
=20
it by dev_err().

That is also not in the logic of a single zImage.

Thanks
   -- Daniel


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
