From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v3 1/3] clocksource/drivers/atcpit100: Add andestech
 atcpit100 timer
Date: Tue, 7 Nov 2017 13:46:51 +0100
Message-ID: <2c921da7-03c6-4098-dd64-ec0efe40b330@linaro.org>
References: <1510039193-32522-1-git-send-email-rickchen36@gmail.com>
 <1510039193-32522-2-git-send-email-rickchen36@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1510039193-32522-2-git-send-email-rickchen36@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rick Chen <rickchen36@gmail.com>, tglx@linutronix.de, robh@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, rick@andestech.com
Cc: Greentime Hu <green.hu@gmail.com>
List-Id: devicetree@vger.kernel.org

On 07/11/2017 08:19, Rick Chen wrote:
> ATCPIT100 is often used on the Andes architecture,
> This timer provide 4 PIT channels. Each PIT channel is a
> multi-function timer, can be configured as 32,16,8 bit timers
> or PWM as well.
> 
> For system timer it will set 32-bit timer0 as clock source
> and count downwards until underflow and restart again.
> 
> It also set 32-bit timer1 as clock event and count downwards
> until condition match. It will generate an interrupt for
> handling periodically.
> 
> Signed-off-by: Rick Chen <rickchen36@gmail.com>
> Signed-off-by: Greentime Hu <green.hu@gmail.com>

Is it rick@andestech.com or rickchen36@gmail.com ?

Are you sending this patch as a hobbyist or on the behalf of your
company ? Can you clarify your position regarding this (From: vs
Copyright) ?

More comments below.

> ---
>  drivers/clocksource/timer-atcpit100.c | 199 ++++++++++++++++++++++++++++++++++
>  1 file changed, 199 insertions(+)
>  create mode 100644 drivers/clocksource/timer-atcpit100.c
> 
> diff --git a/drivers/clocksource/timer-atcpit100.c b/drivers/clocksource/timer-atcpit100.c
> new file mode 100644
> index 0000000..1a5538b
> --- /dev/null
> +++ b/drivers/clocksource/timer-atcpit100.c
> @@ -0,0 +1,199 @@
> +/*
> + *  Andestech ATCPIT100 Timer Device Driver Implementation
> + *
> + *  Copyright (C) 2016 Andes Technology Corporation
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + *
> + */
> +#include <linux/irq.h>
> +#include <linux/clocksource.h>
> +#include <linux/clockchips.h>
> +#include <linux/interrupt.h>
> +#include <linux/ioport.h>
> +#include <linux/cpufreq.h>
> +#include <linux/sched.h>
> +#include <linux/sched_clock.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_platform.h>
> +
> +void __iomem *base;

static

> +static u32 freq;

Please encapsulate in a structure.

With the timer_of API that will be already handled (see the init
function comment).

> +/*
> + * Definition of register offsets
> + */
> +
> +/* ID and Revision Register */
> +#define ID_REV		0x0
> +
> +/* Configuration Register */
> +#define CFG		0x10
> +
> +/* Interrupt Enable Register */
> +#define INT_EN		0x14
> +#define CH_INT_EN(c, i)	((1<<i)<<(4*c))
> +
> +/* Interrupt Status Register */
> +#define INT_STA		0x18
> +#define CH_INT_STA(c, i)	((1<<i)<<(4*c))
> +
> +/* Channel Enable Register */
> +#define CH_EN		0x1C
> +#define CH_TMR_EN(c, t)	((1<<t)<<(4*c))

Why are you redefining 3 times the same macro?

Pre-compute the results as you are only using channel 0 (and channel 1)
and these are in the hot path.


> +/* Ch n Control REgister */
> +#define CH_CTL(n)	(0x20+0x10*n)

Pre-compute.

> +/* Channel clock source , bit 3 , 0:External clock , 1:APB clock */
> +#define APB_CLK		(1<<3)

BIT(3)

> +/* Channel mode , bit 0~2 */
> +#define TMR_32		1
> +#define TMR_16		2
> +#define TMR_8		3

nit: usually use 0x1, 0x2, 0x3

> +#define PWM		4

Remove all PWM related, that ends up in drivers/pwm

> +#define CH_REL(n)	(0x24+0x10*n)
> +#define CH_CNT(n)	(0x28+0x10*n)

Pre-compute.

