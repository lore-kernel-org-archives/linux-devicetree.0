From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v6 4/7] arm64: dts: meson: g12: Add minimal thermal zone
Date: Mon, 30 Sep 2019 10:19:18 +0200
Message-ID: <61a8f023-c8df-5721-bf1e-90f242474bc0@baylibre.com>
References: <20190927184352.28759-1-glaroque@baylibre.com>
 <20190927184352.28759-5-glaroque@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190927184352.28759-5-glaroque@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Guillaume La Roque <glaroque@baylibre.com>, amit.kucheria@linaro.org, rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 27/09/2019 20:43, Guillaume La Roque wrote:
> Add minimal thermal zone for two temperature sensor
> One is located close to the DDR and the other one is
> located close to the PLLs (between the CPU and GPU)
> 
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Tested-by: Christian Hewitt <christianshewitt@gmail.com>
> Tested-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
>  .../boot/dts/amlogic/meson-g12-common.dtsi    | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index 0660d9ef6a86..f98171949fcb 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -12,6 +12,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/reset/amlogic,meson-axg-audio-arb.h>
>  #include <dt-bindings/reset/amlogic,meson-g12a-reset.h>
> +#include <dt-bindings/thermal/thermal.h>
>  
>  / {
>  	interrupt-parent = <&gic>;
> @@ -94,6 +95,50 @@
>  		#size-cells = <2>;
>  		ranges;
>  
> +		thermal-zones {
> +			cpu_thermal: cpu-thermal {
> +				polling-delay = <1000>;
> +				polling-delay-passive = <100>;
> +				thermal-sensors = <&cpu_temp>;
> +
> +				trips {
> +					cpu_passive: cpu-passive {
> +						temperature = <85000>; /* millicelsius */
> +						hysteresis = <2000>; /* millicelsius */
> +						type = "passive";
> +					};
> +
> +					cpu_hot: cpu-hot {
> +						temperature = <95000>; /* millicelsius */
> +						hysteresis = <2000>; /* millicelsius */
> +						type = "hot";
> +					};
> +
> +				};
> +			};
> +
> +			ddr_thermal: ddr-thermal {
> +				polling-delay = <1000>;
> +				polling-delay-passive = <100>;
> +				thermal-sensors = <&ddr_temp>;
> +
> +				trips {
> +					ddr_passive: ddr-passive {
> +						temperature = <85000>; /* millicelsius */
> +						hysteresis = <2000>; /* millicelsius */
> +						type = "passive";
> +					};
> +				};
> +
> +				cooling-maps {
> +					map {
> +						trip = <&ddr_passive>;
> +						cooling-device = <&mali THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +					};
> +				};
> +			};
> +		};
> +
>  		ethmac: ethernet@ff3f0000 {
>  			compatible = "amlogic,meson-axg-dwmac",
>  				     "snps,dwmac-3.70a",
> @@ -2412,6 +2457,7 @@
>  			assigned-clock-rates = <0>, /* Do Nothing */
>  					       <800000000>,
>  					       <0>; /* Do Nothing */
> +			#cooling-cells = <2>;
>  		};
>  	};
>  
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
