From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: rockchip: Remove "regulator-always-on" in vcc_rmii for Radxa Rock
Date: Mon, 22 Sep 2014 15:16:57 +0200
Message-ID: <1553574.dVZvoE0Ofh@phil>
References: <1411130187-4966-1-git-send-email-romain.perier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411130187-4966-1-git-send-email-romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Freitag, 19. September 2014, 12:36:27 schrieb Romain Perier:
> On Rockchip RK3188 SoCs the platform driver emac_rockchip is used. This
> variant driver enables this regulator when the device driver is loaded. The
> phy no longer needs to be always on.
> 
> Signed-off-by: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Added to my dts branch and included in the latest pull request to arm-soc

Please also include linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org (the list for all 
things arm) in future submissions


Heiko

> ---
>  arch/arm/boot/dts/rk3188-radxarock.dts | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/rk3188-radxarock.dts
> b/arch/arm/boot/dts/rk3188-radxarock.dts index e04bf8f..d95f881 100644
> --- a/arch/arm/boot/dts/rk3188-radxarock.dts
> +++ b/arch/arm/boot/dts/rk3188-radxarock.dts
> @@ -176,7 +176,6 @@
>  				regulator-name = "VCC_RMII";
>  				regulator-min-microvolt = <3300000>;
>  				regulator-max-microvolt = <3300000>;
> -				regulator-always-on;
>  			};
> 
>  			vccio_wl: REG10 {

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
