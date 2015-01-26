From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH V2] clockevents: rockchip: Add rockchip timer for
 rk3288
Date: Mon, 26 Jan 2015 10:43:07 +0100 (CET)
Message-ID: <alpine.DEB.2.11.1501261041580.5526@nanos>
References: <1422178979-12382-1-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422178979-12382-1-git-send-email-daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, 25 Jan 2015, Daniel Lezcano wrote:
> +static inline void rk_timer_set_mode(enum clock_event_mode mode,
> +				     struct clock_event_device *ce)
> +{
> +	switch (mode) {
> +	case CLOCK_EVT_MODE_PERIODIC:
> +		rk_timer_disable(ce);
> +		rk_timer_update_counter(rk_timer(ce)->freq / HZ - 1, ce);
> +		rk_timer_enable(ce, TIMER_MODE_FREE_RUNNING);

Missing break. You disable the timer again right away ...

> +	case CLOCK_EVT_MODE_ONESHOT:
> +	case CLOCK_EVT_MODE_RESUME:
> +		break;
> +	case CLOCK_EVT_MODE_UNUSED:
> +	case CLOCK_EVT_MODE_SHUTDOWN:
> +		rk_timer_disable(ce);
> +		break;
> +	}
> +}
> +
> +static irqreturn_t rk_timer_interrupt(int irq, void *dev_id)
> +{
> +	struct clock_event_device *ce = dev_id;
> +
> +	rk_timer_interrupt_clear(ce);
> +
> +	if (ce->mode == CLOCK_EVT_MODE_ONESHOT) {
> +		rk_timer_disable(ce);
> +	}

No need for the braces here.

Thanks,

	tglx
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
