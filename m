From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: Fix multiple thermal zones
 conflict in rk3399.dtsi
Date: Sun, 16 Jun 2019 19:47:38 +0200
Message-ID: <55da0654-ce67-b843-5ca4-37f63577b102@linaro.org>
References: <20190604165802.7338-1-daniel.lezcano@linaro.org>
 <5188064.YWmxIpmbGp@phil> <55b9018e-672e-522b-d0a0-c5655be0f353@linaro.org>
 <e5a4f850-27e0-cad3-04bd-6c004fca2b81@arm.com>
 <9bf85c22-f1ba-3dbc-0b67-17e124484fa1@linaro.org>
 <20190616093127.GC3826@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190616093127.GC3826@kozik-lap>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, edubezval@gmail.com, manivannan.sadhasivam@linaro.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Tomsich <philipp.tomsich@theobroma-systems.com>, Christoph Muellner <christoph.muellner@theobroma-systems.com>, Viresh Kumar <viresh.kumar@linaro.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Emil Renner Berthing <kernel@esmil.dk>, Randy Li <ayaka@soulik.info>, Tony Xie <tony.xie@rock-chips.com>, Vicente Bergas <vicencb@gmail.com>, Klaus Goger <klaus.goger@theobroma-systems.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 16/06/2019 11:31, Krzysztof Kozlowski wrote:
> On Fri, Jun 14, 2019 at 04:30:13PM +0200, Daniel Lezcano wrote:
>> On 14/06/2019 16:02, Robin Murphy wrote:
>>> On 14/06/2019 14:03, Daniel Lezcano wrote:
>>>> On 14/06/2019 11:35, Heiko Stuebner wrote:
>>>>> Hi Daniel,
>>>>>
>>>>> Am Dienstag, 4. Juni 2019, 18:57:57 CEST schrieb Daniel Lezcano:
>>>>>> Currently the common thermal zones definitions for the rk3399 assumes
>>>>>> multiple thermal zones are supported by the governors. This is not the
>>>>>> case and each thermal zone has its own governor instance acting
>>>>>> individually without collaboration with other governors.
>>>>>>
>>>>>> As the cooling device for the CPU and the GPU thermal zones is the
>>>>>> same, each governors take different decisions for the same cooling
>>>>>> device leading to conflicting instructions and an erratic behavior.
>>>>>>
>>>>>> As the cooling-maps is about to become an optional property, let's
>>>>>> remove the cpu cooling device map from the GPU thermal zone.
>>>>>>
>>>>>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>>>>>> ---
>>>>>>   arch/arm64/boot/dts/rockchip/rk3399.dtsi | 9 ---------
>>>>>>   1 file changed, 9 deletions(-)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>>>>>> b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>>>>>> index 196ac9b78076..e1357e0f60f7 100644
>>>>>> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>>>>>> @@ -821,15 +821,6 @@
>>>>>>                       type = "critical";
>>>>>>                   };
>>>>>>               };
>>>>>> -
>>>>>> -            cooling-maps {
>>>>>> -                map0 {
>>>>>> -                    trip = <&gpu_alert0>;
>>>>>> -                    cooling-device =
>>>>>> -                        <&cpu_b0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>>>>>> -                        <&cpu_b1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>>>>>> -                };
>>>>>> -            };
>>>>>>           };
>>>>>>       };
>>>>>
>>>>> my knowledge of the thermal framework is not that big, but what about
>>>>> the
>>>>> rk3399-devices which further detail the cooling-maps like
>>>>> rk3399-gru-kevin
>>>>> and the rk3399-nanopc-t4 with its fan-handling in the cooling-maps?
>>>>
>>>> The rk3399-gru-kevin is correct.
>>>>
>>>> The rk3399-nanopc-t4 is not correct because the cpu and the gpu are
>>>> sharing the same cooling device (the fan). There are different
>>>> configurations:
>>>>
>>>> 1. The cpu cooling device for the CPU and the fan for the GPU
>>>>
>>>> 2. Different trip points on the CPU thermal zone, eg. one to for the CPU
>>>> cooling device and another one for the fan.
>>>>
>>>> There are some variant for the above. If this board is not on battery,
>>>> you may want to give priority to the throughput, so activate the fan
>>>> first and then cool down the CPU. Or if you are on battery, you may want
>>>> to invert the trip points.
>>>>
>>>> In any case, it is not possible to share the same cooling device for
>>>> different thermal zones.
>>>
>>> OK, thanks for the clarification. I'll get my board set up again to
>>> figure out the best fix for rk3399-nanopc-t4 (FWIW most users are
>>> probably just using passive cooling or a plain DC fan anyway). You might
>>> want to raise this issue with the maintainers of
>>> arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi, since the
>>> everything-shared-by-everything approach in there was what I used as a
>>> reference.
>>
>> Cc'ed: Kukjin Kim and Krzysztof Kozlowski
>>
>> Easy :)
>>
> 
> Assuming that all trip-points are the same between thermal zones, I
> understand that solution could be to have one thermal zone with thermal
> multiple sensors (some time ago bindings did not support it) and all
> cooling devices? Then only one governor would be assigned?

