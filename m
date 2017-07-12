From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 4/4] arm64: dts: rockchip: update the thermal zones for RK3399 SoCs
Date: Wed, 12 Jul 2017 20:44:51 +0200
Message-ID: <1962948.PJPnbPYrr4@phil>
References: <1499840971-20392-1-git-send-email-wxt@rock-chips.com> <1499840971-20392-5-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1499840971-20392-5-git-send-email-wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rocky.hao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, William wu <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Roger Chen <roger.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Caesar,

Am Mittwoch, 12. Juli 2017, 14:29:30 CEST schrieb Caesar Wang:
> As RK3399 had used the Power allocator thermal governor by default,
> enabled this to manage thermals by dynamically allocating and limiting
> power to devices.

Does this still run with other thermal governors? The devicetree describes
the hardware, but should not mandate or exclude specific implementations.


> Also, this patch supported the dynamic-power-coefficient/sustainable_power
> and GPU's power model for needed parameters with thermal IPA.

As written below, this doesn't look like a reviewed binding (otherwise
please point me to the binding patch), but even if it is a real binding
it should get its separate patch.


> Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> 
> ---
> 
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 62 +++++++++++++++-----------------
>  1 file changed, 29 insertions(+), 33 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> index 8c6438b..139f58c 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> @@ -147,7 +147,7 @@
>  			enable-method = "psci";
>  			#cooling-cells = <2>; /* min followed by max */
>  			clocks = <&cru ARMCLKB>;
> -			dynamic-power-coefficient = <100>;
> +			dynamic-power-coefficient = <436>;
>  		};
>  
>  		cpu_b1: cpu@101 {
> @@ -156,7 +156,7 @@
>  			reg = <0x0 0x101>;
>  			enable-method = "psci";
>  			clocks = <&cru ARMCLKB>;
> -			dynamic-power-coefficient = <100>;
> +			dynamic-power-coefficient = <436>;
>  		};
>  	};
>  
> @@ -690,24 +690,25 @@
>  	};
>  
>  	thermal_zones: thermal-zones {
> -		cpu_thermal: cpu {
> +		soc_thermal: soc-thermal {
>  			polling-delay-passive = <100>;
>  			polling-delay = <1000>;
> +			sustainable-power = <1000>;
>  
>  			thermal-sensors = <&tsadc 0>;
>  
>  			trips {
> -				cpu_alert0: cpu_alert0 {
> +				threshold: trip-point@0 {

foo@0 will produce warnings when used without reg property. Also,
why all that renaming, the previous names sounded fine to me.


>  					temperature = <70000>;
>  					hysteresis = <2000>;
>  					type = "passive";
>  				};
> -				cpu_alert1: cpu_alert1 {
> -					temperature = <75000>;
> +				target: trip-point@1 {
> +					temperature = <85000>;

When raising the target-temperature to 85 degrees I really
do expect some sort of reassurement in the commit message
why that is really safe - especially when the old limit was 10 degrees
lower.

>  					hysteresis = <2000>;
>  					type = "passive";
>  				};
> -				cpu_crit: cpu_crit {
> +				soc_crit: soc-crit {
>  					temperature = <95000>;
>  					hysteresis = <2000>;
>  					type = "critical";
> @@ -716,45 +717,31 @@
>  
>  			cooling-maps {
>  				map0 {
> -					trip = <&cpu_alert0>;
> +					trip = <&target>;
>  					cooling-device =
> -						<&cpu_b0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +						<&cpu_l0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +					contribution = <4096>;
>  				};
>  				map1 {
> -					trip = <&cpu_alert1>;
> +					trip = <&target>;

Is it correct to use the _same_ trip point all the time? ... what about
the threshold and soc_crit ones?

>  					cooling-device =
> -						<&cpu_l0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>  						<&cpu_b0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +					contribution = <1024>;
> +				};
> +				map2 {
> +					trip = <&target>;
> +					cooling-device =
> +						<&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +					contribution = <4096>;
>  				};
>  			};
>  		};
>  
> -		gpu_thermal: gpu {
> +		gpu_thermal: gpu-thermal {
>  			polling-delay-passive = <100>;
>  			polling-delay = <1000>;
>  
>  			thermal-sensors = <&tsadc 1>;
> -
> -			trips {
> -				gpu_alert0: gpu_alert0 {
> -					temperature = <75000>;
> -					hysteresis = <2000>;
> -					type = "passive";
> -				};
> -				gpu_crit: gpu_crit {
> -					temperature = <95000>;
> -					hysteresis = <2000>;
> -					type = "critical";
> -				};
> -			};
> -
> -			cooling-maps {
> -				map0 {
> -					trip = <&gpu_alert0>;
> -					cooling-device =
> -						<&cpu_b0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> -				};
> -			};
>  		};
>  	};
>  
> @@ -1455,8 +1442,17 @@
>  		interrupt-names = "GPU", "JOB", "MMU";
>  		clocks = <&cru ACLK_GPU>;
>  		clock-names = "clk_mali";
> +		#cooling-cells = <2>;
>  		power-domains = <&power RK3399_PD_GPU>;
>  		status = "disabled";
> +
> +		gpu_power_model: power_model {
> +			compatible = "arm,mali-simple-power-model";

Is this binding documented / reviewed somewhere? Because it looks
quite suspcicious :-) .


Heiko

> +			static-coefficient = <1079403>;
> +			dynamic-coefficient = <977>;
> +			ts = <32000 4700 (-80) 2>;
> +			thermal-zone = "gpu-thermal";
> +		};
>  	};
>  
>  	pinctrl: pinctrl {
> 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
