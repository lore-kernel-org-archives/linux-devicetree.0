From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 1/3] arm: dts: rk322x: fix i2s1 pinctrl error
Date: Wed, 17 May 2017 11:01:00 +0200
Message-ID: <2781249.GNsgFIKA50@diego>
References: <1494992451-32542-1-git-send-email-frank.wang@rock-chips.com> <1494992451-32542-2-git-send-email-frank.wang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1494992451-32542-2-git-send-email-frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, charles.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cody.xie-TNX95d0MmH7DzftRWevZcw@public.gmane.org, kevan.lan-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, sugar.zhang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, wmc-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Frank,

Am Mittwoch, 17. Mai 2017, 11:40:49 CEST schrieb Frank Wang:
> From: Sugar Zhang <sugar.zhang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> 
> Refer to Chapter 5.3.2 of rk3229 TRM, we can see that GPIO1A[2,4,5]
> using RK_FUNC_2 not RK_FUNC_1. This patch fixes it.
> 
> Signed-off-by: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

if the patch has another author, you should preserve his/her Signed-off-by
line, so for example this patch would look like:

Signed-off-by: Sugar Zhang <sugar.zhang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Signed-off-by: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

Same for all other patches with differing authors in your 2 series from
today. As this touches the developer-certificate-of-origin, this is also
something I cannot really correct myself.


Heiko


> ---
>  arch/arm/boot/dts/rk322x.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/rk322x.dtsi b/arch/arm/boot/dts/rk322x.dtsi
> index 48a0c1c..cc6a27d 100644
> --- a/arch/arm/boot/dts/rk322x.dtsi
> +++ b/arch/arm/boot/dts/rk322x.dtsi
> @@ -621,9 +621,9 @@
>  						<0 12 RK_FUNC_1 &pcfg_pull_none>,
>  						<0 13 RK_FUNC_1 &pcfg_pull_none>,
>  						<0 14 RK_FUNC_1 &pcfg_pull_none>,
> -						<1 2 RK_FUNC_1 &pcfg_pull_none>,
> -						<1 4 RK_FUNC_1 &pcfg_pull_none>,
> -						<1 5 RK_FUNC_1 &pcfg_pull_none>;
> +						<1 2 RK_FUNC_2 &pcfg_pull_none>,
> +						<1 4 RK_FUNC_2 &pcfg_pull_none>,
> +						<1 5 RK_FUNC_2 &pcfg_pull_none>;
>  			};
>  		};


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
