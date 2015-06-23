From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 6/9] arm: twr-k70f120m: clock source drivers for Kinetis
 SoC
Date: Tue, 23 Jun 2015 15:24:57 -0700
Message-ID: <5589DCB9.2000908@codeaurora.org>
References: <1435094387-20146-1-git-send-email-pawelo@king.net.pl> <1435094387-20146-7-git-send-email-pawelo@king.net.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435094387-20146-7-git-send-email-pawelo-rhuoMcPwk82rDJvtcaxF/A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Osmialowski <pawelo-rhuoMcPwk82rDJvtcaxF/A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Bhupesh Sharma <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Magnus Damm <damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Nathan
Cc: Yuri Tikhonov <yur-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>, Sergei Poselenov <sposelenov-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>, Dmitry Cherkassov <d_cherkasov-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>, Alexander Potashev <aspotashev-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/23/2015 02:19 PM, Paul Osmialowski wrote:
>
> diff --git a/drivers/clk/clk-kinetis.c b/drivers/clk/clk-kinetis.c
> new file mode 100644
> index 0000000..dea1054
> --- /dev/null
> +++ b/drivers/clk/clk-kinetis.c
> @@ -0,0 +1,226 @@
> +/*
> + * clk-kinetis.c - Clock driver for Kinetis K70 MCG
> + *
> + * Based on legacy pre-OF code by Alexander Potashev <aspotashev-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org>
> + *
> + * Copyright (C) 2015 Paul Osmialowski <pawelo-rhuoMcPwk82rDJvtcaxF/A@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify it under
> + * the terms of the GNU General Public License version 2 as published by the
> + * Free Software Foundation.
> + */
> +
> +#include <linux/clk.h>

Is this using the consumer API? Please remove this include.

> +#include <linux/io.h>
> +#include <linux/clk-provider.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/err.h>
> +#include <mach/kinetis.h>
> +#include <mach/power.h>

It would be nice if we didn't need these mach includes so that this
driver can be easily build tested.

> +
> +#include <dt-bindings/clock/kinetis-mcg.h>
[..]
> +}
> +
> +CLK_OF_DECLARE(kinetis_mcg, "fsl,kinetis-cmu", kinetis_mcg_init);

A clocksource isn't the same as a clk provider. Please split this patch
into two, one for the clk provider (drivers/clk) and one for the
clocksource driver (drivers/clocksource).

> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index 0f1c77e..1d2ecde 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -106,6 +106,11 @@ config CLKSRC_EFM32
>  	  Support to use the timers of EFM32 SoCs as clock source and clock
>  	  event device.
>  
> +config CLKSRC_KINETIS
> +	bool "Clocksource for Kinetis SoCs"
> +	depends on OF && ARM && ARCH_KINETIS

Doesn't ARCH_KINETIS imply ARM? Seems that we can drop the ARM
dependency here.

> +	select CLKSRC_OF
>
>
> diff --git a/drivers/clocksource/timer-kinetis.c b/drivers/clocksource/timer-kinetis.c
> new file mode 100644
> index 0000000..634f365
> --- /dev/null
> +++ b/drivers/clocksource/timer-kinetis.c
[..]
> +
> +/*
> + * Clock event device set mode function
> + */
> +static void kinetis_clockevent_tmr_set_mode(
> +	enum clock_event_mode mode, struct clock_event_device *clk)

s/clk/evt/ ?

