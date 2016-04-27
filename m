From: "jay.xu" <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM64: dts: rockchip: add dts file for RK3399
 evaluation board
Date: Wed, 27 Apr 2016 08:56:00 +0800
Message-ID: <57200E20.6090502@rock-chips.com>
References: <1461638206-20473-1-git-send-email-jay.xu@rock-chips.com>
 <1461638206-20473-5-git-send-email-jay.xu@rock-chips.com>
 <9945516.Q6LYCrkl5z@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9945516.Q6LYCrkl5z@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: lintao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, davidriley-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, smbarber-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 2016=E5=B9=B404=E6=9C=8826=E6=97=A5 20:37, Heiko St=C3=BCbner wrote:
> Am Dienstag, 26. April 2016, 10:36:46 schrieb Jianqun Xu:
>> This patch add rk3399-evb.dts for RK3399 evaluation board.
>> Tested on RK3399 evb.
>>
>> Signed-off-by: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
>> changes in v3:
>> - add more compatible (Doug)
>> - add modle
>>
>>   arch/arm64/boot/dts/rockchip/Makefile       |   1 +
>>   arch/arm64/boot/dts/rockchip/rk3399-evb.dts | 125
>> ++++++++++++++++++++++++++++ 2 files changed, 126 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-evb.dts
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/Makefile
>> b/arch/arm64/boot/dts/rockchip/Makefile index df37865..7037a16 10064=
4
>> --- a/arch/arm64/boot/dts/rockchip/Makefile
>> +++ b/arch/arm64/boot/dts/rockchip/Makefile
>> @@ -1,6 +1,7 @@
>>   dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3368-evb-act8846.dtb
>>   dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3368-geekbox.dtb
>>   dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3368-r88.dtb
>> +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399-evb.dtb
>>
>>   always		:=3D $(dtb-y)
>>   subdir-y	:=3D $(dts-dirs)
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-evb.dts
>> b/arch/arm64/boot/dts/rockchip/rk3399-evb.dts new file mode 100644
>> index 0000000..c3370bd
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399-evb.dts
>> @@ -0,0 +1,125 @@
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
>> + *  a) This file is free software; you can redistribute it and/or
>> + *     modify it under the terms of the GNU General Public License =
as
>> + *     published by the Free Software Foundation; either version 2 =
of the
>> + *     License, or (at your option) any later version.
>> + *
>> + *     This file is distributed in the hope that it will be useful,
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
>> +
>> +/dts-v1/;
>> +#include <dt-bindings/pwm/pwm.h>
>> +#include "rk3399.dtsi"
>> +
>> +/ {
>> +	model =3D "Rockchip RK3399 Evaluation Board";
>> +	compatible =3D "rockchip,rk3399-evb", "rockchip,rk3399",
>> +		     "google,rk3399evb-rev2", google,rk3399evb-rev1",
>> +		     "google,rk3399evb-rev0" ;
>
> can you check against which compatibles that coreboot really matches?
>
> As we said that the evb changed between rev1 and rev2, I would expect=
 the
> compatible to be something like
>
> 	compatible =3D "rockchip,rk3399-evb",  "google,rk3399evb-rev2",
> 			"rockchip,rk3399";
>
> leaving out the rev1 and rev0
>
ok, it will be fixed in next version, thanks

>> +
>> +	vdd_center: vdd-center {
>> +		compatible =3D "pwm-regulator";
>> +		pwms =3D <&pwm3 0 25000 0>;
>> +		regulator-name =3D "vdd_center";
>> +		regulator-min-microvolt =3D <800000>;
>> +		regulator-max-microvolt =3D <1400000>;
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> +		status =3D "okay";
>> +	};
>
> Can you check if this runs stable with the pwm-regulator in mainline =
please?
> I.e. Boris' rework series hasn't landed yet and at least on Veyron I =
remember
> the pwm-regulator having reliability issues or something like that.
>
ok, I will test stablity on rk3399 evb, and to find out what issue does=
=20
veyron encounter.

and could you share a link about Boris'rework series patches ?
thanks

>
>> +
>> +	vcc3v3_sys: vcc3v3-sys {
>> +		compatible =3D "regulator-fixed";
>> +		regulator-name =3D "vcc3v3_sys";
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> +		regulator-min-microvolt =3D <3300000>;
>> +		regulator-max-microvolt =3D <3300000>;
>> +	};
>> +
>> +	vcc_phy: vcc-phy-regulator {
>> +		compatible =3D "regulator-fixed";
>> +		regulator-name =3D "vcc_phy";
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> +	};
>> +};
>> +
>> +&pwm0 {
>> +	status =3D "okay";
>> +};
>> +
>> +&pwm2 {
>> +	status =3D "okay";
>> +};
>> +
>> +&pwm3 {
>> +	status =3D "okay";
>> +};
>> +
>> +&uart2 {
>> +	status =3D "okay";
>> +};
>> +
>> +&usb_host0_ehci {
>> +	status =3D "okay";
>> +};
>> +
>> +&usb_host0_ohci {
>> +	status =3D "okay";
>> +};
>> +
>> +&usb_host1_ehci {
>> +	status =3D "okay";
>> +};
>> +
>> +&usb_host1_ohci {
>> +	status =3D "okay";
>> +};
>> +
>> +&pinctrl {
>> +	pmic {
>> +		pmic_int_l: pmic-int-l {
>> +			rockchip,pins =3D
>> +				<1 21 RK_FUNC_GPIO &pcfg_pull_up>;
>> +		};
>> +
>> +		pmic_dvs2: pmic-dvs2 {
>> +			rockchip,pins =3D
>> +				<1 18 RK_FUNC_GPIO &pcfg_pull_down>;
>> +		};
>> +	};
>> +};
>
>
>
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
