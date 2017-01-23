From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/2] clocksource: Add renesas-ostm timer driver
Date: Mon, 23 Jan 2017 18:52:10 +0100
Message-ID: <20170123175210.GH2166@mai>
References: <20170123135423.28780-1-chris.brandt@renesas.com>
 <20170123135423.28780-3-chris.brandt@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170123135423.28780-3-chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 23, 2017 at 08:54:23AM -0500, Chris Brandt wrote:
> This patch adds a OSTM driver for the Renesas architecture.

As it is a new driver, please give technical details for the log.
 
Replace ioread/write by readl/writel in the code.

> Signed-off-by: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> 
> ---
> v2:
> * changed implementation to be independent channel nodes
> ---
>  arch/arm/mach-shmobile/Kconfig     |   1 +
>  drivers/clocksource/Kconfig        |  12 ++
>  drivers/clocksource/Makefile       |   1 +
>  drivers/clocksource/renesas-ostm.c | 349 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 363 insertions(+)
>  create mode 100644 drivers/clocksource/renesas-ostm.c
> 
> diff --git a/arch/arm/mach-shmobile/Kconfig b/arch/arm/mach-shmobile/Kconfig
> index 2bb4b09..b928634 100644
> --- a/arch/arm/mach-shmobile/Kconfig
> +++ b/arch/arm/mach-shmobile/Kconfig
> @@ -57,6 +57,7 @@ config ARCH_R7S72100
>  	select PM
>  	select PM_GENERIC_DOMAINS
>  	select SYS_SUPPORTS_SH_MTU2
> +	select SYS_SUPPORTS_RENESAS_OSTM

- select SYS_SUPPORTS_RENESAS_OSTM
+ select RENESAS_OSTM

>  
>  config ARCH_R8A73A4
>  	bool "R-Mobile APE6 (R8A73A40)"
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index 4866f7a..95c8d56 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -431,6 +431,9 @@ config MTK_TIMER
>  config SYS_SUPPORTS_SH_MTU2
>          bool
>  
> +config SYS_SUPPORTS_RENESAS_OSTM
> +        bool
> +

-config SYS_SUPPORTS_RENESAS_OSTM
-        bool
-

>  config SYS_SUPPORTS_SH_TMU
>          bool
>  
> @@ -467,6 +470,15 @@ config SH_TIMER_MTU2
>  	  Timer Pulse Unit 2 (MTU2) hardware available on SoCs from Renesas.
>  	  This hardware comes with 16 bit-timer registers.
>  
> +config RENESAS_OSTM
> +	bool "Renesas OSTM timer driver" if COMPILE_TEST
> +	depends on GENERIC_CLOCKEVENTS
> +	select CLKSRC_MMIO
> +	default SYS_SUPPORTS_RENESAS_OSTM

- default SYS_SUPPORTS_RENESAS_OSTM

Except I missing something, I don' the point of having this intermediate
config option.

> +	help
> +	  This enables the build of the OSTM timer driver.
> +	  It creates a clock source and clock event device.
> +
>  config SH_TIMER_TMU
>  	bool "Renesas TMU timer driver" if COMPILE_TEST
>  	depends on GENERIC_CLOCKEVENTS
> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
> index a14111e..bbd163b 100644
> --- a/drivers/clocksource/Makefile
> +++ b/drivers/clocksource/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_CS5535_CLOCK_EVENT_SRC)	+= cs5535-clockevt.o
>  obj-$(CONFIG_CLKSRC_JCORE_PIT)		+= jcore-pit.o
>  obj-$(CONFIG_SH_TIMER_CMT)	+= sh_cmt.o
>  obj-$(CONFIG_SH_TIMER_MTU2)	+= sh_mtu2.o
> +obj-$(CONFIG_RENESAS_OSTM)	+= renesas-ostm.o
>  obj-$(CONFIG_SH_TIMER_TMU)	+= sh_tmu.o
>  obj-$(CONFIG_EM_TIMER_STI)	+= em_sti.o
>  obj-$(CONFIG_CLKBLD_I8253)	+= i8253.o
> diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/renesas-ostm.c
> new file mode 100644
> index 0000000..37f2461
> --- /dev/null
> +++ b/drivers/clocksource/renesas-ostm.c
> @@ -0,0 +1,349 @@
> +/*
> + * Renesas Timer Support - OSTM
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + */
> +
> +#include <linux/platform_device.h>
> +#include <linux/clk.h>
> +#include <linux/clockchips.h>
> +#include <linux/interrupt.h>
> +#include <linux/slab.h>
> +#include <linux/module.h>

