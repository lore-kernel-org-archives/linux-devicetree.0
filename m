From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 09/14] ARM: dts: rockchip: add pwm dt node for rv1108
Date: Mon, 31 Jul 2017 13:28:37 +0200
Message-ID: <1558358.ZOf701IZdC@diego>
References: <1501495449-21290-1-git-send-email-andy.yan@rock-chips.com> <1501496265-21910-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1501496265-21910-1-git-send-email-andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Andy,

Am Montag, 31. Juli 2017, 18:17:45 CEST schrieb Andy Yan:
> Add pwm device tree node for rv1108
> 
> Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> 
>  arch/arm/boot/dts/rv1108.dtsi | 143
> ++++++++++++++++++++++++++++++++++++++++++ 1 file changed, 143
> insertions(+)
> 
> diff --git a/arch/arm/boot/dts/rv1108.dtsi b/arch/arm/boot/dts/rv1108.dtsi
> index 6ae83a8..7fcc6de 100644
> --- a/arch/arm/boot/dts/rv1108.dtsi
> +++ b/arch/arm/boot/dts/rv1108.dtsi
> @@ -213,6 +213,54 @@
>  		status = "disabled";
>  	};
> 
> +	pwm4: pwm@10280000 {
> +		compatible = "rockchip,rk3288-pwm";

please make that a
	compatible = "rockchip,rv1108-pwm", "rockchip,rk3288-pwm";

and update the binding accordingly.


Thanks
Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
