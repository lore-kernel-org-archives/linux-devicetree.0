Return-Path: <SRS0=9I9X=MG=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 4/4] ARM: dts: iwg23s-sbc: Add uSD card support
Date: Mon, 24 Sep 2018 09:30:11 +0000
Message-ID: 
 <TY1PR01MB1770ADB65DD3BDF479C43276C0170@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1537530911-443-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1537530911-443-5-git-send-email-fabrizio.castro@bp.renesas.com>
 <20180924091348.gf462j2n7yuf4tif@verge.net.au>
In-Reply-To: <20180924091348.gf462j2n7yuf4tif@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Simon Horman <horms@verge.net.au>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Magnus Damm <magnus.damm@gmail.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hello Simon,

Thank you for your feedback.

> -----Original Message-----
> From: Simon Horman <horms@verge.net.au>
> Sent: 24 September 2018 10:14
> To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>; Rob Herring <robh+dt@kernel.org=
>; Mark Rutland <mark.rutland@arm.com>; Laurent
> Pinchart <laurent.pinchart@ideasonboard.com>; Geert Uytterhoeven <geert+r=
enesas@glider.be>; Linus Walleij
> <linus.walleij@linaro.org>; Wolfram Sang <wsa+renesas@sang-engineering.co=
m>; Magnus Damm <magnus.damm@gmail.com>;
> linux-mmc@vger.kernel.org; devicetree@vger.kernel.org; linux-renesas-soc@=
vger.kernel.org; linux-gpio@vger.kernel.org; Chris
> Paterson <Chris.Paterson2@renesas.com>; Biju Das <biju.das@bp.renesas.com=
>
> Subject: Re: [PATCH 4/4] ARM: dts: iwg23s-sbc: Add uSD card support
>
> On Fri, Sep 21, 2018 at 12:55:11PM +0100, Fabrizio Castro wrote:
> > Add uSD card support to the iwg23s single board computer powered
> > by the RZ/G1C SoC (a.k.a. r8a77470).
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> > Hello Simon,
> >
> > this patch can only be taken after patch "pinctrl: sh-pfc: r8a77470:
> > Add SDHI2 voltage switch" from this series appears on a release candida=
te
> > or a release.
>
> What is the nature of that dependency. Does adding this patch without
> its dependency cause a regression?

Since the SDHI2 pins definition contain "power-source" property, adding thi=
s
patch without its dependency will cause an error at boot up as the kernel
would be looking for flag SH_PFC_PIN_CFG_IO_VOLTAGE for each pin contained
in sdhi2_pins and sdhi2_pins_uhs, and since that particular flag would be m=
issing
(as such a definition comes from patch "pinctrl: sh-pfc: r8a77470: Add SDHI=
2 voltage
switch") the SD card would not be functional, but this won't have any impac=
t on
the rest of the system.

>
> > Shall I re-send it at a later stage or are you happy to keep it around
> > and defer its application to when its dependency is sorted?
>
> I'd rather that you repost or otherwise ping me once any dependency is so=
rted.

Ok, I will do that.

Thanks,
Fab



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
