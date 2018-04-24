Return-Path: <SRS0=V8UA=HN=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH 3/4] ARM: dts: r8a77470: Add SCIF support
Date: Tue, 24 Apr 2018 08:20:01 +0000
Message-ID: <OSBPR01MB2103D3665FFF912BF6D2D04EB8880@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1524238029-55315-1-git-send-email-biju.das@bp.renesas.com>
 <1524238029-55315-4-git-send-email-biju.das@bp.renesas.com>
 <20180424070801.5g6t2ahoe6lszjw4@verge.net.au>
 <CAMuHMdW4YXCWAD3BnBBerFHkrmjGq9JndnFUnUcLqKK3gAswbw@mail.gmail.com>
 <20180424081423.as35yvhpw3d44zsh@verge.net.au>
In-Reply-To: <20180424081423.as35yvhpw3d44zsh@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS  <devicetree@vger.kernel.org>, Linux-Renesas" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Simon and Geert,

Thanks for the feedback.

> Subject: Re: [PATCH 3/4] ARM: dts: r8a77470: Add SCIF support
>
> On Tue, Apr 24, 2018 at 09:19:39AM +0200, Geert Uytterhoeven wrote:
> > Hi Simon,
> >
> > On Tue, Apr 24, 2018 at 9:08 AM, Simon Horman <horms@verge.net.au>
> wrote:
> > > On Fri, Apr 20, 2018 at 04:27:08PM +0100, Biju Das wrote:
> > >> Describe SCIF ports in the R8A77470 device tree.
> > >>
> > >> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > >> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > >> ---
> > >>  arch/arm/boot/dts/r8a77470.dtsi | 69
> > >> +++++++++++++++++++++++++++++++++++++++--
> > >>  1 file changed, 67 insertions(+), 2 deletions(-)
> > >>
> > >> diff --git a/arch/arm/boot/dts/r8a77470.dtsi
> > >> b/arch/arm/boot/dts/r8a77470.dtsi index 2f89f33..39549f2 100644
> > >> --- a/arch/arm/boot/dts/r8a77470.dtsi
> > >> +++ b/arch/arm/boot/dts/r8a77470.dtsi
> > >> @@ -190,19 +190,84 @@
> > >>                       dma-channels =3D <15>;
> > >>               };
> > >>
> > >> +             scif0: serial@e6e60000 {
> > >> +                     compatible =3D "renesas,scif-r8a77470",
> > >> +                                  "renesas,rcar-gen2-scif", "renesa=
s,scif";
> > >> +                     reg =3D <0 0xe6e60000 0 0x40>;
> > >> +                     interrupts =3D <GIC_SPI 152 IRQ_TYPE_LEVEL_HIG=
H>;
> > >> +                     clocks =3D <&cpg CPG_MOD 721>,
> > >> +                              <&cpg CPG_CORE 5>, <&scif_clk>;
> > >> +                     clock-names =3D "fck", "brg_int", "scif_clk";
> > >> +                     power-domains =3D <&sysc 32>;
> > >> +                     resets =3D <&cpg 721>;
> > >> +                     status =3D "disabled";
> > >> +             };
> > >> +
> > >>               scif1: serial@e6e68000 {
> > >>                       compatible =3D "renesas,scif-r8a77470",
> > >>                                    "renesas,rcar-gen2-scif", "renesa=
s,scif";
> > >>                       reg =3D <0 0xe6e68000 0 0x40>;
> > >>                       interrupts =3D <GIC_SPI 153 IRQ_TYPE_LEVEL_HIG=
H>;
> > >> -                             clocks =3D <&cpg CPG_MOD 720>,
> > >> -                              <&cpg CPG_CORE 6>, <&scif_clk>;
> > >> +                     clocks =3D <&cpg CPG_MOD 720>,
> > >> +                              <&cpg CPG_CORE 5>, <&scif_clk>;
> > >
> > > I am a little unclear why the CPG clock is changed from 6 (ZS?) to 5 =
(ZX?).
> > > Could you clarify this for me?
> >
> > #define R8A77470_CLK_ZS         5
> >
> > I guess you queued up the initial .dtsi before the error in
> > include/dt-bindings/clock/r8a77470-cpg-mssr.h was detected?
>
> Thanks, I see that ZS is 5 in renesas-drivers, but when looking at an ear=
lier
> version of the patch to add the indexes it was 6.

Yes, I took this value from renesas-drivers.

> I think that explains things. But could we add an explanation to the
> changelog?

OK. I will add the explanation to the change log.

Regards,
Biju




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
