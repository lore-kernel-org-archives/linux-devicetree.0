Return-Path: <SRS0=KCtZ=G6=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH v3 1/3] serial: sh-sci: Document r8a77470 bindings
Date: Mon, 9 Apr 2018 12:12:05 +0000
Message-ID: <OSBPR01MB21033E244E5365ECE8290B42B8BF0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1522754379-64116-1-git-send-email-biju.das@bp.renesas.com>
 <1522754379-64116-2-git-send-email-biju.das@bp.renesas.com>
 <20180409120943.f2uhl5un4v3dwg6i@verge.net.au>
In-Reply-To: <20180409120943.f2uhl5un4v3dwg6i@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Simon Horman <horms@verge.net.au>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Simon,

Thanks for the feedback.

> -----Original Message-----
> From: Simon Horman [mailto:horms@verge.net.au]
> Sent: 09 April 2018 13:10
> To: Biju Das <biju.das@bp.renesas.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>; Rob Herring
> <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>; Magnus
> Damm <magnus.damm@gmail.com>; devicetree@vger.kernel.org; linux-
> renesas-soc@vger.kernel.org; Geert Uytterhoeven
> <geert+renesas@glider.be>; Chris Paterson
> <Chris.Paterson2@renesas.com>; Fabrizio Castro
> <fabrizio.castro@bp.renesas.com>
> Subject: Re: [PATCH v3 1/3] serial: sh-sci: Document r8a77470 bindings
>
> On Tue, Apr 03, 2018 at 12:19:37PM +0100, Biju Das wrote:
> > RZ/G1C (R8A77470) SoC also has the R-Car gen2 compatible SCIF and
> > HSCIF ports, so document the SoC specific bindings.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
>
> I recommend reposting this as a stand-alone patch with:
>
> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Rob Herring <robh+dt@kernel.org>,
> linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
> linux-renesas-soc@vger.kernel.org

Will send standalone patch

> > ---
> > V1->V2:
> > * No Change
> > V2->V3:
> > * No Change
> >
> >  Documentation/devicetree/bindings/serial/renesas,sci-serial.txt | 2
> > ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
> > b/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
> > index cf504d0..1c90d2c 100644
> > --- a/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
> > +++ b/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
> > @@ -17,6 +17,8 @@ Required properties:
> >      - "renesas,scifa-r8a7745" for R8A7745 (RZ/G1E) SCIFA compatible UA=
RT.
> >      - "renesas,scifb-r8a7745" for R8A7745 (RZ/G1E) SCIFB compatible UA=
RT.
> >      - "renesas,hscif-r8a7745" for R8A7745 (RZ/G1E) HSCIF compatible UA=
RT.
> > +    - "renesas,scif-r8a77470" for R8A77470 (RZ/G1C) SCIF compatible UA=
RT.
> > +    - "renesas,hscif-r8a77470" for R8A77470 (RZ/G1C) HSCIF compatible
> UART.
> >      - "renesas,scif-r8a7778" for R8A7778 (R-Car M1) SCIF compatible UA=
RT.
> >      - "renesas,scif-r8a7779" for R8A7779 (R-Car H1) SCIF compatible UA=
RT.
> >      - "renesas,scif-r8a7790" for R8A7790 (R-Car H2) SCIF compatible UA=
RT.
> > --
> > 2.7.4
> >



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
