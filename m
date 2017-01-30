From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 5/8] clocksource/drivers/rockchip_timer: split
 bc_timer into rk_timer and rk_clock_event_device
Date: Mon, 30 Jan 2017 15:20:04 +0100
Message-ID: <20170130142004.GI2206@mai>
References: <1485260203-14216-1-git-send-email-al.kochet@gmail.com>
 <1485260203-14216-6-git-send-email-al.kochet@gmail.com>
 <20170130131258.GF2206@mai>
 <0E7077EE-0D5A-4653-99EF-E8F2E8FD2FB0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <0E7077EE-0D5A-4653-99EF-E8F2E8FD2FB0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Huang Tao <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 30, 2017 at 04:55:33PM +0300, Alexander Kochetkov wrote:
> 
> > 30 янв. 2017 г., в 16:12, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> написал(а):
> > 
> > I don't get the point of these changes. The patch does not explain why they are
> > needed.
> 
> I’d like to extract timer API from current implementation.
> And to make code more readable I’d like to introduce 'struct rk_timer’ what can be
> reused with current implementation and with my patch (8/8). And in order keep patches
> simple and readable I split that into three patches: 5/8, 6/8, 7/8.
> 
> Current implementation named rockchip timer as ‘struct bc_timer’ (broadcast timer).
> I renamed it to more suitable to it role (may be bad choice).
> 
> Yes, the patch itself looks strange. You are right.
> 
> What do you think about that solution:
> - in the patch 6/8 i will Introduce 'struct rk_timer’ and 'struct rk_time_clkevt’ (renamed ‘struct bc_timer’).

I prefer rk_clksrc and rk_clkevt.

> - rk_timer_init() changes from 5/8 I will merge with 8/8
> - 8/8 introduce 'struct rk_time_clksrc' 
> - 5/8 drop

Ok, let's see what that gives.

  -- Daniel

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
