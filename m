From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v3 2/5] ARM: dts: rockchip: add ARM Mali GPU node for rk3288
Date: Wed, 19 Apr 2017 10:59:21 +0200
Message-ID: <5403013.fQWx48MQOq@phil>
References: <cover.1492588180.git.guillaume.tucker@collabora.com> <f6f127efb44fb1012f18c483fa522918f8f82d7c.1492588180.git.guillaume.tucker@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f6f127efb44fb1012f18c483fa522918f8f82d7c.1492588180.git.guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, John Reitan <john.reitan-5wv7dgnIgG8@public.gmane.org>, Wookey <wookey-Xpnwy/r4z8dg9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 19. April 2017, 09:06:18 CEST schrieb Guillaume Tucker:
> Add Mali GPU device tree node for the rk3288 SoC, with devfreq
> opp table.
> 
> Tested-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> Signed-off-by: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/rk3288.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
> index df8a0dbe9d91..187eed528f83 100644
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
> @@ -227,6 +228,27 @@
>  		ports = <&vopl_out>, <&vopb_out>;
>  	};
>  
> +	gpu: mali@ffa30000 {

please sort nodes by address. ffa30000 should be placed below hdmi@ff980000
and above qos@ffaa0000 .


> +		compatible = "arm,mali-t760", "arm,mali-midgard";

As indicated before I don't trust that a generic binding will work for
everything, so I would feel safer if we had a "rockchip,rk3288-mali" in
front for future purposes, making it a

		compatible = "rockchip,rk3288-mali", "arm,mali-t760", "arm,mali-midgard";


> +		reg = <0xffa30000 0x10000>;
> +		interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "job", "mmu", "gpu";
> +		clocks = <&cru ACLK_GPU>;
> +		operating-points = <
> +			/* KHz uV */
> +			100000 950000
> +			200000 950000
> +			300000 1000000
> +			400000 1100000
> +			500000 1200000
> +			600000 1250000
> +		>;

Wasn't there a wish for opp-v2 in a previous version?


Thanks
Heiko

> +		power-domains = <&power RK3288_PD_GPU>;
> +		status = "disabled";
> +	};
> +
>  	sdmmc: dwmmc@ff0c0000 {
>  		compatible = "rockchip,rk3288-dw-mshc";
>  		max-frequency = <150000000>;
> 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
