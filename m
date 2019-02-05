From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v2 02/12] clocksource: davinci-timer: new driver
Date: Mon, 4 Feb 2019 20:13:07 -0600
Message-ID: <b9291955-ec2d-a83b-00e3-457e8fb54874@lechnology.com>
References: <20190204171757.32073-1-brgl@bgdev.pl>
 <20190204171757.32073-3-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190204171757.32073-3-brgl@bgdev.pl>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

On 2/4/19 11:17 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Currently the clocksource and clockevent support for davinci platforms
> lives in mach-davinci. It hard-codes many things, used global variables,
> implements functionalities unused by any platform and has code fragments
> scattered across many (often unrelated) files.
> 
> Implement a new, modern and simplified timer driver and put it into
> drivers/clocksource. We still need to support legacy board files so
> export a config structure and a function that allows machine code to
> register the timer.
> 
> We don't bother freeing resources on errors in davinci_timer_register()
> as the system won't boot without a timer anyway.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---

...

> diff --git a/drivers/clocksource/timer-davinci.c b/drivers/clocksource/timer-davinci.c
> new file mode 100644
> index 000000000000..a6d2d3f6526e
> --- /dev/null
> +++ b/drivers/clocksource/timer-davinci.c
> @@ -0,0 +1,431 @@
> +// SPDX-License-Identifier: GPL-2.0

GPL-2.0-only ?

> +//
> +// TI DaVinci clocksource driver
> +//
> +// Copyright (C) 2019 Texas Instruments
> +// Author: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> +// (with some parts adopted from code by Kevin Hilman <khilman@baylibre.com>)
> +
> +#include <linux/clk.h>
> +#include <linux/clockchips.h>
> +#include <linux/clocksource.h>
> +#include <linux/err.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/sched_clock.h>
> +
> +#include <clocksource/timer-davinci.h>
> +
> +#define DAVINCI_TIMER_REG_TIM12			0x10
> +#define DAVINCI_TIMER_REG_TIM34			0x14
> +#define DAVINCI_TIMER_REG_PRD12			0x18
> +#define DAVINCI_TIMER_REG_PRD34			0x1c
> +#define DAVINCI_TIMER_REG_TCR			0x20
> +#define DAVINCI_TIMER_REG_TGCR			0x24
> +
> +#define DAVINCI_TIMER_TIMMODE_MASK		GENMASK(3, 2)
> +#define DAVINCI_TIMER_RESET_MASK		GENMASK(1, 0)
> +#define DAVINCI_TIMER_TIMMODE_32BIT_UNCHAINED	BIT(2)
> +#define DAVINCI_TIMER_UNRESET			GENMASK(1, 0)
> +
> +/* Shift depends on timer. */
> +#define DAVINCI_TIMER_ENAMODE_MASK		GENMASK(1, 0)


> +#define DAVINCI_TIMER_ENAMODE_DISABLED		0x00
> +#define DAVINCI_TIMER_ENAMODE_ONESHOT		BIT(0)
> +#define DAVINCI_TIMER_ENAMODE_PERIODIC		BIT(1)

Are these 3 values essentially an enum of exclusive values?
If so, the the BIT() macro doesn't seem right here. If they
are flags, then BIT() is OK, but DAVINCI_TIMER_ENAMODE_DISABLED
could be omitted.

> +
> +#define DAVINCI_TIMER_ENAMODE_SHIFT_TIM12	6
> +#define DAVINCI_TIMER_ENAMODE_SHIFT_TIM34	22
> +
> +#define DAVINCI_TIMER_MIN_DELTA			0x01
> +#define DAVINCI_TIMER_MAX_DELTA			0xfffffffe
> +
> +#define DAVINCI_TIMER_CLKSRC_BITS		32
> +
> +#define DAVINCI_TIMER_TGCR_DEFAULT \
> +		(DAVINCI_TIMER_TIMMODE_32BIT_UNCHAINED | DAVINCI_TIMER_UNRESET)
> +
> +enum {
> +	DAVINCI_TIMER_MODE_DISABLED = 0,
> +	DAVINCI_TIMER_MODE_ONESHOT,
> +	DAVINCI_TIMER_MODE_PERIODIC,
> +};
> +
> +struct davinci_timer_data;
> +
> +typedef void (*davinci_timer_set_period_func)(struct davinci_timer_data *,
> +					      unsigned int period);
> +
> +struct davinci_timer_regs {
> +	unsigned int tim_off;> +	unsigned int prd_off;

It is not obvious to me what the abbreviations tim and prd
mean. Add comments or change the names?

> +	unsigned int enamode_shift;
> +};
> +

