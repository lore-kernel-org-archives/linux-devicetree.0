Return-Path: <SRS0=9I9X=MG=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 1/4] dt-bindings: i2c: rcar: Add r8a77470 support
Date: Mon, 24 Sep 2018 16:18:31 +0000
Message-ID: 
 <TY1PR01MB1770B27F16CE9004C620F366C0170@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1537551421-4259-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1537551421-4259-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <20180924085904.xa76egqvowg5gkjs@verge.net.au>
 <TY1PR01MB1770C5200D068C52EA140B4CC0170@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20180924155250.GA2988@kunai>
In-Reply-To: <20180924155250.GA2988@kunai>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Biju Das <biju.das@bp.renesas.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hello Wolfram,

> Subject: Re: [PATCH 1/4] dt-bindings: i2c: rcar: Add r8a77470 support
>
>
> > > It seems to me that the RZ/G1C has some extra registers described
> > > for I2C when compared with both other RZ/G1 and R-Car Gen2 SoCs.
> >
> > Exactly. The extra registers found with the RZ/G1C I2C controller are
> > also found in R-Car Gen3, but the driver doesn't handle them. R-Car
> > Gen3 has more registers on top of those found with the RZ/G1C.
>
> I don't have he RZ documentation yet, could you name which ones are Gen3
> only?

ICDMAER and ICFBSCR are the registers found in R-Car Gen3 but not in RZ/G1C=
.

Thanks,
Fab




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
