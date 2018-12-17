Return-Path: <SRS0=2g+B=O2=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1400092.outbound.protection.outlook.com ([40.107.140.92]:45952
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727096AbeLQMTW (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 17 Dec 2018 07:19:22 -0500
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 02/17] arm64: dts: renesas: r8a774c0: Add I2C and IIC-DVFS
 support
Date: Mon, 17 Dec 2018 12:19:16 +0000
Message-ID: <TY1PR01MB1770E768408113F4C9F57B64C0BC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1544780260-27590-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <20181216201741.qqwmc44ogqifl52e@verge.net.au>
 <TY1PR01MB177034D6488A48CE08DF797FC0BC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20181217115024.lhaeaw4b55dgpgx2@verge.net.au>
In-Reply-To: <20181217115024.lhaeaw4b55dgpgx2@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hello Simon,

Thank you for your feedback!

> From: Simon Horman <horms@verge.net.au>
> Sent: 17 December 2018 11:50
> To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Subject: Re: [PATCH 02/17] arm64: dts: renesas: r8a774c0: Add I2C and IIC=
-DVFS support
>
> On Mon, Dec 17, 2018 at 11:24:39AM +0000, Fabrizio Castro wrote:
> > Hello Simon,
> >
> > > From: Simon Horman <horms@verge.net.au>
> > > Sent: 16 December 2018 20:18
> > > Subject: Re: [PATCH 02/17] arm64: dts: renesas: r8a774c0: Add I2C and=
 IIC-DVFS support
> > >
> > > On Fri, Dec 14, 2018 at 09:37:25AM +0000, Fabrizio Castro wrote:
> > > > Add the I2C[0-7] and IIC Bus Interface for DVFS (IIC for DVFS)
> > > > devices nodes to the r8a774c0 device tree.
> > > >
> > > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > >
> > > Thanks Fabrizo for this patch, it looks good to me with the exception=
 of
> > > one minor question I have below.
> > >
> > > > ---
> > > >  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 143 ++++++++++++++++++=
++++++++++++
> > > >  1 file changed, 143 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64=
/boot/dts/renesas/r8a774c0.dtsi
> > > > index 96a71e3..bf08aba 100644
> > > > --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > > > +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > > > @@ -271,6 +271,149 @@
> > > >  resets =3D <&cpg 407>;
> > > >  };
> > > >
> > > > +i2c0: i2c@e6500000 {
> > > > +#address-cells =3D <1>;
> > > > +#size-cells =3D <0>;
> > > > +compatible =3D "renesas,i2c-r8a774c0",
> > > > +     "renesas,rcar-gen3-i2c";
> > > > +reg =3D <0 0xe6500000 0 0x40>;
> > > > +interrupts =3D <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
> > > > +clocks =3D <&cpg CPG_MOD 931>;
> > > > +power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> > > > +resets =3D <&cpg 931>;
> > > > +dmas =3D <&dmac1 0x91>, <&dmac1 0x90>,
> > > > +       <&dmac2 0x91>, <&dmac2 0x90>;
> > > > +dma-names =3D "tx", "rx", "tx", "rx";
> > > > +i2c-scl-internal-delay-ns =3D <110>;
> > > > +status =3D "disabled";
> > > > +};
> > > > +
> > > > +i2c1: i2c@e6508000 {
> > > > +#address-cells =3D <1>;
> > > > +#size-cells =3D <0>;
> > > > +compatible =3D "renesas,i2c-r8a774c0",
> > > > +     "renesas,rcar-gen3-i2c";
> > > > +reg =3D <0 0xe6508000 0 0x40>;
> > > > +interrupts =3D <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
> > > > +clocks =3D <&cpg CPG_MOD 930>;
> > > > +power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> > > > +resets =3D <&cpg 930>;
> > > > +dmas =3D <&dmac1 0x93>, <&dmac1 0x92>,
> > > > +       <&dmac2 0x93>, <&dmac2 0x92>;
> > > > +dma-names =3D "tx", "rx", "tx", "rx";
> > > > +i2c-scl-internal-delay-ns =3D <6>;
> > > > +status =3D "disabled";
> > > > +};
> > > > +
> > > > +i2c2: i2c@e6510000 {
> > > > +#address-cells =3D <1>;
> > > > +#size-cells =3D <0>;
> > > > +compatible =3D "renesas,i2c-r8a774c0",
> > > > +     "renesas,rcar-gen3-i2c";
> > > > +reg =3D <0 0xe6510000 0 0x40>;
> > > > +interrupts =3D <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>;
> > > > +clocks =3D <&cpg CPG_MOD 929>;
> > > > +power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> > > > +resets =3D <&cpg 929>;
> > > > +dmas =3D <&dmac1 0x95>, <&dmac1 0x94>,
> > > > +       <&dmac2 0x95>, <&dmac2 0x94>;
> > > > +dma-names =3D "tx", "rx", "tx", "rx";
> > > > +i2c-scl-internal-delay-ns =3D <6>;
> > > > +status =3D "disabled";
> > > > +};
> > > > +
> > > > +i2c3: i2c@e66d0000 {
> > > > +#address-cells =3D <1>;
> > > > +#size-cells =3D <0>;
> > > > +compatible =3D "renesas,i2c-r8a774c0",
> > > > +     "renesas,rcar-gen3-i2c";
> > > > +reg =3D <0 0xe66d0000 0 0x40>;
> > > > +interrupts =3D <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
> > > > +clocks =3D <&cpg CPG_MOD 928>;
> > > > +power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> > > > +resets =3D <&cpg 928>;
> > > > +dmas =3D <&dmac0 0x97>, <&dmac0 0x96>;
> > > > +dma-names =3D "tx", "rx";
> > > > +i2c-scl-internal-delay-ns =3D <110>;
> > > > +status =3D "disabled";
> > > > +};
> > > > +
> > > > +i2c4: i2c@e66d8000 {
> > > > +#address-cells =3D <1>;
> > > > +#size-cells =3D <0>;
> > > > +compatible =3D "renesas,i2c-r8a774c0",
> > > > +     "renesas,rcar-gen3-i2c";
> > > > +reg =3D <0 0xe66d8000 0 0x40>;
> > > > +interrupts =3D <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> > > > +clocks =3D <&cpg CPG_MOD 927>;
> > > > +power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> > > > +resets =3D <&cpg 927>;
> > > > +dmas =3D <&dmac0 0x99>, <&dmac0 0x98>;
> > > > +dma-names =3D "tx", "rx";
> > > > +i2c-scl-internal-delay-ns =3D <6>;
> > > > +status =3D "disabled";
> > > > +};
> > > > +
> > > > +i2c5: i2c@e66e0000 {
> > > > +#address-cells =3D <1>;
> > > > +#size-cells =3D <0>;
> > > > +compatible =3D "renesas,i2c-r8a774c0",
> > > > +     "renesas,rcar-gen3-i2c";
> > > > +reg =3D <0 0xe66e0000 0 0x40>;
> > > > +interrupts =3D <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
> > > > +clocks =3D <&cpg CPG_MOD 919>;
> > > > +power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> > > > +resets =3D <&cpg 919>;
> > > > +dmas =3D <&dmac0 0x9b>, <&dmac0 0x9a>;
> > > > +dma-names =3D "tx", "rx";
> > > > +i2c-scl-internal-delay-ns =3D <6>;
> > > > +status =3D "disabled";
> > > > +};
> > > > +
> > > > +i2c6: i2c@e66e8000 {
> > > > +#address-cells =3D <1>;
> > > > +#size-cells =3D <0>;
> > > > +compatible =3D "renesas,i2c-r8a774c0",
> > > > +     "renesas,rcar-gen3-i2c";
> > > > +reg =3D <0 0xe66e8000 0 0x40>;
> > > > +interrupts =3D <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> > > > +clocks =3D <&cpg CPG_MOD 918>;
> > > > +power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> > > > +resets =3D <&cpg 918>;
> > > > +dmas =3D <&dmac0 0x9d>, <&dmac0 0x9c>;
> > > > +dma-names =3D "tx", "rx";
> > > > +i2c-scl-internal-delay-ns =3D <6>;
> > > > +status =3D "disabled";
> > > > +};
> > > > +
> > > > +i2c7: i2c@e6690000 {
> > > > +#address-cells =3D <1>;
> > > > +#size-cells =3D <0>;
> > > > +compatible =3D "renesas,i2c-r8a774c0",
> > > > +     "renesas,rcar-gen3-i2c";
> > > > +reg =3D <0 0xe6690000 0 0x40>;
> > > > +interrupts =3D <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
> > > > +clocks =3D <&cpg CPG_MOD 1003>;
> > > > +power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> > > > +resets =3D <&cpg 1003>;
> > > > +i2c-scl-internal-delay-ns =3D <6>;
> > > > +status =3D "disabled";
> > > > +};
> > > > +
> > > > +i2c_dvfs: i2c@e60b0000 {
> > > > +#address-cells =3D <1>;
> > > > +#size-cells =3D <0>;
> > > > +compatible =3D "renesas,iic-r8a774c0";
> > > > +reg =3D <0 0xe60b0000 0 0x15>;
> > >
> > > My reading of the documentation is that 0x31 would be a more appropri=
ate
> > > size for the register window.
> >
> > Thank you for looking into this. RZ/G2 documentation about this seems a=
 bit incomplete
> > at the moment, and we weren't too sure about what to do here. Our expec=
tation is
> > that the IP should be the same as the one found in R-Car E3, and we tho=
ught they
> > finally wanted to document some previously undocumented registers with =
the RZ/G2
> > User's manual. We are waiting for some answers from Japan, and since th=
e driver
> > doesn't support the "new" registers we thought there was no harm in usi=
ng the same
> > memory region used for R-Car E3. I can see the following options:
> > * use 0x31 as you recommended
> > * keep 0x15 and change it later on to the right figure once the driver =
actually supports all
> > of the documented registers (and maybe updated r8a77990.dtsi as well in=
 case the IP is the
> > same?)
> > * drop i2c_dvfs from this patch, and send it with a new patch once we g=
et some answers
> > from Japan
> >
> > What's best option?
>
> If you think 0x15 is correct then lets just use that and follow-up
> with a fix if necessary.

Thank you for this.

Cheers,
Fab

>
> I'm now happy with this patch but would like to give others a chance to
> review it.
>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
>
> > Thanks,
> > Fab
> >
> > >
> > > > +interrupts =3D <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
> > > > +clocks =3D <&cpg CPG_MOD 926>;
> > > > +power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
> > > > +resets =3D <&cpg 926>;
> > > > +dmas =3D <&dmac0 0x11>, <&dmac0 0x10>;
> > > > +dma-names =3D "tx", "rx";
> > > > +status =3D "disabled";
> > > > +};
> > > > +
> > > >  hscif0: serial@e6540000 {
> > > >  compatible =3D "renesas,hscif-r8a774c0",
> > > >       "renesas,rcar-gen3-hscif",
> > > > --
> > > > 2.7.4
> > > >
> >
> >
> > [https://www2.renesas.eu/media/email/unicef.jpg]
> >
> > This Christmas, instead of sending out cards, Renesas Electronics Europ=
e have decided to support Unicef with a donation. For further
> details click here<https://www.unicef.org/> to find out about the valuabl=
e work they do, helping children all over the world.
> > We would like to take this opportunity to wish you a Merry Christmas an=
d a prosperous New Year.
> >
> >
> >
> > Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne En=
d, Buckinghamshire, SL8 5FH, UK. Registered in England
> & Wales under Registered No. 04586709.
> >


[https://www2.renesas.eu/media/email/unicef.jpg]

This Christmas, instead of sending out cards, Renesas Electronics Europe ha=
ve decided to support Unicef with a donation. For further details click her=
e<https://www.unicef.org/> to find out about the valuable work they do, hel=
ping children all over the world.
We would like to take this opportunity to wish you a Merry Christmas and a =
prosperous New Year.



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
