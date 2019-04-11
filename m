From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: [PATCH v2 4/8] arm64: dts: allwinner: Add ARM Mali
 GPU node for H6
Date: Thu, 11 Apr 2019 17:23:25 +0200
Message-ID: <2797515.ZAugZ1JPiN@jernej-laptop>
References: <20190411105720.32357-1-peron.clem@gmail.com> <2957024.jOddxINRMN@jernej-laptop> <CAJiuCcdo_WAP1_rOcqOcoNkt7rdGb3H_GVMN2DiZnvo_4c=7DA@mail.gmail.com>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDQNBWPU7YERB4NXXXSQKGQESAGFUAA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAJiuCcdo_WAP1_rOcqOcoNkt7rdGb3H_GVMN2DiZnvo_4c=7DA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dne =C4=8Detrtek, 11. april 2019 ob 17:20:04 CEST je Cl=C3=A9ment P=C3=A9ro=
n napisal(a):
> Hi,
>=20
> On Thu, 11 Apr 2019 at 17:05, Jernej =C5=A0krabec <jernej.skrabec-ix9DCk4F938@public.gmane.org=
t>=20
wrote:
> > Dne =C4=8Detrtek, 11. april 2019 ob 12:57:16 CEST je Cl=C3=A9ment P=C3=
=A9ron napisal(a):
> > > Add the mali gpu node to the H6 device-tree.
> > >=20
> > > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > ---
> > >=20
> > >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 14 ++++++++++++++
> > >  1 file changed, 14 insertions(+)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi index
> > > e0dc4a05c1ba..196753110434 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > @@ -157,6 +157,20 @@
> > >=20
> > >                       allwinner,sram =3D <&ve_sram 1>;
> > >              =20
> > >               };
> > >=20
> > > +             gpu: gpu@1800000 {
> > > +                     compatible =3D "allwinner,sun50i-h6-mali",
> > > +                                  "arm,mali-t720";
> > > +                     reg =3D <0x01800000 0x4000>;
> > > +                     interrupts =3D <GIC_SPI 84
> >=20
> > IRQ_TYPE_LEVEL_HIGH>,
> >=20
> > > +                                  <GIC_SPI 85
> >=20
> > IRQ_TYPE_LEVEL_HIGH>,
> >=20
> > > +                                  <GIC_SPI 83
> >=20
> > IRQ_TYPE_LEVEL_HIGH>;
> >=20
> > > +                     interrupt-names =3D "job", "mmu", "gpu";
> > > +                     clocks =3D <&ccu CLK_GPU>, <&ccu CLK_BUS_GPU>;
> > > +                     clock-names =3D "core", "bus";
> > > +                     resets =3D <&ccu RST_BUS_GPU>;
> > > +                     status =3D "disabled";
> >=20
> > Usually self sufficient peripherals are enabled by default in DTSI.
>=20
> I follow the other Mali Midgard (rk3399, rk3288) syntax.
> But I think you're right here, will go for an update I think.
>=20

I quickly checked A64 and H5 DTSI and both have GPU enabled by default (sta=
tus=20
property is not set).

Best regards,
Jernej

> Clement
>=20
> > > +             };
> > > +
> > >=20
> > >               syscon: syscon@3000000 {
> > >              =20
> > >                       compatible =3D "allwinner,sun50i-h6-system-
> >=20
> > control",
> >=20
> > >                                    "allwinner,sun50i-a64-
> >=20
> > system-control";




--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
