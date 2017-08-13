From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v3 13/13] ARM: dts: rockchip: add accelerometer bma250e dt node for rv1108 evb
Date: Sun, 13 Aug 2017 14:16:24 +0200
Message-ID: <3261055.FbxHzKYeRb@phil>
References: <1502422578-30611-1-git-send-email-andy.yan@rock-chips.com> <1502423358-31375-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502423358-31375-1-git-send-email-andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Freitag, 11. August 2017, 11:49:18 CEST schrieb Andy Yan:
> Add dt node of bosch accelerometer bma250e on rv1108 evb.
> 
> Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> 
> Changes in v3: None
> Changes in v2: None
> 
>  arch/arm/boot/dts/rv1108-evb.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/rv1108-evb.dts b/arch/arm/boot/dts/rv1108-evb.dts
> index a1bd95e..6690083 100644
> --- a/arch/arm/boot/dts/rv1108-evb.dts
> +++ b/arch/arm/boot/dts/rv1108-evb.dts
> @@ -110,6 +110,13 @@
>  	i2c-scl-falling-time-ns = <16>;
>  	clock-frequency = <400000>;
>  
> +	bma250: accelerometer@19 {

please order such things by address,
foo@19 should come after bar@18 of course


Thanks
Heiko

> +		compatible = "bosch,bma250e";
> +		reg = <0x19>;
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <RK_PB3 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
>  	rk805: pmic@18 {
>  		compatible = "rockchip,rk805";
>  		reg = <0x18>;
> 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
