From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v4 4/6] arm64: dts: meson: sei510: Add minimal thermal zone
Date: Thu, 22 Aug 2019 12:59:32 -0700
Message-ID: <7h8srl55uj.fsf@baylibre.com>
References: <20190821222421.30242-1-glaroque@baylibre.com> <20190821222421.30242-5-glaroque@baylibre.com> <7hsgpu5c7j.fsf@baylibre.com> <a6881ab8-21b0-ecd6-f7d9-cfe081455c24@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a6881ab8-21b0-ecd6-f7d9-cfe081455c24@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, Guillaume La Roque <glaroque@baylibre.com>, rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 22/08/2019 01:29, Kevin Hilman wrote:
>> Guillaume La Roque <glaroque@baylibre.com> writes:
>> 
>>> Add minimal thermal zone for two temperature sensor
>>> One is located close to the DDR and the other one is
>>> located close to the PLLs (between the CPU and GPU)
>>>
>>> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
>>> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>>> ---
>>>  .../boot/dts/amlogic/meson-g12a-sei510.dts    | 70 +++++++++++++++++++
>>>  1 file changed, 70 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
>>> index c9fa23a56562..35d2ebbd6d4e 100644
>>> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
>>> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
>>> @@ -10,6 +10,7 @@
>>>  #include <dt-bindings/input/input.h>
>>>  #include <dt-bindings/gpio/meson-g12a-gpio.h>
>>>  #include <dt-bindings/sound/meson-g12a-tohdmitx.h>
>>> +#include <dt-bindings/thermal/thermal.h>
>>>  
>>>  / {
>>>  	compatible = "seirobotics,sei510", "amlogic,g12a";
>>> @@ -33,6 +34,67 @@
>>>  		ethernet0 = &ethmac;
>>>  	};
>>>  
>>> +	thermal-zones {
>>> +		cpu-thermal {
>>> +			polling-delay = <1000>;
>>> +			polling-delay-passive = <100>;
>>> +			thermal-sensors = <&cpu_temp>;
>>> +
>>> +			trips {
>>> +				cpu_hot: cpu-hot {
>>> +					temperature = <85000>; /* millicelsius */
>>> +					hysteresis = <2000>; /* millicelsius */
>>> +					type = "hot";
>>> +				};
>>> +
>>> +				cpu_critical: cpu-critical {
>>> +					temperature = <110000>; /* millicelsius */
>>> +					hysteresis = <2000>; /* millicelsius */
>>> +					type = "critical";
>>> +				};
>>> +			};
>>> +
>>> +			cooling-maps {
>>> +				map0 {
>>> +					trip = <&cpu_hot>;
>>> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>>> +							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>>> +							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>>> +							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>>> +				};
>>> +
>>> +				map1 {
>>> +					trip = <&cpu_critical>;
>>> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>>> +							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>>> +							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>>> +							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>>> +				};
>>> +			};
>>> +		};
>>> +
>>> +		ddr-thermal {
>>> +			polling-delay = <1000>;
>>> +			polling-delay-passive = <100>;
>>> +			thermal-sensors = <&ddr_temp>;
>>> +
>>> +			trips {
>>> +				ddr_critical: ddr-critical {
>>> +					temperature = <110000>; /* millicelsius */
>>> +					hysteresis = <2000>; /* millicelsius */
>>> +					type = "critical";
>>> +				};
>>> +			};
>>> +
>>> +			cooling-maps {
>>> +				map {
>>> +					trip = <&ddr_critical>;
>>> +					cooling-device = <&mali THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>>> +				};
>>> +			};
>>> +		};
>>> +	};
>>> +
>>>  	mono_dac: audio-codec-0 {
>>>  		compatible = "maxim,max98357a";
>>>  		#sound-dai-cells = <0>;
>>> @@ -321,6 +383,7 @@
>>>  	operating-points-v2 = <&cpu_opp_table>;
>>>  	clocks = <&clkc CLKID_CPU_CLK>;
>>>  	clock-latency = <50000>;
>>> +	#cooling-cells = <2>;
>>>  };
>>>  
>>>  &cpu1 {
>>> @@ -328,6 +391,7 @@
>>>  	operating-points-v2 = <&cpu_opp_table>;
>>>  	clocks = <&clkc CLKID_CPU_CLK>;
>>>  	clock-latency = <50000>;
>>> +	#cooling-cells = <2>;
>>>  };
>>>  
>>>  &cpu2 {
>>> @@ -335,6 +399,7 @@
>>>  	operating-points-v2 = <&cpu_opp_table>;
>>>  	clocks = <&clkc CLKID_CPU_CLK>;
>>>  	clock-latency = <50000>;
>>> +	#cooling-cells = <2>;
>>>  };
>>>  
>>>  &cpu3 {
>>> @@ -342,6 +407,7 @@
>>>  	operating-points-v2 = <&cpu_opp_table>;
>>>  	clocks = <&clkc CLKID_CPU_CLK>;
>>>  	clock-latency = <50000>;
>>> +	#cooling-cells = <2>;
>>>  };
>>>  
>>>  &cvbs_vdac_port {
>>> @@ -368,6 +434,10 @@
>>>  	status = "okay";
>>>  };
>>>  
>>> +&mali {
>>> +	#cooling-cells = <2>;
>>> +};
>>> +
>> 
>> Is there a reason these #cooling-cells properties belong in the SoC
>> .dtsi and not the board .dts.  Seems like you'll have to repeat this in
>> every board .dts which doesn't seem necessary.
>
> I asked him to keep the cooling-cells in the boards until we add the thermal
> in all the remaining boards.
>
> Seemed to be safer way at the time...

I assumed that #cooling-cells alone would be harmless.

If there are no thermal-zones with trips/maps defined, what can
#cooling-cells by itself do?

Kevin
