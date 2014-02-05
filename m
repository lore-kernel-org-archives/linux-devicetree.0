From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH v5 02/20] clocksource: orion: Use atomic access for
 shared registers
Date: Wed, 5 Feb 2014 14:10:35 -0500
Message-ID: <20140205191035.GZ8533@titan.lakedaemon.net>
References: <1390836440-12744-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1390836440-12744-3-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1390836440-12744-3-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Daniel,

On Mon, Jan 27, 2014 at 12:27:02PM -0300, Ezequiel Garcia wrote:
> Replace the driver-specific thread-safe shared register API
> by the recently introduced atomic_io_clear_set().
> 
> Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Tested-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/clocksource/time-orion.c | 28 ++++++++++------------------
>  1 file changed, 10 insertions(+), 18 deletions(-)

The MMIO patch this depends on:

  c5ca95b507c8 ARM: 7930/1: Introduce atomic MMIO modify

made it in to v3.14-rc1.  It looks like this change is independent of
the rest of the watchdog series, so:

Acked-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>

thx,

Jason.

> diff --git a/drivers/clocksource/time-orion.c b/drivers/clocksource/time-orion.c
> index 9c7f018..3f14e56 100644
> --- a/drivers/clocksource/time-orion.c
> +++ b/drivers/clocksource/time-orion.c
> @@ -35,20 +35,6 @@
>  #define ORION_ONESHOT_MAX	0xfffffffe
>  
>  static void __iomem *timer_base;
> -static DEFINE_SPINLOCK(timer_ctrl_lock);
> -
> -/*
> - * Thread-safe access to TIMER_CTRL register
> - * (shared with watchdog timer)
> - */
> -void orion_timer_ctrl_clrset(u32 clr, u32 set)
> -{
> -	spin_lock(&timer_ctrl_lock);
> -	writel((readl(timer_base + TIMER_CTRL) & ~clr) | set,
> -		timer_base + TIMER_CTRL);
> -	spin_unlock(&timer_ctrl_lock);
> -}
> -EXPORT_SYMBOL(orion_timer_ctrl_clrset);
>  
>  /*
>   * Free-running clocksource handling.
> @@ -68,7 +54,8 @@ static int orion_clkevt_next_event(unsigned long delta,
>  {
>  	/* setup and enable one-shot timer */
>  	writel(delta, timer_base + TIMER1_VAL);
> -	orion_timer_ctrl_clrset(TIMER1_RELOAD_EN, TIMER1_EN);
> +	atomic_io_modify(timer_base + TIMER_CTRL,
> +		TIMER1_RELOAD_EN | TIMER1_EN, TIMER1_EN);
>  
>  	return 0;
>  }
> @@ -80,10 +67,13 @@ static void orion_clkevt_mode(enum clock_event_mode mode,
>  		/* setup and enable periodic timer at 1/HZ intervals */
>  		writel(ticks_per_jiffy - 1, timer_base + TIMER1_RELOAD);
>  		writel(ticks_per_jiffy - 1, timer_base + TIMER1_VAL);
> -		orion_timer_ctrl_clrset(0, TIMER1_RELOAD_EN | TIMER1_EN);
> +		atomic_io_modify(timer_base + TIMER_CTRL,
> +			TIMER1_RELOAD_EN | TIMER1_EN,
> +			TIMER1_RELOAD_EN | TIMER1_EN);
>  	} else {
>  		/* disable timer */
> -		orion_timer_ctrl_clrset(TIMER1_RELOAD_EN | TIMER1_EN, 0);
> +		atomic_io_modify(timer_base + TIMER_CTRL,
> +			TIMER1_RELOAD_EN | TIMER1_EN, 0);
>  	}
>  }
>  
> @@ -131,7 +121,9 @@ static void __init orion_timer_init(struct device_node *np)
>  	/* setup timer0 as free-running clocksource */
>  	writel(~0, timer_base + TIMER0_VAL);
>  	writel(~0, timer_base + TIMER0_RELOAD);
> -	orion_timer_ctrl_clrset(0, TIMER0_RELOAD_EN | TIMER0_EN);
> +	atomic_io_modify(timer_base + TIMER_CTRL,
> +		TIMER0_RELOAD_EN | TIMER0_EN,
> +		TIMER0_RELOAD_EN | TIMER0_EN);
>  	clocksource_mmio_init(timer_base + TIMER0_VAL, "orion_clocksource",
>  			      clk_get_rate(clk), 300, 32,
>  			      clocksource_mmio_readl_down);
> -- 
> 1.8.1.5
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
