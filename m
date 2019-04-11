From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 4/8] arm64: dts: allwinner: Add ARM Mali GPU node for H6
Date: Thu, 11 Apr 2019 11:24:54 -0500
Message-ID: <CAL_JsqJAwxxZqokOYfxfSu05AxjAtts_vKajGFpDhyvqb2sO5Q@mail.gmail.com>
References: <20190411105720.32357-1-peron.clem@gmail.com> <2957024.jOddxINRMN@jernej-laptop>
 <CAJiuCcdo_WAP1_rOcqOcoNkt7rdGb3H_GVMN2DiZnvo_4c=7DA@mail.gmail.com>
 <2797515.ZAugZ1JPiN@jernej-laptop> <20190411152752.qlabx7heh74dy2ao@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411152752.qlabx7heh74dy2ao@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>, =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 11, 2019 at 10:27 AM Maxime Ripard
<maxime.ripard@bootlin.com> wrote:
>
> On Thu, Apr 11, 2019 at 05:23:25PM +0200, Jernej =C5=A0krabec wrote:
> > Dne =C4=8Detrtek, 11. april 2019 ob 17:20:04 CEST je Cl=C3=A9ment P=C3=
=A9ron napisal(a):
> > > Hi,
> > >
> > > On Thu, 11 Apr 2019 at 17:05, Jernej =C5=A0krabec <jernej.skrabec@sio=
l.net>
> > wrote:
> > > > Dne =C4=8Detrtek, 11. april 2019 ob 12:57:16 CEST je Cl=C3=A9ment P=
=C3=A9ron napisal(a):
> > > > > Add the mali gpu node to the H6 device-tree.
> > > > >
> > > > > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > > > > ---
> > > > >
> > > > >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 14 ++++++++++++++
> > > > >  1 file changed, 14 insertions(+)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > > b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi index
> > > > > e0dc4a05c1ba..196753110434 100644
> > > > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > > @@ -157,6 +157,20 @@
> > > > >
> > > > >                       allwinner,sram =3D <&ve_sram 1>;
> > > > >
> > > > >               };
> > > > >
> > > > > +             gpu: gpu@1800000 {
> > > > > +                     compatible =3D "allwinner,sun50i-h6-mali",
> > > > > +                                  "arm,mali-t720";
> > > > > +                     reg =3D <0x01800000 0x4000>;
> > > > > +                     interrupts =3D <GIC_SPI 84
> > > >
> > > > IRQ_TYPE_LEVEL_HIGH>,
> > > >
> > > > > +                                  <GIC_SPI 85
> > > >
> > > > IRQ_TYPE_LEVEL_HIGH>,
> > > >
> > > > > +                                  <GIC_SPI 83
> > > >
> > > > IRQ_TYPE_LEVEL_HIGH>;
> > > >
> > > > > +                     interrupt-names =3D "job", "mmu", "gpu";
> > > > > +                     clocks =3D <&ccu CLK_GPU>, <&ccu CLK_BUS_GP=
U>;
> > > > > +                     clock-names =3D "core", "bus";
> > > > > +                     resets =3D <&ccu RST_BUS_GPU>;
> > > > > +                     status =3D "disabled";
> > > >
> > > > Usually self sufficient peripherals are enabled by default in DTSI.
> > >
> > > I follow the other Mali Midgard (rk3399, rk3288) syntax.
> > > But I think you're right here, will go for an update I think.
> >
> > I quickly checked A64 and H5 DTSI and both have GPU enabled by default =
(status
> > property is not set).
>
> I asked myself the same question, but the H6 seems to have a supply
> wired to the GPU, while the H3 and H5 do not. So I'm not sure we want
> to enable it on all the boards, even though some might have left out
> the GPU supply which will result in a non-working GPU (I assume?)

If the default state is enabled, then only devfreq will be disabled
for panfrost, but it should otherwise work. I guess we could be
smarter and just do frequency changes if all the OPP voltages are the
same.

Rob
