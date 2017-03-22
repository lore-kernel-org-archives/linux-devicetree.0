From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: sun8i: add device tree for
 Lichee Pi Zero with Dock
Date: Thu, 23 Mar 2017 03:34:18 +0800
Message-ID: <20170322223427.YNp8w8sn@smtp3m.mail.yandex.net>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBSNDZPDAKGQEXEI6N5A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


2017=E5=B9=B43=E6=9C=8823=E6=97=A5 03:24=E4=BA=8E Maxime Ripard <maxime.rip=
ard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Mar 17, 2017 at 11:43:43PM +0800, Icenowy Zheng wrote:=20
> > Lichee Pi Zero features a dock, which adds some functions, and should b=
e=20
> > soldered with the core board of Lichee Pi Zero.=20
> >=20
> > Add support for the dock as a new dts, as soldering is needed to make=
=20
> > the dock usable and there's functions enabled on the dock that is=20
> > unavailable at the 2.54mm pins of the core board.=20
> >=20
> > Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>=20
> > ---=20
> >=C2=A0 arch/arm/boot/dts/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +-=20
> >=C2=A0 arch/arm/boot/dts/sun8i-v3s-licheepi-zero-dock.dts | 98 +++++++++=
+++++++++++++=20
> >=C2=A0 2 files changed, 100 insertions(+), 1 deletion(-)=20
> >=C2=A0 create mode 100644 arch/arm/boot/dts/sun8i-v3s-licheepi-zero-dock=
.dts=20
> >=20
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile=20
> > index 43c27b624f94..de52d403f818 100644=20
> > --- a/arch/arm/boot/dts/Makefile=20
> > +++ b/arch/arm/boot/dts/Makefile=20
> > @@ -878,7 +878,8 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \=20
> >=C2=A0 sun8i-h3-orangepi-plus.dtb \=20
> >=C2=A0 sun8i-h3-orangepi-plus2e.dtb \=20
> >=C2=A0 sun8i-r16-parrot.dtb \=20
> > - sun8i-v3s-licheepi-zero.dtb=20
> > + sun8i-v3s-licheepi-zero.dtb \=20
> > + sun8i-v3s-licheepi-zero-dock.dtb=20
> >=C2=A0 dtb-$(CONFIG_MACH_SUN9I) +=3D \=20
> >=C2=A0 sun9i-a80-optimus.dtb \=20
> >=C2=A0 sun9i-a80-cubieboard4.dtb=20
> > diff --git a/arch/arm/boot/dts/sun8i-v3s-licheepi-zero-dock.dts b/arch/=
arm/boot/dts/sun8i-v3s-licheepi-zero-dock.dts=20
> > new file mode 100644=20
> > index 000000000000..956fa47fde53=20
> > --- /dev/null=20
> > +++ b/arch/arm/boot/dts/sun8i-v3s-licheepi-zero-dock.dts=20
> > @@ -0,0 +1,98 @@=20
> > +/*=20
> > + * Copyright (C) 2016 Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>=20
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
> > +#include "sun8i-v3s-licheepi-zero.dts"=20
> > +=20
> > +#include <dt-bindings/input/input.h>=20
> > +=20
> > +/ {=20
> > + model =3D "Lichee Pi Zero with Dock";=20
> > + compatible =3D "licheepi,licheepi-zero-dock", "licheepi,licheepi-zero=
",=20
> > + =C2=A0=C2=A0=C2=A0=C2=A0 "allwinner,sun8i-v3s";=20
> > +};=20
> > +=20
> > +&leds {=20
> > + /* The LEDs conflict with MMC1 slot */=20
>
> How does it conflicts?=20

They both use PGx.

>
> > +&mmc1 {=20
> > + pinctrl-0 =3D <&mmc1_pins>;=20
> > + pinctrl-names =3D "default";=20
> > + broken-cd;=20
>
> There's no card-detect on a GPIO?=20

Yes.

All SD slots on Lichee Pi series have no card-detect.

>
> Maxime=20
>
> --=20
> Maxime Ripard, Free Electrons=20
> Embedded Linux and Kernel engineering=20
> http://free-electrons.com=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
