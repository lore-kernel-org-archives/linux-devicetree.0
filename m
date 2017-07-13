Return-Path: <SRS0=wwO0=6Q=rock-chips.com=wxt@kernel.org>
Subject: Re: [PATCH 4/4] arm64: dts: rockchip: update the thermal zones for
 RK3399 SoCs
References: <1499840971-20392-1-git-send-email-wxt@rock-chips.com>
 <1499840971-20392-5-git-send-email-wxt@rock-chips.com>
 <1962948.PJPnbPYrr4@phil>
From: Caesar Wang <wxt@rock-chips.com>
Message-ID: <db1d8925-176b-9e5e-0409-d9ab7a78b4be@rock-chips.com>
Date: Thu, 13 Jul 2017 10:06:08 +0800
MIME-Version: 1.0
In-Reply-To: <1962948.PJPnbPYrr4@phil>
Content-Type: multipart/alternative;
 boundary="------------7FF420431E0A89FBA7109F80"
Content-Language: en-US
To: Heiko Stuebner <heiko@sntech.de>
Cc: Caesar Wang <wxt@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>, Elaine Zhang <zhangqing@rock-chips.com>, Will Deacon <will.deacon@arm.com>, Kever Yang <kever.yang@rock-chips.com>, Douglas Anderson <dianders@chromium.org>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Roger Chen <roger.chen@rock-chips.com>, Catalin Marinas <catalin.marinas@arm.com>, William wu <wulf@rock-chips.com>, rocky.hao@rock-chips.com, linux-arm-kernel@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------7FF420431E0A89FBA7109F80
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

在 2017年07月13日 02:44, Heiko Stuebner 写道:
> Hi Caesar,
>
> Am Mittwoch, 12. Juli 2017, 14:29:30 CEST schrieb Caesar Wang:
>> As RK3399 had used the Power allocator thermal governor by default,
>> enabled this to manage thermals by dynamically allocating and limiting
>> power to devices.
> Does this still run with other thermal governors? The devicetree describes
> the hardware, but should not mandate or exclude specific implementations.
>

I believe the thermal IPA (Power allocator) is better governor on ARM 
SoCs,  you just override for dts if
someone want to use the other governors (step_wise, fair_share..)

The other rockchip SoCs also will support the power allocator governor 
later.

>> Also, this patch supported the dynamic-power-coefficient/sustainable_power
>> and GPU's power model for needed parameters with thermal IPA.
> As written below, this doesn't look like a reviewed binding (otherwise
> please point me to the binding patch), but even if it is a real binding
> it should get its separate patch.

Will do.