> +{
> +	struct kinetis_clock_event_ddata *pit =
> +		container_of(clk, struct kinetis_clock_event_ddata, evtdev);
> +
> +	switch (mode) {
> +	case CLOCK_EVT_MODE_PERIODIC:
> +		kinetis_pit_enable(pit->base, 1);
> +		break;
> +	case CLOCK_EVT_MODE_ONESHOT:
> +	case CLOCK_EVT_MODE_UNUSED:
> +	case CLOCK_EVT_MODE_SHUTDOWN:
> +	default:
> +		kinetis_pit_enable(pit->base, 0);
> +	}
> +}
> +
> +/*
> + * Configure the timer to generate an interrupt in the specified amount of ticks
> + */
> +static int kinetis_clockevent_tmr_set_next_event(
> +	unsigned long delta, struct clock_event_device *c)
> +{
> +	struct kinetis_clock_event_ddata *pit =
> +		container_of(c, struct kinetis_clock_event_ddata, evtdev);
> +	unsigned long flags;
> +
> +	raw_local_irq_save(flags);

What is this protecting against?

> +	kinetis_pit_init(pit->base, delta);
> +	kinetis_pit_enable(pit->base, 1);
> +	raw_local_irq_restore(flags);
> +
> +	return 0;
> +}
> +
> +static struct kinetis_clock_event_ddata
> +		kinetis_clockevent_tmrs[KINETIS_PIT_CHANNELS] = {
> +	{
> +		.evtdev = {
> +			.name		= "fsl,kinetis-pit-timer0",
> +			.rating		= 200,
> +			.features	=
> +			    CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT,
> +			.set_mode	= kinetis_clockevent_tmr_set_mode,
> +			.set_next_event	= kinetis_clockevent_tmr_set_next_event,
> +		},
> +	},
> +	{
> +		.evtdev = {
> +			.name		= "fsl,kinetis-pit-timer1",
> +		},
> +	},
> +	{
> +		.evtdev = {
> +			.name		= "fsl,kinetis-pit-timer2",
> +		},
> +	},
> +	{
> +		.evtdev = {
> +			.name		= "fsl,kinetis-pit-timer3",
> +		},
> +	},
> +};
> +
> +/*
> + * Timer IRQ handler
> + */
> +static irqreturn_t kinetis_clockevent_tmr_irq_handler(int irq, void *dev_id)
> +{
> +	struct kinetis_clock_event_ddata *tmr = dev_id;
> +
> +	KINETIS_PIT_WR(tmr->base, tflg, KINETIS_PIT_TFLG_TIF_MSK);
> +
> +	tmr->evtdev.event_handler(&(tmr->evtdev));

Unnecessary parentheses, please remove them.

> +
> +	return IRQ_HANDLED;
> +}
> +
> +/*
> + * System timer IRQ action
> + */
> +static struct irqaction kinetis_clockevent_irqaction[KINETIS_PIT_CHANNELS] = {
> +	{
> +		.name = "Kinetis Kernel Time Tick (pit0)",
> +		.flags = IRQF_TIMER | IRQF_IRQPOLL,
> +		.dev_id = &kinetis_clockevent_tmrs[0],
> +		.handler = kinetis_clockevent_tmr_irq_handler,
> +	}, {
> +		.name = "Kinetis Kernel Time Tick (pit1)",
> +		.flags = IRQF_TIMER | IRQF_IRQPOLL,
> +		.dev_id = &kinetis_clockevent_tmrs[1],
> +		.handler = kinetis_clockevent_tmr_irq_handler,
> +	}, {
> +		.name = "Kinetis Kernel Time Tick (pit2)",
> +		.flags = IRQF_TIMER | IRQF_IRQPOLL,
> +		.dev_id = &kinetis_clockevent_tmrs[2],
> +		.handler = kinetis_clockevent_tmr_irq_handler,
> +	}, {
> +		.name = "Kinetis Kernel Time Tick (pit3)",
> +		.flags = IRQF_TIMER | IRQF_IRQPOLL,
> +		.dev_id = &kinetis_clockevent_tmrs[3],
> +		.handler = kinetis_clockevent_tmr_irq_handler,
> +	},
> +};

Any reason we can't just use request_irq() instead of having a set of
static irq actions?

> +
> +static void __init kinetis_clockevent_init(struct device_node *np)
> +{
[..]
> irq;
> +	}
> +
> +	chan = of_alias_get_id(np, "pit");
> +	if ((chan < 0) || (chan >= KINETIS_PIT_CHANNELS)) {

Unnecessary parentheses, please remove them.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