Please remove everything module related here and below. This driver is not
supposed to be removed and it is compiled in with the Kconfig option.

> +#include <linux/pm_runtime.h>
> +#include <linux/sched_clock.h>
> +
> +/*
> + * The OSTM contains independent channels.
> + * The first OSTM channel probed will be set up as a free running
> + * clocksource. Additionally we will use this clocksource for the system
> + * schedule timer sched_clock().
> + *
> + * The second (or more) channel probed will be set up as an interrupt
> + * driven clock event.
> + */
> +
> +struct ostm_device {
> +	struct platform_device *pdev;
> +	int irq;
> +	struct clk *clk;
> +	unsigned long rate;
> +	void __iomem *base;
> +	unsigned long ticks_per_jiffy;
> +	struct clock_event_device ced;
> +};

You can probably reduce the size of this structure by removing some fields
which are used only at init time.

> +
> +static void __iomem *system_clock;	/* For sched_clock() */
> +
> +/* OSTM REGISTERS */
> +#define	OSTM_CMP		0x000	/* RW,32 */
> +#define	OSTM_CNT		0x004	/* R,32 */
> +#define	OSTM_TE			0x010	/* R,8 */
> +#define	OSTM_TS			0x014	/* W,8 */
> +#define	OSTM_TT			0x018	/* W,8 */
> +#define	OSTM_CTL		0x020	/* RW,8 */
> +
> +#define	TE			0x01
> +#define	TS			0x01
> +#define	TT			0x01
> +#define	CTL_PERIODIC		0x00
> +#define	CTL_ONESHOT		0x02
> +#define	CTL_FREERUN		0x02
> +
> +static struct ostm_device *ced_to_ostm(struct clock_event_device *ced)
> +{
> +	return container_of(ced, struct ostm_device, ced);
> +}
> +
> +static int __init ostm_init_clksrc(struct ostm_device *ostm)
> +{
> +	int ret;
> +
> +	/* irq not used (clock sources don't use interrupts) */
> +
> +	/* stop counter */

One line comment is usually in the network code. Please use multiline.

/*
 * Bla bla
 */

> +	iowrite8(TT, ostm->base + OSTM_TT);
> +	while (ioread8(ostm->base + OSTM_TE) & TE)
> +		;

Comment here for this dangerous loop. Explain why we can't be stuck here.

> +
> +	/* setup as freerun */
> +	iowrite32(0, ostm->base + OSTM_CMP);
> +	iowrite8(CTL_FREERUN, ostm->base + OSTM_CTL);
> +	iowrite8(TS, ostm->base + OSTM_TS);
> +
> +	/* register */
> +	ret = clocksource_mmio_init(ostm->base + OSTM_CNT,
> +			"ostm", ostm->rate,
> +			300, 32, clocksource_mmio_readl_up);
> +
> +	return ret;

return clocksource_mmio_init(...);

> +}
> +
> +static u64 notrace ostm_read_sched_clock(void)
> +{
> +	return ioread32(system_clock);
> +}
> +
> +static int __init ostm_init_sched_clock(struct ostm_device *ostm)
> +{
> +	unsigned long flags;
> +
> +	system_clock = ostm->base + OSTM_CNT;
> +	local_irq_save(flags);
> +	local_irq_disable();

1. local_irq_disable() is not needed, local_irq_save() saves the irq flags and
disables the irq.

2. Why do you need to disable the irq here ?

> +	sched_clock_register(ostm_read_sched_clock, 32, ostm->rate);
> +	local_irq_restore(flags);
> +
> +	return 0;
> +}
> +
> +static void ostm_clkevt_timer_stop(struct ostm_device *ostm)
> +{
> +	if (ioread8(ostm->base + OSTM_TE) & TE) {
> +		iowrite8(TT, ostm->base + OSTM_TT);
> +		while (ioread8(ostm->base + OSTM_TE) & TE)
> +			;

Same comment as above.

> +	}
> +}
> +
> +static int ostm_clock_event_next(unsigned long delta,
> +				     struct clock_event_device *ced)
> +{
> +	struct ostm_device *ostm = ced_to_ostm(ced);
> +
> +	WARN_ON(!clockevent_state_oneshot(ced));

Pointless check. It is up to the time framework to handle that and that is the
case.

> +
> +	ostm_clkevt_timer_stop(ostm);
> +
> +	iowrite32(delta, ostm->base + OSTM_CMP);
> +	iowrite8(CTL_ONESHOT, ostm->base + OSTM_CTL);
> +	iowrite8(TS, ostm->base + OSTM_TS);
> +
> +	return 0;
> +}
> +
> +static int ostm_shutdown(struct clock_event_device *ced)
> +{
> +	struct ostm_device *ostm = ced_to_ostm(ced);
> +
> +	ostm_clkevt_timer_stop(ostm);
> +
> +	return 0;
> +}
> +static int ostm_set_periodic(struct clock_event_device *ced)
> +{
> +	struct ostm_device *ostm = ced_to_ostm(ced);
> +
> +	if (clockevent_state_oneshot(ced) || clockevent_state_periodic(ced))
> +		ostm_clkevt_timer_stop(ostm);
> +
> +	iowrite32(ostm->ticks_per_jiffy - 1, ostm->base + OSTM_CMP);
> +	iowrite8(CTL_PERIODIC, ostm->base + OSTM_CTL);
> +	iowrite8(TS, ostm->base + OSTM_TS);
> +
> +	return 0;
> +}
> +
> +static int ostm_set_oneshot(struct clock_event_device *ced)
> +{
> +	struct ostm_device *ostm = ced_to_ostm(ced);
> +
> +	ostm_clkevt_timer_stop(ostm);
> +
> +	return 0;
> +}
> +
> +static irqreturn_t ostm_timer_interrupt(int irq, void *dev_id)
> +{
> +	struct ostm_device *ostm = dev_id;
> +
> +	if (clockevent_state_oneshot(&ostm->ced))
> +		ostm_clkevt_timer_stop(ostm);
> +
> +	/* notify clockevent layer */
> +	if (ostm->ced.event_handler)
> +		ostm->ced.event_handler(&ostm->ced);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int __init ostm_init_clkevt(struct ostm_device *ostm)
> +{
> +	struct clock_event_device *ced = &ostm->ced;
> +	int ret = -ENXIO;
> +
> +	ret = request_irq(ostm->irq, ostm_timer_interrupt,
> +			  IRQF_TIMER | IRQF_IRQPOLL | IRQF_NOBALANCING,
> +			  dev_name(&ostm->pdev->dev), ostm);

	devm_request_irq

Are you sure the IRQF_NOBALANCING flag should be used ? By default the
interrupt is pinned to cpu0 below. If this timer is used as a broadcast timer
for a system with deep idle, you may want to add the DYNIRQ flag feature to
improve the wakeups on the system.

> +	if (ret) {
> +		dev_err(&ostm->pdev->dev, "failed to request irq\n");
> +		return ret;
> +	}
> +
> +	ced->name = "ostm";
> +	ced->features = CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_PERIODIC;
> +	ced->set_state_shutdown = ostm_shutdown;
> +	ced->set_state_periodic = ostm_set_periodic;
> +	ced->set_state_oneshot = ostm_set_oneshot;
> +	ced->set_next_event = ostm_clock_event_next;
> +	ced->shift = 32;
> +	ced->rating = 300;
> +	ced->cpumask = cpumask_of(0);
> +	clockevents_config_and_register(ced, ostm->rate, 0xf, 0xffffffff);
> +
> +	return 0;
> +}
> +
> +static int __init ostm_probe(struct platform_device *pdev)
> +{
> +	struct ostm_device *ostm;
> +	struct resource *res;
> +	int ret = -EFAULT;
> +
> +	if (!is_early_platform_device(pdev)) {
> +		pm_runtime_set_active(&pdev->dev);
> +		pm_runtime_enable(&pdev->dev);
> +	}

Can you clarify why the 'early' is needed here ?

I don't see the pm_runtime_get/pm_runtime_put in the corresponding function.

What is the benefit of using pm_runtime in this driver ? Isn't the timer
supposed to be in an always-on power domain ?

> +	ostm = platform_get_drvdata(pdev);
> +	if (ostm) {
> +		dev_info(&pdev->dev, "kept as earlytimer\n");
> +		ret = 0;
> +		goto out;
> +	}
> +
> +	ostm = kzalloc(sizeof(*ostm), GFP_KERNEL);

	devm_kzalloc ?

> +	if (!ostm) {
> +		dev_err(&pdev->dev, "failed to allocate memory\n");

A memory failure allocation always triggers a dumpstack (IIRC), so this
error message is pointless.

> +		return -ENOMEM;
> +	}
> +
> +	ostm->pdev = pdev;
> +	platform_set_drvdata(ostm->pdev, ostm);
> +
> +	res = platform_get_resource(ostm->pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(&ostm->pdev->dev, "failed to get I/O memory\n");
> +		goto err;
> +	}
> +
> +	ostm->base = ioremap_nocache(res->start, resource_size(res));

	devm_ioremap_nocache ?

> +	if (!ostm->base) {
> +		dev_err(&ostm->pdev->dev, "failed to remap I/O memory\n");
> +		goto err;
> +	}
> +
> +	ostm->irq = platform_get_irq(ostm->pdev, 0);
> +	if (ostm->irq < 0) {
> +		dev_err(&ostm->pdev->dev, "failed to get irq\n");
> +		goto err;
> +	}
> +
> +	ostm->clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(ostm->clk)) {
> +		dev_err(&ostm->pdev->dev, "failed to get clock\n");
> +		ostm->clk = NULL;
> +		goto err;
> +	}
> +
> +	ret = clk_prepare_enable(ostm->clk);
> +	if (ret) {
> +		dev_err(&ostm->pdev->dev, "failed to enable clock\n");
> +		goto err;
> +	}
> +
> +	ostm->rate = clk_get_rate(ostm->clk);
> +	ostm->ticks_per_jiffy = (ostm->rate + HZ / 2) / HZ;
> +
> +	/* First probed device will be used as system clocksource */
> +	if (!system_clock) {
> +		/* use as clocksource */
> +		ret = ostm_init_clksrc(ostm);
> +
> +		/* use as system scheduling clock */
> +		if (!ret)
> +			ret = ostm_init_sched_clock(ostm);
> +
> +		if (ret) {
> +			dev_err(&pdev->dev, "failed to use as sched_clock\n");
> +			system_clock = (void *)-1; /* prevent future attempts */
> +			ret = 0;	/* still works as clocksource */
> +		}

This error code check is unnecessary complex. ostm_init_sched_clock always
return zero.

	if (!system_clock) {
		system_clock = ostm_init_sched_clock(ostm);
		ret = ostm_init_clksrc(ostm)
		if (ret)
			dev_err("Failed to initialize the clocksource\n");
	} else {

		...
	}

This is not perfect but until I send the clksrc_of/clkevt_of split changes, we
have to deal with these kind of hacks.

> +		if (!ret)
> +			dev_info(&pdev->dev, "used for clocksource\n");
> +	} else {
> +		/* use as clock event */
> +		ret = ostm_init_clkevt(ostm);
> +
> +		if (!ret)
> +			dev_info(&pdev->dev, "used for clock events\n");
> +	}
> +
> +err:
> +	if (ret) {
> +		if (ostm->clk)
> +			clk_disable_unprepare(ostm->clk);
> +		if (ostm->base)
> +			iounmap(ostm->base);
> +		kfree(ostm);
> +		platform_set_drvdata(pdev, NULL);

As iomap, kzalloc were done with the devm, then the rollback will be handled
with the device framework.

> +		pm_runtime_idle(&pdev->dev);
> +		return ret;
> +	}
> +
> +	if (is_early_platform_device(pdev))
> +		return ret;
> +
> +out:
> +	pm_runtime_irq_safe(&pdev->dev);
> +
> +	return ret;
> +}
> +
> +static int ostm_remove(struct platform_device *pdev)
> +{
> +	return -EBUSY;	/* cannot unregister clockevent */
> +}
> +
> +static const struct of_device_id ostm_of_table[] __maybe_unused = {
> +	{ .compatible = "renesas,ostm" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ostm_of_table);
> +
> +static struct platform_driver ostm_timer = {
> +	.probe		= ostm_probe,
> +	.remove		= ostm_remove,
> +	.driver	= {
> +		.name	= "ostm",
> +		.of_match_table = of_match_ptr(ostm_of_table),
> +	},
> +};
> +
> +static int __init ostm_init(void)
> +{
> +	return platform_driver_register(&ostm_timer);
> +}
> +
> +static void __exit ostm_exit(void)
> +{
> +	platform_driver_unregister(&ostm_timer);
> +}
> +
> +early_platform_init("earlytimer", &ostm_timer);
> +subsys_initcall(ostm_init);
> +module_exit(ostm_exit);
> +
> +MODULE_AUTHOR("Chris Brandt");
> +MODULE_DESCRIPTION("Renesas OSTM Timer Driver");
> +MODULE_LICENSE("GPL v2");

Maybe you can try with builtin_platform ?

  -- Daniel

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