...

> +static void davinci_timer_update(struct davinci_timer_data *timer,
> +				 unsigned int reg, unsigned int mask,
> +				 unsigned int val)
> +{
> +	unsigned int new, orig = davinci_timer_read(timer, reg);

Slightly more readable with function not in variable declaration?

> +
> +	new = orig & ~mask;
> +	new |= val & mask;
> +
> +	davinci_timer_write(timer, reg, new);
> +}

...

> +int __init davinci_timer_register(struct clk *clk,
> +				  const struct davinci_timer_cfg *timer_cfg)
> +{
> +	struct davinci_timer_clocksource *clocksource;
> +	struct davinci_timer_clockevent *clockevent;
> +	void __iomem *base;
> +	int rv;
> +
> +	rv = clk_prepare_enable(clk);
> +	if (rv) {
> +		pr_err("%s: Unable to prepare and enable the timer clock\n",

use pr_fmt marco to simplify? e.g. at the top of the file...

#define pr_fmt(fmt)    "%s: " fmt "\n", __func__

Then just

		pr_err("Unable to prepare and enable the timer clock");


> +		       __func__);
> +		return rv;
> +	}

...

> diff --git a/include/clocksource/timer-davinci.h b/include/clocksource/timer-davinci.h
> new file mode 100644
> index 000000000000..ef1de78a1820
> --- /dev/null
> +++ b/include/clocksource/timer-davinci.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */

Seems odd to have the header GPL-2.0+ when the c file GPL-2.0-only

> +/*
> + * TI DaVinci clocksource driver
> + *
> + * Copyright (C) 2019 Texas Instruments
> + * Author: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> + */
> +
> +#ifndef __TIMER_DAVINCI_H__
> +#define __TIMER_DAVINCI_H__
> +
> +#include <linux/clk.h>
> +#include <linux/ioport.h>
> +
> +enum {
> +	DAVINCI_TIMER_CLOCKEVENT_IRQ = 0,

Isn't = 0 implied, so can be omitted?

> +	DAVINCI_TIMER_CLOCKSOURCE_IRQ,
> +	DAVINCI_TIMER_NUM_IRQS,
> +};
> +
> +/**
> + * struct davinci_timer_cfg - davinci clocksource driver configuration struct
> + * @reg:        register range resource
> + * @irq:        clockevent and clocksource interrupt resources
> + * @cmp_off:    if set - it specifies the compare register used for clockevent
> + *
> + * Note: if the compare register is specified, the driver will use the bottom
> + * clock half for both clocksource and clockevent and the compare register
> + * to generate event irqs. The user must supply the correct compare register
> + * interrupt number.

I'm a little confused by this comment. I think I get it, but it took me a while.

If cmp_off is 0, we don't use the compare register and therefore
DAVINCI_TIMER_CLOCKEVENT_IRQ and DAVINCI_TIMER_CLOCKSOURCE_IRQ should
be TINT12 and TINT34 (or vice versa?). If cmp_off is non-zero, then
it should be one of the 8 (more or less depending on the SoC) and
DAVINCI_TIMER_CLOCKEVENT_IRQ should be something like T12CMPINT0.

> + *
> + * This is only used by da830 the DSP of which uses the top half. The timer
> + * driver still configures the top half to run in free-run mode.
> + */
> +struct davinci_timer_cfg {
> +	struct resource reg;
> +	struct resource irq[DAVINCI_TIMER_NUM_IRQS];
> +	unsigned int cmp_off;
> +};
> +
> +int __init davinci_timer_register(struct clk *clk,
> +				  const struct davinci_timer_cfg *data);
> +
> +#endif /* __TIMER_DAVINCI_H__ */
> 
