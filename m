From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: rockchip: fix typo in mmc pinctrl
Date: Tue, 27 Jun 2017 21:28:56 +0200
Message-ID: <1623992.6iPIWFxdC5@diego>
References: <20170627061904.12128-1-klaus.goger@theobroma-systems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170627061904.12128-1-klaus.goger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Klaus Goger <klaus.goger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 27. Juni 2017, 08:19:03 CEST schrieb Klaus Goger:
> replace all occurrences of sdmcc with sdmmc in the rockchip devicetree
> files.
> 
> Signed-off-by: Klaus Goger <klaus.goger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
> ---
> 
>  arch/arm/boot/dts/rk3036.dtsi                | 2 +-
>  arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi | 2 +-
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi     | 2 +-

please split arm32/arm64 changes, as they go through different branches
on their way to mainline.

Otherwise looks good
Heiko

>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/rk3036.dtsi b/arch/arm/boot/dts/rk3036.dtsi
> index ec91325d3b6e..bc5942023889 100644
> --- a/arch/arm/boot/dts/rk3036.dtsi
> +++ b/arch/arm/boot/dts/rk3036.dtsi
> @@ -599,7 +599,7 @@
>  				rockchip,pins = <1 15 RK_FUNC_1 &pcfg_pull_default>;
>  			};
> 
> -			sdmmc_cd: sdmcc-cd {
> +			sdmmc_cd: sdmmc-cd {
>  				rockchip,pins = <1 17 RK_FUNC_1 &pcfg_pull_default>;
>  			};
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
> b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi index
> eb5059344023..eddc6eb31286 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
> @@ -1031,7 +1031,7 @@ ap_i2c_audio: &i2c8 {
>  		 * hurt and dw_mmc will ignore it.  We make sure to disable
>  		 * the pull though so we don't burn needless power.
>  		 */
> -		sdmmc_cd: sdmcc-cd {
> +		sdmmc_cd: sdmmc-cd {
>  			rockchip,pins =
>  				<0 7 RK_FUNC_1 &pcfg_pull_none>;
>  		};
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> b/arch/arm64/boot/dts/rockchip/rk3399.dtsi index 69c56f7316c4..21f32c42d7db
> 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> @@ -1786,7 +1786,7 @@
>  					<4 RK_PB5 RK_FUNC_1 &pcfg_pull_up>;
>  			};
> 
> -			sdmmc_cd: sdmcc-cd {
> +			sdmmc_cd: sdmmc-cd {
>  				rockchip,pins =
>  					<0 RK_PA7 RK_FUNC_1 &pcfg_pull_up>;
>  			};


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
