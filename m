From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: Re: [PATCH 5/8] arm64: dts: allwinner: add R_PIO node
Date: Fri, 10 Feb 2017 16:32:05 +0800
Message-ID: <20170210113215.W9Rqn4js@smtp2m.mail.yandex.net>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBGXV6XCAKGQEBMOQUFY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "	linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "
	linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "	devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


2017=E5=B9=B42=E6=9C=8810=E6=97=A5 16:07=E4=BA=8E Maxime Ripard <maxime.rip=
ard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Feb 08, 2017 at 07:08:46PM +0800, Icenowy Zheng wrote:=20
> > 08.02.2017, 18:15, "Maxime Ripard" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:=
=20
> > > On Wed, Feb 08, 2017 at 06:00:06PM +0800, Icenowy Zheng wrote:=20
> > >> =C2=A0Allwinner A64 SoC has a R_PIO node like the one in H3.=20
> > >>=20
> > >> =C2=A0Add the node as well as needed clocks and resets.=20
> > >>=20
> > >> =C2=A0As there's no document for apb0_gates, I only added the R_PIO =
bit here.=20
> > >>=20
> > >> =C2=A0Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>=20
> > >> =C2=A0---=20
> > >> =C2=A0=C2=A0arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 40 +++++=
++++++++++++++++++++++=20
> > >> =C2=A0=C2=A01 file changed, 40 insertions(+)=20
> > >>=20
> > >> =C2=A0diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/a=
rch/arm64/boot/dts/allwinner/sun50i-a64.dtsi=20
> > >> =C2=A0index 1c64ea2d23f9..4b0baa79554c 100644=20
> > >> =C2=A0--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi=20
> > >> =C2=A0+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi=20
> > >> =C2=A0@@ -98,6 +98,15 @@=20
> > >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0clock-output-names =3D "osc32k";=
=20
> > >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};=20
> > >>=20
> > >> =C2=A0+ apb0: apb0_clk {=20
> > >> =C2=A0+ compatible =3D "fixed-factor-clock";=20
> > >> =C2=A0+ #clock-cells =3D <0>;=20
> > >> =C2=A0+ clock-div =3D <1>;=20
> > >> =C2=A0+ clock-mult =3D <1>;=20
> > >> =C2=A0+ clocks =3D <&osc24M>;=20
> > >> =C2=A0+ clock-output-names =3D "apb0";=20
> > >> =C2=A0+ };=20
> > >> =C2=A0+=20
> > >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0psci {=
=20
> > >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0compatible =3D "arm,psci-0.2";=20
> > >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0method =3D "smc";=20
> > >> =C2=A0@@ -392,5 +401,36 @@=20
> > >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0interrupts =3D <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,=20
> > >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0<GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;=20
> > >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};=20
> > >> =C2=A0+=20
> > >> =C2=A0+ apb0_gates: clk@1f01428 {=20
> > >> =C2=A0+ compatible =3D "allwinner,sun50i-a64-apb0-gates-clk",=20
> > >> =C2=A0+ "allwinner,sun4i-a10-gates-clk";=20
> > >> =C2=A0+ reg =3D <0x01f01428 0x4>;=20
> > >> =C2=A0+ #clock-cells =3D <1>;=20
> > >> =C2=A0+ clocks =3D <&apb0>;=20
> > >> =C2=A0+ clock-indices =3D <0>;=20
> > >> =C2=A0+ clock-output-names =3D "apb0_pio";=20
> > >> =C2=A0+ };=20
> > >> =C2=A0+=20
> > >> =C2=A0+ apb0_rst: reset@1f014b0 {=20
> > >> =C2=A0+ reg =3D <0x01f014b0 0x4>;=20
> > >> =C2=A0+ compatible =3D "allwinner,sun6i-a31-clock-reset";=20
> > >> =C2=A0+ #reset-cells =3D <1>;=20
> > >> =C2=A0+ };=20
> > >=20
> > > Please make a sunxi-ng driver for those clocks.=20
> >=20
> > We have no enough materials to make such a CCU driver.=20
> >=20
> > Clocks in CPUs are usually undocumented, and difficult to=20
> > be collected -- even the clk-sun50iw1.c in BSP do not have=20
> > all clocks in CPUs.=20
>
> That's unfortunate, but we can deal with that by simply extending the=20
> clocks we have. Nothing too complicated or unconvenient to deal with.=20

I did a WIP R_CCU driver based on the info on the wiki -- https://github.co=
m/Icenowy/linux/commit/8d215986f4d33ded68c705d4bb152bbb863446c9

Only infomation about H3 and A64 is included, because A31 and A23 PRCM is a=
 MFD, and I have no hackable device with A83T.

>
> > We should only make it sunxi-ng until it's fully discovered (all=20
> > functions in CPUs are functional).=20
>
> No, I expect that by 4.12 we have converted every users to sunxi-ng,=20
> PRCM included.=20
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
