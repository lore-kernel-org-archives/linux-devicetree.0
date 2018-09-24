Return-Path: <SRS0=oVJk=MG=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1537551421-4259-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1537551421-4259-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <20180924085904.xa76egqvowg5gkjs@verge.net.au> <TY1PR01MB1770C5200D068C52EA140B4CC0170@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20180924155250.GA2988@kunai>
In-Reply-To: <20180924155250.GA2988@kunai>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Sep 2018 18:14:08 +0200
Message-ID: <CAMuHMdUANEVV+=nF8atPiHDAFoVJV13VgobDkxxOUfz72at_Hw@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: i2c: rcar: Add r8a77470 support
Content-Type: text/plain; charset="UTF-8"
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Biju Das <biju.das@bp.renesas.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>, Linux I2C <linux-i2c@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Wolfram,

On Mon, Sep 24, 2018 at 5:52 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> > > It seems to me that the RZ/G1C has some extra registers described
> > > for I2C when compared with both other RZ/G1 and R-Car Gen2 SoCs.
> >
> > Exactly. The extra registers found with the RZ/G1C I2C controller are
> > also found in R-Car Gen3, but the driver doesn't handle them. R-Car
> > Gen3 has more registers on top of those found with the RZ/G1C.
>
> I don't have he RZ documentation yet, could you name which ones are Gen3
> only?

https://www.renesas.com/eu/en/search/keyword-search.html#q=RZ%2FG1

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
