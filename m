From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v5 1/6] clocksource: Add support for the Mediatek SoCs
Date: Fri, 23 May 2014 19:39:24 +0200
Message-ID: <537F87CC.7090705@linaro.org>
References: <1400689583-21119-1-git-send-email-matthias.bgg@gmail.com> <1400689583-21119-2-git-send-email-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1400689583-21119-2-git-send-email-matthias.bgg@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rdunlap@infradead.org, linux@arm.linux.org.uk, tglx@linutronix.de, thierry.reding@gmail.com, florian.vaussard@epfl.ch, jic23@kernel.org, jason@lakedaemon.net, andrew@lunn.ch, silvio.fricke@gmail.com, heiko.stuebner@bq.com, olof@lixom.net, sebastian.hesselbarth@gmail.com, sboyd@codeaurora.org, gregory.clement@free-electrons.com, arnd@arndb.de, robherring2@gmail.com, marc.zyngier@arm.com, maxime.ripard@free-electrons.com, soren.brinkmann@xilinx.com, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 05/21/2014 06:26 PM, Matthias Brugger wrote:
> This patch adds a clock source and clock event for the timer found
> on the Mediatek SoCs.
>
> The Mediatek General Porpose Timer block provides five 32 bit timers =
and

s/Porpose/Purpose

> one 64 bit timer.
>
> Two 32 bit timers are used:
> TIMER1: clock events supporting periodic and oneshot events
> TIMER2: clock source configured as a free running counter
>
> The General Porpose Timer block can be run with two clocks. A 13 MHz =
system

s/Porpose/Purpose

> clock and the RTC clock running at 32 KHz. This implementation uses t=
he system
> clock.

As it is a new driver, could you elaborate a bit the description of thi=
s=20
driver please ? Behavior, some oddities, etc ...

> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>   drivers/clocksource/Kconfig     |   4 +
>   drivers/clocksource/Makefile    |   1 +
>   drivers/clocksource/mtk_timer.c | 263 +++++++++++++++++++++++++++++=
+++++++++++
>   3 files changed, 268 insertions(+)
>   create mode 100644 drivers/clocksource/mtk_timer.c
>
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfi=
g
> index 96918e1..1f73740 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -144,6 +144,10 @@ config VF_PIT_TIMER
>   config SYS_SUPPORTS_SH_CMT
>           bool
>
> +config MTK_TIMER
> +	select CLKSRC_MMIO
> +	bool
> +
>   config SYS_SUPPORTS_SH_MTU2
>           bool
>
> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makef=
ile
> index 98cb6c5..619d302 100644
> --- a/drivers/clocksource/Makefile
> +++ b/drivers/clocksource/Makefile
> @@ -33,6 +33,7 @@ obj-$(CONFIG_CLKSRC_EXYNOS_MCT)	+=3D exynos_mct.o
>   obj-$(CONFIG_CLKSRC_SAMSUNG_PWM)	+=3D samsung_pwm_timer.o
>   obj-$(CONFIG_VF_PIT_TIMER)	+=3D vf_pit_timer.o
>   obj-$(CONFIG_CLKSRC_QCOM)	+=3D qcom-timer.o
> +obj-$(CONFIG_MTK_TIMER)		+=3D mtk_timer.o
>
>   obj-$(CONFIG_ARM_ARCH_TIMER)		+=3D arm_arch_timer.o
>   obj-$(CONFIG_ARM_GLOBAL_TIMER)		+=3D arm_global_timer.o
> diff --git a/drivers/clocksource/mtk_timer.c b/drivers/clocksource/mt=
k_timer.c
> new file mode 100644
> index 0000000..f86b5080
> --- /dev/null
> +++ b/drivers/clocksource/mtk_timer.c
> @@ -0,0 +1,263 @@
> +/*
> + * Mediatek SoCs General-Purpose Timer handling.
> + *
> + * Copyright (C) 2014 Matthias Brugger
> + *
> + * Matthias Brugger <matthias.bgg@gmail.com>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clockchips.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/irqreturn.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/slab.h>
> +
> +#define GPT_IRQ_EN_REG		0x00
> +#define GPT_IRQ_ENABLE(val)	BIT(val-1)
> +#define GPT_IRQ_ST_REG		0x04
> +#define GPT_IRQ_ACK_REG		0x08
> +#define GPT_IRQ_ACK(val)	BIT(val-1)
> +
> +#define TIMER_CTRL_REG(val)	(0x10 * val)
> +#define TIMER_CTRL_OP(val)	(((val) & 0x3) << 4)
> +#define TIMER_CTRL_OP_ONESHOT	(0)
> +#define TIMER_CTRL_OP_REPEAT	(1)
> +#define TIMER_CTRL_OP_KEEPGO	(2)
> +#define TIMER_CTRL_OP_FREERUN	(3)
> +#define TIMER_CTRL_CLEAR	(2)
> +#define TIMER_CTRL_ENABLE	(1)
> +#define TIMER_CTRL_DISABLE	(0)
> +
> +#define TIMER_CLK_REG(val)	(0x04 + (0x10 * val))
> +#define TIMER_CLK_SRC(val)	(((val) & 0x1) << 4)
> +#define TIMER_CLK_SRC_SYS13M	(0)
> +#define TIMER_CLK_SRC_RTC32K	(1)
> +#define TIMER_CLK_DIV1		(0x0)
> +#define TIMER_CLK_DIV2		(0x1)
> +#define TIMER_CLK_DIV3		(0x2)
> +#define TIMER_CLK_DIV4		(0x3)
> +#define TIMER_CLK_DIV5		(0x4)
> +#define TIMER_CLK_DIV6		(0x5)
> +#define TIMER_CLK_DIV7		(0x6)
> +#define TIMER_CLK_DIV8		(0x7)
> +#define TIMER_CLK_DIV9		(0x8)
> +#define TIMER_CLK_DIV10		(0x9)
> +#define TIMER_CLK_DIV11		(0xA)
> +#define TIMER_CLK_DIV12		(0xB)
> +#define TIMER_CLK_DIV13		(0xC)
> +#define TIMER_CLK_DIV16		(0xD)
> +#define TIMER_CLK_DIV32		(0xE)
> +#define TIMER_CLK_DIV64		(0xF)
> +
> +#define TIMER_CNT_REG(val)	(0x08 + (0x10 * val))
> +#define TIMER_CMP_REG(val)	(0x0C + (0x10 * val))

Please remove unused macros.

> +
> +#define GPT_CLK_EVT	1
> +#define GPT_CLK_SRC	2
> +
> +
> +

extra lines.

> +struct mtk_clock_event_device {
> +	void __iomem *gpt_base;
> +	u32 ticks_per_jiffy;
> +	struct clock_event_device dev;
> +};
> +
> +static inline struct mtk_clock_event_device *to_mtk_clk(
> +				struct clock_event_device *c)
> +{
> +	return container_of(c, struct mtk_clock_event_device, dev);
> +}
> +
> +static void mtk_clkevt_time_stop(struct mtk_clock_event_device *evt,=
 u8 timer)
> +{
> +	u32 val =3D readl(evt->gpt_base + TIMER_CTRL_REG(timer));
> +	writel(val & ~TIMER_CTRL_ENABLE, evt->gpt_base +
> +			TIMER_CTRL_REG(timer));
> +}
> +
> +static void mtk_clkevt_time_setup(struct mtk_clock_event_device *evt=
,
> +				unsigned long delay, u8 timer)
> +{
> +	writel(delay, evt->gpt_base + TIMER_CMP_REG(timer));
> +}
> +
> +static void mtk_clkevt_time_start(struct mtk_clock_event_device *evt=
,
> +		bool periodic, u8 timer)
> +{
> +	u32 val;
> +
> +	/* Acknowledge interrupt */
> +	writel(GPT_IRQ_ACK(timer), evt->gpt_base + GPT_IRQ_ACK_REG);
> +
> +	val =3D readl(evt->gpt_base + TIMER_CTRL_REG(timer));
> +
> +	/* Clear 2 bit timer operation mode field */
> +	val &=3D ~TIMER_CTRL_OP(0x3);
> +
> +	if (periodic)
> +		val |=3D TIMER_CTRL_OP(TIMER_CTRL_OP_REPEAT);
> +	else
> +		val |=3D TIMER_CTRL_OP(TIMER_CTRL_OP_ONESHOT);
> +
> +	writel(val | TIMER_CTRL_ENABLE | TIMER_CTRL_CLEAR,
> +	       evt->gpt_base + TIMER_CTRL_REG(timer));
> +}
> +
> +static void mtk_clkevt_mode(enum clock_event_mode mode,
> +				struct clock_event_device *clk)
> +{
> +	struct mtk_clock_event_device *evt =3D to_mtk_clk(clk);
> +
> +	mtk_clkevt_time_stop(evt, GPT_CLK_EVT);
> +
> +	switch (mode) {
> +	case CLOCK_EVT_MODE_PERIODIC:
> +		mtk_clkevt_time_setup(evt, evt->ticks_per_jiffy, GPT_CLK_EVT);
> +		mtk_clkevt_time_start(evt, true, GPT_CLK_EVT);
> +		break;
> +	case CLOCK_EVT_MODE_ONESHOT:
> +		mtk_clkevt_time_start(evt, false, GPT_CLK_EVT);
> +		break;
> +	case CLOCK_EVT_MODE_UNUSED:
> +	case CLOCK_EVT_MODE_SHUTDOWN:
> +	default:
> +		/* No more interrupts will occur as source is disabled */
> +		break;
> +	}
> +}
> +
> +static int mtk_clkevt_next_event(unsigned long event,
> +				   struct clock_event_device *clk)
> +{
> +	struct mtk_clock_event_device *evt =3D to_mtk_clk(clk);
> +
> +	mtk_clkevt_time_stop(evt, GPT_CLK_EVT);
> +	mtk_clkevt_time_setup(evt, event, GPT_CLK_EVT);
> +	mtk_clkevt_time_start(evt, false, GPT_CLK_EVT);
> +
> +	return 0;
> +}
> +
> +static irqreturn_t mtk_timer_interrupt(int irq, void *dev_id)
> +{
> +	struct mtk_clock_event_device *evt =3D dev_id;
> +
> +	/* Acknowledge timer0 irq */
> +	writel(GPT_IRQ_ACK(GPT_CLK_EVT), evt->gpt_base + GPT_IRQ_ACK_REG);
> +	evt->dev.event_handler(&evt->dev);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void mtk_timer_global_reset(struct mtk_clock_event_device *ev=
t)
> +{
> +	/* Disable all interrupts */
> +	writel(0x0, evt->gpt_base + GPT_IRQ_EN_REG);
> +	/* Acknowledge all interrupts */
> +	writel(0x3f, evt->gpt_base + GPT_IRQ_ACK_REG);
> +}
> +
> +static void mtk_timer_reset(struct mtk_clock_event_device *evt, u8 t=
imer)
> +{
> +	writel(TIMER_CTRL_CLEAR | TIMER_CTRL_DISABLE,
> +		evt->gpt_base + TIMER_CTRL_REG(timer));
> +	writel(0x0, evt->gpt_base + TIMER_CMP_REG(timer));
> +}
> +
> +static void __init mtk_timer_init(struct device_node *node)
> +{
> +	struct mtk_clock_event_device *evt;
> +	struct resource res;
> +	unsigned long rate =3D 0;
> +	struct clk *clk;
> +	int ret;
> +	u32 val;
> +
> +	evt =3D kzalloc(sizeof(*evt), GFP_KERNEL);
> +	if (!evt)
> +		panic("Can't allocate mtk clock event driver struct");
> +
> +	evt->dev.name =3D "mtk_tick";
> +	evt->dev.rating =3D 300;
> +	evt->dev.features =3D CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONES=
HOT;
> +	evt->dev.set_mode =3D mtk_clkevt_mode;
> +	evt->dev.set_next_event =3D mtk_clkevt_next_event;
> +	evt->dev.cpumask =3D cpu_possible_mask;
> +
> +	if (of_address_to_resource(node, 0, &res))
> +		panic("Failed to parse resource\n");
> +
> +	if (!request_mem_region(res.start, resource_size(&res), "mtk-timer"=
))
> +		panic("Registers are a busy IO resource");
> +
> +	evt->gpt_base =3D ioremap(res.start, resource_size(&res));
> +	if (!evt->gpt_base)
> +		panic("Can't map registers");
> +
> +	evt->dev.irq =3D irq_of_parse_and_map(node, 0);
> +	if (evt->dev.irq <=3D 0)
> +		panic("Can't parse IRQ");
> +
> +	clk =3D of_clk_get(node, 0);
> +	if (IS_ERR(clk))
> +		panic("Can't get timer clock");
> +
> +	clk_prepare_enable(clk);
> +	rate =3D clk_get_rate(clk);
> +
> +	mtk_timer_global_reset(evt);
> +
> +	/* Configure clock source */
> +	mtk_timer_reset(evt, GPT_CLK_SRC);
> +
> +	writel(TIMER_CLK_SRC(TIMER_CLK_SRC_SYS13M) | TIMER_CLK_DIV1,
> +			evt->gpt_base + TIMER_CLK_REG(GPT_CLK_SRC));
> +
> +	writel(TIMER_CTRL_OP(TIMER_CTRL_OP_FREERUN) | TIMER_CTRL_ENABLE,
> +			evt->gpt_base + TIMER_CTRL_REG(GPT_CLK_SRC));
> +
> +	clocksource_mmio_init(evt->gpt_base + TIMER_CNT_REG(GPT_CLK_SRC),
> +			node->name, rate, 300, 32, clocksource_mmio_readl_up);
> +
> +	evt->ticks_per_jiffy =3D DIV_ROUND_UP(rate, HZ);
> +
> +	/* Configure clock event */
> +	mtk_timer_reset(evt, GPT_CLK_EVT);
> +
> +	writel(TIMER_CLK_SRC(TIMER_CLK_SRC_SYS13M) | TIMER_CLK_DIV1,
> +			evt->gpt_base + TIMER_CLK_REG(GPT_CLK_EVT));
> +	writel(0, evt->gpt_base + TIMER_CMP_REG(GPT_CLK_EVT));
> +
> +	writel(TIMER_CTRL_OP(TIMER_CTRL_OP_REPEAT) | TIMER_CTRL_ENABLE,
> +			evt->gpt_base + TIMER_CTRL_REG(GPT_CLK_EVT));
> +
> +	ret =3D request_irq(evt->dev.irq, mtk_timer_interrupt,
> +			IRQF_TIMER | IRQF_IRQPOLL, "mtk_timer", evt);
> +	if (ret)
> +		pr_warn("failed to setup irq %d\n", evt->dev.irq);
> +
> +	/* Enable timer0 interrupt */
> +	val =3D readl(evt->gpt_base + GPT_IRQ_EN_REG);
> +	writel(val | GPT_IRQ_ENABLE(GPT_CLK_EVT),
> +			evt->gpt_base + GPT_IRQ_EN_REG);

Could you encapsulate in well named functions the different 'writel' ab=
ove ?

> +	clockevents_config_and_register(&evt->dev, rate, 0x3,
> +					0xffffffff);
> +}
> +CLOCKSOURCE_OF_DECLARE(mtk_mt6589, "mediatek,mtk6577-timer", mtk_tim=
er_init);
> +
>


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

