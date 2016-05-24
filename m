From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: rockchip: drop rk3288 jtag/mmc switch handling
Date: Tue, 24 May 2016 10:09:41 +0800
Message-ID: <feee590b-e9a9-7c36-cf99-9dd1cb229eb7@rock-chips.com>
References: <1464015539-19521-1-git-send-email-heiko@sntech.de>
 <1464015539-19521-4-git-send-email-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=gbk;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464015539-19521-4-git-send-email-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

=D4=DA 2016/5/23 22:58, Heiko Stuebner =D0=B4=B5=C0:
> We moved that functionality to a more generic place where it can also
> be used for other socs, so drop it from architecture code.
>
> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>

It looks good to drop this Soc related setting from
architecture code.

Reviewed-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

> ---
>  arch/arm/mach-rockchip/rockchip.c | 12 ------------
>  1 file changed, 12 deletions(-)
>
> diff --git a/arch/arm/mach-rockchip/rockchip.c b/arch/arm/mach-rockch=
ip/rockchip.c
> index beb71da..e7b2aa7 100644
> --- a/arch/arm/mach-rockchip/rockchip.c
> +++ b/arch/arm/mach-rockchip/rockchip.c
> @@ -29,13 +29,11 @@
>  #include "core.h"
>  #include "pm.h"
>
> -#define RK3288_GRF_SOC_CON0 0x244
>  #define RK3288_TIMER6_7_PHYS 0xff810000
>
>  static void __init rockchip_timer_init(void)
>  {
>  	if (of_machine_is_compatible("rockchip,rk3288")) {
> -		struct regmap *grf;
>  		void __iomem *reg_base;
>
>  		/*
> @@ -54,16 +52,6 @@ static void __init rockchip_timer_init(void)
>  		} else {
>  			pr_err("rockchip: could not map timer7 registers\n");
>  		}
> -
> -		/*
> -		 * Disable auto jtag/sdmmc switching that causes issues
> -		 * with the mmc controllers making them unreliable
> -		 */
> -		grf =3D syscon_regmap_lookup_by_compatible("rockchip,rk3288-grf");
> -		if (!IS_ERR(grf))
> -			regmap_write(grf, RK3288_GRF_SOC_CON0, 0x10000000);
> -		else
> -			pr_err("rockchip: could not get grf syscon\n");
>  	}
>
>  	of_clk_init(NULL);
>


--=20
Best Regards
Shawn Lin

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
