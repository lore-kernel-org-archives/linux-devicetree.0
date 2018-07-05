From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v6 5/5] clocksource/drivers/timer-mediatek: Add support
 for system timer
Date: Thu, 5 Jul 2018 02:13:01 +0200
Message-ID: <2cb9177c-0586-4432-94a2-df46fe64cc3b@linaro.org>
References: <1530715820-3406-1-git-send-email-stanley.chu@mediatek.com>
 <1530715820-3406-6-git-send-email-stanley.chu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1530715820-3406-6-git-send-email-stanley.chu@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stanley Chu <stanley.chu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On 04/07/2018 16:50, Stanley Chu wrote:
> This patch adds a new "System Timer" on the Mediatek SoCs.
> 
> The System Timer is introduced as an always-on timer being
> clockevent device for tick-broadcasting.
> 
> For clock, it is driven by 13 MHz system clock.
> The implementation uses the system clock with no clock
> source divider.
> 
> For interrupt, the clock event timer can be used by all cores.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>  drivers/clocksource/timer-mediatek.c |  110 +++++++++++++++++++++++++++++++++-
>  1 file changed, 109 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
> index e57c4d7..e98244a 100644
> --- a/drivers/clocksource/timer-mediatek.c
> +++ b/drivers/clocksource/timer-mediatek.c
> @@ -58,6 +58,86 @@
>  
>  static void __iomem *gpt_sched_reg __read_mostly;
>  
> +/* system timer */
> +#define SYST_BASE               (0x40)
> +
> +#define SYST_CON                (SYST_BASE + 0x0)
> +#define SYST_VAL                (SYST_BASE + 0x4)
> +
> +#define SYST_CON_REG(to)        (timer_of_base(to) + SYST_CON)
> +#define SYST_VAL_REG(to)        (timer_of_base(to) + SYST_VAL)
> +
> +/*
> + * SYST_CON_EN: Clock enable. Shall be set to
> + *   - Start timer countdown.
> + *   - Allow timeout ticks being updated.
> + *   - Allow changing interrupt functions.
> + *
> + * SYST_CON_IRQ_EN: Set to allow interrupt.
> + *
> + * SYST_CON_IRQ_CLR: Set to clear interrupt.
> + */
> +#define SYST_CON_EN              BIT(0)
> +#define SYST_CON_IRQ_EN          BIT(1)
> +#define SYST_CON_IRQ_CLR         BIT(4)
> +
> +static void __iomem *gpt_sched_reg __read_mostly;

duplicate 'gpt_sched_reg' variable.


> +static void mtk_syst_ack_irq(struct timer_of *to)
> +{
> +	/* Clear and disable interrupt */
> +	writel(SYST_CON_IRQ_CLR | SYST_CON_EN, SYST_CON_REG(to));
> +}
> +
> +static irqreturn_t mtk_syst_handler(int irq, void *dev_id)
> +{
> +	struct clock_event_device *clkevt = dev_id;
> +	struct timer_of *to = to_timer_of(clkevt);
> +
> +	mtk_syst_ack_irq(to);
> +	clkevt->event_handler(clkevt);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int mtk_syst_clkevt_next_event(unsigned long ticks,
> +				      struct clock_event_device *clkevt)
> +{
> +	struct timer_of *to = to_timer_of(clkevt);
> +
> +	/* Enable clock to allow timeout tick update later */
> +	writel(SYST_CON_EN, SYST_CON_REG(to));
> +
> +	/*
> +	 * Write new timeout ticks. Timer shall start countdown
> +	 * after timeout ticks are updated.
> +	 */
> +	writel(ticks, SYST_VAL_REG(to));
> +
> +	/* Enable interrupt */
> +	writel(SYST_CON_EN | SYST_CON_IRQ_EN, SYST_CON_REG(to));
> +
> +	return 0;
> +}
> +
> +static int mtk_syst_clkevt_shutdown(struct clock_event_device *clkevt)
> +{
> +	/* Disable timer */
> +	writel(0, SYST_CON_REG(to_timer_of(clkevt)));
> +
> +	return 0;
> +}
> +
> +static int mtk_syst_clkevt_resume(struct clock_event_device *clkevt)
> +{
> +	return mtk_syst_clkevt_shutdown(clkevt);
> +}
> +
> +static int mtk_syst_clkevt_oneshot(struct clock_event_device *clkevt)
> +{
> +	return 0;
> +}
> +
>  static u64 notrace mtk_gpt_read_sched_clock(void)
>  {
>  	return readl_relaxed(gpt_sched_reg);
> @@ -186,6 +266,34 @@ static void mtk_gpt_enable_irq(struct timer_of *to, u8 timer)
>  	},
>  };
>  
> +static int __init mtk_syst_init(struct device_node *node)
> +{
> +	int ret;
> +
> +	to.clkevt.features = CLOCK_EVT_FEAT_DYNIRQ | CLOCK_EVT_FEAT_ONESHOT;
> +	to.clkevt.set_state_shutdown = mtk_syst_clkevt_shutdown;
> +	to.clkevt.set_state_oneshot = mtk_syst_clkevt_oneshot;
> +	to.clkevt.tick_resume = mtk_syst_clkevt_resume;
> +	to.clkevt.set_next_event = mtk_syst_clkevt_next_event;
> +	to.of_irq.handler = mtk_syst_handler;
> +
> +	ret = timer_of_init(node, &to);
> +	if (ret)
> +		goto err;
> +
> +	clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
> +					TIMER_SYNC_TICKS, 0xffffffff);
> +
> +	pr_info("irq=%d, rate=%lu, max_ns: %llu, min_ns: %llu\n",
> +		timer_of_irq(&to), timer_of_rate(&to),
> +		to.clkevt.max_delta_ns, to.clkevt.min_delta_ns);

Please remove this trace. Most of this information is already available
in /proc/timer_list.

However, if you think it is worth to add this trace, do a proposition in
the time framework directly so all drivers can benefit this change.

> +	return 0;
> +err:
> +	timer_of_cleanup(&to);
> +	return ret;
> +}
> +
>  static int __init mtk_gpt_init(struct device_node *node)
>  {
>  	int ret;
> @@ -218,9 +326,9 @@ static int __init mtk_gpt_init(struct device_node *node)
>  	mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
>  
>  	return 0;
> -
>  err:
>  	timer_of_cleanup(&to);
>  	return ret;
>  }
>  TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_gpt_init);
> +TIMER_OF_DECLARE(mtk_mt6765, "mediatek,mt6765-timer", mtk_syst_init);
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
