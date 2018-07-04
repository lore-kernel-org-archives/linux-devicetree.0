From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v5 5/5] clocksource/drivers/timer-mediatek: Add support
 for system timer
Date: Wed, 4 Jul 2018 11:27:53 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1807041108110.1816@nanos.tec.linutronix.de>
References: <1530669383-17516-1-git-send-email-stanley.chu@mediatek.com> <1530669383-17516-6-git-send-email-stanley.chu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1530669383-17516-6-git-send-email-stanley.chu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stanley Chu <stanley.chu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On Wed, 4 Jul 2018, Stanley Chu wrote:
> +/* system timer */
> +#define SYST_CON                (0x0)
> +#define SYST_VAL                (0x4)
> +
> +#define SYST_CON_REG(to)        (timer_of_base(to) + SYST_CON)
> +#define SYST_VAL_REG(to)        (timer_of_base(to) + SYST_VAL)
> +
> +#define SYST_CON_EN              BIT(0)
> +#define SYST_CON_IRQ_EN          BIT(1)
> +#define SYST_CON_IRQ_CLR         BIT(4)
> +
> +static void __iomem *gpt_sched_reg __read_mostly;
> +
> +static void mtk_syst_reset(struct timer_of *to)
> +{
> +	/* clear and disable interrupt */
> +	writel(SYST_CON_IRQ_CLR | SYST_CON_EN, SYST_CON_REG(to));
> +
> +	/* reset counter */
> +	writel(0, SYST_VAL_REG(to));
> +
> +	/* disable timer */
> +	writel(0, SYST_CON_REG(to));

Not having any insight into the inner workings of that hardware. This
sequence does not make any sense.

You first clear and disable the interrupt, but leave the counter
running. Then you reset the counter and _after_ that you disable the
timer.

Is that a workaround for yet another completely misdesigned piece of timer
hardware or is it just the software implementation which makes no sense?

If it's a workaround for HW stupidity then you really want to document it
proper.

If not then, what's wrong with doing the obvious:
{
	writel(SYST_CON_IRQ_CLR, SYST_CON_REG(to));
}

which clears the interrupt and disables the timer in one go. Writing the
counter is not required at all because the next_event() function will write
it again and the counter value is irrelevant once the timer is disabled.

> +static void mtk_syst_ack_irq(struct timer_of *to)
> +{
> +	mtk_syst_reset(to);
> +}
> +
> +static irqreturn_t mtk_syst_handler(int irq, void *dev_id)
> +{
> +	struct clock_event_device *clkevt = (struct clock_event_device *)dev_id;

No type casts from and to void. They are completely pointless.

> +	struct timer_of *to = to_timer_of(clkevt);
> +
> +	mtk_syst_ack_irq(to);

So you do the full dance here.

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
> +	/*
> +	 * reset timer first because we do not expect interrupt is triggered
> +	 * by old compare value.
> +	 */
> +	mtk_syst_reset(to);

And here, which gets called through the event_handler.

> +
> +	writel(SYST_CON_EN, SYST_CON_REG(to));

Why are you enabling the timer _before_ setting the new counter value? This
does not make any sense at least not w/o a comment explaining WHY this
needs to be so convoluted.

> +	writel(ticks, SYST_VAL_REG(to));
> +
> +	writel(SYST_CON_EN | SYST_CON_IRQ_EN, SYST_CON_REG(to));

With a sane hardware implementation the whole thing can be boiled down to:

{
	writel(ticks, SYST_VAL_REG(to));
	writel(SYST_CON_EN | SYST_CON_IRQ_EN, SYST_CON_REG(to));
}

There is no need to do the whole reset thing, unless the hardware is
broken. Either you manage to overwrite the timer in time or not. The extra
work of writing the control register before that is a cosmetic 'makes me
feel' good hack, which just makes the normal case slower. If you have an
occasional spurious interrupt, fine, but you can get them anyway.

Thanks,

	tglx