The multiple sensors, multiple thermal zones and governors dealing with
different group of them is not implemented [yet]. Basically, you can
consider there is a 1:1 relationship between each of them.

 one thermal zone = one sensor = one cooling device

Given the configuration and the hardware, it would make sense to create
one thermal zone per cluster.

There is one clock line per cluster. It is possible to create two CPU
cooling devices, one for each cluster.

IMO, the fan definition is correct except it should be assigned to one
thermal zone only.

One configuration could be:

thermal-zones {
	little-thermal-zone: little-thermal-zone {
		thermal-sensors = <&tmu_cpu0 0>;
                polling-delay-passive = <250>;
                polling-delay = <0>;

		trips {
			ltz_alert0: ltz-alert-0 {
				temperature = <50000>;
				hysteresis = <5000>;
                        	type = "active";
			};

			ltz_alert1: cpu-alert-1 {
				temperature = <60000>;
				hysteresis = <5000>;
				type = "active";
			};

			ltz_alert2: ltz-alert-2 {
				temperature = <70000>;
				hysteresis = <5000>;
				type = "active";
			};

			ltz_alert3: ltz-alert-3 {
				temperature = <75000>;
				hysteresis = <10000>;
				type = "passive";
			};

			ltz_crit0: ltz-crit-0 {
				temperature = <120000>;
				hysteresis = <0>;
				type = "critical";
			};
		};

		cooling-maps {
			map0 {
				trip = <&ltz_alert0>;
				cooling-device = <&fan0 0 1>;
			};

			map1 {
				trip = <&ltz_alert1>;
				cooling-device = <&fan0 1 2>;
			};

			map2 {
				trip = <&ltz_alert2>;
				cooling-device = <&fan0 2 3>;
			};

			map3 {
				trip = <&ltz_alert3>;
				cooling-device = <&cpu0
						THERMAL_NO_LIMIT
						THERMAL_NO_LIMIT>,

						 <&cpu1
						THERMAL_NO_LIMIT
						THERMAL_NO_LIMIT>,

						 <&cpu2
						THERMAL_NO_LIMIT
						THERMAL_NO_LIMIT>,

						 <&cpu3
						THERMAL_NO_LIMIT
						THERMAL_NO_LIMIT>,
			};
		};
	};

	big-thermal-zone: big-thermal-zone {

		/* The same as little, except the sensor and the cpu
		  cooling &cpu4, &cpu5, &cpu6, &cpu7 */

	};
};


That said, the idle injection cooling device is for the moment being
developed and that would be a good opportunity to test a real per cpu
cooling device as the exynos5422 has a per core sensor.


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
