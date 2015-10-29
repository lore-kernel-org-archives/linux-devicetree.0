From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: rockchip: Setup ethernet0 alias for u-boot
Date: Thu, 29 Oct 2015 21:52:50 +0100
Message-ID: <1895461.b5NitQ7UFH@phil>
References: <1446151497-29833-1-git-send-email-sjoerd.simons@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446151497-29833-1-git-send-email-sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Sjoerd,

Am Donnerstag, 29. Oktober 2015, 21:44:57 schrieb Sjoerd Simons:
> Add an ethernet0 alias for the wired network card and an all 0 default
> mac address so that u-boot can find the device-node and fill in the
> mac address.
> 
> Signed-off-by: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
> ---
> 
>  arch/arm/boot/dts/rk3288-rock2-square.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/rk3288-rock2-square.dts b/arch/arm/boot/dts/rk3288-rock2-square.dts
> index 0ef065d..a029ebf 100644
> --- a/arch/arm/boot/dts/rk3288-rock2-square.dts
> +++ b/arch/arm/boot/dts/rk3288-rock2-square.dts
> @@ -45,6 +45,10 @@
>  	model = "Radxa Rock 2 Square";
>  	compatible = "radxa,rock2-square", "rockchip,rk3288";
>  
> +	aliases {
> +		ethernet0 = &gmac;
> +	};
> +

wouldn't it make more sense to have this in the rk3288.dtsi, so to keep
every board from having to add this alias?


>  	chosen {
>  		stdout-path = "serial2:115200n8";
>  	};
> @@ -130,6 +134,8 @@
>  };
>  
>  &gmac {
> +	/* To be filled in by U-Boot */
> +	mac-address = [00 00 00 00 00 00];
>  	status = "ok";
>  };

I guess the same applies for the mac placeholder.

Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
