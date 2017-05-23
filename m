From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v3 1/3] clk: rockchip: add dt-binding header for rk3128
Date: Tue, 23 May 2017 10:29:52 +0200
Message-ID: <1725571.3NA4bbO7jm@phil>
References: <1495501865-18512-1-git-send-email-zhangqing@rock-chips.com> <1495501865-18512-2-git-send-email-zhangqing@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1495501865-18512-2-git-send-email-zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: xf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Elaine,

Am Dienstag, 23. Mai 2017, 09:11:03 CEST schrieb Elaine Zhang:
> Add the dt-bindings header for the rk3128,
> that gets shared between the clock controller and
> the clock references in the dts.
> Add softreset ID for rk3128.
> And it also applies to the RK3126 SoC.
> 
> Signed-off-by: Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
>  include/dt-bindings/clock/rk3128-cru.h | 283 +++++++++++++++++++++++++++++++++
>  1 file changed, 283 insertions(+)
>  create mode 100644 include/dt-bindings/clock/rk3128-cru.h
> 
> diff --git a/include/dt-bindings/clock/rk3128-cru.h b/include/dt-bindings/clock/rk3128-cru.h
> new file mode 100644
> index 000000000000..5f055a41584b
> --- /dev/null
> +++ b/include/dt-bindings/clock/rk3128-cru.h

[...]

> +#define SCLK_USB480M		154
> +#define SCLK_USB480M_PHY	155

We probably don't need the clock-id for USB480M_PHY, as it is an external
clock and is unused. Instead as I wrote in the previous patch, it should
be added to the list of external clocks in the binding txt document.


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
