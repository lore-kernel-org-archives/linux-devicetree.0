From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/9] clocksource/cadence_ttc: Use enable/disable_irq
Date: Thu, 28 Nov 2013 12:55:38 +0100
Message-ID: <52972F3A.9090103@linaro.org>
References: <1385514296-26702-1-git-send-email-soren.brinkmann@xilinx.com> <1385514296-26702-5-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385514296-26702-5-git-send-email-soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/27/2013 02:04 AM, Soren Brinkmann wrote:
> To ensure that the timer interrupt is properly enabled/disabled acros=
s
> the whole CPU cluster use enable/disable_irq() instead of
> local_irq_disable().
>
> Signed-off-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
>   drivers/clocksource/cadence_ttc_timer.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clocksource/cadence_ttc_timer.c b/drivers/clocks=
ource/cadence_ttc_timer.c
> index a92350b55d32..246d018d1e63 100644
> --- a/drivers/clocksource/cadence_ttc_timer.c
> +++ b/drivers/clocksource/cadence_ttc_timer.c
> @@ -322,18 +322,16 @@ static int ttc_rate_change_clockevent_cb(struct=
 notifier_block *nb,
>   	switch (event) {
>   	case POST_RATE_CHANGE:
>   	{
> -		unsigned long flags;
> -
>   		/*
>   		 * clockevents_update_freq should be called with IRQ disabled on
>   		 * the CPU the timer provides events for. The timer we use is
>   		 * common to both CPUs, not sure if we need to run on both
>   		 * cores.
>   		 */
> -		local_irq_save(flags);
> +		disable_irq(ttcce->ce.irq);
>   		clockevents_update_freq(&ttcce->ce,
>   				ndata->new_rate / PRESCALE);
> -		local_irq_restore(flags);
> +		enable_irq(ttcce->ce.irq);
>
>   		/* update cached frequency */
>   		ttc->freq =3D ndata->new_rate;
>

I am worried about the 'disable_irq' function calling 'synchronize_irq'=
=2E=20
Isn't possible to deadlock with the ondemand cpufreq governor ? I added=
=20
Viresh in Cc, he knows better than me the code path.

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
