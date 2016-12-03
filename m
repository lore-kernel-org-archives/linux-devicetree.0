From: Jernej Skrabec <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 -next 2/2] ARM: dts: sunxi: add support
 for Orange Pi Zero board
Date: Sat, 3 Dec 2016 01:43:31 -0800 (PST)
Message-ID: <375fb14a-340d-4d2b-ab07-5cb1c4e2356c@googlegroups.com>
References: <20161202150513.34691-1-icenowy@aosc.xyz> <20161202150513.34691-2-icenowy@aosc.xyz>
 <CAGb2v661hBsd7tBcYByeRKEZh+8YMB3ewbnkrT3rUvzP2f90yQ@mail.gmail.com>
Reply-To: jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_980_1421047783.1480758211693"
Return-path: <linux-sunxi+bncBDP4JJM5QYGRBRFHRLBAKGQEPAW5URY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v661hBsd7tBcYByeRKEZh+8YMB3ewbnkrT3rUvzP2f90yQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: icenowy-ymACFijhrKM@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, andre.przywara-5wv7dgnIgG8@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_980_1421047783.1480758211693
Content-Type: multipart/alternative;
	boundary="----=_Part_981_204372029.1480758211694"

------=_Part_981_204372029.1480758211694
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Dne petek, 02. december 2016 17.42.04 UTC+1 je oseba Chen-Yu Tsai napisala:
>
> Hi,=20
>
> On Fri, Dec 2, 2016 at 11:05 PM, Icenowy Zheng <ice...-ymACFijhrKM@public.gmane.org=20
> <javascript:>> wrote:=20
> > Orange Pi Zero is a board that came with the new Allwinner H2+ SoC and =
a=20
> > SDIO Wi-Fi chip by Allwinner (XR819).=20
> >=20
> > Add a device tree file for it.=20
> >=20
> > Signed-off-by: Icenowy Zheng <ice...-ymACFijhrKM@public.gmane.org <javascript:>>=20
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
> > - The onboard USB connector has its Vbus directly connected to DCIN-5V=
=20
> (the=20
> >   power jack)=20
> >=20
> >  arch/arm/boot/dts/Makefile                        |   1 +=20
> >  arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts | 159=20
> ++++++++++++++++++++++=20
> >  2 files changed, 160 insertions(+)=20
> >  create mode 100644 arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts=
=20
> >=20
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile=20
> > index 6447abc..59f6e86 100644=20
> > --- a/arch/arm/boot/dts/Makefile=20
> > +++ b/arch/arm/boot/dts/Makefile=20
> > @@ -844,6 +844,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \=20
> >         sun8i-a33-sinlinx-sina33.dtb \=20
> >         sun8i-a83t-allwinner-h8homlet-v2.dtb \=20
> >         sun8i-a83t-cubietruck-plus.dtb \=20
> > +       sun8i-h2-plus-orangepi-zero.dtb \=20
> >         sun8i-h3-bananapi-m2-plus.dtb \=20
> >         sun8i-h3-nanopi-neo.dtb \=20
> >         sun8i-h3-orangepi-2.dtb \=20
> > diff --git a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts=20
> b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts=20
> > new file mode 100644=20
> > index 0000000..d18807f=20
> > --- /dev/null=20
> > +++ b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts=20
> > @@ -0,0 +1,159 @@=20
> > +/*=20
> > + * Copyright (C) 2016 Icenowy Zheng <ice...-ymACFijhrKM@public.gmane.org <javascript:>>=20
> > + *=20
> > + * Based on sun8i-h3-orangepi-one.dts, which is:=20
> > + *   Copyright (C) 2016 Hans de Goede <hdeg...-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org <javascript:=
>>=20
>
> > + *=20
> > + * This file is dual-licensed: you can use it either under the terms=
=20
> > + * of the GPL or the X11 license, at your option. Note that this dual=
=20
> > + * licensing only applies to this file, and not this project as a=20
> > + * whole.=20
> > + *=20
> > + *  a) This file is free software; you can redistribute it and/or=20
> > + *     modify it under the terms of the GNU General Public License as=
=20
> > + *     published by the Free Software Foundation; either version 2 of=
=20
> the=20
> > + *     License, or (at your option) any later version.=20
> > + *=20
> > + *     This file is distributed in the hope that it will be useful,=20
> > + *     but WITHOUT ANY WARRANTY; without even the implied warranty of=
=20
> > + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the=
=20
> > + *     GNU General Public License for more details.=20
> > + *=20
> > + * Or, alternatively,=20
> > + *=20
> > + *  b) Permission is hereby granted, free of charge, to any person=20
> > + *     obtaining a copy of this software and associated documentation=
=20
> > + *     files (the "Software"), to deal in the Software without=20
> > + *     restriction, including without limitation the rights to use,=20
> > + *     copy, modify, merge, publish, distribute, sublicense, and/or=20
> > + *     sell copies of the Software, and to permit persons to whom the=
=20
> > + *     Software is furnished to do so, subject to the following=20
> > + *     conditions:=20
> > + *=20
> > + *     The above copyright notice and this permission notice shall be=
=20
> > + *     included in all copies or substantial portions of the Software.=
=20
> > + *=20
> > + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,=
=20
> > + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES=
=20
> > + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND=20
> > + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT=20
> > + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,=20
> > + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=20
> > + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR=
=20
> > + *     OTHER DEALINGS IN THE SOFTWARE.=20
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
> > +       model =3D "Xunlong Orange Pi Zero";=20
> > +       compatible =3D "xunlong,orangepi-zero", "allwinner,sun8i-h2-plu=
s";=20
> > +=20
> > +       aliases {=20
> > +               serial0 =3D &uart0;=20
> > +               /* ethernet0 is the H3 emac, defined in sun8i-h3.dtsi *=
/=20
> > +               ethernet1 =3D &xr819;=20
> > +       };=20
> > +=20
> > +       chosen {=20
> > +               stdout-path =3D "serial0:115200n8";=20
> > +       };=20
> > +=20
> > +       leds {=20
> > +               compatible =3D "gpio-leds";=20
> > +=20
> > +               pwr_led {=20
> > +                       label =3D "orangepi:green:pwr";=20
> > +                       gpios =3D <&r_pio 0 10 GPIO_ACTIVE_HIGH>;=20
> > +                       default-state =3D "on";=20
> > +               };=20
> > +=20
> > +               status_led {=20
> > +                       label =3D "orangepi:red:status";=20
> > +                       gpios =3D <&pio 0 17 GPIO_ACTIVE_HIGH>;=20
> > +               };=20
> > +       };=20
> > +=20
> > +       reg_vcc_wifi: reg_vcc_wifi {=20
> > +               compatible =3D "regulator-fixed";=20
> > +               regulator-min-microvolt =3D <3300000>;=20
> > +               regulator-max-microvolt =3D <3300000>;=20
> > +               regulator-name =3D "vcc-wifi";=20
> > +               enable-active-high;=20
> > +               gpio =3D <&pio 0 20 GPIO_ACTIVE_HIGH>;=20
> > +       };=20
> > +=20
> > +       wifi_pwrseq: wifi_pwrseq {=20
> > +               compatible =3D "mmc-pwrseq-simple";=20
> > +               reset-gpios =3D <&r_pio 0 7 GPIO_ACTIVE_LOW>;=20
> > +       };=20
> > +};=20
> > +=20
> > +&ehci1 {=20
> > +       status =3D "okay";=20
> > +};=20
> > +=20
> > +&mmc0 {=20
> > +       pinctrl-names =3D "default";=20
> > +       pinctrl-0 =3D <&mmc0_pins_a>;=20
> > +       vmmc-supply =3D <&reg_vcc3v3>;=20
> > +       bus-width =3D <4>;=20
> > +       cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_HIGH>; /* PF6 */=20
> > +       cd-inverted;=20
> > +       status =3D "okay";=20
> > +};=20
> > +=20
> > +&mmc1 {=20
> > +       pinctrl-names =3D "default";=20
> > +       pinctrl-0 =3D <&mmc1_pins_a>;=20
> > +       vmmc-supply =3D <&reg_vcc_wifi>;=20
> > +       mmc-pwrseq =3D <&wifi_pwrseq>;=20
> > +       bus-width =3D <4>;=20
> > +       non-removable;=20
> > +       status =3D "okay";=20
> > +=20
> > +       /*=20
> > +        * Explicitly define the sdio device, so that we can add an=20
> ethernet=20
> > +        * alias for it (which e.g. makes u-boot set a mac-address).=20
> > +        */=20
> > +       xr819: sdio_wifi@1 {=20
> > +               reg =3D <1>;=20
> > +       };=20
> > +};=20
> > +=20
> > +&mmc1_pins_a {=20
> > +       bias-pull-up;=20
>
> This is already set in h3.dtsi=20
>
> > +};=20
> > +=20
> > +&ohci1 {=20
> > +       status =3D "okay";=20
> > +};=20
> > +=20
> > +&uart0 {=20
> > +       pinctrl-names =3D "default";=20
> > +       pinctrl-0 =3D <&uart0_pins_a>;=20
> > +       status =3D "okay";=20
> > +};=20
> > +=20
> > +&uart1 {=20
> > +       pinctrl-names =3D "default";=20
> > +       pinctrl-0 =3D <&uart1_pins>;=20
> > +       status =3D "disabled";=20
> > +};=20
> > +=20
> > +&uart2 {=20
> > +       pinctrl-names =3D "default";=20
> > +       pinctrl-0 =3D <&uart2_pins>;=20
> > +       status =3D "disabled";=20
> > +};=20
> > +=20
> > +&usbphy {=20
> > +       /* USB VBUS is always on */=20
>
> I think this comment could use a little work.=20
>
> AFAIK this board doesn't have an actual USB port.=20
> It's just the D+/D- pins on the pin header, along=20
> with the board-wide 5V, also on the pin header.=20
>

How is addon board handled then? It has two USBs,
IR, audio, mic and probably also TV out. I can't see
any obvious way how to detect that the addon board
is plugged in from the image.

https://www.aliexpress.com/item/New-Orange-Pi-Zreo-Expansion-board-Interfac=
e-board-Development-board-beyond-Raspberry-Pi/32770665186.html

Best regards,
Jernej =C5=A0krabec
=20

>
> ChenYu=20
>
> > +       status =3D "okay";=20
> > +};=20
> > --=20
> > 2.10.2=20
> >=20
> > --=20
> > You received this message because you are subscribed to the Google=20
> Groups "linux-sunxi" group.=20
> > To unsubscribe from this group and stop receiving emails from it, send=
=20
> an email to linux-sunxi...-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org <javascript:>.=20
> > For more options, visit https://groups.google.com/d/optout.=20
>

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_981_204372029.1480758211694
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br>Dne petek, 02. december 2016 17.42.04 UTC+1 je =
oseba Chen-Yu Tsai napisala:<blockquote class=3D"gmail_quote" style=3D"marg=
in: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">Hi=
,
<br>
<br>On Fri, Dec 2, 2016 at 11:05 PM, Icenowy Zheng &lt;<a href=3D"javascrip=
t:" target=3D"_blank" gdf-obfuscated-mailto=3D"hoDLIWk0CwAJ" rel=3D"nofollo=
w" onmousedown=3D"this.href=3D&#39;javascript:&#39;;return true;" onclick=
=3D"this.href=3D&#39;javascript:&#39;;return true;">ice...-ymACFijhrKM@public.gmane.org</a>&gt;=
 wrote:
