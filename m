From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH v6 4/5] clocksource: stm32: add clocksource support
Date: Wed, 18 Oct 2017 20:59:11 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1710182036070.2477@nanos>
References: <1508331506-23782-1-git-send-email-benjamin.gaignard@linaro.org> <1508331506-23782-5-git-send-email-benjamin.gaignard@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1508331506-23782-5-git-send-email-benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ludovic.barre-qxv4g6HH51o@public.gmane.org, julien.thierry-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 18 Oct 2017, Benjamin Gaignard wrote:

> Rework driver code to be able to implement clocksource and clockevent
> on the same hardware block.
> Before this patch only the counter of the hardware block was used to
> generate clock events. Now counter will be used to provide a 32 bits
> clock source and a comparator will provide clock events.

Again. Read, understand and comply with the patch submission
documentation. Proper changelogs are not optional.

"Before this patch ...." is bogus because it suggests that the patch is
already applied which is obviously not the case.

Let me give you an example.

  The stm32 timer hardware is currently only used as a clock event device,
  but it can be utilized as a clocksource as well.

  Implement this by enabling the free running counter in the hardware block
  and converting the clock event part from a count down event timer to a
  comparator based timer.

Can you see the difference?

> -static int stm32_clock_event_set_periodic(struct clock_event_device *evt)
> +static int stm32_clock_event_set_next_event(unsigned long evt,
> +					    struct clock_event_device *clkevt)
>  {
> -	struct timer_of *to = to_timer_of(evt);
> +	struct timer_of *to = to_timer_of(clkevt);
> +	unsigned long cnt;
>  
> -	writel_relaxed(timer_of_period(to), timer_of_base(to) + TIM_ARR);
> -	writel_relaxed(TIM_CR1_ARPE | TIM_CR1_CEN, timer_of_base(to) + TIM_CR1);
> +	cnt = readl_relaxed(timer_of_base(to) + TIM_CNT);
> +	writel_relaxed(cnt + evt, timer_of_base(to) + TIM_CCR1);
> +	writel_relaxed(TIM_DIER_CC1IE, timer_of_base(to) + TIM_DIER);

This implementation is doomed. You cannot rely on the assumption that the
read/modify/write sequence is 'atomic'.

Bus/pipeline delays, FIQs, hypervisor exits and whatever can delay it
enough so that the write comes too late which means that you have to wait
for a full wraparound of the counter for the next interrupt.

See the big fat comment in hpet_next_event() for gory details of issues
caused by comparator based timers.

Your change of min delay in one of the previous patches is papering over
this problem and I really wonder if your argumentation of 'required because
the CPU can't keep up otherwise' is just wrong and you failed to decode the
RMW issue proper.

Though fact is, that your implementation CANNOT cover all potential RMW
disturbances safely. You need a proper safety net for these cases.

To be honest. I prefer having a slow, inaccurate down counting timer over a
fast comparator based one any time as long as the comparator is not
cleverly implemented and can do less than equal comparisons which take the
wraparound of the counter into account. It's not rocket science to do that,
it just takes a few more gates, but hardware people can't be bothered to
think about the consequences of their cheap implementations ever.

Thanks,

	tglx


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
