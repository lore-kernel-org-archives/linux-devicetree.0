From: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: dts: rockchip: add ARM Mali GPU node for rk3288
Date: Thu, 30 Mar 2017 10:03:24 +0200
Message-ID: <7f16f2ec-8e94-aa86-a8da-84ff8fd60c60@collabora.com>
References: <cover.1490789802.git.guillaume.tucker@collabora.com>
 <46d14d3c969a35e800b1c06da0ddb652986e6827.1490789802.git.guillaume.tucker@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <46d14d3c969a35e800b1c06da0ddb652986e6827.1490789802.git.guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, John Reitan <john.reitan-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 29/03/17 14:44, Guillaume Tucker wrote:
> Add Mali GPU device tree node for the rk3288 SoC, with devfreq
> opp table.
> 
> Signed-off-by: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/rk3288.dtsi | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
> index df8a0dbe9d91..213224ea309e 100644
> --- a/arch/arm/boot/dts/rk3288.dtsi
> +++ b/arch/arm/boot/dts/rk3288.dtsi
> @@ -43,6 +43,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/pinctrl/rockchip.h>
>  #include <dt-bindings/clock/rk3288-cru.h>
> +#include <dt-bindings/power/rk3288-power.h>
>  #include <dt-bindings/thermal/thermal.h>
>  #include <dt-bindings/power/rk3288-power.h>
>  #include <dt-bindings/soc/rockchip,boot-mode.h>
> @@ -227,6 +228,28 @@
>  		ports = <&vopl_out>, <&vopb_out>;
>  	};
>  
> +	gpu: mali@ffa30000 {
> +		compatible = "arm,mali-midgard";
> +		reg = <0xffa30000 0x10000>;
> +		interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "JOB", "MMU", "GPU";
> +		clocks = <&cru ACLK_GPU>;
> +		clock-names = "clk_mali";
> +		operating-points = <
> +			/* KHz uV */
> +			100000 950000
> +			200000 950000
> +			300000 1000000
> +			400000 1100000
> +			500000 1200000
> +			600000 1250000
> +		>;
> +		power-domains = <&power RK3288_PD_GPU>;
> +		status = "disabled";
> +	};
> +
>  	sdmmc: dwmmc@ff0c0000 {
>  		compatible = "rockchip,rk3288-dw-mshc";
>  		max-frequency = <150000000>;
> 

This works on a veyron-minnie and a veyron-jerry, so

Tested-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
