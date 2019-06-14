From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: Fix multiple thermal zones
 conflict in rk3399.dtsi
Date: Fri, 14 Jun 2019 15:02:16 +0100
Message-ID: <e5a4f850-27e0-cad3-04bd-6c004fca2b81@arm.com>
References: <20190604165802.7338-1-daniel.lezcano@linaro.org>
 <5188064.YWmxIpmbGp@phil> <55b9018e-672e-522b-d0a0-c5655be0f353@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55b9018e-672e-522b-d0a0-c5655be0f353@linaro.org>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, edubezval@gmail.com, manivannan.sadhasivam@linaro.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Tomsich <philipp.tomsich@theobroma-systems.com>, Christoph Muellner <christoph.muellner@theobroma-systems.com>, Viresh Kumar <viresh.kumar@linaro.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Emil Renner Berthing <kernel@esmil.dk>, Randy Li <ayaka@soulik.info>, Tony Xie <tony.xie@rock-chips.com>, Vicente Bergas <vicencb@gmail.com>, Klaus Goger <klaus.goger@theobroma-systems.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infr>
List-Id: devicetree@vger.kernel.org

On 14/06/2019 14:03, Daniel Lezcano wrote:
> On 14/06/2019 11:35, Heiko Stuebner wrote:
>> Hi Daniel,
>>
>> Am Dienstag, 4. Juni 2019, 18:57:57 CEST schrieb Daniel Lezcano:
>>> Currently the common thermal zones definitions for the rk3399 assumes
>>> multiple thermal zones are supported by the governors. This is not the
>>> case and each thermal zone has its own governor instance acting
>>> individually without collaboration with other governors.
>>>
>>> As the cooling device for the CPU and the GPU thermal zones is the
>>> same, each governors take different decisions for the same cooling
>>> device leading to conflicting instructions and an erratic behavior.
>>>
>>> As the cooling-maps is about to become an optional property, let's
>>> remove the cpu cooling device map from the GPU thermal zone.
>>>
>>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>>> ---
>>>   arch/arm64/boot/dts/rockchip/rk3399.dtsi | 9 ---------
>>>   1 file changed, 9 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>>> index 196ac9b78076..e1357e0f60f7 100644
>>> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>>> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>>> @@ -821,15 +821,6 @@
>>>   					type = "critical";
>>>   				};
>>>   			};
>>> -
>>> -			cooling-maps {
>>> -				map0 {
>>> -					trip = <&gpu_alert0>;
>>> -					cooling-device =
>>> -						<&cpu_b0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>>> -						<&cpu_b1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>>> -				};
>>> -			};
>>>   		};
>>>   	};
>>
>> my knowledge of the thermal framework is not that big, but what about the
>> rk3399-devices which further detail the cooling-maps like rk3399-gru-kevin
>> and the rk3399-nanopc-t4 with its fan-handling in the cooling-maps?
> 
> The rk3399-gru-kevin is correct.
> 
> The rk3399-nanopc-t4 is not correct because the cpu and the gpu are
> sharing the same cooling device (the fan). There are different
> configurations:
> 
> 1. The cpu cooling device for the CPU and the fan for the GPU
> 
> 2. Different trip points on the CPU thermal zone, eg. one to for the CPU
> cooling device and another one for the fan.
> 
> There are some variant for the above. If this board is not on battery,
> you may want to give priority to the throughput, so activate the fan
> first and then cool down the CPU. Or if you are on battery, you may want
> to invert the trip points.
> 
> In any case, it is not possible to share the same cooling device for
> different thermal zones.

OK, thanks for the clarification. I'll get my board set up again to 
figure out the best fix for rk3399-nanopc-t4 (FWIW most users are 
probably just using passive cooling or a plain DC fan anyway). You might 
want to raise this issue with the maintainers of 
arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi, since the 
everything-shared-by-everything approach in there was what I used as a 
reference.

Robin.
