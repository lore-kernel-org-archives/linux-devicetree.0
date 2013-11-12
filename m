From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/7] clocksource/cadence_ttc: Store timer frequency in
 driver data
Date: Tue, 12 Nov 2013 17:26:34 +0100
Message-ID: <528256BA.7010801@linaro.org>
References: <1383945677-29674-1-git-send-email-soren.brinkmann@xilinx.com> <1383945677-29674-4-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383945677-29674-4-git-send-email-soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/08/2013 10:21 PM, Soren Brinkmann wrote:
> It is not allowed to call clk_get_rate() from interrupt context. To
> avoid such calls the timer input frequency is stored in the driver's
> data struct which makes it accessible to the driver in any context.
>
> Signed-off-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---

Acked-by: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

>   drivers/clocksource/cadence_ttc_timer.c | 21 +++++++++++++--------
>   1 file changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/clocksource/cadence_ttc_timer.c b/drivers/clocks=
ource/cadence_ttc_timer.c
> index b2bb3a4bc205..a92350b55d32 100644
> --- a/drivers/clocksource/cadence_ttc_timer.c
> +++ b/drivers/clocksource/cadence_ttc_timer.c
> @@ -67,11 +67,13 @@
>    * struct ttc_timer - This definition defines local timer structure
>    *
>    * @base_addr:	Base address of timer
> + * @freq:	Timer input clock frequency
>    * @clk:	Associated clock source
>    * @clk_rate_change_nb	Notifier block for clock rate changes
>    */
>   struct ttc_timer {
>   	void __iomem *base_addr;
> +	unsigned long freq;
>   	struct clk *clk;
>   	struct notifier_block clk_rate_change_nb;
>   };
> @@ -196,9 +198,8 @@ static void ttc_set_mode(enum clock_event_mode mo=
de,
>
>   	switch (mode) {
>   	case CLOCK_EVT_MODE_PERIODIC:
> -		ttc_set_interval(timer,
> -				DIV_ROUND_CLOSEST(clk_get_rate(ttce->ttc.clk),
> -					PRESCALE * HZ));
> +		ttc_set_interval(timer, DIV_ROUND_CLOSEST(ttce->ttc.freq,
> +						PRESCALE * HZ));
>   		break;
>   	case CLOCK_EVT_MODE_ONESHOT:
>   	case CLOCK_EVT_MODE_UNUSED:
> @@ -273,6 +274,8 @@ static void __init ttc_setup_clocksource(struct c=
lk *clk, void __iomem *base)
>   		return;
>   	}
>
> +	ttccs->ttc.freq =3D clk_get_rate(ttccs->ttc.clk);
> +
>   	ttccs->ttc.clk_rate_change_nb.notifier_call =3D
>   		ttc_rate_change_clocksource_cb;
>   	ttccs->ttc.clk_rate_change_nb.next =3D NULL;
> @@ -298,16 +301,14 @@ static void __init ttc_setup_clocksource(struct=
 clk *clk, void __iomem *base)
>   	__raw_writel(CNT_CNTRL_RESET,
>   		     ttccs->ttc.base_addr + TTC_CNT_CNTRL_OFFSET);
>
> -	err =3D clocksource_register_hz(&ttccs->cs,
> -			clk_get_rate(ttccs->ttc.clk) / PRESCALE);
> +	err =3D clocksource_register_hz(&ttccs->cs, ttccs->ttc.freq / PRESC=
ALE);
>   	if (WARN_ON(err)) {
>   		kfree(ttccs);
>   		return;
>   	}
>
>   	ttc_sched_clock_val_reg =3D base + TTC_COUNT_VAL_OFFSET;
> -	setup_sched_clock(ttc_sched_clock_read, 16,
> -			clk_get_rate(ttccs->ttc.clk) / PRESCALE);
> +	setup_sched_clock(ttc_sched_clock_read, 16, ttccs->ttc.freq / PRESC=
ALE);
>   }
>
>   static int ttc_rate_change_clockevent_cb(struct notifier_block *nb,
> @@ -334,6 +335,9 @@ static int ttc_rate_change_clockevent_cb(struct n=
otifier_block *nb,
>   				ndata->new_rate / PRESCALE);
>   		local_irq_restore(flags);
>
> +		/* update cached frequency */
> +		ttc->freq =3D ndata->new_rate;
> +
>   		/* fall through */
>   	}
>   	case PRE_RATE_CHANGE:
> @@ -367,6 +371,7 @@ static void __init ttc_setup_clockevent(struct cl=
k *clk,
>   	if (clk_notifier_register(ttcce->ttc.clk,
>   				&ttcce->ttc.clk_rate_change_nb))
>   		pr_warn("Unable to register clock notifier.\n");
> +	ttcce->ttc.freq =3D clk_get_rate(ttcce->ttc.clk);
>
>   	ttcce->ttc.base_addr =3D base;
>   	ttcce->ce.name =3D "ttc_clockevent";
> @@ -396,7 +401,7 @@ static void __init ttc_setup_clockevent(struct cl=
k *clk,
>   	}
>
>   	clockevents_config_and_register(&ttcce->ce,
> -			clk_get_rate(ttcce->ttc.clk) / PRESCALE, 1, 0xfffe);
> +			ttcce->ttc.freq / PRESCALE, 1, 0xfffe);
>   }
>
>   /**
>


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