<br>&gt; Orange Pi Zero is a board that came with the new Allwinner H2+ SoC=
 and a
<br>&gt; SDIO Wi-Fi chip by Allwinner (XR819).
<br>&gt;
<br>&gt; Add a device tree file for it.
<br>&gt;
<br>&gt; Signed-off-by: Icenowy Zheng &lt;<a href=3D"javascript:" target=3D=
"_blank" gdf-obfuscated-mailto=3D"hoDLIWk0CwAJ" rel=3D"nofollow" onmousedow=
n=3D"this.href=3D&#39;javascript:&#39;;return true;" onclick=3D"this.href=
=3D&#39;javascript:&#39;;return true;">ice...-ymACFijhrKM@public.gmane.org</a>&gt;
<br>&gt; ---
<br>&gt; Changes since v2:
<br>&gt; - Merged SDIO Wi-Fi patch into it.
<br>&gt; - SDIO Wi-Fi: add a ethernet1 alias to it, as it has no internal N=
VRAM.
<br>&gt; - SDIO Wi-Fi: changed pinctrl binding to generic pinconf
<br>&gt; - removed all gpio pinctrl nodes
<br>&gt; - changed h2plus to h2-plus
<br>&gt; Changes since v1:
<br>&gt; - Convert to generic pinconf bindings.
<br>&gt; - SDIO Wi-Fi: add patch.
<br>&gt;
<br>&gt; Some notes:
<br>&gt; - The uart1 and uart2 is available on the unsoldered gpio header.
<br>&gt; - The onboard USB connector has its Vbus directly connected to DCI=
N-5V (the
<br>&gt; =C2=A0 power jack)
<br>&gt;
<br>&gt; =C2=A0arch/arm/boot/dts/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 1 +
<br>&gt; =C2=A0arch/arm/boot/dts/sun8i-h2-<wbr>plus-orangepi-zero.dts | 159=
 ++++++++++++++++++++++
