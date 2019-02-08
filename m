From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v2 02/12] clocksource: davinci-timer: new driver
Date: Fri, 8 Feb 2019 18:54:12 +0530
Message-ID: <7243573a-884d-cce2-380b-1be73636fafb@ti.com>
References: <20190204171757.32073-1-brgl@bgdev.pl>
 <20190204171757.32073-3-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190204171757.32073-3-brgl@bgdev.pl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

On 04/02/19 10:47 PM, Bartosz Golaszewski wrote:

> +static unsigned int davinci_timer_read(struct davinci_timer_data *timer,
> +				       unsigned int reg)
> +{
> +	return __raw_readl(timer->base + reg);
> +}
> +
> +static void davinci_timer_write(struct davinci_timer_data *timer,
> +				unsigned int reg, unsigned int val)
> +{
> +	__raw_writel(val, timer->base + reg);
> +}

Since its a new driver, please use readl_relaxed() and writel_relaxed().

> +static void davinci_timer_init(void __iomem *base)
> +{
> +	/* Set clock to internal mode and disable it. */
> +	__raw_writel(0x0, base + DAVINCI_TIMER_REG_TCR);
> +	/*
> +	 * Reset both 32-bit timers, set no prescaler for timer 34, set the
> +	 * timer to dual 32-bit unchained mode, unreset both 32-bit timers.
> +	 */
> +	__raw_writel(DAVINCI_TIMER_TGCR_DEFAULT, base + DAVINCI_TIMER_REG_TGCR);
> +	/* Init both counters to zero. */
> +	__raw_writel(0x0, base + DAVINCI_TIMER_REG_TIM12);
> +	__raw_writel(0x0, base + DAVINCI_TIMER_REG_TIM34);

here too.

> +}
> +
> +int __init davinci_timer_register(struct clk *clk,
> +				  const struct davinci_timer_cfg *timer_cfg)
> +{

[...]

> +	clocksource = kzalloc(sizeof(*clocksource), GFP_KERNEL);
> +	if (!clocksource) {
> +		pr_err("%s: Error allocating memory for clocksource data\n",
> +		       __func__);
> +		return -ENOMEM;
> +	}
> +
> +	clocksource->dev.name = "tim34";
> +	clocksource->dev.rating = 300;
> +	clocksource->dev.read = davinci_timer_clksrc_read;
> +	clocksource->dev.mask = CLOCKSOURCE_MASK(DAVINCI_TIMER_CLKSRC_BITS);
> +	clocksource->dev.flags = CLOCK_SOURCE_IS_CONTINUOUS;
> +	clocksource->timer.set_period = davinci_timer_set_period_std;
> +	clocksource->timer.mode = DAVINCI_TIMER_MODE_PERIODIC;
> +	clocksource->timer.base = base;
> +
> +	if (timer_cfg->cmp_off)
> +		clocksource->timer.regs = &davinci_timer_tim12_regs;
> +	else
> +		clocksource->timer.regs = &davinci_timer_tim34_regs;

We should set clocksource->dev.name based on cmp_off too, otherwise it
will be confusing to have a device called "tim34" using tim12 registers.

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
> + *
> + * This is only used by da830 the DSP of which uses the top half. The timer
> + * driver still configures the top half to run in free-run mode.

This note helps. Thanks!

Regards,
Sekhar
