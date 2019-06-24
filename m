From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v3 9/9] ARM: dts: sun8i: s3: add devicetree
 for Lichee zero plus w/ S3
Date: Mon, 24 Jun 2019 21:43:23 +0800
Message-ID: <1E6AB747-5A4C-4515-A0EB-F0E89F520CF7@aosc.io>
References: <20190623043801.14040-1-icenowy@aosc.io> <20190623043801.14040-10-icenowy@aosc.io> <20190624124301.chwhfalk5o53fm5x@flea>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBCFHYPUAKGQE6SLK6ZQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190624124301.chwhfalk5o53fm5x@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2019=E5=B9=B46=E6=9C=8824=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=888:=
43:01, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> =E5=86=99=E5=88=B0:
>On Sun, Jun 23, 2019 at 12:38:01PM +0800, Icenowy Zheng wrote:
>> Lichee zero plus is a core board made by Sipeed, which includes
>on-board
>> TF slot or SMT SD NAND, and optional SPI NOR or eMMC, a UART debug
>> header, a microUSB slot and a gold finger connector for expansion. It
>> can use either Sochip S3 or Allwinner S3L SoC.
>>
>> Add the basic device tree for the core board, w/o optional onboard
>> storage, and with S3 SoC.
>>
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> ---
>> Changes in v3:
>> - Drop common regulator DTSI usage and added vcc3v3 regulator.
>>
>>  arch/arm/boot/dts/Makefile                    |  1 +
>>  .../boot/dts/sun8i-s3-lichee-zero-plus.dts    |  8 ++++
>>  .../dts/sun8i-s3-s3l-lichee-zero-plus.dtsi    | 44
>+++++++++++++++++++
>>  3 files changed, 53 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/sun8i-s3-lichee-zero-plus.dts
>>  create mode 100644
>arch/arm/boot/dts/sun8i-s3-s3l-lichee-zero-plus.dtsi
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index c4742afe41a7..d24dec29245e 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -1113,6 +1113,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
>>  	sun8i-r16-nintendo-super-nes-classic.dtb \
>>  	sun8i-r16-parrot.dtb \
>>  	sun8i-r40-bananapi-m2-ultra.dtb \
>> +	sun8i-s3-lichee-zero-plus.dtb \
>>  	sun8i-t3-cqa3t-bv3.dtb \
>>  	sun8i-v3s-licheepi-zero.dtb \
>>  	sun8i-v3s-licheepi-zero-dock.dtb \
>> diff --git a/arch/arm/boot/dts/sun8i-s3-lichee-zero-plus.dts
>b/arch/arm/boot/dts/sun8i-s3-lichee-zero-plus.dts
>> new file mode 100644
>> index 000000000000..7d2f6b145190
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/sun8i-s3-lichee-zero-plus.dts
>> @@ -0,0 +1,8 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright (C) 2019 Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> + */
>> +
>> +/dts-v1/;
>> +#include "sun8i-s3.dtsi"
>> +#include "sun8i-s3-s3l-lichee-zero-plus.dtsi"
>> diff --git a/arch/arm/boot/dts/sun8i-s3-s3l-lichee-zero-plus.dtsi
>b/arch/arm/boot/dts/sun8i-s3-s3l-lichee-zero-plus.dtsi
>> new file mode 100644
>> index 000000000000..e68f738c3046
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/sun8i-s3-s3l-lichee-zero-plus.dtsi
>> @@ -0,0 +1,46 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright (C) 2019 Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> + */
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +
>> +/ {
>> +	aliases {
>> +		serial0 =3D &uart0;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path =3D "serial0:115200n8";
>> +	};
>> +
>> +	reg_vcc3v3: vcc3v3 {
>> +		compatible =3D "regulator-fixed";
>> +		regulator-name =3D "vcc3v3";
>> +		regulator-min-microvolt =3D <3300000>;
>> +		regulator-max-microvolt =3D <3300000>;
>> +	};
>> +};
>> +
>> +&mmc0 {
>> +	broken-cd;
>> +	bus-width =3D <4>;
>> +	vmmc-supply =3D <&reg_vcc3v3>;
>> +	status =3D "okay";
>> +};
>> +
>> +&uart0 {
>> +	pinctrl-0 =3D <&uart0_pb_pins>;
>> +	pinctrl-names =3D "default";
>> +	status =3D "okay";
>> +};
>> +
>> +&usb_otg {
>> +	dr_mode =3D "otg";
>> +	status =3D "okay";
>> +};
>> +
>> +&usbphy {
>> +	usb0_id_det-gpios =3D <&pio 5 6 GPIO_ACTIVE_HIGH>;
>> +	status =3D "okay";
>> +};
>
>How can it do OTG if there's no controllable VBUS regulator?

All 5V's are connected together, like Orange Pi Zero.

>
>Maxime
>
>--
>Maxime Ripard, Bootlin
>Embedded Linux and Kernel engineering
>https://bootlin.com

--=20
=E4=BD=BF=E7=94=A8 K-9 Mail =E5=8F=91=E9=80=81=E8=87=AA=E6=88=91=E7=9A=84An=
droid=E8=AE=BE=E5=A4=87=E3=80=82

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
To view this discussion on the web, visit https://groups.google.com/d/msgid=
/linux-sunxi/1E6AB747-5A4C-4515-A0EB-F0E89F520CF7%40aosc.io.
For more options, visit https://groups.google.com/d/optout.
