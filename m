Return-Path: <SRS0=CJKp=MQ=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 1/6] dt-bindings: mmc: renesas_sdhi: Add r8a77470 support
Date: Thu, 4 Oct 2018 10:37:52 +0000
Message-ID: 
 <TY1PR01MB17701F19C5BA9E9BE5BD5A98C0EA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1538564744-15590-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1538564744-15590-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <20181004095955.qhltoiybmdd23lfx@verge.net.au>
In-Reply-To: <20181004095955.qhltoiybmdd23lfx@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Simon Horman <horms@verge.net.au>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Mark Rutland <mark.rutland@arm.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hello Simon,

Thank you for your feedback!

> Subject: Re: [PATCH 1/6] dt-bindings: mmc: renesas_sdhi: Add r8a77470 sup=
port
>
> On Wed, Oct 03, 2018 at 12:05:39PM +0100, Fabrizio Castro wrote:
> > The RZ/G1C (a.k.a. R8A77470) comes with three SDHI interfaces,
> > SDHI0 and SDHI2 are compatible with R-Car Gen2 SDHIs, and
> > SDHI1 is compatible with R-Car Gen3 SDHIs, as it comes with an
> > internal DMAC, therefore SDHI1 is fully compatible with driver
> > renesas_sdhi_internal_dmac driver. As a result, the compatible
> > strings for the R8A77470 SDHI interfaces are a little bit special.
> > Document SDHI support for the RZ/G1C SoC.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> >
> > ---
> > v1->v2:
> > * Added "renesas,sdhi-mmc-r8a77470"
> > * Using generic/fallback compatibilty only for SDHI[02]
> > * Reworked changelog
> > ---
> >  Documentation/devicetree/bindings/mmc/tmio_mmc.txt | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt b/Docum=
entation/devicetree/bindings/mmc/tmio_mmc.txt
> > index d39d5e4..247abee 100644
> > --- a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> > +++ b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> > @@ -19,6 +19,8 @@ Required properties:
> >  "renesas,sdhi-r8a7744" - SDHI IP on R8A7744 SoC
> >  "renesas,sdhi-r8a7745" - SDHI IP on R8A7745 SoC
> >  "renesas,sdhi-r8a774a1" - SDHI IP on R8A774A1 SoC
> > +"renesas,sdhi-r8a77470" - SDHI IP on R8A77470 SoC (SDHI[02])
> > +"renesas,sdhi-mmc-r8a77470" - SDHI IP on R8A77470 SoC (SDHI1)
>
> I understand that SDHI[02] is different to SDHI1 on this SoC.
> But I'm not clear on why SDHI1 is more "mmc" than SDHI[02].

Only SDHI1 can be used as MMC interface, from Section 40.1.1 of the SD Card
manual: " This LSI has three SD card interfaces (SDHI0 to SDHI2), one of wh=
ich
can also be used as MMC interfaces (SDHI1)."

>
> >  "renesas,sdhi-r8a7778" - SDHI IP on R8A7778 SoC
> >  "renesas,sdhi-r8a7779" - SDHI IP on R8A7779 SoC
> >  "renesas,sdhi-r8a7790" - SDHI IP on R8A7790 SoC
> > @@ -35,8 +37,8 @@ Required properties:
> >  "renesas,sdhi-r8a77995" - SDHI IP on R8A77995 SoC
> >  "renesas,sdhi-shmobile" - a generic sh-mobile SDHI controller
> >  "renesas,rcar-gen1-sdhi" - a generic R-Car Gen1 SDHI controller
> > -"renesas,rcar-gen2-sdhi" - a generic R-Car Gen2 or RZ/G1
> > -   SDHI controller
> > +"renesas,rcar-gen2-sdhi" - a generic R-Car Gen2 and RZ/G1 (but
> > +   not RZ/G1C SDHI1) SDHI controller
> >  "renesas,rcar-gen3-sdhi" - a generic R-Car Gen3 or RZ/G2
> >     SDHI controller
>
> renesas,rcar-gen3-sdhi can be used with RZ/G1C SDHI1, right?

It can be used, but when we previously discussed about this I have received=
 bad
feedbacks from both yourself and Geert:
Geert: "I'm a bit reluctant to add "renesas,rcar-gen3-sdhi", though"
You: "I am also reluctant to add "renesas,rcar-gen3-sdhi", because as we ar=
e
seeing things are not so simple wrt to compatible."

We need to make a final decision here, but automatically detecting the IP d=
oesn't
seem to be great, so the final solution has to rely on compatible strings.

> The naming is starting to break down at this point :(

Personally, I am not too bothered about using "renesas,rcar-gen3-sdhi"
for this specific IP, as this chip "borrows" Gen3 implementation, but of co=
urse it
exposes some cross compatibility with other families of products which coul=
d result in
some confusion to the final user. Anyway, as long as we document things pro=
perly
there should be no confusion.

Thanks,
Fab

>
> >
> > --
> > 2.7.4
> >



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
