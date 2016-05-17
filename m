From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH] arm64: dts: r8a7795: enable DMA for I2C
Date: Tue, 17 May 2016 12:13:06 +0200
Message-ID: <20160517101306.GH29375@bigcity.dyn.berto.se>
References: <1462365303-1664-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUqkodEsmOwzwv_PNVgqxkxG3bmjGTDYY5pC7g6tLciFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdUqkodEsmOwzwv_PNVgqxkxG3bmjGTDYY5pC7g6tLciFg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

On 2016-05-17 10:52:08 +0200, Geert Uytterhoeven wrote:
> On Wed, May 4, 2016 at 2:35 PM, Niklas S=F6derlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > Add DMA properties to the I2C nodes.
> >
> > Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnate=
ch.se>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a7795.dtsi | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/=
boot/dts/renesas/r8a7795.dtsi
> > index a7315eb..49896e4 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > @@ -693,6 +693,8 @@
> >                         interrupts =3D <GIC_SPI 287 IRQ_TYPE_LEVEL_=
HIGH>;
> >                         clocks =3D <&cpg CPG_MOD 931>;
> >                         power-domains =3D <&cpg>;
> > +                       dmas =3D <&dmac1 0x91>, <&dmac1 0x90>;
> > +                       dma-names =3D "tx", "rx";
> >                         i2c-scl-internal-delay-ns =3D <110>;
> >                         status =3D "disabled";
> >                 };
> > @@ -705,6 +707,8 @@
> >                         interrupts =3D <GIC_SPI 288 IRQ_TYPE_LEVEL_=
HIGH>;
> >                         clocks =3D <&cpg CPG_MOD 930>;
> >                         power-domains =3D <&cpg>;
> > +                       dmas =3D <&dmac1 0x93>, <&dmac1 0x92>;
> > +                       dma-names =3D "tx", "rx";
> >                         i2c-scl-internal-delay-ns =3D <6>;
> >                         status =3D "disabled";
> >                 };
> > @@ -717,6 +721,8 @@
> >                         interrupts =3D <GIC_SPI 286 IRQ_TYPE_LEVEL_=
HIGH>;
> >                         clocks =3D <&cpg CPG_MOD 929>;
> >                         power-domains =3D <&cpg>;
> > +                       dmas =3D <&dmac1 0x95>, <&dmac1 0x94>;
> > +                       dma-names =3D "tx", "rx";
> >                         i2c-scl-internal-delay-ns =3D <6>;
> >                         status =3D "disabled";
> >                 };
>=20
> The three above can be used with SYS-DMAC1 (channels 16-31) or with S=
YS-DMAC2
> (channels 32-47).
> It should be tested with the latter before adding the corresponding d=
mas, as
> we had issue with SYS-DMAC2 before (they may have been fixed in firmw=
are in the
> mean time).

I tested with firmware v270-4core and you are correct, looks like dmac2=
=20
is not working for i2c.

>=20
> > @@ -729,6 +735,8 @@
> >                         interrupts =3D <GIC_SPI 290 IRQ_TYPE_LEVEL_=
HIGH>;
> >                         clocks =3D <&cpg CPG_MOD 928>;
> >                         power-domains =3D <&cpg>;
> > +                       dmas =3D <&dmac1 0x97>, <&dmac1 0x96>;
>=20
> The two phandles above should reference "dmac0", as this i2c module c=
an only be
> used with SYS-DMAC0 (channels 0-15), according to the datasheet.

Thanks for pointing this out! I will fix it.

>=20
> > +                       dma-names =3D "tx", "rx";
> >                         i2c-scl-internal-delay-ns =3D <110>;
> >                         status =3D "disabled";
> >                 };
> > @@ -741,6 +749,8 @@
> >                         interrupts =3D <GIC_SPI 19 IRQ_TYPE_LEVEL_H=
IGH>;
> >                         clocks =3D <&cpg CPG_MOD 927>;
> >                         power-domains =3D <&cpg>;
> > +                       dmas =3D <&dmac1 0x99>, <&dmac1 0x98>;
>=20
> dmac0
>=20
> > +                       dma-names =3D "tx", "rx";
> >                         i2c-scl-internal-delay-ns =3D <110>;
> >                         status =3D "disabled";
> >                 };
> > @@ -753,6 +763,8 @@
> >                         interrupts =3D <GIC_SPI 20 IRQ_TYPE_LEVEL_H=
IGH>;
> >                         clocks =3D <&cpg CPG_MOD 919>;
> >                         power-domains =3D <&cpg>;
> > +                       dmas =3D <&dmac1 0x9b>, <&dmac1 0x9a>;
>=20
> dmac0
>=20
> > +                       dma-names =3D "tx", "rx";
> >                         i2c-scl-internal-delay-ns =3D <110>;
> >                         status =3D "disabled";
> >                 };
> > @@ -765,6 +777,8 @@
> >                         interrupts =3D <GIC_SPI 21 IRQ_TYPE_LEVEL_H=
IGH>;
> >                         clocks =3D <&cpg CPG_MOD 918>;
> >                         power-domains =3D <&cpg>;
> > +                       dmas =3D <&dmac1 0x9d>, <&dmac1 0x9c>;
>=20
> dmac0
>=20
> > +                       dma-names =3D "tx", "rx";
> >                         i2c-scl-internal-delay-ns =3D <6>;
> >                         status =3D "disabled";
> >                 };
>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linu=
x-m68k.org
>=20
> In personal conversations with technical people, I call myself a hack=
er. But
> when I'm talking to journalists I just say "programmer" or something =
like that.
>                                 -- Linus Torvalds

--=20
Regards,
Niklas S=F6derlund
