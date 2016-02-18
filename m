From: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH 6/6] ARM64: dts: rockchip: add core dtsi file for rk3399
Date: Thu, 18 Feb 2016 09:43:37 +0800
Message-ID: <56C521C9.4050906@rock-chips.com>
References: <1455673992-16469-1-git-send-email-jay.xu@rock-chips.com>
 <1455674476-16655-1-git-send-email-jay.xu@rock-chips.com>
 <2396201.CBcovI4jc4@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=gbk;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2396201.CBcovI4jc4@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



=D4=DA 17/02/2016 15:00, Heiko Stuebner =D0=B4=B5=C0:
> Hi Jianqun,
>
> Am Mittwoch, 17. Februar 2016, 10:01:16 schrieb jianqun.xu:
>> From: Xu Jianqun <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>
>> Add dtsi file for Rockchip rk3399 SoCs, which includes some
>> general nodes such as cpu, pmu, cru, gic, amba and so on.
>>
>> Change-Id: Ie3b824e8ead967d4cb119d73222b7a198478c29c
>
> please remove any review-cruft like Change-Ids from mainline patches =
:-)
ok, will fix it in next version patch
>
>> Signed-off-by: Xu Jianqun <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
>>   arch/arm64/boot/dts/rockchip/rk3399.dtsi | 989
>> +++++++++++++++++++++++++++++++ 1 file changed, 989 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3399.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> b/arch/arm64/boot/dts/rockchip/rk3399.dtsi new file mode 100644
>> index 0000000..eb671f6
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>> @@ -0,0 +1,989 @@
>> +/*
>> + * Copyright (c) 2016 Fuzhou Rockchip Electronics Co., Ltd
>> + *
>> + * This file is dual-licensed: you can use it either under the term=
s
>> + * of the GPL or the X11 license, at your option. Note that this du=
al
>> + * licensing only applies to this file, and not this project as a
>> + * whole.
>> + *
>> + *  a) This library is free software; you can redistribute it and/o=
r
>> + *     modify it under the terms of the GNU General Public License =
as
>> + *     published by the Free Software Foundation; either version 2 =
of the
>> + *     License, or (at your option) any later version.
>> + *
>> + *     This library is distributed in the hope that it will be usef=
ul,
>> + *     but WITHOUT ANY WARRANTY; without even the implied warranty =
of
>> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See th=
e
>> + *     GNU General Public License for more details.
>> + *
>> + * Or, alternatively,
>> + *
>> + *  b) Permission is hereby granted, free of charge, to any person
>> + *     obtaining a copy of this software and associated documentati=
on
>> + *     files (the "Software"), to deal in the Software without
>> + *     restriction, including without limitation the rights to use,
>> + *     copy, modify, merge, publish, distribute, sublicense, and/or
>> + *     sell copies of the Software, and to permit persons to whom t=
he
>> + *     Software is furnished to do so, subject to the following
>> + *     conditions:
>> + *
>> + *     The above copyright notice and this permission notice shall =
be
>> + *     included in all copies or substantial portions of the Softwa=
re.
>> + *
>> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KI=
ND,
>> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANT=
IES
>> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
>> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
>> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE O=
R
>> + *     OTHER DEALINGS IN THE SOFTWARE.
>> + */
>> +#include <dt-bindings/clock/rk3399-cru.h>
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/pinctrl/rockchip.h>
>> +
>> +/ {
>> +	compatible =3D "rockchip,rk3399";
>> +	interrupt-parent =3D <&gic>;
>> +	#address-cells =3D <2>;
>> +	#size-cells =3D <2>;
>> +
>> +	aliases {
>> +		serial0 =3D &uart0;
>> +		serial1 =3D &uart1;
>> +		serial2 =3D &uart2;
>> +		serial3 =3D &uart3;
>> +	};
>> +
>> +	psci {
>> +		compatible =3D "arm,psci";
>> +		method =3D "smc";
>> +	};
>> +
>> +	cpus {
>> +		#address-cells =3D <2>;
>> +		#size-cells =3D <0>;
>> +
>> +		cpu-map {
>> +			cluster0 {
>> +				core0 {
>> +					cpu =3D <&cpu_l0>;
>> +				};
>> +				core1 {
>> +					cpu =3D <&cpu_l1>;
>> +				};
>> +				core2 {
>> +					cpu =3D <&cpu_l2>;
>> +				};
>> +				core3 {
>> +					cpu =3D <&cpu_l3>;
>> +				};
>> +			};
>> +
>> +			cluster1 {
>> +				core0 {
>> +					cpu =3D <&cpu_b0>;
>> +				};
>> +				core1 {
>> +					cpu =3D <&cpu_b1>;
>> +				};
>> +			};
>> +		};
>> +
>> +		idle-states {
>> +			entry-method =3D "psci";
>> +
>> +			cpu_sleep: cpu-sleep-0 {
>> +				compatible =3D "arm,idle-state";
>> +			};
>> +		};
>
> why the essentially empty idle-states, which is probably missing prop=
erties?
> In the absence of a real idle driver the kernel will fall back to
> arch_cpu_idle(), which already does WFI handling even on arm64.
>
the idle node will be added by my colleague with new patch later,
so I will remove it first in next version patch.
>
>> +
>> +		cpu_l0: cpu@0 {
>> +			device_type =3D "cpu";
>> +			compatible =3D "arm,cortex-a53", "arm,armv8";
>> +			reg =3D <0x0 0x0>;
>> +			cpu-idle-states =3D <&cpu_sleep>;
>
> that won't compile, as the referenced node is not present
>
>
>> +			enable-method =3D "psci";
>> +		};
>> +
>> +		cpu_l1: cpu@1 {
>> +			device_type =3D "cpu";
>> +			compatible =3D "arm,cortex-a53", "arm,armv8";
>> +			reg =3D <0x0 0x1>;
>> +			cpu-idle-states =3D <&cpu_sleep>;
>> +			enable-method =3D "psci";
>> +		};
>> +
>> +		cpu_l2: cpu@2 {
>> +			device_type =3D "cpu";
>> +			compatible =3D "arm,cortex-a53", "arm,armv8";
>> +			reg =3D <0x0 0x2>;
>> +			cpu-idle-states =3D <&cpu_sleep>;
>> +			enable-method =3D "psci";
>> +		};
>> +
>> +		cpu_l3: cpu@3 {
>> +			device_type =3D "cpu";
>> +			compatible =3D "arm,cortex-a53", "arm,armv8";
>> +			reg =3D <0x0 0x3>;
>> +			cpu-idle-states =3D <&cpu_sleep>;
>> +			enable-method =3D "psci";
>> +		};
>> +
>> +		cpu_b0: cpu@100 {
>> +			device_type =3D "cpu";
>> +			compatible =3D "arm,cortex-a72", "arm,armv8";
>> +			reg =3D <0x0 0x100>;
>> +			cpu-idle-states =3D <&cpu_sleep>;
>> +			enable-method =3D "psci";
>> +		};
>> +
>> +		cpu_b1: cpu@101 {
>> +			device_type =3D "cpu";
>> +			compatible =3D "arm,cortex-a72", "arm,armv8";
>> +			reg =3D <0x0 0x101>;
>> +			cpu-idle-states =3D <&cpu_sleep>;
>> +			enable-method =3D "psci";
>> +		};
>> +	};
>> +
>> +	pmu {
>> +		compatible =3D "arm,armv8-pmuv3";
>> +		interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
>> +		interrupt-affinity =3D <&cpu_l0>, <&cpu_l1>, <&cpu_l2>,
>> +				     <&cpu_l3>, <&cpu_b0>, <&cpu_b1>;
>> +	};
>> +
>> +	timer {
>> +		compatible =3D "arm,armv8-timer";
>> +		interrupts =3D
>> +			<GIC_PPI 13
>> +			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
>
> shouldn't that be GIC_CPU_MASK_SIMPLE(6) instead of 4?
>
ok, will fix it in next version patch
>
>> +			<GIC_PPI 14
>> +			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
>> +			<GIC_PPI 11
>> +			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
>> +			<GIC_PPI 10
>> +			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
>> +		clock-frequency =3D <24000000>;
>> +	};
>> +
>> +	xin24m: xin24m {
>> +		compatible =3D "fixed-clock";
>> +		#clock-cells =3D <0>;
>> +		clock-frequency =3D <24000000>;
>> +		clock-output-names =3D "xin24m";
>> +	};
>> +
>> +	gic: interrupt-controller@fee00000 {
>> +		compatible =3D "arm,gic-v3";
>> +		#interrupt-cells =3D <3>;
>> +		#address-cells =3D <2>;
>> +		#size-cells =3D <2>;
>> +		ranges;
>> +		interrupt-controller;
>> +
>> +		reg =3D <0x0 0xfee00000 0 0x10000>, /* GICD */
>> +		      <0x0 0xfef00000 0 0xc0000>, /* GICR */
>> +		      <0x0 0xfff00000 0 0x10000>, /* GICC */
>> +		      <0x0 0xfff10000 0 0x10000>, /* GICH */
>> +		      <0x0 0xfff20000 0 0x10000>; /* GICV */
>> +		interrupts =3D
>> +			<GIC_PPI 9
>> +			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
>
> again GIC_CPU_MASK_SIMPLE(6)?
ok.
>
>> +		its: interrupt-controller@fee20000 {
>> +			compatible =3D "arm,gic-v3-its";
>> +			msi-controller;
>> +			reg =3D <0x0 0xfee20000 0x0 0x20000>;
>> +		};
>> +	};
>> +
>> +	amba {
>> +		compatible =3D "arm,amba-bus";
>> +		#address-cells =3D <2>;
>> +		#size-cells =3D <2>;
>> +		ranges;
>> +
>> +		dmac_bus: dma-controller@ff6d0000 {
>> +			compatible =3D "arm,pl330", "arm,primecell";
>> +			reg =3D <0x0 0xff6d0000 0x0 0x4000>;
>> +			interrupts =3D <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
>> +			#dma-cells =3D <1>;
>> +			clocks =3D <&cru ACLK_DMAC_BUS>;
>> +			clock-names =3D "apb_pclk";
>
> has the FLUSHP bug gotten fixed? That would be cool.
>
Since amba node is added by my colleague, I will double check it, thank=
s
>
>> +		};
>
> rest looks nice on first glance :-)
>
>
> Heiko
>
>
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
