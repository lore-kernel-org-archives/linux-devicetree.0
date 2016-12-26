From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v3 4/4] clk: rockchip: add new pll-type for rk3328
Date: Mon, 26 Dec 2016 12:17:06 +0100
Message-ID: <30891453.yaZWColTmb@phil>
References: <1482723930-5876-1-git-send-email-zhangqing@rock-chips.com> <1482723930-5876-5-git-send-email-zhangqing@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1482723930-5876-5-git-send-email-zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, xf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Montag, 26. Dezember 2016, 11:45:30 CET schrieb Elaine Zhang:
> The rk3328's pll and clock are similar with rk3036's,
> it different with pll_mode_mask, the rk3328 soc
> pll mode only one bit(rk3036 soc have two bits)
> so these should be independent and separate from
> the series of rk3328s.
> 
> Changes in v3:
>   fix up the pll type pll_rk3328 description and use
> 
> Signed-off-by: Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---

pll-specific code looks good now, but please make this patch before the clock 
controller in the series and move the 

@@ -130,6 +152,7 @@
 enum rockchip_pll_type {
        pll_rk3036,
        pll_rk3066,
+       pll_rk3328,
        pll_rk3399,
 };
 
from patch3 into this one.


Thanks
Heiko

PS: I will have some comments for the clock controller patch, but it's xmas, 
so that may take bit still.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
