From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v2 1/9] arm64: dts: rockchip: add eMMC's power domain support for rk3399
Date: Mon, 14 Nov 2016 15:45:20 +0100
Message-ID: <2342292.tK2jqRKrXH@phil>
References: <1478697721-2323-1-git-send-email-wxt@rock-chips.com> <1478697721-2323-2-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478697721-2323-2-git-send-email-wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org, tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Ziyuan Xu <xzy.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 9. November 2016, 21:21:53 CET schrieb Caesar Wang:
> From: Ziyuan Xu <xzy.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> 
> Control power domain for eMMC via genpd to reduce power consumption.
> 
> Signed-off-by: Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Signed-off-by: Ziyuan Xu <xzy.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

Authorship / Signed-off mismatch. From above suggest Ziyuan is the author 
while first Signed-off-by indicates Elaine as author. Please clarify.


Thanks
Heiko

> ---
> 
> Changes in v2:
> - Reviewed-on: https://chromium-review.googlesource.com/376558
> - Verified on ChromeOS kernel4.4
> 
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> b/arch/arm64/boot/dts/rockchip/rk3399.dtsi index cbb7f8b..b401176 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> @@ -269,6 +269,7 @@
>  		#clock-cells = <0>;
>  		phys = <&emmc_phy>;
>  		phy-names = "phy_arasan";
> +		power-domains = <&power RK3399_PD_EMMC>;
>  		status = "disabled";
>  	};
> 
> @@ -690,6 +691,11 @@
>  		status = "disabled";
>  	};
> 
> +	qos_emmc: qos@ffa58000 {
> +		compatible = "syscon";
> +		reg = <0x0 0xffa58000 0x0 0x20>;
> +	};
> +
>  	qos_gmac: qos@ffa5c000 {
>  		compatible = "syscon";
>  		reg = <0x0 0xffa5c000 0x0 0x20>;
> @@ -823,6 +829,11 @@
>  			};
> 
>  			/* These power domains are grouped by VD_LOGIC */
> +			pd_emmc@RK3399_PD_EMMC {
> +				reg = <RK3399_PD_EMMC>;
> +				clocks = <&cru ACLK_EMMC>;
> +				pm_qos = <&qos_emmc>;
> +			};
>  			pd_gmac@RK3399_PD_GMAC {
>  				reg = <RK3399_PD_GMAC>;
>  				clocks = <&cru ACLK_GMAC>;


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
