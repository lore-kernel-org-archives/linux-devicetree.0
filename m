From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH v3 -next 2/2] ARM: dts: sunxi: add support
 for Orange Pi Zero board
Date: Tue, 06 Dec 2016 15:43:30 +0800
Message-ID: <20161206104343.hb8GsYcB@smtp2j.mail.yandex.net>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBO6YTHBAKGQEHQ76ICY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Alexey Kardashevskiy <aik-sLpHqDYs0B2HXe+LvDLADg@public.gmane.org>
Cc: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


2016=E5=B9=B412=E6=9C=886=E6=97=A5 09:51=E4=BA=8E Alexey Kardashevskiy <aik=
@ozlabs.ru>=E5=86=99=E9=81=93=EF=BC=9A
>
> On 03/12/16 02:05, Icenowy Zheng wrote:=20
> > Orange Pi Zero is a board that came with the new Allwinner H2+ SoC and =
a=20
> > SDIO Wi-Fi chip by Allwinner (XR819).=20
> >=20
> > Add a device tree file for it.=20
> >=20
> > Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>=20
> > ---=20
> > Changes since v2:=20
> > - Merged SDIO Wi-Fi patch into it.=20
> > - SDIO Wi-Fi: add a ethernet1 alias to it, as it has no internal NVRAM.=
=20
> > - SDIO Wi-Fi: changed pinctrl binding to generic pinconf=20
> > - removed all gpio pinctrl nodes=20
> > - changed h2plus to h2-plus=20
> > Changes since v1:=20
> > - Convert to generic pinconf bindings.=20
> > - SDIO Wi-Fi: add patch.=20
> >=20
> > Some notes:=20
> > - The uart1 and uart2 is available on the unsoldered gpio header.=20
> > - The onboard USB connector has its Vbus directly connected to DCIN-5V =
(the=20
> >=C2=A0=C2=A0 power jack)=20
> >=20
> >=C2=A0 arch/arm/boot/dts/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +=20
> >=C2=A0 arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts | 159 +++++++++=
+++++++++++++=20
> >=C2=A0 2 files changed, 160 insertions(+)=20
> >=C2=A0 create mode 100644 arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.=
dts=20
> >=20
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile=20
> > index 6447abc..59f6e86 100644=20
> > --- a/arch/arm/boot/dts/Makefile=20
> > +++ b/arch/arm/boot/dts/Makefile=20
> > @@ -844,6 +844,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \=20
> >=C2=A0 sun8i-a33-sinlinx-sina33.dtb \=20
> >=C2=A0 sun8i-a83t-allwinner-h8homlet-v2.dtb \=20
> >=C2=A0 sun8i-a83t-cubietruck-plus.dtb \=20
> > + sun8i-h2-plus-orangepi-zero.dtb \=20
> >=C2=A0 sun8i-h3-bananapi-m2-plus.dtb \=20
> >=C2=A0 sun8i-h3-nanopi-neo.dtb \=20
> >=C2=A0 sun8i-h3-orangepi-2.dtb \=20
> > diff --git a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts b/arch/a=
rm/boot/dts/sun8i-h2-plus-orangepi-zero.dts=20
> > new file mode 100644=20
> > index 0000000..d18807f=20
> > --- /dev/null=20
> > +++ b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts=20
> > @@ -0,0 +1,159 @@=20
> > +/*=20
> > + * Copyright (C) 2016 Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>=20
> > + *=20
> > + * Based on sun8i-h3-orangepi-one.dts, which is:=20
> > + *=C2=A0=C2=A0 Copyright (C) 2016 Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>=
=20
> > + *=20
> > + * This file is dual-licensed: you can use it either under the terms=
=20
> > + * of the GPL or the X11 license, at your option. Note that this dual=
=20
> > + * licensing only applies to this file, and not this project as a=20
> > + * whole.=20
> > + *=20
> > + *=C2=A0 a) This file is free software; you can redistribute it and/or=
=20
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 modify it under the terms of the GNU Genera=
l Public License as=20
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 published by the Free Software Foundation; =
either version 2 of the=20
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 License, or (at your option) any later vers=
ion.=20
> > + *=20
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 This file is distributed in the hope that i=
t will be useful,=20
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 but WITHOUT ANY WARRANTY; without even the =
implied warranty of=20
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR=
 PURPOSE.=C2=A0 See the=20
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 GNU General Public License for more details=
.=20
> > + *=20
> > + * Or, alternatively,=20
> > + *=20
> > + *=C2=A0 b) Permission is hereby granted, free of charge, to any perso=
n=20
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 obtaining a copy of this software and assoc=
iated documentation=20
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 files (the "Software"), to deal in the Soft=
ware without=20
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 restriction, including without limitation t=
he rights to use,=20
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 copy, modify, merge, publish, distribute, s=
ublicense, and/or=20
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 sell copies of the Software, and to permit =
persons to whom the=20
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 Software is furnished to do so, subject to =
the following=20
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 conditions:=20
> > + *=20
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 The above copyright notice and this permiss=
ion notice shall be=20
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 included in all copies or substantial porti=
ons of the Software.=20
> > + *=20
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT W=
ARRANTY OF ANY KIND,=20
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMIT=
ED TO THE WARRANTIES=20
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 OF MERCHANTABILITY, FITNESS FOR A PARTICULA=
R PURPOSE AND=20
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 NONINFRINGEMENT. IN NO EVENT SHALL THE AUTH=
ORS OR COPYRIGHT=20
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR=
 OTHER LIABILITY,=20
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 WHETHER IN AN ACTION OF CONTRACT, TORT OR O=
THERWISE, ARISING=20
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 FROM, OUT OF OR IN CONNECTION WITH THE SOFT=
WARE OR THE USE OR=20
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 OTHER DEALINGS IN THE SOFTWARE.=20
> > + */=20
> > +=20
> > +/dts-v1/;=20
> > +#include "sun8i-h3.dtsi"=20
> > +#include "sunxi-common-regulators.dtsi"=20
> > +=20
> > +#include <dt-bindings/gpio/gpio.h>=20
> > +#include <dt-bindings/input/input.h>=20
> > +#include <dt-bindings/pinctrl/sun4i-a10.h>=20
> > +=20
> > +/ {=20
> > + model =3D "Xunlong Orange Pi Zero";=20
> > + compatible =3D "xunlong,orangepi-zero", "allwinner,sun8i-h2-plus";=20
> > +=20
> > + aliases {=20
> > + serial0 =3D &uart0;=20
> > + /* ethernet0 is the H3 emac, defined in sun8i-h3.dtsi */=20
>
>
> It is not defined there as for:=20
>
> cef87e9 (tag: next-20161205) 20 hours ago Stephen Rothwell Add linux-next=
=20
> specific files for 20161205=20

The driver of H3's obfuscated DesignWare MAC is not yet mainlined, so there=
 won't be one ethernet0 now.

But it's reserved for the onboard Ethernet.

>
>
>
>
>
> > + ethernet1 =3D &xr819;=20
> > + };=20
> > +=20
> > + chosen {=20
> > + stdout-path =3D "serial0:115200n8";=20
> > + };=20
> > +=20
> > + leds {=20
> > + compatible =3D "gpio-leds";=20
> > +=20
> > + pwr_led {=20
> > + label =3D "orangepi:green:pwr";=20
> > + gpios =3D <&r_pio 0 10 GPIO_ACTIVE_HIGH>;=20
> > + default-state =3D "on";=20
> > + };=20
> > +=20
> > + status_led {=20
> > + label =3D "orangepi:red:status";=20
> > + gpios =3D <&pio 0 17 GPIO_ACTIVE_HIGH>;=20
> > + };=20
> > + };=20
> > +=20
> > + reg_vcc_wifi: reg_vcc_wifi {=20
> > + compatible =3D "regulator-fixed";=20
> > + regulator-min-microvolt =3D <3300000>;=20
> > + regulator-max-microvolt =3D <3300000>;=20
> > + regulator-name =3D "vcc-wifi";=20
> > + enable-active-high;=20
> > + gpio =3D <&pio 0 20 GPIO_ACTIVE_HIGH>;=20
> > + };=20
> > +=20
> > + wifi_pwrseq: wifi_pwrseq {=20
> > + compatible =3D "mmc-pwrseq-simple";=20
> > + reset-gpios =3D <&r_pio 0 7 GPIO_ACTIVE_LOW>;=20
> > + };=20
> > +};=20
> > +=20
> > +&ehci1 {=20
> > + status =3D "okay";=20
> > +};=20
> > +=20
> > +&mmc0 {=20
> > + pinctrl-names =3D "default";=20
> > + pinctrl-0 =3D <&mmc0_pins_a>;=20
> > + vmmc-supply =3D <&reg_vcc3v3>;=20
> > + bus-width =3D <4>;=20
> > + cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_HIGH>; /* PF6 */=20
> > + cd-inverted;=20
> > + status =3D "okay";=20
> > +};=20
> > +=20
> > +&mmc1 {=20
> > + pinctrl-names =3D "default";=20
> > + pinctrl-0 =3D <&mmc1_pins_a>;=20
> > + vmmc-supply =3D <&reg_vcc_wifi>;=20
> > + mmc-pwrseq =3D <&wifi_pwrseq>;=20
> > + bus-width =3D <4>;=20
> > + non-removable;=20
> > + status =3D "okay";=20
> > +=20
> > + /*=20
> > + * Explicitly define the sdio device, so that we can add an ethernet=
=20
> > + * alias for it (which e.g. makes u-boot set a mac-address).=20
> > + */=20
> > + xr819: sdio_wifi@1 {=20
> > + reg =3D <1>;=20
> > + };=20
> > +};=20
> > +=20
> > +&mmc1_pins_a {=20
> > + bias-pull-up;=20
> > +};=20
> > +=20
> > +&ohci1 {=20
> > + status =3D "okay";=20
> > +};=20
> > +=20
> > +&uart0 {=20
> > + pinctrl-names =3D "default";=20
> > + pinctrl-0 =3D <&uart0_pins_a>;=20
> > + status =3D "okay";=20
> > +};=20
> > +=20
> > +&uart1 {=20
> > + pinctrl-names =3D "default";=20
> > + pinctrl-0 =3D <&uart1_pins>;=20
> > + status =3D "disabled";=20
> > +};=20
> > +=20
> > +&uart2 {=20
> > + pinctrl-names =3D "default";=20
> > + pinctrl-0 =3D <&uart2_pins>;=20
> > + status =3D "disabled";=20
> > +};=20
> > +=20
> > +&usbphy {=20
> > + /* USB VBUS is always on */=20
> > + status =3D "okay";=20
> > +};=20
> >=20
>
>
> --=20
> Alexey=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
