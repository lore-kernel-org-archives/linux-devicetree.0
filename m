From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v4 2/2] driver: clocksource: Add nxp system counter timer
 driver support
Date: Tue, 21 May 2019 12:08:16 +0200
Message-ID: <5823cd07-312b-600c-1b78-dc5bff2a12eb@linaro.org>
References: <20190521072355.12928-1-ping.bai@nxp.com>
 <20190521072355.12928-2-ping.bai@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190521072355.12928-2-ping.bai@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacky Bai <ping.bai@nxp.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On 21/05/2019 09:18, Jacky Bai wrote:
> From: Bai Ping <ping.bai@nxp.com>
> 
> The system counter (sys_ctr) is a programmable system counter
> which provides a shared time base to the Cortex A15, A7, A53 etc cores.
> It is intended for use in applications where the counter is always
> powered on and supports multiple, unrelated clocks. The sys_ctr hardware
> supports:
>  - 56-bit counter width (roll-over time greater than 40 years)

The benefit of using more than 32bits on a 32bits system is not proven.

The function to read and build the 56bits value can have a very
significant impact on the performance of your platform.

Using a 32bits counter can be enough if it does not wrap too fast.

Can you consider a 32 bits counter ?

>  - compare frame(64-bit compare value) contains programmable interrupt
>    generation when compare value <= counter value.
> 
> Signed-off-by: Bai Ping <ping.bai@nxp.com>
> ---
> change v1->v2:
>  - no change 
> change v2->v3:
>  - remove the clocksource, we only need to use this module for timer purpose,
>    so register it as clockevent is enough.
>  - use the timer_of_init to init the irq, clock, etc.
>  - remove some unnecessary comments.
> change v3->v4:
>  - use cached value for CMPCR,
>  - remove unnecessary timer enabe from set_state_oneshot function.
> ---
>  drivers/clocksource/Kconfig            |   7 ++
>  drivers/clocksource/Makefile           |   1 +
>  drivers/clocksource/timer-imx-sysctr.c | 146 +++++++++++++++++++++++++
>  3 files changed, 154 insertions(+)
>  create mode 100644 drivers/clocksource/timer-imx-sysctr.c
> 
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index 6bcaa4e2e72c..ee48620a4561 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -616,6 +616,13 @@ config CLKSRC_IMX_TPM
>  	  Enable this option to use IMX Timer/PWM Module (TPM) timer as
>  	  clocksource.
>  
> +config TIMER_IMX_SYS_CTR
> +	bool "i.MX system counter timer" if COMPILE_TEST
> +	depends on ARCH_MXC

Do you really need this dep?

