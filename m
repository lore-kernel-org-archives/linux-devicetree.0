From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v2 4/8] arm64: dts: allwinner: Add ARM Mali GPU node for H6
Date: Thu, 11 Apr 2019 17:20:04 +0200
Message-ID: <CAJiuCcdo_WAP1_rOcqOcoNkt7rdGb3H_GVMN2DiZnvo_4c=7DA@mail.gmail.com>
References: <20190411105720.32357-1-peron.clem@gmail.com> <20190411105720.32357-5-peron.clem@gmail.com>
 <2957024.jOddxINRMN@jernej-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2957024.jOddxINRMN@jernej-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>
Cc: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, 11 Apr 2019 at 17:05, Jernej =C5=A0krabec <jernej.skrabec@siol.net>=
 wrote:
>
> Dne =C4=8Detrtek, 11. april 2019 ob 12:57:16 CEST je Cl=C3=A9ment P=C3=A9=
ron napisal(a):
> > Add the mali gpu node to the H6 device-tree.
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi index
> > e0dc4a05c1ba..196753110434 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > @@ -157,6 +157,20 @@
> >                       allwinner,sram =3D <&ve_sram 1>;
> >               };
> >
> > +             gpu: gpu@1800000 {
> > +                     compatible =3D "allwinner,sun50i-h6-mali",
> > +                                  "arm,mali-t720";
> > +                     reg =3D <0x01800000 0x4000>;
> > +                     interrupts =3D <GIC_SPI 84
> IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <GIC_SPI 85
> IRQ_TYPE_LEVEL_HIGH>,
> > +                                  <GIC_SPI 83
> IRQ_TYPE_LEVEL_HIGH>;
> > +                     interrupt-names =3D "job", "mmu", "gpu";
> > +                     clocks =3D <&ccu CLK_GPU>, <&ccu CLK_BUS_GPU>;
> > +                     clock-names =3D "core", "bus";
> > +                     resets =3D <&ccu RST_BUS_GPU>;
> > +                     status =3D "disabled";
>
> Usually self sufficient peripherals are enabled by default in DTSI.

I follow the other Mali Midgard (rk3399, rk3288) syntax.
But I think you're right here, will go for an update I think.

Clement

>
> > +             };
> > +
> >               syscon: syscon@3000000 {
> >                       compatible =3D "allwinner,sun50i-h6-system-
> control",
> >                                    "allwinner,sun50i-a64-
> system-control";
>
>
>
>
