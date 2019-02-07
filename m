From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v4 1/1] arm64: dts: sdm845: wireup the thermal trip
 points to cpufreq
Date: Wed, 6 Feb 2019 18:00:51 -0800
Message-ID: <20190207020051.GL117604@google.com>
References: <cover.1549448839.git.amit.kucheria@linaro.org>
 <edfe493e2f2034d531702c333c5acb4fabfbbb97.1549448839.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <edfe493e2f2034d531702c333c5acb4fabfbbb97.1549448839.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, andy.gross@linaro.org, tdas@codeaurora.org, swboyd@chromium.org, dianders@chromium.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 06, 2019 at 04:04:49PM +0530, Amit Kucheria wrote:
> Since all cpus in the big and little clusters, respectively, are in the
> same frequency domain, use all of them for mitigation in the
> cooling-map. We end up with two cooling devices - one each for the big
> and little clusters.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> Acked-by: Eduardo Valentin <edubezval@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 241 ++++++++++++++++++++++++---
>  1 file changed, 217 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index c27cbd3bcb0a..8ce5bf55a345 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -13,6 +13,7 @@
>  #include <dt-bindings/reset/qcom,sdm845-aoss.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>  #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +#include <dt-bindings/thermal/thermal.h>
>  
>  / {
>  	interrupt-parent = <&intc>;
> @@ -99,6 +100,7 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x0>;
>  			enable-method = "psci";
> +			#cooling-cells = <2>;
>  			next-level-cache = <&L2_0>;
>  			L2_0: l2-cache {
>  				compatible = "cache";
> @@ -114,6 +116,7 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x100>;
>  			enable-method = "psci";
> +			#cooling-cells = <2>;
>  			next-level-cache = <&L2_100>;
>  			L2_100: l2-cache {
>  				compatible = "cache";
> @@ -126,6 +129,7 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x200>;
>  			enable-method = "psci";
> +			#cooling-cells = <2>;
>  			next-level-cache = <&L2_200>;
>  			L2_200: l2-cache {
>  				compatible = "cache";
> @@ -138,6 +142,7 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x300>;
>  			enable-method = "psci";
> +			#cooling-cells = <2>;
>  			next-level-cache = <&L2_300>;
>  			L2_300: l2-cache {
>  				compatible = "cache";
> @@ -150,6 +155,7 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x400>;
>  			enable-method = "psci";
> +			#cooling-cells = <2>;
>  			next-level-cache = <&L2_400>;
>  			L2_400: l2-cache {
>  				compatible = "cache";
> @@ -162,6 +168,7 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x500>;
>  			enable-method = "psci";
> +			#cooling-cells = <2>;
>  			next-level-cache = <&L2_500>;
>  			L2_500: l2-cache {
>  				compatible = "cache";
> @@ -174,6 +181,7 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x600>;
>  			enable-method = "psci";
> +			#cooling-cells = <2>;
>  			next-level-cache = <&L2_600>;
>  			L2_600: l2-cache {
>  				compatible = "cache";
> @@ -186,6 +194,7 @@
>  			compatible = "qcom,kryo385";
>  			reg = <0x0 0x700>;
>  			enable-method = "psci";
> +			#cooling-cells = <2>;
>  			next-level-cache = <&L2_700>;
>  			L2_700: l2-cache {
>  				compatible = "cache";
> @@ -1691,18 +1700,41 @@
>  			thermal-sensors = <&tsens0 1>;
>  
>  			trips {
> -				cpu_alert0: trip0 {
> -					temperature = <75000>;
> +				cpu0_alert0: trip-point@0 {
> +					temperature = <90000>;
>  					hysteresis = <2000>;
>  					type = "passive";
>  				};
>  
> -				cpu_crit0: trip1 {
> +				cpu0_alert1: trip-point@1 {
> +					temperature = <95000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				cpu0_crit: cpu_crit {
>  					temperature = <110000>;
>  					hysteresis = <1000>;
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu0_alert0>;
> +					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +				map1 {
> +					trip = <&cpu0_alert1>;
> +					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		cpu1-thermal {
> @@ -1712,18 +1744,41 @@
>  			thermal-sensors = <&tsens0 2>;
>  
>  			trips {
> -				cpu_alert1: trip0 {
> -					temperature = <75000>;
> +				cpu1_alert0: trip-point@0 {
> +					temperature = <90000>;
>  					hysteresis = <2000>;
>  					type = "passive";
>  				};
>  
> -				cpu_crit1: trip1 {
> +				cpu1_alert1: trip-point@1 {
> +					temperature = <95000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				cpu1_crit: cpu_crit {
>  					temperature = <110000>;
>  					hysteresis = <1000>;
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu1_alert0>;
> +					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +				map1 {
> +					trip = <&cpu1_alert1>;
> +					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		cpu2-thermal {
> @@ -1733,18 +1788,41 @@
>  			thermal-sensors = <&tsens0 3>;
>  
>  			trips {
> -				cpu_alert2: trip0 {
> -					temperature = <75000>;
> +				cpu2_alert0: trip-point@0 {
> +					temperature = <90000>;
>  					hysteresis = <2000>;
>  					type = "passive";
>  				};
>  
> -				cpu_crit2: trip1 {
> +				cpu2_alert1: trip-point@1 {
> +					temperature = <95000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				cpu2_crit: cpu_crit {
>  					temperature = <110000>;
>  					hysteresis = <1000>;
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu2_alert0>;
> +					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +				map1 {
> +					trip = <&cpu2_alert1>;
> +					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		cpu3-thermal {
> @@ -1754,18 +1832,41 @@
>  			thermal-sensors = <&tsens0 4>;
>  
>  			trips {
> -				cpu_alert3: trip0 {
> -					temperature = <75000>;
> +				cpu3_alert0: trip-point@0 {
> +					temperature = <90000>;
>  					hysteresis = <2000>;
>  					type = "passive";
>  				};
>  
> -				cpu_crit3: trip1 {
> +				cpu3_alert1: trip-point@1 {
> +					temperature = <95000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				cpu3_crit: cpu_crit {
>  					temperature = <110000>;
>  					hysteresis = <1000>;
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu3_alert0>;
> +					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +				map1 {
> +					trip = <&cpu3_alert1>;
> +					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		cpu4-thermal {
> @@ -1775,18 +1876,41 @@
>  			thermal-sensors = <&tsens0 7>;
>  
>  			trips {
> -				cpu_alert4: trip0 {
> -					temperature = <75000>;
> +				cpu4_alert0: trip-point@0 {
> +					temperature = <90000>;
>  					hysteresis = <2000>;
>  					type = "passive";
>  				};
>  
> -				cpu_crit4: trip1 {
> +				cpu4_alert1: trip-point@1 {
> +					temperature = <95000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				cpu4_crit: cpu_crit {
>  					temperature = <110000>;
>  					hysteresis = <1000>;
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu4_alert0>;
> +					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +				map1 {
> +					trip = <&cpu4_alert1>;
> +					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		cpu5-thermal {
> @@ -1796,18 +1920,41 @@
>  			thermal-sensors = <&tsens0 8>;
>  
>  			trips {
> -				cpu_alert5: trip0 {
> -					temperature = <75000>;
> +				cpu5_alert0: trip-point@0 {
> +					temperature = <90000>;
>  					hysteresis = <2000>;
>  					type = "passive";
>  				};
>  
> -				cpu_crit5: trip1 {
> +				cpu5_alert1: trip-point@1 {
> +					temperature = <95000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				cpu5_crit: cpu_crit {
>  					temperature = <110000>;
>  					hysteresis = <1000>;
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu5_alert0>;
> +					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +				map1 {
> +					trip = <&cpu5_alert1>;
> +					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		cpu6-thermal {
> @@ -1817,18 +1964,41 @@
>  			thermal-sensors = <&tsens0 9>;
>  
>  			trips {
> -				cpu_alert6: trip0 {
> -					temperature = <75000>;
> +				cpu6_alert0: trip-point@0 {
> +					temperature = <90000>;
>  					hysteresis = <2000>;
>  					type = "passive";
>  				};
>  
> -				cpu_crit6: trip1 {
> +				cpu6_alert1: trip-point@1 {
> +					temperature = <95000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				cpu6_crit: cpu_crit {
>  					temperature = <110000>;
>  					hysteresis = <1000>;
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu6_alert0>;
> +					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +				map1 {
> +					trip = <&cpu6_alert1>;
> +					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		cpu7-thermal {
> @@ -1838,18 +2008,41 @@
>  			thermal-sensors = <&tsens0 10>;
>  
>  			trips {
> -				cpu_alert7: trip0 {
> -					temperature = <75000>;
> +				cpu7_alert0: trip-point@0 {
> +					temperature = <90000>;
>  					hysteresis = <2000>;
>  					type = "passive";
>  				};
>  
> -				cpu_crit7: trip1 {
> +				cpu7_alert1: trip-point@1 {
> +					temperature = <95000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				cpu7_crit: cpu_crit {
>  					temperature = <110000>;
>  					hysteresis = <1000>;
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu7_alert0>;
> +					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +				map1 {
> +					trip = <&cpu7_alert1>;
> +					cooling-device = <&CPU4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&CPU7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  	};
>  };

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Tested-by: Matthias Kaehlcke <mka@chromium.org>

Thanks

Matthias
