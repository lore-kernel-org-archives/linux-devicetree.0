From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 4/6] ARM: dts: rockchip: enable eMMC for rk3229-evb
Date: Tue, 04 Jul 2017 10:35:44 +0200
Message-ID: <4792016.SK4QvSrg4n@diego>
References: <1499155967-26090-1-git-send-email-frank.wang@rock-chips.com> <1499155967-26090-5-git-send-email-frank.wang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1499155967-26090-5-git-send-email-frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, finley.xiao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, wmc-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 4. Juli 2017, 16:12:45 CEST schrieb Frank Wang:
> This patch enables eMMC support for rk3229-evb board.
> 
> Signed-off-by: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
>  arch/arm/boot/dts/rk3229-evb.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/rk3229-evb.dts
> b/arch/arm/boot/dts/rk3229-evb.dts index b64f86c..bae0dbf 100644
> --- a/arch/arm/boot/dts/rk3229-evb.dts
> +++ b/arch/arm/boot/dts/rk3229-evb.dts
> @@ -130,6 +130,17 @@
>  	cpu-supply = <&vdd_arm>;
>  };
> 
> +&emmc {
> +	broken-cd;
> +	bus-width = <8>;
> +	cap-mmc-highspeed;
> +	supports-emmc;
> +	disable-wp;
> +	non-removable;

non-removable should be enough, so you shouldn't need the broken-cd above?

> +	num-slots = <1>;
> +	status = "okay";
> +};
> +
>  &gmac {
>  	assigned-clocks = <&cru SCLK_MAC_EXTCLK>, <&cru SCLK_MAC>;
>  	assigned-clock-parents = <&ext_gmac>, <&cru SCLK_MAC_EXTCLK>;


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
