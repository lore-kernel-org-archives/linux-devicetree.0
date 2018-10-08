Return-Path: <SRS0=ioYF=MU=verge.net.au=horms@kernel.org>
Date: Mon, 8 Oct 2018 09:30:34 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/6] dt-bindings: mmc: renesas_sdhi: Add r8a77470 support
Message-ID: <20181008073034.rfrq4n6vejt2ijep@verge.net.au>
References: <1538564744-15590-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1538564744-15590-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdXPhgARbJQW4gm+xQyjJwa7DoB6gWFhQBVYzuyB67oBwA@mail.gmail.com>
 <TY1PR01MB17700BA10D1C747009877871C0EA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB17700BA10D1C747009877871C0EA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Mark Rutland <mark.rutland@arm.com>, Linux MMC List <linux-mmc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Thu, Oct 04, 2018 at 11:08:10AM +0000, Fabrizio Castro wrote:
> Hello Geert,
> 
> Thank you for your feedback!
> 
> > Subject: Re: [PATCH 1/6] dt-bindings: mmc: renesas_sdhi: Add r8a77470 support
> >
> > Hi Fabrizio,
> >
> > On Wed, Oct 3, 2018 at 1:06 PM Fabrizio Castro
> > <fabrizio.castro@bp.renesas.com> wrote:
> > > The RZ/G1C (a.k.a. R8A77470) comes with three SDHI interfaces,
> > > SDHI0 and SDHI2 are compatible with R-Car Gen2 SDHIs, and
> > > SDHI1 is compatible with R-Car Gen3 SDHIs, as it comes with an
> > > internal DMAC, therefore SDHI1 is fully compatible with driver
> > > renesas_sdhi_internal_dmac driver. As a result, the compatible
> > > strings for the R8A77470 SDHI interfaces are a little bit special.
> > > Document SDHI support for the RZ/G1C SoC.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> > >
> > > ---
> > > v1->v2:
> > > * Added "renesas,sdhi-mmc-r8a77470"
> > > * Using generic/fallback compatibilty only for SDHI[02]
> > > * Reworked changelog
> >
> > Thanks for the update!
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > > --- a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> > > +++ b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> > > @@ -19,6 +19,8 @@ Required properties:
> > >                 "renesas,sdhi-r8a7744" - SDHI IP on R8A7744 SoC
> > >                 "renesas,sdhi-r8a7745" - SDHI IP on R8A7745 SoC
> > >                 "renesas,sdhi-r8a774a1" - SDHI IP on R8A774A1 SoC
> > > +               "renesas,sdhi-r8a77470" - SDHI IP on R8A77470 SoC (SDHI[02])
> > > +               "renesas,sdhi-mmc-r8a77470" - SDHI IP on R8A77470 SoC (SDHI1)
> >
> > I'm wondering if this would be clearer:
> >
> >                "renesas,sdhi-r8a77470" - SDHI IP on R8A77470 SoC
> >                "renesas,sdhi-mmc-r8a77470" - SDHI/MMC IP on R8A77470 SoC
> >
> > >                 "renesas,sdhi-r8a7778" - SDHI IP on R8A7778 SoC
> > >                 "renesas,sdhi-r8a7779" - SDHI IP on R8A7779 SoC
> > >                 "renesas,sdhi-r8a7790" - SDHI IP on R8A7790 SoC
> > > @@ -35,8 +37,8 @@ Required properties:
> > >                 "renesas,sdhi-r8a77995" - SDHI IP on R8A77995 SoC
> > >                 "renesas,sdhi-shmobile" - a generic sh-mobile SDHI controller
> > >                 "renesas,rcar-gen1-sdhi" - a generic R-Car Gen1 SDHI controller
> > > -               "renesas,rcar-gen2-sdhi" - a generic R-Car Gen2 or RZ/G1
> > > -                                          SDHI controller
> > > +               "renesas,rcar-gen2-sdhi" - a generic R-Car Gen2 and RZ/G1 (but
> > > +                                          not RZ/G1C SDHI1) SDHI controller
> >
> > And:
> >
> >                "renesas,rcar-gen2-sdhi" - a generic R-Car Gen2 and RZ/G1 SDHI
> >                                           (not SDHI/MMC) controller
> >
> > as it not only applies to RZ/G1C, but also to R-Car E2X (which is not yet
> > supported upstream).
> >
> > >                 "renesas,rcar-gen3-sdhi" - a generic R-Car Gen3 or RZ/G2
> > >                                            SDHI controller
> >
> > What do you think?
> 
> It makes sense to me, I will wait for Simon's reply and if he is happy as well I'll
> send a new version incorporating your recommendations (and his, in case he
> has any).

Hi,

thanks for the feedback here and elsewhere in this thread.
I am happy with the proposed bindings and Geert's proposed
documentation enhancements.
