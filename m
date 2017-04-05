From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: Re: [PATCH 10/11] arm64: allwinner: a64: enable
 AXP803 regulators for Pine64
Date: Wed, 05 Apr 2017 14:15:43 +0800
Message-ID: <58e48b95.8c9d810a.c6385.f3fbSMTPIN_ADDED_MISSING@gmr-mx.google.com>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBFUXSLDQKGQEDUKTQ4A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


2017=E5=B9=B44=E6=9C=885=E6=97=A5 14:13=E4=BA=8E Maxime Ripard <maxime.ripa=
rd-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Apr 05, 2017 at 02:01:44AM +0800, Icenowy Zheng wrote:=20
> > Add support of AXP803 regulators in the Pine64 device tree, in order to=
=20
> > enable many future functionalities, e.g. Wi-Fi.=20
> >=20
> > Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>=20
> > ---=20
> >=C2=A0 .../arm64/boot/dts/allwinner/sun50i-a64-pine64.dts | 109 ++++++++=
+++++++++++++=20
> >=C2=A0 1 file changed, 109 insertions(+)=20
> >=20
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts b/arch=
/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts=20
> > index 2132d8e6cb3d..7da074f95065 100644=20
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts=20
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts=20
> > @@ -106,6 +106,115 @@=20
> >=C2=A0 };=20
> >=C2=A0 };=20
> >=C2=A0=20
> > +#include "axp803.dtsi"=20
> > +=20
> > +&reg_aldo1 {=20
> > + regulator-min-microvolt =3D <2800000>;=20
> > + regulator-max-microvolt =3D <2800000>;=20
> > + regulator-name =3D "vcc-csi";=20
> > +};=20
> > +=20
> > +&reg_aldo2 {=20
> > + regulator-always-on;=20
> > + regulator-min-microvolt =3D <1800000>;=20
> > + regulator-max-microvolt =3D <3300000>;=20
> > + regulator-name =3D "vcc-pl";=20
> > +};=20
> > +=20
> > +&reg_aldo3 {=20
> > + regulator-always-on;=20
> > + regulator-min-microvolt =3D <2700000>;=20
> > + regulator-max-microvolt =3D <3300000>;=20
> > + regulator-name =3D "vcc-pll-avcc";=20
> > +};=20
> > +=20
> > +&reg_dc1sw {=20
> > + regulator-name =3D "vcc-phy";=20
> > +};=20
> > +=20
> > +&reg_dcdc1 {=20
> > + regulator-always-on;=20
> > + regulator-min-microvolt =3D <3300000>;=20
> > + regulator-max-microvolt =3D <3300000>;=20
> > + regulator-name =3D "vcc-3v3";=20
> > +};=20
> > +=20
> > +&reg_dcdc2 {=20
> > + regulator-always-on;=20
> > + regulator-min-microvolt =3D <1000000>;=20
> > + regulator-max-microvolt =3D <1300000>;=20
> > + regulator-name =3D "vdd-cpux";=20
> > +};=20
> > +=20
> > +/* DCDC3 is polyphased with DCDC2 */=20
> > +=20
> > +&reg_dcdc5 {=20
> > + regulator-always-on;=20
> > + regulator-min-microvolt =3D <1500000>;=20
> > + regulator-max-microvolt =3D <1500000>;=20
> > + regulator-name =3D "vcc-dram";=20
> > +};=20
> > +=20
> > +&reg_dcdc6 {=20
> > + regulator-always-on;=20
> > + regulator-min-microvolt =3D <1100000>;=20
> > + regulator-max-microvolt =3D <1100000>;=20
> > + regulator-name =3D "vdd-sys";=20
> > +};=20
> > +=20
> > +&reg_dldo1 {=20
> > + regulator-min-microvolt =3D <3300000>;=20
> > + regulator-max-microvolt =3D <3300000>;=20
> > + regulator-name =3D "vcc-hdmi";=20
> > +};=20
> > +=20
> > +&reg_dldo2 {=20
> > + regulator-min-microvolt =3D <3300000>;=20
> > + regulator-max-microvolt =3D <3300000>;=20
> > + regulator-name =3D "vcc-mipi";=20
> > +};=20
> > +=20
> > +&reg_dldo3 {=20
> > + regulator-min-microvolt =3D <3300000>;=20
> > + regulator-max-microvolt =3D <3300000>;=20
> > + regulator-name =3D "avdd-csi";=20
> > +};=20
> > +=20
> > +&reg_dldo4 {=20
> > + regulator-min-microvolt =3D <3300000>;=20
> > + regulator-max-microvolt =3D <3300000>;=20
> > + regulator-name =3D "vcc-wifi";=20
> > +};=20
> > +=20
> > +&reg_eldo1 {=20
> > + regulator-min-microvolt =3D <1800000>;=20
> > + regulator-max-microvolt =3D <1800000>;=20
> > + regulator-name =3D "cpvdd";=20
> > +};=20
> > +=20
> > +&reg_eldo3 {=20
> > + regulator-min-microvolt =3D <1800000>;=20
> > + regulator-max-microvolt =3D <1800000>;=20
> > + regulator-name =3D "vdd-1v8-csi";=20
> > +};=20
> > +=20
> > +&reg_fldo1 {=20
> > + regulator-min-microvolt =3D <1200000>;=20
> > + regulator-max-microvolt =3D <1200000>;=20
> > + regulator-name =3D "vcc-1v2-hsic";=20
> > +};=20
> > +=20
> > +&reg_fldo2 {=20
> > + regulator-always-on;=20
> > + regulator-min-microvolt =3D <1100000>;=20
> > + regulator-max-microvolt =3D <1100000>;=20
> > + regulator-name =3D "vdd-cpus";=20
> > +};=20
>
> Why do you need to always power the AR100 on?=20

It's for CPUS power domain, not the AR100 processor.

Kill it will lead to instantly system hang.

>
> Maxime=20
>
> --=20
> Maxime Ripard, Free Electrons=20
> Embedded Linux and Kernel engineering=20
> http://free-electrons.com=20
>
> --=20
> You received this message because you are subscribed to the Google Groups=
 "linux-sunxi" group.=20
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org=20
> For more options, visit https://groups.google.com/d/optout.=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
