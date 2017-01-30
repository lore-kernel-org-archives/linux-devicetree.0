From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 5/8] clocksource/drivers/rockchip_timer: split
 bc_timer into rk_timer and rk_clock_event_device
Date: Mon, 30 Jan 2017 14:12:58 +0100
Message-ID: <20170130131258.GF2206@mai>
References: <1485260203-14216-1-git-send-email-al.kochet@gmail.com>
 <1485260203-14216-6-git-send-email-al.kochet@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1485260203-14216-6-git-send-email-al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Huang Tao <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 24, 2017 at 03:16:40PM +0300, Alexander Kochetkov wrote:
> The patch move ce field out of struct bc_timer into struct
> rk_clock_event_device and rename struct bc_timer to struct rk_timer.
> 
> The main idea for the commit is to exctact low level timer
> routines from current implementation so they could be
> reused in the following clocksource implementation commit.
> 
> This is refactoring step without functional changes.
> 
> Signed-off-by: Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Reviwed-by: Heiko Stübner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>

I don't get the point of these changes. The patch does not explain why they are
needed.

> ---
>  drivers/clocksource/rockchip_timer.c |   33 ++++++++++++++++++++++-----------
>  1 file changed, 22 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clocksource/rockchip_timer.c b/drivers/clocksource/rockchip_timer.c
> index 23e267a..6d68d4c 100644
> --- a/drivers/clocksource/rockchip_timer.c
> +++ b/drivers/clocksource/rockchip_timer.c
> @@ -29,18 +29,28 @@
>  #define TIMER_MODE_USER_DEFINED_COUNT		(1 << 1)
>  #define TIMER_INT_UNMASK			(1 << 2)
>  
> -struct bc_timer {
> -	struct clock_event_device ce;
> +struct rk_timer {
>  	void __iomem *base;
>  	void __iomem *ctrl;
>  	u32 freq;
>  };
>  
> -static struct bc_timer bc_timer;
> +struct rk_clock_event_device {
> +	struct clock_event_device ce;
> +	struct rk_timer timer;
> +};
> +
> +static struct rk_clock_event_device bc_timer;
> +
> +static inline struct rk_clock_event_device*
> +rk_clock_event_device(struct clock_event_device *ce)
> +{
> +	return container_of(ce, struct rk_clock_event_device, ce);
> +}
>  
> -static inline struct bc_timer *rk_timer(struct clock_event_device *ce)
> +static inline struct rk_timer *rk_timer(struct clock_event_device *ce)
>  {
> -	return container_of(ce, struct bc_timer, ce);
> +	return &rk_clock_event_device(ce)->timer;
>  }
>  
>  static inline void __iomem *rk_base(struct clock_event_device *ce)
> @@ -116,16 +126,17 @@ static irqreturn_t rk_timer_interrupt(int irq, void *dev_id)
>  static int __init rk_timer_init(struct device_node *np, u32 ctrl_reg)
>  {
>  	struct clock_event_device *ce = &bc_timer.ce;
> +	struct rk_timer *timer = &bc_timer.timer;
>  	struct clk *timer_clk;
>  	struct clk *pclk;
>  	int ret = -EINVAL, irq;
>  
> -	bc_timer.base = of_iomap(np, 0);
> -	if (!bc_timer.base) {
> +	timer->base = of_iomap(np, 0);
> +	if (!timer->base) {
>  		pr_err("Failed to get base address for '%s'\n", TIMER_NAME);
>  		return -ENXIO;
>  	}
> -	bc_timer.ctrl = bc_timer.base + ctrl_reg;
> +	timer->ctrl = timer->base + ctrl_reg;
>  
>  	pclk = of_clk_get_by_name(np, "pclk");
>  	if (IS_ERR(pclk)) {
> @@ -153,7 +164,7 @@ static int __init rk_timer_init(struct device_node *np, u32 ctrl_reg)
>  		goto out_timer_clk;
>  	}
>  
> -	bc_timer.freq = clk_get_rate(timer_clk);
> +	timer->freq = clk_get_rate(timer_clk);
>  
>  	irq = irq_of_parse_and_map(np, 0);
>  	if (!irq) {
> @@ -181,7 +192,7 @@ static int __init rk_timer_init(struct device_node *np, u32 ctrl_reg)
>  		goto out_irq;
>  	}
>  
> -	clockevents_config_and_register(ce, bc_timer.freq, 1, UINT_MAX);
> +	clockevents_config_and_register(ce, timer->freq, 1, UINT_MAX);
>  
>  	return 0;
>  
> @@ -190,7 +201,7 @@ static int __init rk_timer_init(struct device_node *np, u32 ctrl_reg)
>  out_timer_clk:
>  	clk_disable_unprepare(pclk);
>  out_unmap:
> -	iounmap(bc_timer.base);
> +	iounmap(timer->base);
>  
>  	return ret;
>  }
> -- 
> 1.7.9.5
> 

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
