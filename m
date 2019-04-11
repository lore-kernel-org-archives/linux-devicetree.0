From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: [PATCH v2 4/8] arm64: dts: allwinner: Add ARM Mali
 GPU node for H6
Date: Thu, 11 Apr 2019 17:42:56 +0200
Message-ID: <5149757.GgN2G91tE9@jernej-laptop>
References: <20190411105720.32357-1-peron.clem@gmail.com> <2797515.ZAugZ1JPiN@jernej-laptop> <20190411152752.qlabx7heh74dy2ao@flea>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDQNBWPU7YERBAWBXXSQKGQEIQKRPSI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190411152752.qlabx7heh74dy2ao@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dne =C4=8Detrtek, 11. april 2019 ob 17:27:52 CEST je Maxime Ripard napisal(=
a):
> On Thu, Apr 11, 2019 at 05:23:25PM +0200, Jernej =C5=A0krabec wrote:
> > Dne =C4=8Detrtek, 11. april 2019 ob 17:20:04 CEST je Cl=C3=A9ment P=C3=
=A9ron napisal(a):
> > > Hi,
> > >=20
> > > On Thu, 11 Apr 2019 at 17:05, Jernej =C5=A0krabec <jernej.skrabec@sio=
l.net>
> >=20
> > wrote:
> > > > Dne =C4=8Detrtek, 11. april 2019 ob 12:57:16 CEST je Cl=C3=A9ment P=
=C3=A9ron=20
napisal(a):
> > > > > Add the mali gpu node to the H6 device-tree.
> > > > >=20
> > > > > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > > > ---
> > > > >=20
> > > > >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 14 ++++++++++++++
> > > > >  1 file changed, 14 insertions(+)
> > > > >=20
> > > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > > b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi index
> > > > > e0dc4a05c1ba..196753110434 100644
> > > > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > > @@ -157,6 +157,20 @@
> > > > >=20
> > > > >                       allwinner,sram =3D <&ve_sram 1>;
> > > > >              =20
> > > > >               };
> > > > >=20
> > > > > +             gpu: gpu@1800000 {
> > > > > +                     compatible =3D "allwinner,sun50i-h6-mali",
> > > > > +                                  "arm,mali-t720";
> > > > > +                     reg =3D <0x01800000 0x4000>;
> > > > > +                     interrupts =3D <GIC_SPI 84
> > > >=20
> > > > IRQ_TYPE_LEVEL_HIGH>,
> > > >=20
> > > > > +                                  <GIC_SPI 85
> > > >=20
> > > > IRQ_TYPE_LEVEL_HIGH>,
> > > >=20
> > > > > +                                  <GIC_SPI 83
> > > >=20
> > > > IRQ_TYPE_LEVEL_HIGH>;
> > > >=20
> > > > > +                     interrupt-names =3D "job", "mmu", "gpu";
> > > > > +                     clocks =3D <&ccu CLK_GPU>, <&ccu CLK_BUS_GP=
U>;
> > > > > +                     clock-names =3D "core", "bus";
> > > > > +                     resets =3D <&ccu RST_BUS_GPU>;
> > > > > +                     status =3D "disabled";
> > > >=20
> > > > Usually self sufficient peripherals are enabled by default in DTSI.
> > >=20
> > > I follow the other Mali Midgard (rk3399, rk3288) syntax.
> > > But I think you're right here, will go for an update I think.
> >=20
> > I quickly checked A64 and H5 DTSI and both have GPU enabled by default
> > (status property is not set).
>=20
> I asked myself the same question, but the H6 seems to have a supply
> wired to the GPU, while the H3 and H5 do not. So I'm not sure we want
> to enable it on all the boards, even though some might have left out
> the GPU supply which will result in a non-working GPU (I assume?)

It's true that GPU doesn't work at all without power supply. Even worse, AR=
M=20
kernel driver just hangs whole SoC if it tries to use unpowered GPU.

I checked few datasheets and almost none of them have GPU power supply, exc=
ept=20
H5, where GPU is enabled by default in DTSI.

Yeah, I guess it's more safe to explicitly enable it in board DT.

Jernej


--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
