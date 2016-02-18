From: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH 6/6] ARM64: dts: rockchip: add core dtsi file for rk3399
Date: Thu, 18 Feb 2016 09:07:04 +0800
Message-ID: <56C51938.1060806@rock-chips.com>
References: <1455673992-16469-1-git-send-email-jay.xu@rock-chips.com>
 <1455674476-16655-1-git-send-email-jay.xu@rock-chips.com>
 <20160217114645.GA32647@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=gbk;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160217114645.GA32647@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Mark

=D4=DA 17/02/2016 19:46, Mark Rutland =D0=B4=B5=C0:
> On Wed, Feb 17, 2016 at 10:01:16AM +0800, jianqun.xu wrote:
>> From: Xu Jianqun <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>
>> Add dtsi file for Rockchip rk3399 SoCs, which includes some
>> general nodes such as cpu, pmu, cru, gic, amba and so on.
>>
>> Change-Id: Ie3b824e8ead967d4cb119d73222b7a198478c29c
>
> This is meaningless upstream. Please remove any "Change-Id" lines fro=
m
> upstream commit messages.
ok, next version will remove them. thanks

>
>> Signed-off-by: Xu Jianqun <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
>>   arch/arm64/boot/dts/rockchip/rk3399.dtsi | 989 +++++++++++++++++++=
++++++++++++
>>   1 file changed, 989 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3399.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/b=
oot/dts/rockchip/rk3399.dtsi
>> new file mode 100644
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
>
> That compatible string alone is insufficient, as it implies no
> particular function IDs. Hotplug and idle cannot possibly work.
>
> Have you tested this DT?
Yes, but only the simple system now, more function IDs will be added la=
ter.

>
> Which PSCI version have you implemented? Are you using a standard
> firmware (e.g. ARM Trusted Firmware), or some custom implementation?
>
>> +		cpu_l0: cpu@0 {
>> +			device_type =3D "cpu";
>> +			compatible =3D "arm,cortex-a53", "arm,armv8";
>> +			reg =3D <0x0 0x0>;
>> +			cpu-idle-states =3D <&cpu_sleep>;
>> +			enable-method =3D "psci";
>> +		};
>
>> +		cpu_b0: cpu@100 {
>> +			device_type =3D "cpu";
>> +			compatible =3D "arm,cortex-a72", "arm,armv8";
>> +			reg =3D <0x0 0x100>;
>> +			cpu-idle-states =3D <&cpu_sleep>;
>> +			enable-method =3D "psci";
>> +		};
>> +
>
>> +	pmu {
>> +		compatible =3D "arm,armv8-pmuv3";
>> +		interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
>> +		interrupt-affinity =3D <&cpu_l0>, <&cpu_l1>, <&cpu_l2>,
>> +				     <&cpu_l3>, <&cpu_b0>, <&cpu_b1>;
>> +	};
>> +
>
> This isn't quite right. We should have separate nodes for the A72 and
> A53 PMUs.
>
> We can't describe that just yet due to needing cluster-local PPIs. I
> believe Will was looking into that.
>
> In the mean time, please drop the PMU node.

ok, next version will drop the pmu node first, someone will add them in=
=20
another patch.

>
>> +	timer {
>> +		compatible =3D "arm,armv8-timer";
>> +		interrupts =3D
>> +			<GIC_PPI 13
>> +			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
>> +			<GIC_PPI 14
>> +			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
>> +			<GIC_PPI 11
>> +			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
>> +			<GIC_PPI 10
>> +			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
>> +		clock-frequency =3D <24000000>;
>> +	};
>
> Please fix your firmware to program CNTFRQ. Using clock-frequency is
> really not sufficient, and new platforms have no excuse for not havin=
g
> it programmed correctly.
ok, I will fix it. thanks

>
> Thanks,
> Mark.
>
>
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
