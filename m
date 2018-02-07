From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 14/16] arm64: dts: mt7622: add thermal and related
 nodes
Date: Wed, 7 Feb 2018 12:43:56 +0100
Message-ID: <4db5c81b-0e55-3676-d7c8-d1b6aefb99c4@gmail.com>
References: <cover.1517910489.git.sean.wang@mediatek.com>
 <687a7c43e3e3260ebdf004a96d2cde143f563250.1517910489.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <687a7c43e3e3260ebdf004a96d2cde143f563250.1517910489.git.sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 02/06/2018 10:53 AM, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> add nodes for the thermal controller and associated thermal zone using
> CPU as the cooling device for each trip point. In addition, add a fixup
> for thermal_calibration on nvmem should be 12 bytes as the minimal
> requirement.
> 
> Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm64/boot/dts/mediatek/mt7622.dtsi | 72 +++++++++++++++++++++++++++++++-
>  1 file changed, 71 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> index e6dd4f6..6cf67dd 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> @@ -12,6 +12,7 @@
>  #include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/power/mt7622-power.h>
>  #include <dt-bindings/reset/mt7622-reset.h>
> +#include <dt-bindings/thermal/thermal.h>
>  
>  / {
>  	compatible = "mediatek,mt7622";
> @@ -75,6 +76,7 @@
>  				 <&apmixedsys CLK_APMIXED_MAIN_CORE_EN>;
>  			clock-names = "cpu", "intermediate";
>  			operating-points-v2 = <&cpu_opp_table>;
> +			#cooling-cells = <2>;
>  			enable-method = "psci";
>  			clock-frequency = <1300000000>;
>  		};
> @@ -119,6 +121,58 @@
>  		};
>  	};
>  
> +	thermal-zones {
> +		cpu_thermal: cpu-thermal {
> +			polling-delay-passive = <1000>;
> +			polling-delay = <1000>;
> +
> +			thermal-sensors = <&thermal 0>;
> +
> +			trips {
> +				cpu_passive: cpu-passive {
> +					temperature = <47000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				cpu_active: cpu-active {
> +					temperature = <67000>;
> +					hysteresis = <2000>;
> +					type = "active";
> +				};
> +
> +				cpu_hot: cpu-hot {
> +					temperature = <87000>;
> +					hysteresis = <2000>;
> +					type = "hot";
> +				};
> +
> +				cpu-crit {
> +					temperature = <107000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu_passive>;
> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +
> +				map1 {
> +					trip = <&cpu_active>;
> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +
> +				map2 {
> +					trip = <&cpu_hot>;
> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +		};
> +	};
> +
>  	timer {
>  		compatible = "arm,armv8-timer";
>  		interrupt-parent = <&gic>;
> @@ -201,7 +255,7 @@
>  		#size-cells = <1>;
>  
>  		thermal_calibration: calib@198 {
> -			reg = <0x198 0x8>;
> +			reg = <0x198 0xc>;

Any reason why this is not part of patch 8/16?

Regards,
Matthias
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
