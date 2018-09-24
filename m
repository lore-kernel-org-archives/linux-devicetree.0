Return-Path: <SRS0=oVJk=MG=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1537530911-443-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1537530911-443-3-git-send-email-fabrizio.castro@bp.renesas.com> <20180922184443.GD841@kunai>
In-Reply-To: <20180922184443.GD841@kunai>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Sep 2018 11:51:28 +0200
Message-ID: <CAMuHMdXjuJT6=fAkCtJYxu95sMjMsxZgt2ASc-4+DBWAcYOHhQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] pinctrl: sh-pfc: r8a77470: Add SDHI2 voltage switch
Content-Type: text/plain; charset="UTF-8"
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux MMC List <linux-mmc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Sat, Sep 22, 2018 at 8:44 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> On Fri, Sep 21, 2018 at 12:55:09PM +0100, Fabrizio Castro wrote:
> > Add SH_PFC_PIN_CFG_IO_VOLTAGE definition for the SDHI2 pins
> > capable of switching voltage. Please note that with the
> > RZ/G1C only 1 bit of the POC Control Register is used to
> > control each interface.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
>
> In general:
>
> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> > +     if (_bank == 4 && _pin >= 14 && _pin <= 19)
> > +             return 1;
> > +
> > +     return -EINVAL;
>
> I'd like a tad better to bail out on the error case and have the main
> path returning on the good case, but no strong opinion...

And we have these nice RCAR_GP_PIN() macros to check pin ranges.
Please have a look at the flow in e.g. r8a7795_pin_to_pocctrl().

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