>
>
>> Signed-off-by: Caesar Wang <wxt@rock-chips.com>
>>
>> ---
>>
>>   arch/arm64/boot/dts/rockchip/rk3399.dtsi | 62 +++++++++++++++-----------------
>>   1 file changed, 29 insertions(+), 33 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> index 8c6438b..139f58c 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> @@ -147,7 +147,7 @@
>>   			enable-method = "psci";
>>   			#cooling-cells = <2>; /* min followed by max */
>>   			clocks = <&cru ARMCLKB>;
>> -			dynamic-power-coefficient = <100>;
>> +			dynamic-power-coefficient = <436>;
>>   		};
>>   
>>   		cpu_b1: cpu@101 {
>> @@ -156,7 +156,7 @@
>>   			reg = <0x0 0x101>;
>>   			enable-method = "psci";
>>   			clocks = <&cru ARMCLKB>;
>> -			dynamic-power-coefficient = <100>;
>> +			dynamic-power-coefficient = <436>;
>>   		};
>>   	};
>>   
>> @@ -690,24 +690,25 @@
>>   	};
>>   
>>   	thermal_zones: thermal-zones {
>> -		cpu_thermal: cpu {
>> +		soc_thermal: soc-thermal {
>>   			polling-delay-passive = <100>;
>>   			polling-delay = <1000>;
>> +			sustainable-power = <1000>;
>>   
>>   			thermal-sensors = <&tsadc 0>;
>>   
>>   			trips {
>> -				cpu_alert0: cpu_alert0 {
>> +				threshold: trip-point@0 {
> foo@0 will produce warnings when used without reg property. Also,
> why all that renaming, the previous names sounded fine to me.

The IPA likes these name, as the 
Documentation/thermal/power_allocator.txt describes

>
>>   					temperature = <70000>;
>>   					hysteresis = <2000>;
>>   					type = "passive";
>>   				};
>> -				cpu_alert1: cpu_alert1 {
>> -					temperature = <75000>;
>> +				target: trip-point@1 {
>> +					temperature = <85000>;
> When raising the target-temperature to 85 degrees I really
> do expect some sort of reassurement in the commit message
> why that is really safe - especially when the old limit was 10 degrees
> lower.

Think about the better performance, Intelligent Power Allocator should 
be enough safe for 80/85 degree.
That's also used on rockchip inside and chromeos4.4.

The Old limit followed up the rk3288 way before.

>>   					hysteresis = <2000>;
>>   					type = "passive";
>>   				};
>> -				cpu_crit: cpu_crit {
>> +				soc_crit: soc-crit {
>>   					temperature = <95000>;
>>   					hysteresis = <2000>;
>>   					type = "critical";
>> @@ -716,45 +717,31 @@
>>   
>>   			cooling-maps {
>>   				map0 {
>> -					trip = <&cpu_alert0>;
>> +					trip = <&target>;
>>   					cooling-device =
>> -						<&cpu_b0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +						<&cpu_l0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +					contribution = <4096>;
>>   				};
>>   				map1 {
>> -					trip = <&cpu_alert1>;
>> +					trip = <&target>;
> Is it correct to use the _same_ trip point all the time? ... what about
> the threshold and soc_crit ones?

The threshold is  "switch on" trip point that temperature above which 
the governor control loop starts operating.
That just for enabling the IPA.

The target is "desired temperature" trip point. The different is 
throttle the big with little cluster frequency.
Priority to reduce the frequency of little cluster for better performance.

>
>>   					cooling-device =
>> -						<&cpu_l0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>>   						<&cpu_b0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +					contribution = <1024>;
>> +				};
>> +				map2 {
>> +					trip = <&target>;
>> +					cooling-device =
>> +						<&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +					contribution = <4096>;
>>   				};
>>   			};
>>   		};
>>   
>> -		gpu_thermal: gpu {
>> +		gpu_thermal: gpu-thermal {
>>   			polling-delay-passive = <100>;
>>   			polling-delay = <1000>;
>>   
>>   			thermal-sensors = <&tsadc 1>;
>> -
>> -			trips {
>> -				gpu_alert0: gpu_alert0 {
>> -					temperature = <75000>;
>> -					hysteresis = <2000>;
>> -					type = "passive";
>> -				};
>> -				gpu_crit: gpu_crit {
>> -					temperature = <95000>;
>> -					hysteresis = <2000>;
>> -					type = "critical";
>> -				};
>> -			};
>> -
>> -			cooling-maps {
>> -				map0 {
>> -					trip = <&gpu_alert0>;
>> -					cooling-device =
>> -						<&cpu_b0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> -				};
>> -			};
>>   		};
>>   	};
>>   
>> @@ -1455,8 +1442,17 @@
>>   		interrupt-names = "GPU", "JOB", "MMU";
>>   		clocks = <&cru ACLK_GPU>;
>>   		clock-names = "clk_mali";
>> +		#cooling-cells = <2>;
>>   		power-domains = <&power RK3399_PD_GPU>;
>>   		status = "disabled";
>> +
>> +		gpu_power_model: power_model {
>> +			compatible = "arm,mali-simple-power-model";
> Is this binding documented / reviewed somewhere? Because it looks
> quite suspcicious :-) .

Will do.

Thanks,
Caesar

>
> Heiko
>
>> +			static-coefficient = <1079403>;
>> +			dynamic-coefficient = <977>;
>> +			ts = <32000 4700 (-80) 2>;
>> +			thermal-zone = "gpu-thermal";
>> +		};
>>   	};
>>   
>>   	pinctrl: pinctrl {
>>
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


--------------7FF420431E0A89FBA7109F80
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">在 2017年07月13日 02:44, Heiko Stuebner 写道:<br>
    </div>
    <blockquote type="cite" cite="mid:1962948.PJPnbPYrr4@phil">
      <pre wrap="">Hi Caesar,

Am Mittwoch, 12. Juli 2017, 14:29:30 CEST schrieb Caesar Wang:
</pre>
      <blockquote type="cite">
        <pre wrap="">As RK3399 had used the Power allocator thermal governor by default,
enabled this to manage thermals by dynamically allocating and limiting
power to devices.
</pre>
      </blockquote>
      <pre wrap="">
Does this still run with other thermal governors? The devicetree describes
the hardware, but should not mandate or exclude specific implementations.

</pre>
    </blockquote>
    <br>
    I believe the thermal IPA (Power allocator) is better governor on
    ARM SoCs,  you just override for dts if<br>
    someone want to use the other governors (step_wise, fair_share..)<br>
    <br>
    The other rockchip SoCs also will support the power allocator
    governor later. <br>
    <br>
    <blockquote type="cite" cite="mid:1962948.PJPnbPYrr4@phil">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">Also, this patch supported the dynamic-power-coefficient/sustainable_power
and GPU's power model for needed parameters with thermal IPA.
</pre>
      </blockquote>
      <pre wrap="">
As written below, this doesn't look like a reviewed binding (otherwise
please point me to the binding patch), but even if it is a real binding
it should get its separate patch.</pre>
    </blockquote>
    <br>
    Will do.<br>
    <br>
    <blockquote type="cite" cite="mid:1962948.PJPnbPYrr4@phil">
      <pre wrap="">


</pre>
      <blockquote type="cite">
        <pre wrap="">Signed-off-by: Caesar Wang <a class="moz-txt-link-rfc2396E" href="mailto:wxt@rock-chips.com">&lt;wxt@rock-chips.com&gt;</a>

---

 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 62 +++++++++++++++-----------------
 1 file changed, 29 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 8c6438b..139f58c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -147,7 +147,7 @@
 			enable-method = "psci";
 			#cooling-cells = &lt;2&gt;; /* min followed by max */
 			clocks = &lt;&amp;cru ARMCLKB&gt;;
-			dynamic-power-coefficient = &lt;100&gt;;
+			dynamic-power-coefficient = &lt;436&gt;;
 		};
 
 		cpu_b1: cpu@101 {
@@ -156,7 +156,7 @@
 			reg = &lt;0x0 0x101&gt;;
 			enable-method = "psci";
 			clocks = &lt;&amp;cru ARMCLKB&gt;;
-			dynamic-power-coefficient = &lt;100&gt;;
+			dynamic-power-coefficient = &lt;436&gt;;
 		};
 	};
 
@@ -690,24 +690,25 @@
 	};
 
 	thermal_zones: thermal-zones {
-		cpu_thermal: cpu {
+		soc_thermal: soc-thermal {
 			polling-delay-passive = &lt;100&gt;;
 			polling-delay = &lt;1000&gt;;
+			sustainable-power = &lt;1000&gt;;
 
 			thermal-sensors = &lt;&amp;tsadc 0&gt;;
 
 			trips {
-				cpu_alert0: cpu_alert0 {
+				threshold: trip-point@0 {
</pre>
      </blockquote>
      <pre wrap="">
foo@0 will produce warnings when used without reg property. Also,
why all that renaming, the previous names sounded fine to me.
</pre>
    </blockquote>
    <br>
    The IPA likes these name, as the
    Documentation/thermal/power_allocator.txt describes<br>
    <br>
    <blockquote type="cite" cite="mid:1962948.PJPnbPYrr4@phil">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap=""> 					temperature = &lt;70000&gt;;
 					hysteresis = &lt;2000&gt;;
 					type = "passive";
 				};
-				cpu_alert1: cpu_alert1 {
-					temperature = &lt;75000&gt;;
+				target: trip-point@1 {
+					temperature = &lt;85000&gt;;
</pre>
      </blockquote>
      <pre wrap="">
When raising the target-temperature to 85 degrees I really
do expect some sort of reassurement in the commit message
why that is really safe - especially when the old limit was 10 degrees
lower.
</pre>
    </blockquote>
    <font size="+1"><br>
      Think about the better performance, Intelligent Power Allocator
      should be enough safe for 80/85 degree.<br>
      That's also used on rockchip inside and chromeos4.4.<br>
      <br>
      The Old limit followed up the rk3288 way before.<br>
      <br>
    </font>
    <blockquote type="cite" cite="mid:1962948.PJPnbPYrr4@phil">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap=""> 					hysteresis = &lt;2000&gt;;
 					type = "passive";
 				};
-				cpu_crit: cpu_crit {
+				soc_crit: soc-crit {
 					temperature = &lt;95000&gt;;
 					hysteresis = &lt;2000&gt;;
 					type = "critical";
@@ -716,45 +717,31 @@
 
 			cooling-maps {
 				map0 {
-					trip = &lt;&amp;cpu_alert0&gt;;
+					trip = &lt;&amp;target&gt;;
 					cooling-device =
-						&lt;&amp;cpu_b0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT&gt;;
+						&lt;&amp;cpu_l0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT&gt;;
+					contribution = &lt;4096&gt;;
 				};
 				map1 {
-					trip = &lt;&amp;cpu_alert1&gt;;
+					trip = &lt;&amp;target&gt;;
</pre>
      </blockquote>
      <pre wrap="">
Is it correct to use the _same_ trip point all the time? ... what about
the threshold and soc_crit ones?</pre>
    </blockquote>
    <br>
    The threshold is  "switch on" trip point that temperature above
    which the governor control loop starts operating.<br>
    That just for enabling the IPA.<br>
    <br>
    The target is "desired temperature" trip point. The different is
    throttle the big with little cluster frequency. <br>
    Priority to reduce the frequency of little cluster for better
    performance.<br>
    <br>
    <blockquote type="cite" cite="mid:1962948.PJPnbPYrr4@phil">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap=""> 					cooling-device =
-						&lt;&amp;cpu_l0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT&gt;,
 						&lt;&amp;cpu_b0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT&gt;;
+					contribution = &lt;1024&gt;;
+				};
+				map2 {
+					trip = &lt;&amp;target&gt;;
+					cooling-device =
+						&lt;&amp;gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT&gt;;
+					contribution = &lt;4096&gt;;
 				};
 			};
 		};
 
-		gpu_thermal: gpu {
+		gpu_thermal: gpu-thermal {
 			polling-delay-passive = &lt;100&gt;;
 			polling-delay = &lt;1000&gt;;
 
 			thermal-sensors = &lt;&amp;tsadc 1&gt;;
-
-			trips {
-				gpu_alert0: gpu_alert0 {
-					temperature = &lt;75000&gt;;
-					hysteresis = &lt;2000&gt;;
-					type = "passive";
-				};
-				gpu_crit: gpu_crit {
-					temperature = &lt;95000&gt;;
-					hysteresis = &lt;2000&gt;;
-					type = "critical";
-				};
-			};
-
-			cooling-maps {
-				map0 {
-					trip = &lt;&amp;gpu_alert0&gt;;
-					cooling-device =
-						&lt;&amp;cpu_b0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT&gt;;
-				};
-			};
 		};
 	};
 
@@ -1455,8 +1442,17 @@
 		interrupt-names = "GPU", "JOB", "MMU";
 		clocks = &lt;&amp;cru ACLK_GPU&gt;;
 		clock-names = "clk_mali";
+		#cooling-cells = &lt;2&gt;;
 		power-domains = &lt;&amp;power RK3399_PD_GPU&gt;;
 		status = "disabled";
+
+		gpu_power_model: power_model {
+			compatible = "arm,mali-simple-power-model";
</pre>
      </blockquote>
      <pre wrap="">
Is this binding documented / reviewed somewhere? Because it looks
quite suspcicious :-) .
</pre>
    </blockquote>
    <br>
    Will do.<br>
    <br>
    Thanks,<br>
    Caesar<br>
    <br>
    <blockquote type="cite" cite="mid:1962948.PJPnbPYrr4@phil">
      <pre wrap="">

Heiko

</pre>
      <blockquote type="cite">
        <pre wrap="">+			static-coefficient = &lt;1079403&gt;;
+			dynamic-coefficient = &lt;977&gt;;
+			ts = &lt;32000 4700 (-80) 2&gt;;
+			thermal-zone = "gpu-thermal";
+		};
 	};
 
 	pinctrl: pinctrl {

</pre>
      </blockquote>
      <pre wrap="">


_______________________________________________
Linux-rockchip mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Linux-rockchip@lists.infradead.org">Linux-rockchip@lists.infradead.org</a>
<a class="moz-txt-link-freetext" href="http://lists.infradead.org/mailman/listinfo/linux-rockchip">http://lists.infradead.org/mailman/listinfo/linux-rockchip</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------7FF420431E0A89FBA7109F80--