> +static unsigned long atcpit100_read_current_timer_down(void)
> +{
> +	return ~readl(base + CH_CNT(1));
> +}
> +
> +static u64 notrace atcpit100_read_sched_clock_down(void)
> +{
> +	return atcpit100_read_current_timer_down();
> +}
> +
> +static void atcpit100_clocksource_init(void)
> +{
> +	writel(0xffffffff, base + CH_REL(1));
> +	writel(APB_CLK|TMR_32, base + CH_CTL(1));
> +	writel(readl(base + CH_EN) | CH_TMR_EN(1, 0), base + CH_EN);

Wrap these calls into properly named functions:

eg. atcpit100_timer_disable(), atcpit100_timer_enable()



> +	clocksource_mmio_init(base + CH_CNT(1),
> +			      "atcpit100_tm1",
> +			      freq,
> +			      300, 32, clocksource_mmio_readl_down);
> +	sched_clock_register(atcpit100_read_sched_clock_down, 32, freq);
> +}
> +
> +static int atcpit100_set_next_event(unsigned long cycles,
> +		struct clock_event_device *evt)
> +{
> +	writel(cycles, base + CH_REL(0));
> +
> +	return 0;
> +}
> +
> +static int atcpit100_set_state_shutdown(struct clock_event_device *evt)
> +{
> +	writel(readl(base + CH_EN) & ~CH_TMR_EN(0, 0), base + CH_EN);
> +
> +	return 0;
> +}
> +static int atcpit100_set_state_periodic(struct clock_event_device *evt)
> +{
> +	writel(freq / HZ - 1, base + CH_CNT(0));
> +	writel(freq / HZ - 1, base + CH_REL(0));
> +	writel(readl(base + CH_EN) | CH_TMR_EN(0, 0), base + CH_EN);
> +
> +	return 0;
> +}
> +static int atcpit100_tick_resume(struct clock_event_device *evt)
> +{
> +	writel(readl(base + INT_STA) | CH_INT_STA(0, 0), base + INT_STA);
> +	writel(readl(base + CH_EN) | CH_TMR_EN(0, 0), base + CH_EN);
> +
> +	return 0;
> +}
> +static int atcpit100_set_state_oneshot(struct clock_event_device *evt)
> +{
> +	writel(0xffffffff, base + CH_REL(0));
> +	writel(readl(base + CH_EN) | CH_TMR_EN(0, 0), base + CH_EN);
> +
> +	return 0;
> +}
> +
> +static struct clock_event_device clockevent_atcpit100 = {
> +	.name		= "atcpit100_tm0",
> +	.features       = CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_PERIODIC,
> +	.shift		= 32,
> +	.cpumask	= cpu_all_mask,
> +	.set_next_event	= atcpit100_set_next_event,
> +	.set_state_shutdown = atcpit100_set_state_shutdown,
> +	.set_state_periodic = atcpit100_set_state_periodic,
> +	.set_state_oneshot = atcpit100_set_state_oneshot,
> +	.tick_resume = atcpit100_tick_resume,
> +};
> +
> +static irqreturn_t timer1_interrupt(int irq, void *dev_id)
> +{
> +	struct clock_event_device *evt = dev_id;
> +
> +	writel(readl(base + INT_STA) | CH_INT_STA(0, 0), base + INT_STA);
> +
> +	evt->event_handler(evt);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static struct irqaction timer1_irq = {
> +	.name		= "Timer Tick",
> +	.flags		= IRQF_TIMER | IRQF_IRQPOLL,
> +	.handler	= timer1_interrupt,
> +	.dev_id		= &clockevent_atcpit100
> +};
> +
> +static void __init atcpit100_clockevent_init(int irq)
> +{
> +	struct clock_event_device *evt = &clockevent_atcpit100;
> +
> +	evt->mult = div_sc(freq, NSEC_PER_SEC, evt->shift);
> +	evt->max_delta_ns = clockevent_delta2ns(0xffffffff, evt);
> +	evt->min_delta_ns = clockevent_delta2ns(3, evt);
> +	clockevents_register_device(evt);
> +	setup_irq(irq, &timer1_irq);> +}
> +
> +static int __init atcpit100_init(struct device_node *dev)
> +{
> +	int irq;
> +
> +	base = of_iomap(dev, 0);
> +	if (!base) {
> +		pr_warn("Can't remap registers");
> +		return -ENXIO;
> +	}
> +
> +	if (of_property_read_u32(dev, "clock-frequency", &freq)) {
> +		pr_warn("Can't read clock-frequency");
> +		return -EINVAL;
> +	}
> +	irq = irq_of_parse_and_map(dev, 0);
> +
> +	if (irq <= 0) {
> +		pr_warn("Failed to map timer IRQ\n");
> +		return -EINVAL;
> +	}

Please, use the timer-of API.

eg:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clocksource/sun4i_timer.c#n143

> +	pr_info("ATCPIT100 timer 1 installed on IRQ %d, with clock %d at %d HZ. in %p\n",
> +			irq, freq, HZ, base);
> +	writel(APB_CLK|TMR_32, base + CH_CTL(0));
> +	writel(readl(base + INT_EN) | CH_INT_EN(0, 0), base + INT_EN);
> +	writel(readl(base + CH_EN) | CH_TMR_EN(0, 0), base + CH_EN);

Same comment as above, wrap these calls.

> +	atcpit100_clocksource_init();
> +	atcpit100_clockevent_init(irq);
> +
> +	return 0;
> +}
> +
> +TIMER_OF_DECLARE(atcpit100, "andestech,atcpit100", atcpit100_init);


Thanks

  -- Daniel


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
