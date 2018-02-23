From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v3 6/7] arm64: allwinner: h6: add the
 basical Allwinner H6 DTSI file
Date: Fri, 23 Feb 2018 23:22:06 +0800
Message-ID: <81D53DC5-7622-430E-A530-ED0DE5397DC3@aosc.io>
References: <20180223123555.64009-6-icenowy@aosc.io> <20180223123555.64009-7-icenowy@aosc.io> <20180223152038.2bflylwa6vj4gzfj@flea.lan>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBNPDYDKAKGQEKTYVUVQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180223152038.2bflylwa6vj4gzfj-ZC1Zs529Oq4@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2018=E5=B9=B42=E6=9C=8823=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=8811=
:20:38, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> =E5=86=99=E5=88=B0:
>On Fri, Feb 23, 2018 at 08:35:54PM +0800, Icenowy Zheng wrote:
>> Allwinner H6 is a new SoC with Cortex-A53 cores from Allwinner, with
>its
>> memory map fully reworked and some high-speed peripherals (PCIe, USB
>> 3.0) introduced.
>>=20
>> This commit adds the basical DTSI file of it, including the clock
>> support and UART support.
>>=20
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> Reviewed-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
>> ---
>> Changes in v3:
>> - SPDX license identifier fix.
>>=20
>> Changes in v2:
>> - Add APB1 clock as PIO's APB clock.
>> - Switched to SPDX license identifier.
>>=20
>>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 177
>+++++++++++++++++++++++++++
>>  1 file changed, 177 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
>>=20
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
>b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
>> new file mode 100644
>> index 000000000000..4a6236bd9778
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
>> @@ -0,0 +1,177 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
>> +/*
>> + * Copyright (C) 2017 Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> + */
>> +
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/clock/sun50i-h6-ccu.h>
>> +#include <dt-bindings/reset/sun50i-h6-ccu.h>
>> +
>> +/ {
>> +	interrupt-parent =3D <&gic>;
>> +	#address-cells =3D <1>;
>> +	#size-cells =3D <1>;
>> +
>> +	cpus {
>> +		#address-cells =3D <1>;
>> +		#size-cells =3D <0>;
>> +
>> +		cpu0: cpu@0 {
>> +			compatible =3D "arm,cortex-a53", "arm,armv8";
>> +			device_type =3D "cpu";
>> +			reg =3D <0>;
>> +			enable-method =3D "psci";
>> +		};
>> +
>> +		cpu1: cpu@1 {
>> +			compatible =3D "arm,cortex-a53", "arm,armv8";
>> +			device_type =3D "cpu";
>> +			reg =3D <1>;
>> +			enable-method =3D "psci";
>> +		};
>> +
>> +		cpu2: cpu@2 {
>> +			compatible =3D "arm,cortex-a53", "arm,armv8";
>> +			device_type =3D "cpu";
>> +			reg =3D <2>;
>> +			enable-method =3D "psci";
>> +		};
>> +
>> +		cpu3: cpu@3 {
>> +			compatible =3D "arm,cortex-a53", "arm,armv8";
>> +			device_type =3D "cpu";
>> +			reg =3D <3>;
>> +			enable-method =3D "psci";
>> +		};
>> +	};
>> +
>> +	iosc: internal-osc-clk {
>> +		#clock-cells =3D <0>;
>> +		compatible =3D "fixed-clock";
>> +		clock-frequency =3D <16000000>;
>> +		clock-accuracy =3D <300000000>;
>> +		clock-output-names =3D "iosc";
>> +	};
>
>You're not using it anywhere
>
>> +	osc24M: osc24M_clk {
>> +		#clock-cells =3D <0>;
>> +		compatible =3D "fixed-clock";
>> +		clock-frequency =3D <24000000>;
>> +		clock-output-names =3D "osc24M";
>> +	};
>> +
>> +	osc32k: osc32k_clk {
>> +		#clock-cells =3D <0>;
>> +		compatible =3D "fixed-clock";
>> +		clock-frequency =3D <32768>;
>> +		clock-output-names =3D "osc32k";
>> +	};
>> +
>> +	psci {
>> +		compatible =3D "arm,psci-0.2";
>> +		method =3D "smc";
>> +	};
>
>Is it needed? The bootloader should fill it with whatever version it
>has, shouldn't it?

But we now use ATF rather than U-Boot PSCI. U-Boot will
not fill ATF info.

See A64/H5 device trees.

>
>Thanks!
>Maxime

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
