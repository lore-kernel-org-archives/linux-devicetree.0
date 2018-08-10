Return-Path: <SRS0=Pq+n=KZ=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH v2 4/5] clk: renesas: Add r8a774a1 CPG Core Clock
 Definitions
Date: Fri, 10 Aug 2018 07:35:22 +0000
Message-ID: 
 <OSBPR01MB21036ED37D495C23FE0ABFB9B8240@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1533221794-59181-1-git-send-email-biju.das@bp.renesas.com>
 <5b6cc306.1c69fb81.25824.1225@mx.google.com>
In-Reply-To: <5b6cc306.1c69fb81.25824.1225@mx.google.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Chris Paterson <Chris.Paterson2@renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Rob,


> Subject: Re: [PATCH v2 4/5] clk: renesas: Add r8a774a1 CPG Core Clock
> Definitions
>
> Hi, this is an automated email from Rob's (experimental) review bot. I fo=
und
> a couple of common problems with your patch. Please see below.

Do I need to send another patch? The mail says " Rob's (experimental) revie=
w bot".
Previously for RZ/G1C upstreaming I have submitted the patches in similar f=
ashion.
Is anything changed?

> On Thu,  2 Aug 2018 15:56:34 +0100, Biju Das wrote:
> > Add all RZ/G2M Clock Pulse Generator Core Clock Outputs, as listed in
> > Table 8.2b ("List of Clocks [RZ/G2M]") of the RZ/G2M Hardware User's
> > Manual.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> The preferred subject prefix is "dt-bindings: <binding dir>: ...".

Regards,
Biju



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
