From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] time: Serialize calls to 'clockevents_update_freq'
 in the timing core
Date: Wed, 11 Dec 2013 15:32:57 +0100
Message-ID: <52A87799.8010300@linaro.org>
References: <alpine.DEB.2.02.1312071151340.30673@ionos.tec.linutronix.de> <1386635686-15686-1-git-send-email-soren.brinkmann@xilinx.com> <1386635686-15686-2-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386635686-15686-2-git-send-email-soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/10/2013 01:34 AM, Soren Brinkmann wrote:
> From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
>
> We can identify the broadcast device in the core and serialize all
> callers including interrupts on a different CPU against the update.
> Also, disabling interrupts is moved into the core allowing callers to
> leave interrutps enabled when calling clockevents_update_freq().
>
> Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> Signed-off-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
>   kernel/time/clockevents.c    | 29 ++++++++++++++++++++++-------
>   kernel/time/tick-broadcast.c | 25 +++++++++++++++++++------
>   kernel/time/tick-internal.h  |  4 ++++
>   3 files changed, 45 insertions(+), 13 deletions(-)
>
> diff --git a/kernel/time/clockevents.c b/kernel/time/clockevents.c
> index 086ad6043bcb..641d91003a45 100644
> --- a/kernel/time/clockevents.c
> +++ b/kernel/time/clockevents.c
> @@ -439,6 +439,16 @@ void clockevents_config_and_register(struct cloc=
k_event_device *dev,
>   }
>   EXPORT_SYMBOL_GPL(clockevents_config_and_register);
>
> +int __clockevents_update_freq(struct clock_event_device *dev, u32 fr=
eq)
> +{
> +	clockevents_config(dev, freq);
> +
> +	if (dev->mode !=3D CLOCK_EVT_MODE_ONESHOT)
> +		return 0;
> +
> +	return clockevents_program_event(dev, dev->next_event, false);
> +}
> +

=2E/arch/arm/kernel/smp_twd.c should be modified to call=20
__clockevents_update_freq instead of clockevents_update_freq, no ?

>   /**
>    * clockevents_update_freq - Update frequency and reprogram a clock=
 event device.
>    * @dev:	device to modify
> @@ -446,17 +456,22 @@ EXPORT_SYMBOL_GPL(clockevents_config_and_regist=
er);
>    *
>    * Reconfigure and reprogram a clock event device in oneshot
>    * mode. Must be called on the cpu for which the device delivers pe=
r
> - * cpu timer events with interrupts disabled!  Returns 0 on success,
> - * -ETIME when the event is in the past.
> + * cpu timer events. If called for the broadcast device the core tak=
es
> + * care of serialization.
> + *
> + * Returns 0 on success, -ETIME when the event is in the past.
>    */
>   int clockevents_update_freq(struct clock_event_device *dev, u32 fre=
q)
>   {
> -	clockevents_config(dev, freq);
> -
> -	if (dev->mode !=3D CLOCK_EVT_MODE_ONESHOT)
> -		return 0;
> +	unsigned long flags;
> +	int ret;
>
> -	return clockevents_program_event(dev, dev->next_event, false);
> +	local_irq_save(flags);
> +	ret =3D tick_broadcast_update_freq(dev, freq);
> +	if (ret =3D=3D -ENODEV)
> +		ret =3D __clockevents_update_freq(dev, freq);
> +	local_irq_restore(flags);
> +	return ret;
>   }
>
>   /*
> diff --git a/kernel/time/tick-broadcast.c b/kernel/time/tick-broadcas=
t.c
> index 9532690daaa9..63a33b33fc4e 100644
> --- a/kernel/time/tick-broadcast.c
> +++ b/kernel/time/tick-broadcast.c
> @@ -120,6 +120,19 @@ int tick_is_broadcast_device(struct clock_event_=
device *dev)
>   	return (dev && tick_broadcast_device.evtdev =3D=3D dev);
>   }
>
> +int tick_broadcast_update_freq(struct clock_event_device *dev, u32 f=
req)
> +{
> +	int ret =3D -ENODEV;
> +
> +	if (tick_is_broadcast_device(dev)) {
> +		raw_spin_lock(&tick_broadcast_lock);
> +		ret =3D __clockevents_update_freq(dev, freq);
> +		raw_spin_unlock(&tick_broadcast_lock);
> +	}
> +	return ret;
> +}
> +
> +
>   static void err_broadcast(const struct cpumask *mask)
>   {
>   	pr_crit_once("Failed to broadcast timer tick. Some CPUs may be unr=
esponsive.\n");
> @@ -272,12 +285,8 @@ static void tick_do_broadcast(struct cpumask *ma=
sk)
>    */
>   static void tick_do_periodic_broadcast(void)
>   {
> -	raw_spin_lock(&tick_broadcast_lock);
> -
>   	cpumask_and(tmpmask, cpu_online_mask, tick_broadcast_mask);
>   	tick_do_broadcast(tmpmask);
> -
> -	raw_spin_unlock(&tick_broadcast_lock);
>   }
>
>   /*
> @@ -287,13 +296,15 @@ static void tick_handle_periodic_broadcast(stru=
ct clock_event_device *dev)
>   {
>   	ktime_t next;
>
> +	raw_spin_lock(&tick_broadcast_lock);
> +
>   	tick_do_periodic_broadcast();
>
>   	/*
>   	 * The device is in periodic mode. No reprogramming necessary:
>   	 */
>   	if (dev->mode =3D=3D CLOCK_EVT_MODE_PERIODIC)
> -		return;
> +		goto unlock;
>
>   	/*
>   	 * Setup the next period for devices, which do not have
> @@ -306,9 +317,11 @@ static void tick_handle_periodic_broadcast(struc=
t clock_event_device *dev)
>   		next =3D ktime_add(next, tick_period);
>
>   		if (!clockevents_program_event(dev, next, false))
> -			return;
> +			goto unlock;
>   		tick_do_periodic_broadcast();
>   	}
> +unlock:
> +	raw_spin_unlock(&tick_broadcast_lock);
>   }
>
>   /*
> diff --git a/kernel/time/tick-internal.h b/kernel/time/tick-internal.=
h
> index 18e71f7fbc2a..22fd431a02eb 100644
> --- a/kernel/time/tick-internal.h
> +++ b/kernel/time/tick-internal.h
> @@ -111,6 +111,7 @@ extern int tick_resume_broadcast(void);
>   extern void tick_broadcast_init(void);
>   extern void
>   tick_set_periodic_handler(struct clock_event_device *dev, int broad=
cast);
> +int tick_broadcast_update_freq(struct clock_event_device *dev, u32 f=
req);
>
>   #else /* !BROADCAST */
>
> @@ -133,6 +134,8 @@ static inline void tick_shutdown_broadcast(unsign=
ed int *cpup) { }
>   static inline void tick_suspend_broadcast(void) { }
>   static inline int tick_resume_broadcast(void) { return 0; }
>   static inline void tick_broadcast_init(void) { }
> +static inline int tick_broadcast_update_freq(struct clock_event_devi=
ce *dev,
> +					     u32 freq) { return -ENODEV; }
>
>   /*
>    * Set the periodic handler in non broadcast mode
> @@ -154,4 +157,5 @@ static inline int tick_device_is_functional(struc=
t clock_event_device *dev)
>
>   #endif
>
> +int __clockevents_update_freq(struct clock_event_device *dev, u32 fr=
eq);
>   extern void do_timer(unsigned long ticks);
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
