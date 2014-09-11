From: Addy <addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: Switch i2c0 to 400kHz on rk3288-evb-rk808
Date: Thu, 11 Sep 2014 17:17:58 +0800
Message-ID: <541168C6.2090603@rock-chips.com>
References: <1410409815-22200-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410409815-22200-1-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 11 Sep 2014 12:30, Doug Anderson writes:
> We should be able to talk to the PMIC at 400kHz.  No need to talk at
> the slow 100kHz.
>
> As measured by ftrace (with a bunch of extra patches, since cpufreq
> for rk808 hasn't landed yet):
>   before this change: cpu0_set_target() => ~500us
>   after this change:  cpu0_set_target() => ~300us
>
> Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  arch/arm/boot/dts/rk3288-evb-rk808.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/rk3288-evb-rk808.dts b/arch/arm/boot/dts/rk3288-evb-rk808.dts
> index 36db177..ff522f8 100644
> --- a/arch/arm/boot/dts/rk3288-evb-rk808.dts
> +++ b/arch/arm/boot/dts/rk3288-evb-rk808.dts
> @@ -18,6 +18,7 @@
>  };
>  
>  &i2c0 {
> +	clock-frequency = <400000>;
>  	status = "okay";
>  
>  	rk808: pmic@1b {
I have tested on rk3288-pinky board, it work well. so

Reviewed-by Addy Ke <addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Tested-by Addy Ke <addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
