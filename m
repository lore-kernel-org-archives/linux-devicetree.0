From: icenowy-h8G6r0blFSE@public.gmane.org
Subject: Re: [PATCH 1/2] arm64: allwinner: h5: Add initial
 NanoPi NEO2 support
Date: Wed, 31 May 2017 03:09:22 +0800
Message-ID: <0ac7e4973794e99d75001dd6b1adc822@aosc.io>
References: <1496166170-6593-1-git-send-email-jagan@openedev.com>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBZUGW7EQKGQEU3VPIPQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1496166170-6593-1-git-send-email-jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2017-05-31 01:42=EF=BC=8CJagan Teki =E5=86=99=E9=81=93=EF=BC=9A
> From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
>=20
> NanoPi M1 Plus is designed and developed by FriendlyElec
> using the Allwinner 64-bit H5 SOC.

Copy'n'paste error?

>=20
> NanoPi Neo2 key features
> - Allwinner H5, Quad-core 64-bit Cortex-A53
> - 512MB DDR3 RAM
> - microSD slot
> - 10/100/1000M Ethernet
> - Serial Debug Port
> - 5V 2A DC MicroUSB power-supply

Sorry, this time I also submitted it first and merged...

http://lists.infradead.org/pipermail/linux-arm-kernel/2017-April/501672.htm=
l

>=20
> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> ---
>  arch/arm64/boot/dts/allwinner/Makefile             |  1 +
>  .../boot/dts/allwinner/sun50i-h5-nanopi-neo2.dts   | 92=20
> ++++++++++++++++++++++
>  2 files changed, 93 insertions(+)
>  create mode 100644=20
> arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo2.dts
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile
> b/arch/arm64/boot/dts/allwinner/Makefile
> index c1dd6e4..8d50907 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -2,6 +2,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-bananapi-m64.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-nanopi-a64.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-pine64-plus.dtb=20
> sun50i-a64-pine64.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-orangepi-win.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-nanopi-neo2.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-pc2.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-prime.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-zero-plus2.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo2.dts
> b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo2.dts
> new file mode 100644
> index 0000000..c28779f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo2.dts
> @@ -0,0 +1,92 @@
> +/*
> + * Copyright (C) 2017 Jagan Teki <jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dual
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + *
> + *  a) This library is free software; you can redistribute it and/or
> + *     modify it under the terms of the GNU General Public License as
> + *     published by the Free Software Foundation; either version 2 of=20
> the
> + *     License, or (at your option) any later version.
> + *
> + *     This library is distributed in the hope that it will be useful,
> + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *     GNU General Public License for more details.
> + *
> + * Or, alternatively,
> + *
> + *  b) Permission is hereby granted, free of charge, to any person
> + *     obtaining a copy of this software and associated documentation
> + *     files (the "Software"), to deal in the Software without
> + *     restriction, including without limitation the rights to use,
> + *     copy, modify, merge, publish, distribute, sublicense, and/or
> + *     sell copies of the Software, and to permit persons to whom the
> + *     Software is furnished to do so, subject to the following
> + *     conditions:
> + *
> + *     The above copyright notice and this permission notice shall be
> + *     included in all copies or substantial portions of the Software.
> + *
> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + *     OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +/dts-v1/;
> +
> +#include "sun50i-h5.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	model =3D "FriendlyARM NanoPi NEO2";
> +	compatible =3D "friendlyarm,nanopi-neo2", "allwinner,sun50i-h5";
> +
> +	aliases {
> +		serial0 =3D &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	memory {
> +		reg =3D <0x40000000 0x20000000>;
> +	};
> +
> +	soc {
> +		reg_vcc3v3: vcc3v3 {
> +			compatible =3D "regulator-fixed";
> +			regulator-name =3D "vcc3v3";
> +			regulator-min-microvolt =3D <3300000>;
> +			regulator-max-microvolt =3D <3300000>;
> +		};
> +	};
> +};
> +
> +&mmc0 {
> +	compatible =3D "allwinner,sun50i-h5-mmc",
> +		     "allwinner,sun50i-a64-mmc",
> +		     "allwinner,sun5i-a13-mmc";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc0_pins_a>, <&mmc0_cd_pin>;
> +	vmmc-supply =3D <&reg_vcc3v3>;
> +	bus-width =3D <4>;
> +	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_HIGH>;
> +	cd-inverted;
> +	status =3D "okay";
> +};
> +
> +&uart0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart0_pins_a>;
> +	status =3D "okay";
> +};

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
