From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v3 08/13] clocksource/drivers/rockchip_timer: drop unused rk_base() and rk_ctrl()
Date: Tue, 29 Nov 2016 16:03:30 +0100
Message-ID: <4764744.Q8IDkmDPk7@diego>
References: <1480343486-25539-1-git-send-email-al.kochet@gmail.com> <1480427118-5126-1-git-send-email-al.kochet@gmail.com> <1480427118-5126-9-git-send-email-al.kochet@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480427118-5126-9-git-send-email-al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Huang Tao <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Dienstag, 29. November 2016, 16:45:13 schrieb Alexander Kochetkov:
> Use of functions has been ceased by previous commit.

Then why do you need another patch to remove them and don't do that in the 
patch removing their respective usage?

> 
> Signed-off-by: Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/clocksource/rockchip_timer.c |   10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/drivers/clocksource/rockchip_timer.c
> b/drivers/clocksource/rockchip_timer.c index aa9ccd1..a17dc61 100644
> --- a/drivers/clocksource/rockchip_timer.c
> +++ b/drivers/clocksource/rockchip_timer.c
> @@ -53,16 +53,6 @@ static inline struct rk_timer *rk_timer(struct
> clock_event_device *ce) return &rk_clock_event_device(ce)->timer;
>  }
> 
> -static inline void __iomem *rk_base(struct clock_event_device *ce)
> -{
> -	return rk_timer(ce)->base;
> -}
> -
> -static inline void __iomem *rk_ctrl(struct clock_event_device *ce)
> -{
> -	return rk_timer(ce)->ctrl;
> -}
> -
>  static inline void rk_timer_disable(struct rk_timer *timer)
>  {
>  	writel_relaxed(TIMER_DISABLE, timer->ctrl);

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