<br>&gt; =C2=A02 files changed, 160 insertions(+)
<br>&gt; =C2=A0create mode 100644 arch/arm/boot/dts/sun8i-h2-<wbr>plus-oran=
gepi-zero.dts
<br>&gt;
<br>&gt; diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefi=
le
<br>&gt; index 6447abc..59f6e86 100644
<br>&gt; --- a/arch/arm/boot/dts/Makefile
<br>&gt; +++ b/arch/arm/boot/dts/Makefile
<br>&gt; @@ -844,6 +844,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 sun8i-a33-sinlinx-sina33.dtb \
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 sun8i-a83t-allwinner-h8homlet-<wbr>v2.=
dtb \
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 sun8i-a83t-cubietruck-plus.dtb \
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 sun8i-h2-plus-orangepi-zero.<wbr>dtb \
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 sun8i-h3-bananapi-m2-plus.dtb \
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 sun8i-h3-nanopi-neo.dtb \
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 sun8i-h3-orangepi-2.dtb \
<br>&gt; diff --git a/arch/arm/boot/dts/sun8i-h2-<wbr>plus-orangepi-zero.dt=
s b/arch/arm/boot/dts/sun8i-h2-<wbr>plus-orangepi-zero.dts
<br>&gt; new file mode 100644
<br>&gt; index 0000000..d18807f
<br>&gt; --- /dev/null
<br>&gt; +++ b/arch/arm/boot/dts/sun8i-h2-<wbr>plus-orangepi-zero.dts
<br>&gt; @@ -0,0 +1,159 @@
<br>&gt; +/*
<br>&gt; + * Copyright (C) 2016 Icenowy Zheng &lt;<a href=3D"javascript:" t=
arget=3D"_blank" gdf-obfuscated-mailto=3D"hoDLIWk0CwAJ" rel=3D"nofollow" on=
mousedown=3D"this.href=3D&#39;javascript:&#39;;return true;" onclick=3D"thi=
s.href=3D&#39;javascript:&#39;;return true;">ice...-ymACFijhrKM@public.gmane.org</a>&gt;
<br>&gt; + *
<br>&gt; + * Based on sun8i-h3-orangepi-one.dts, which is:
<br>&gt; + * =C2=A0 Copyright (C) 2016 Hans de Goede &lt;<a href=3D"javascr=
ipt:" target=3D"_blank" gdf-obfuscated-mailto=3D"hoDLIWk0CwAJ" rel=3D"nofol=
low" onmousedown=3D"this.href=3D&#39;javascript:&#39;;return true;" onclick=
=3D"this.href=3D&#39;javascript:&#39;;return true;">hdeg...-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org</a>&=
gt;
<br>&gt; + *
<br>&gt; + * This file is dual-licensed: you can use it either under the te=
rms
<br>&gt; + * of the GPL or the X11 license, at your option. Note that this =
dual
<br>&gt; + * licensing only applies to this file, and not this project as a
<br>&gt; + * whole.
<br>&gt; + *
<br>&gt; + * =C2=A0a) This file is free software; you can redistribute it a=
nd/or
<br>&gt; + * =C2=A0 =C2=A0 modify it under the terms of the GNU General Pub=
lic License as
<br>&gt; + * =C2=A0 =C2=A0 published by the Free Software Foundation; eithe=
r version 2 of the
<br>&gt; + * =C2=A0 =C2=A0 License, or (at your option) any later version.
<br>&gt; + *
<br>&gt; + * =C2=A0 =C2=A0 This file is distributed in the hope that it wil=
l be useful,
<br>&gt; + * =C2=A0 =C2=A0 but WITHOUT ANY WARRANTY; without even the impli=
ed warranty of
<br>&gt; + * =C2=A0 =C2=A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURP=
OSE. =C2=A0See the
<br>&gt; + * =C2=A0 =C2=A0 GNU General Public License for more details.
<br>&gt; + *
<br>&gt; + * Or, alternatively,
<br>&gt; + *
<br>&gt; + * =C2=A0b) Permission is hereby granted, free of charge, to any =
person
<br>&gt; + * =C2=A0 =C2=A0 obtaining a copy of this software and associated=
 documentation
<br>&gt; + * =C2=A0 =C2=A0 files (the &quot;Software&quot;), to deal in the=
 Software without
<br>&gt; + * =C2=A0 =C2=A0 restriction, including without limitation the ri=
ghts to use,
<br>&gt; + * =C2=A0 =C2=A0 copy, modify, merge, publish, distribute, sublic=
ense, and/or
<br>&gt; + * =C2=A0 =C2=A0 sell copies of the Software, and to permit perso=
ns to whom the
<br>&gt; + * =C2=A0 =C2=A0 Software is furnished to do so, subject to the f=
ollowing
<br>&gt; + * =C2=A0 =C2=A0 conditions:
<br>&gt; + *
<br>&gt; + * =C2=A0 =C2=A0 The above copyright notice and this permission n=
otice shall be
<br>&gt; + * =C2=A0 =C2=A0 included in all copies or substantial portions o=
f the Software.
<br>&gt; + *
<br>&gt; + * =C2=A0 =C2=A0 THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITH=
OUT WARRANTY OF ANY KIND,
<br>&gt; + * =C2=A0 =C2=A0 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO=
 THE WARRANTIES
<br>&gt; + * =C2=A0 =C2=A0 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PUR=
POSE AND
<br>&gt; + * =C2=A0 =C2=A0 NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS O=
R COPYRIGHT
<br>&gt; + * =C2=A0 =C2=A0 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHE=
R LIABILITY,
<br>&gt; + * =C2=A0 =C2=A0 WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERW=
ISE, ARISING
<br>&gt; + * =C2=A0 =C2=A0 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE =
OR THE USE OR
<br>&gt; + * =C2=A0 =C2=A0 OTHER DEALINGS IN THE SOFTWARE.
<br>&gt; + */
<br>&gt; +
<br>&gt; +/dts-v1/;
<br>&gt; +#include &quot;sun8i-h3.dtsi&quot;
<br>&gt; +#include &quot;sunxi-common-regulators.dtsi&quot;
<br>&gt; +
<br>&gt; +#include &lt;dt-bindings/gpio/gpio.h&gt;
<br>&gt; +#include &lt;dt-bindings/input/input.h&gt;
<br>&gt; +#include &lt;dt-bindings/pinctrl/sun4i-<wbr>a10.h&gt;
<br>&gt; +
<br>&gt; +/ {
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 model =3D &quot;Xunlong Orange Pi Zero&quot=
;;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;xunlong,orangepi-zero&=
quot;, &quot;allwinner,sun8i-h2-plus&quot;;
<br>&gt; +
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 aliases {
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 serial0 =3D &am=
p;uart0;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* ethernet0 is=
 the H3 emac, defined in sun8i-h3.dtsi */
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ethernet1 =3D &=
amp;xr819;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 };
<br>&gt; +
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 chosen {
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stdout-path =3D=
 &quot;serial0:115200n8&quot;;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 };
<br>&gt; +
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 leds {
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D =
&quot;gpio-leds&quot;;
<br>&gt; +
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pwr_led {
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 label =3D &quot;orangepi:green:pwr&quot;;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 gpios =3D &lt;&amp;r_pio 0 10 GPIO_ACTIVE_HIGH&gt;;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 default-state =3D &quot;on&quot;;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };
<br>&gt; +
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status_led {
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 label =3D &quot;orangepi:red:status&quot;;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 gpios =3D &lt;&amp;pio 0 17 GPIO_ACTIVE_HIGH&gt;;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 };
<br>&gt; +
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 reg_vcc_wifi: reg_vcc_wifi {
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D =
&quot;regulator-fixed&quot;;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 regulator-min-m=
icrovolt =3D &lt;3300000&gt;;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 regulator-max-m=
icrovolt =3D &lt;3300000&gt;;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 regulator-name =
=3D &quot;vcc-wifi&quot;;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enable-active-h=
igh;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpio =3D &lt;&a=
mp;pio 0 20 GPIO_ACTIVE_HIGH&gt;;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 };
<br>&gt; +
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 wifi_pwrseq: wifi_pwrseq {
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D =
&quot;mmc-pwrseq-simple&quot;;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reset-gpios =3D=
 &lt;&amp;r_pio 0 7 GPIO_ACTIVE_LOW&gt;;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 };
<br>&gt; +};
<br>&gt; +
<br>&gt; +&amp;ehci1 {
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;
<br>&gt; +};
<br>&gt; +
<br>&gt; +&amp;mmc0 {
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 pinctrl-names =3D &quot;default&quot;;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 pinctrl-0 =3D &lt;&amp;mmc0_pins_a&gt;;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 vmmc-supply =3D &lt;&amp;reg_vcc3v3&gt;;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 bus-width =3D &lt;4&gt;;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 cd-gpios =3D &lt;&amp;pio 5 6 GPIO_ACTIVE_H=
IGH&gt;; /* PF6 */
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 cd-inverted;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;
<br>&gt; +};
<br>&gt; +
<br>&gt; +&amp;mmc1 {
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 pinctrl-names =3D &quot;default&quot;;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 pinctrl-0 =3D &lt;&amp;mmc1_pins_a&gt;;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 vmmc-supply =3D &lt;&amp;reg_vcc_wifi&gt;;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 mmc-pwrseq =3D &lt;&amp;wifi_pwrseq&gt;;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 bus-width =3D &lt;4&gt;;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 non-removable;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;
<br>&gt; +
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 /*
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* Explicitly define the sdio device, =
so that we can add an ethernet
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0* alias for it (which e.g. makes u-bo=
ot set a mac-address).
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 xr819: sdio_wifi@1 {
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;1&g=
t;;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 };
<br>&gt; +};
<br>&gt; +
<br>&gt; +&amp;mmc1_pins_a {
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 bias-pull-up;
<br>
<br>This is already set in h3.dtsi
<br>
<br>&gt; +};
<br>&gt; +
<br>&gt; +&amp;ohci1 {
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;
<br>&gt; +};
<br>&gt; +
<br>&gt; +&amp;uart0 {
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 pinctrl-names =3D &quot;default&quot;;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 pinctrl-0 =3D &lt;&amp;uart0_pins_a&gt;;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;
<br>&gt; +};
<br>&gt; +
<br>&gt; +&amp;uart1 {
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 pinctrl-names =3D &quot;default&quot;;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 pinctrl-0 =3D &lt;&amp;uart1_pins&gt;;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 status =3D &quot;disabled&quot;;
<br>&gt; +};
<br>&gt; +
<br>&gt; +&amp;uart2 {
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 pinctrl-names =3D &quot;default&quot;;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 pinctrl-0 =3D &lt;&amp;uart2_pins&gt;;
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 status =3D &quot;disabled&quot;;
<br>&gt; +};
<br>&gt; +
<br>&gt; +&amp;usbphy {
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 /* USB VBUS is always on */
<br>
<br>I think this comment could use a little work.
<br>
<br>AFAIK this board doesn&#39;t have an actual USB port.
<br>It&#39;s just the D+/D- pins on the pin header, along
<br>with the board-wide 5V, also on the pin header.
<br></blockquote><div><br>How is addon board handled then? It has two USBs,=
<br>IR, audio, mic and probably also TV out. I can&#39;t see<br>any obvious=
 way how to detect that the addon board<br>is plugged in from the image.<br=
><br>https://www.aliexpress.com/item/New-Orange-Pi-Zreo-Expansion-board-Int=
erface-board-Development-board-beyond-Raspberry-Pi/32770665186.html<br><br>=
Best regards,<br>Jernej =C5=A0krabec<br>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc soli=
d;padding-left: 1ex;">
<br>ChenYu
<br>
<br>&gt; + =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;
<br>&gt; +};
<br>&gt; --
<br>&gt; 2.10.2
<br>&gt;
<br>&gt; --
<br>&gt; You received this message because you are subscribed to the Google=
 Groups &quot;linux-sunxi&quot; group.
<br>&gt; To unsubscribe from this group and stop receiving emails from it, =
send an email to <a href=3D"javascript:" target=3D"_blank" gdf-obfuscated-m=
ailto=3D"hoDLIWk0CwAJ" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;jav=
ascript:&#39;;return true;" onclick=3D"this.href=3D&#39;javascript:&#39;;re=
turn true;">linux-sunxi...@<wbr>googlegroups.com</a>.
<br>&gt; For more options, visit <a href=3D"https://groups.google.com/d/opt=
out" target=3D"_blank" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;htt=
ps://groups.google.com/d/optout&#39;;return true;" onclick=3D"this.href=3D&=
#39;https://groups.google.com/d/optout&#39;;return true;">https://groups.go=
ogle.com/d/<wbr>optout</a>.
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_981_204372029.1480758211694--

------=_Part_980_1421047783.1480758211693--