> +	select TIMER_OF
> +	help
> +	  Enable this option to use i.MX system counter timer for clockevent.
> +
>  config CLKSRC_ST_LPC
>  	bool "Low power clocksource found in the LPC" if COMPILE_TEST
>  	select TIMER_OF if OF
> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
> index 236858fa7fbf..5fba39e81a40 100644
> --- a/drivers/clocksource/Makefile
> +++ b/drivers/clocksource/Makefile
> @@ -74,6 +74,7 @@ obj-$(CONFIG_CLKSRC_MIPS_GIC)		+= mips-gic-timer.o
>  obj-$(CONFIG_CLKSRC_TANGO_XTAL)		+= timer-tango-xtal.o
>  obj-$(CONFIG_CLKSRC_IMX_GPT)		+= timer-imx-gpt.o
>  obj-$(CONFIG_CLKSRC_IMX_TPM)		+= timer-imx-tpm.o
> +obj-$(CONFIG_TIMER_IMX_SYS_CTR)		+= timer-imx-sysctr.o
>  obj-$(CONFIG_ASM9260_TIMER)		+= asm9260_timer.o
>  obj-$(CONFIG_H8300_TMR8)		+= h8300_timer8.o
>  obj-$(CONFIG_H8300_TMR16)		+= h8300_timer16.o
> diff --git a/drivers/clocksource/timer-imx-sysctr.c b/drivers/clocksource/timer-imx-sysctr.c
> new file mode 100644
> index 000000000000..d0428d3189f8
> --- /dev/null
> +++ b/drivers/clocksource/timer-imx-sysctr.c
> @@ -0,0 +1,146 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +//
> +// Copyright 2017-2019 NXP
> +
> +#include <linux/interrupt.h>
> +#include <linux/clockchips.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +
> +#include "timer-of.h"
> +
> +#define CMP_OFFSET	0x10000
> +
> +#define CNTCV_LO	0x8
> +#define CNTCV_HI	0xc
> +#define CMPCV_LO	(CMP_OFFSET + 0x20)
> +#define CMPCV_HI	(CMP_OFFSET + 0x24)
> +#define CMPCR		(CMP_OFFSET + 0x2c)
> +
> +#define SYS_CTR_EN		0x1
> +#define SYS_CTR_IRQ_MASK	0x2
> +
> +static void __iomem *sys_ctr_base;
> +static u32 cmpcr;
> +
> +static void sysctr_timer_enable(bool enable)
> +{
> +	cmpcr &= ~SYS_CTR_EN;

Do the computation after reading the value in the init function...

> +	if (enable)
> +		cmpcr |= SYS_CTR_EN;

... then

writel(enable ? cmpcr | SYS_CTR_EN : cmpcr, sys_ctr_base);

> +	writel(cmpcr, sys_ctr_base + CMPCR);
> +}
> +
> +static void sysctr_irq_acknowledge(void)
> +{
> +	/*
> +	 * clear the enable bit(EN =0) will clear
> +	 * the status bit(ISTAT = 0), then the interrupt
> +	 * signal will be negated(acknowledged).
> +	 */
> +	sysctr_timer_enable(false);
> +}
> +
> +static inline u64 sysctr_read_counter(void)
> +{
> +	u32 cnt_hi, tmp_hi, cnt_lo;
> +
> +	do {
> +		cnt_hi = readl_relaxed(sys_ctr_base + CNTCV_HI);
> +		cnt_lo = readl_relaxed(sys_ctr_base + CNTCV_LO);
> +		tmp_hi = readl_relaxed(sys_ctr_base + CNTCV_HI);
> +	} while (tmp_hi != cnt_hi);
> +
> +	return  ((u64) cnt_hi << 32) | cnt_lo;
> +}
> +
> +static int sysctr_set_next_event(unsigned long delta,
> +				 struct clock_event_device *evt)
> +{
> +	u32 cmp_hi, cmp_lo;
> +	u64 next;
> +
> +	sysctr_timer_enable(false);
> +
> +	next = sysctr_read_counter();
> +
> +	next += delta;
> +
> +	cmp_hi = (next >> 32) & 0x00fffff;
> +	cmp_lo = next & 0xffffffff;
> +
> +	writel_relaxed(cmp_hi, sys_ctr_base + CMPCV_HI);
> +	writel_relaxed(cmp_lo, sys_ctr_base + CMPCV_LO);
> +
> +	sysctr_timer_enable(true);
> +
> +	return 0;
> +}
> +
> +static int sysctr_set_state_oneshot(struct clock_event_device *evt)
> +{
> +	return 0;
> +}
> +
> +static int sysctr_set_state_shutdown(struct clock_event_device *evt)
> +{
> +	sysctr_timer_enable(false);
> +
> +	return 0;
> +}
> +
> +static irqreturn_t sysctr_timer_interrupt(int irq, void *dev_id)
> +{
> +	struct clock_event_device *evt = dev_id;
> +
> +	sysctr_irq_acknowledge();
> +
> +	evt->event_handler(evt);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static struct timer_of to_sysctr = {
> +	.flags = TIMER_OF_IRQ | TIMER_OF_CLOCK | TIMER_OF_BASE,
> +	.clkevt = {
> +		.name			= "i.MX system counter timer",
> +		.features		= CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_DYNIRQ,
> +		.set_state_oneshot	= sysctr_set_state_oneshot,
> +		.set_next_event		= sysctr_set_next_event,
> +		.set_state_shutdown	= sysctr_set_state_shutdown,
> +		.rating			= 200,
> +	},
> +	.of_irq = {
> +		.handler		= sysctr_timer_interrupt,
> +		.flags			= IRQF_TIMER | IRQF_IRQPOLL,
> +	},
> +	.of_clk = {
> +		.name = "per",
> +	},
> +};
> +
> +static void __init sysctr_clockevent_init(void)
> +{
> +	to_sysctr.clkevt.cpumask = cpumask_of(0);
> +
> +	clockevents_config_and_register(&to_sysctr.clkevt, timer_of_rate(&to_sysctr),
> +					0xff, 0x7fffffff);
> +}
> +
> +static int __init sysctr_timer_init(struct device_node *np)
> +{
> +	int ret = 0;
> +
> +	ret = timer_of_init(np, &to_sysctr);
> +	if (ret)
> +		return ret;
> +
> +	sys_ctr_base = timer_of_base(&to_sysctr);
> +	cmpcr = readl(sys_ctr_base + CMPCR);
> +
> +	sysctr_clockevent_init();
> +
> +	return 0;
> +}
> +TIMER_OF_DECLARE(sysctr_timer, "nxp,sysctr-timer", sysctr_timer_init);
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
