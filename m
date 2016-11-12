From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v2 2/9] arm64: dts: rockchip: add pd_sd power node for
 rk3399
Date: Sat, 12 Nov 2016 12:35:27 +0800
Message-ID: <86b48b7e-990e-d98a-687e-536a47cb2ac1@rock-chips.com>
References: <1478697721-2323-1-git-send-email-wxt@rock-chips.com>
 <1478697721-2323-3-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478697721-2323-3-git-send-email-wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, zhangqing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org, David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Caesar,

On 2016/11/9 21:21, Caesar Wang wrote:
> From: zhangqing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>
> 1.add pd node for RK3399 Soc
> 2.create power domain tree
> 3.add qos node for domain
> 4.add the pd_sd consumers node

I'm no sure if it is worth spliting out a seperated
patch as it looks to me that you was doing 4 things within
one patch, but anyway

Tested-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

>
> Signed-off-by: Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
>
> Changes in v2:
> - v1 on https://patchwork.kernel.org/patch/9322553/
> - Reviewed-on: https://chromium-review.googlesource.com/386483
> - Verified on ChromeOS kernel4.4
>
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> index b401176..e5b5b3d 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> @@ -253,6 +253,7 @@
>  			 <&cru SCLK_SDMMC_DRV>, <&cru SCLK_SDMMC_SAMPLE>;
>  		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
>  		fifo-depth = <0x100>;
> +		power-domains = <&power RK3399_PD_SD>;
>  		status = "disabled";
>  	};
>
> @@ -691,6 +692,11 @@
>  		status = "disabled";
>  	};
>
> +	qos_sd: qos@ffa74000 {
> +		compatible = "syscon";
> +		reg = <0x0 0xffa74000 0x0 0x20>;
> +	};
> +
>  	qos_emmc: qos@ffa58000 {
>  		compatible = "syscon";
>  		reg = <0x0 0xffa58000 0x0 0x20>;
> @@ -839,6 +845,12 @@
>  				clocks = <&cru ACLK_GMAC>;
>  				pm_qos = <&qos_gmac>;
>  			};
> +			pd_sd@RK3399_PD_SD {
> +				reg = <RK3399_PD_SD>;
> +				clocks = <&cru HCLK_SDMMC>,
> +					 <&cru SCLK_SDMMC>;
> +				pm_qos = <&qos_sd>;
> +			};
>  			pd_vio@RK3399_PD_VIO {
>  				reg = <RK3399_PD_VIO>;
>  				#address-cells = <1>;
>


-- 
Best Regards
Shawn Lin

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
