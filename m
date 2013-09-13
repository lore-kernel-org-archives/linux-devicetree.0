From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH 1/2] tick: broadcast: Deny per-cpu clockevents from being
 broadcast sources
Date: Fri, 13 Sep 2013 16:45:12 +0200 (CEST)
Message-ID: <alpine.DEB.2.02.1309131643500.4089@ionos.tec.linutronix.de>
References: <1379004640-15117-1-git-send-email-soren.brinkmann@xilinx.com> <1379004640-15117-2-git-send-email-soren.brinkmann@xilinx.com> <alpine.DEB.2.02.1309122224420.4089@ionos.tec.linutronix.de>
 <54e79f60-d0c4-4897-ab16-ecd50ae7ec0d@DB9EHSMHS019.ehs.local>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-581853902-1379083513=:4089"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54e79f60-d0c4-4897-ab16-ecd50ae7ec0d-K5ybuo5XL++GljRhoabY2LjjLBE8jN/0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-15?Q?S=F6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-581853902-1379083513=:4089
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Thu, 12 Sep 2013, Sören Brinkmann wrote:
> On Thu, Sep 12, 2013 at 10:30:15PM +0200, Thomas Gleixner wrote:
> I gave it a shot. Is this what you imagine:
> diff --git a/drivers/clocksource/arm_global_timer.c b/drivers/clocksource/arm_global_timer.c
> index b66c1f3..c639b1a 100644
> --- a/drivers/clocksource/arm_global_timer.c
> +++ b/drivers/clocksource/arm_global_timer.c
> @@ -169,7 +169,8 @@ static int gt_clockevents_init(struct clock_event_device *clk)
>         int cpu = smp_processor_id();
>  
>         clk->name = "arm_global_timer";
> -       clk->features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
> +       clk->features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT |
> +               CLOCK_EVT_FEAT_PERCPU;
>         clk->set_mode = gt_clockevent_set_mode;
>         clk->set_next_event = gt_clockevent_set_next_event;
>         clk->cpumask = cpumask_of(cpu);
> diff --git a/include/linux/clockchips.h b/include/linux/clockchips.h
> index 0857922..493aa02 100644
> --- a/include/linux/clockchips.h
> +++ b/include/linux/clockchips.h
> @@ -60,6 +60,7 @@ enum clock_event_mode {
>   * Core shall set the interrupt affinity dynamically in broadcast mode
>   */
>  #define CLOCK_EVT_FEAT_DYNIRQ          0x000020
> +#define CLOCK_EVT_FEAT_PERCPU          0x000040
>  
>  /**
>   * struct clock_event_device - clock event device descriptor
> diff --git a/kernel/time/tick-broadcast.c b/kernel/time/tick-broadcast.c
> index d3539e5..de4c5d8 100644
> --- a/kernel/time/tick-broadcast.c
> +++ b/kernel/time/tick-broadcast.c
> @@ -70,16 +70,14 @@ static bool tick_check_broadcast_device(struct clock_event_device *curdev,
>                                         struct clock_event_device *newdev)
>  {
>         if ((newdev->features & CLOCK_EVT_FEAT_DUMMY) ||
> -           (newdev->features & CLOCK_EVT_FEAT_C3STOP))
> +           (newdev->features & CLOCK_EVT_FEAT_C3STOP) ||
> +           (newdev->features & CLOCK_EVT_FEAT_PERCPU))
>                 return false;
>  
>         if (tick_broadcast_device.mode == TICKDEV_MODE_ONESHOT &&
>             !(newdev->features & CLOCK_EVT_FEAT_ONESHOT))
>                 return false;
>  
> -       if (cpumask_equal(newdev->cpumask, cpumask_of(smp_processor_id())))
> -               return false;
> -
>         return !curdev || newdev->rating > curdev->rating;
>  }
> 
> If this is the way to go, I can prepare this in a v2.

Looks good to me. The last junk of the patch won't apply on mainline,
but thats the least of my worries. :)

Thanks,

	tglx
--8323329-581853902-1379083513=:4089--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
