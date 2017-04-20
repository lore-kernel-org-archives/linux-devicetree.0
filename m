From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 22/29] dt-bindings: Clarify compatible property for
 rockchip timers
Date: Thu, 20 Apr 2017 09:12:29 -0500
Message-ID: <20170420141229.a3qran4agt24iczc@rob-hp-laptop>
References: <20170416202542.GV2078@mai>
 <1492374441-23336-1-git-send-email-daniel.lezcano@linaro.org>
 <1492374441-23336-22-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1492374441-23336-22-git-send-email-daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Huang Tao <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM/Rockchip SoC support" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:ARM/Rockchip SoC support" <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Apr 16, 2017 at 10:27:12PM +0200, Daniel Lezcano wrote:
> From: Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Make all properties description in form '"rockchip,<chip>-timer",
> "rockchip,rk3288-timer"' for all chips found in linux kernel.
> 
> Suggested-by: Heiko Stübner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> Signed-off-by: Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Reviewed-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> Signed-off-by: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  .../devicetree/bindings/timer/rockchip,rk-timer.txt          | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/timer/rockchip,rk-timer.txt b/Documentation/devicetree/bindings/timer/rockchip,rk-timer.txt
> index a41b184..16a5f45 100644
> --- a/Documentation/devicetree/bindings/timer/rockchip,rk-timer.txt
> +++ b/Documentation/devicetree/bindings/timer/rockchip,rk-timer.txt
> @@ -1,9 +1,15 @@
>  Rockchip rk timer
>  
>  Required properties:
> -- compatible: shall be one of:
> -  "rockchip,rk3288-timer" - for rk3066, rk3036, rk3188, rk322x, rk3288, rk3368
> -  "rockchip,rk3399-timer" - for rk3399
> +- compatible: should be:

should be one of:

> +  "rockchip,rk3036-timer", "rockchip,rk3288-timer": for Rockchip RK3036
> +  "rockchip,rk3066-timer", "rockchip,rk3288-timer": for Rockchip RK3066
> +  "rockchip,rk3188-timer", "rockchip,rk3288-timer": for Rockchip RK3188
> +  "rockchip,rk3228-timer", "rockchip,rk3288-timer": for Rockchip RK3228
> +  "rockchip,rk3229-timer", "rockchip,rk3288-timer": for Rockchip RK3229
> +  "rockchip,rk3288-timer": for Rockchip RK3288
> +  "rockchip,rk3368-timer", "rockchip,rk3288-timer": for Rockchip RK3368
> +  "rockchip,rk3399-timer": for Rockchip RK3399

I find the "for Rockchip RKxxxx" a bit redundant, but it's fine with or 
without. Otherwise,

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
