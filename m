Return-Path: <SRS0=X0Lk=MG=verge.net.au=horms@kernel.org>
Date: Mon, 24 Sep 2018 17:34:27 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 4/4] ARM: dts: iwg23s-sbc: Add uSD card support
Message-ID: <20180924153426.entl4tkypuaqs3sz@verge.net.au>
References: <1537530911-443-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1537530911-443-5-git-send-email-fabrizio.castro@bp.renesas.com>
 <20180924091348.gf462j2n7yuf4tif@verge.net.au>
 <TY1PR01MB1770ADB65DD3BDF479C43276C0170@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <CAMuHMdVs+EnPndpPm6cw4oXm4bnwJ15G=ac_f2Xbe_w=i8CBnA@mail.gmail.com>
 <TY1PR01MB1770B98D83C2CC1C602E503DC0170@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1770B98D83C2CC1C602E503DC0170@TY1PR01MB1770.jpnprd01.prod.outlook.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Magnus Damm <magnus.damm@gmail.com>, Linux MMC List <linux-mmc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Sep 24, 2018 at 03:09:49PM +0000, Fabrizio Castro wrote:
> Hello Geert,
> 
> Thank you for your feedback.
> 
> > Subject: Re: [PATCH 4/4] ARM: dts: iwg23s-sbc: Add uSD card support
> >
> > Hi Fabrizio,
> >
> > On Mon, Sep 24, 2018 at 11:30 AM Fabrizio Castro
> > <fabrizio.castro@bp.renesas.com> wrote:
> > > > -----Original Message-----
> > > > From: Simon Horman <horms@verge.net.au>
> > > > Sent: 24 September 2018 10:14
> > > > To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > > Cc: Ulf Hansson <ulf.hansson@linaro.org>; Rob Herring <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>; Laurent
> > > > Pinchart <laurent.pinchart@ideasonboard.com>; Geert Uytterhoeven <geert+renesas@glider.be>; Linus Walleij
> > > > <linus.walleij@linaro.org>; Wolfram Sang <wsa+renesas@sang-engineering.com>; Magnus Damm <magnus.damm@gmail.com>;
> > > > linux-mmc@vger.kernel.org; devicetree@vger.kernel.org; linux-renesas-soc@vger.kernel.org; linux-gpio@vger.kernel.org; Chris
> > > > Paterson <Chris.Paterson2@renesas.com>; Biju Das <biju.das@bp.renesas.com>
> > > > Subject: Re: [PATCH 4/4] ARM: dts: iwg23s-sbc: Add uSD card support
> > > >
> > > > On Fri, Sep 21, 2018 at 12:55:11PM +0100, Fabrizio Castro wrote:
> > > > > Add uSD card support to the iwg23s single board computer powered
> > > > > by the RZ/G1C SoC (a.k.a. r8a77470).
> > > > >
> > > > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > > > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> > > > > ---
> > > > > Hello Simon,
> > > > >
> > > > > this patch can only be taken after patch "pinctrl: sh-pfc: r8a77470:
> > > > > Add SDHI2 voltage switch" from this series appears on a release candidate
> > > > > or a release.
> > > >
> > > > What is the nature of that dependency. Does adding this patch without
> > > > its dependency cause a regression?
> > >
> > > Since the SDHI2 pins definition contain "power-source" property, adding this
> > > patch without its dependency will cause an error at boot up as the kernel
> > > would be looking for flag SH_PFC_PIN_CFG_IO_VOLTAGE for each pin contained
> > > in sdhi2_pins and sdhi2_pins_uhs, and since that particular flag would be missing
> > > (as such a definition comes from patch "pinctrl: sh-pfc: r8a77470: Add SDHI2 voltage
> > > switch") the SD card would not be functional, but this won't have any impact on
> > > the rest of the system.
> >
> > But that won't be a regression, as currently there's no support for
> > SDHI2 anyway,
> > right? All pieces will start working when both the pinctrl and DTS support will
> > be merged together.
> 
> Exactly, it won't be a regression, you'd just get weird messages from the kernel, that's all.

That is fine. But lets finalise the discussion of the bindings before
I apply this patch.
