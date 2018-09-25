Return-Path: <SRS0=hPEm=MH=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1537530911-443-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1537530911-443-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdVY1ty4fGoBg7qxfkRaEBEgBEK5YDgwNryDx_tCUYpiaw@mail.gmail.com> <TY1PR01MB1770218E44B1C365EE23299DC0170@TY1PR01MB1770.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1770218E44B1C365EE23299DC0170@TY1PR01MB1770.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Sep 2018 08:47:38 +0200
Message-ID: <CAMuHMdX1jTwehG_XdsnWXz5HhPK4OYtOkb1BNr75yxZn8u6B6w@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: mmc: renesas_sdhi: Add r8a77470 support
Content-Type: text/plain; charset="UTF-8"
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux MMC List <linux-mmc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Fabrizio,

On Mon, Sep 24, 2018 at 8:34 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> > Subject: Re: [PATCH 1/4] dt-bindings: mmc: renesas_sdhi: Add r8a77470 support
> > On Fri, Sep 21, 2018 at 1:55 PM Fabrizio Castro
> > <fabrizio.castro@bp.renesas.com> wrote:
> > > Document SDHI support for the RZ/G1C (a.k.a. R8A77470) SoC.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > Reviewed-by: Biju Das <biju.das@bp.renesas.com>

> > > --- a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> > > +++ b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> > > @@ -17,6 +17,7 @@ Required properties:
> > >                 "renesas,sdhi-r8a7740" - SDHI IP on R8A7740 SoC
> > >                 "renesas,sdhi-r8a7743" - SDHI IP on R8A7743 SoC
> > >                 "renesas,sdhi-r8a7745" - SDHI IP on R8A7745 SoC
> > > +               "renesas,sdhi-r8a77470" - SDHI IP on R8A77470 SoC
> > >                 "renesas,sdhi-r8a7778" - SDHI IP on R8A7778 SoC
> > >                 "renesas,sdhi-r8a7779" - SDHI IP on R8A7779 SoC
> > >                 "renesas,sdhi-r8a7790" - SDHI IP on R8A7790 SoC
> >
> > It seems RZ/G1C has two slighty different types of SD card interfaces:
> >   1. SDHI0 and SDHI2 use SYS-DMAC,
> >   2. SDHI1 can also be used as an MMC interface, and has an internal DMAC.
> >
> > Do we need to distinguish between them using the compatible value, or
> > are there other ways?
>
> The most sensible thing to do here is probably to distinguish between them using
> the compatible value, we were thinking about using the following for SDHI1:
> compatible = "renesas,sdhi-mmc-r8a77470", "renesas,rcar-gen3-sdhi";
>
> What do you guys think?

Oh, so it's identical (or "sufficiently compatible") with the SD card
interface on R-Car Gen3?
"renesas,sdhi-mmc-r8a77470" may be a good way to distinguish.
I'm a bit reluctant to add "renesas,rcar-gen3-sdhi", though.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
