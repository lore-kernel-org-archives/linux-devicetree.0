From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 5/9] clocksource/cadence_ttc: Adjust interval in clock
 notifier
Date: Thu, 12 Dec 2013 13:15:38 +0100
Message-ID: <52A9A8EA.3080609@linaro.org>
References: <1385514296-26702-1-git-send-email-soren.brinkmann@xilinx.com> <1385514296-26702-6-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385514296-26702-6-git-send-email-soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/27/2013 02:04 AM, Soren Brinkmann wrote:
> The clockevent has to be reprogrammed if the timer's input
> clock frequency changes and the timer is in periodic mode, in order t=
o
> maintain the correct timer interval.
>
> Signed-off-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
> v2:
>   - adjust the timer interval while the timer interrupt is disabled
> ---
>   drivers/clocksource/cadence_ttc_timer.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clocksource/cadence_ttc_timer.c b/drivers/clocks=
ource/cadence_ttc_timer.c
> index 246d018d1e63..77517675653e 100644
> --- a/drivers/clocksource/cadence_ttc_timer.c
> +++ b/drivers/clocksource/cadence_ttc_timer.c
> @@ -322,6 +322,9 @@ static int ttc_rate_change_clockevent_cb(struct n=
otifier_block *nb,
>   	switch (event) {
>   	case POST_RATE_CHANGE:
>   	{
> +		/* update cached frequency */
> +		ttc->freq =3D ndata->new_rate;
> +
>   		/*
>   		 * clockevents_update_freq should be called with IRQ disabled on
>   		 * the CPU the timer provides events for. The timer we use is
> @@ -329,12 +332,15 @@ static int ttc_rate_change_clockevent_cb(struct=
 notifier_block *nb,
>   		 * cores.
>   		 */
>   		disable_irq(ttcce->ce.irq);
> +
>   		clockevents_update_freq(&ttcce->ce,
>   				ndata->new_rate / PRESCALE);
> -		enable_irq(ttcce->ce.irq);
>
> -		/* update cached frequency */
> -		ttc->freq =3D ndata->new_rate;
> +		if (ttcce->ce.mode =3D=3D CLOCK_EVT_MODE_PERIODIC)
> +			ttc_set_interval(ttc, DIV_ROUND_CLOSEST(ttc->freq,
> +						PRESCALE * HZ));
> +
> +		enable_irq(ttcce->ce.irq);
>
>   		/* fall through */
>   	}

When looking at the smp_twd.c, there is a similar need.

There are a couple of notifier used on for cpufreq and one for clock=20
rate change.

Wouldn't make sense to add the notifier calls and registration in the=20
time framework and add the callbacks in the dev ops ? The switch would=20
be in the timer framework and perhaps the irq disabling may be easier t=
o=20
deal with ?

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
