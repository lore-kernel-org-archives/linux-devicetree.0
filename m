Return-Path: <SRS0=oVJk=MG=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1537530911-443-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1537530911-443-5-git-send-email-fabrizio.castro@bp.renesas.com>
 <20180924091348.gf462j2n7yuf4tif@verge.net.au> <TY1PR01MB1770ADB65DD3BDF479C43276C0170@TY1PR01MB1770.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1770ADB65DD3BDF479C43276C0170@TY1PR01MB1770.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Sep 2018 12:03:18 +0200
Message-ID: <CAMuHMdVs+EnPndpPm6cw4oXm4bnwJ15G=ac_f2Xbe_w=i8CBnA@mail.gmail.com>
Subject: Re: [PATCH 4/4] ARM: dts: iwg23s-sbc: Add uSD card support
Content-Type: text/plain; charset="UTF-8"
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Magnus Damm <magnus.damm@gmail.com>, Linux MMC List <linux-mmc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Fabrizio,

On Mon, Sep 24, 2018 at 11:30 AM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> > -----Original Message-----
> > From: Simon Horman <horms@verge.net.au>
> > Sent: 24 September 2018 10:14
> > To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Cc: Ulf Hansson <ulf.hansson@linaro.org>; Rob Herring <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>; Laurent
> > Pinchart <laurent.pinchart@ideasonboard.com>; Geert Uytterhoeven <geert+renesas@glider.be>; Linus Walleij
> > <linus.walleij@linaro.org>; Wolfram Sang <wsa+renesas@sang-engineering.com>; Magnus Damm <magnus.damm@gmail.com>;
> > linux-mmc@vger.kernel.org; devicetree@vger.kernel.org; linux-renesas-soc@vger.kernel.org; linux-gpio@vger.kernel.org; Chris
> > Paterson <Chris.Paterson2@renesas.com>; Biju Das <biju.das@bp.renesas.com>
> > Subject: Re: [PATCH 4/4] ARM: dts: iwg23s-sbc: Add uSD card support
> >
> > On Fri, Sep 21, 2018 at 12:55:11PM +0100, Fabrizio Castro wrote:
> > > Add uSD card support to the iwg23s single board computer powered
> > > by the RZ/G1C SoC (a.k.a. r8a77470).
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> > > ---
> > > Hello Simon,
> > >
> > > this patch can only be taken after patch "pinctrl: sh-pfc: r8a77470:
> > > Add SDHI2 voltage switch" from this series appears on a release candidate
> > > or a release.
> >
> > What is the nature of that dependency. Does adding this patch without
> > its dependency cause a regression?
>
> Since the SDHI2 pins definition contain "power-source" property, adding this
> patch without its dependency will cause an error at boot up as the kernel
> would be looking for flag SH_PFC_PIN_CFG_IO_VOLTAGE for each pin contained
> in sdhi2_pins and sdhi2_pins_uhs, and since that particular flag would be missing
> (as such a definition comes from patch "pinctrl: sh-pfc: r8a77470: Add SDHI2 voltage
> switch") the SD card would not be functional, but this won't have any impact on
> the rest of the system.

But that won't be a regression, as currently there's no support for
SDHI2 anyway,
right? All pieces will start working when both the pinctrl and DTS support will
be merged together.

This is different from the case where you first add a device node to enable a
device (which makes it work), and later add pinctrl properties (which may
break it, if the pinctrl driver doesn't have support for it yet).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
