From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH v2] ARM: dts: iwg20d-q7: Add RTC support
Date: Thu, 24 Aug 2017 14:53:55 +0000
Message-ID: <SG2PR06MB1711B313440D06B838E3DBD1B89A0@SG2PR06MB1711.apcprd06.prod.outlook.com>
References: <1502874990-12006-1-git-send-email-chris.paterson2@renesas.com>
 <20170824104701.GA30281@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170824104701.GA30281@verge.net.au>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Chris Paterson <Chris.Paterson2@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


> -----Original Message-----
> From: Simon Horman [mailto:horms@verge.net.au]
> Sent: 24 August 2017 11:47
> To: Chris Paterson <Chris.Paterson2@renesas.com>
> Cc: Rob Herring <robh+dt@kernel.org>; Mark Rutland
> <mark.rutland@arm.com>; Magnus Damm <magnus.damm@gmail.com>;
> Russell King <linux@armlinux.org.uk>; Biju Das <biju.das@bp.renesas.com>;
> devicetree@vger.kernel.org; linux-renesas-soc@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org
> Subject: Re: [PATCH v2] ARM: dts: iwg20d-q7: Add RTC support
>
> On Wed, Aug 16, 2017 at 10:16:30AM +0100, Chris Paterson wrote:
> > From: Biju Das <biju.das@bp.renesas.com>
> >
> > Define the iWave RainboW-G20D-Qseven board dependent part of the RTC
> > device node.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > [chris: corrected bq32000 compatible string]
> > Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
> > ---
> > v1 -> v2
> > Added ti to bq32000 compatible string - Thanks Geert
>
> Thanks, applied for v4.15.

Looks like i2c2_pins nodes are misplaced. Please drop this patch,
So that I can send a new patch.





Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
