Return-Path: <SRS0=SWuu=LK=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180821032020.81254-1-chris.brandt@renesas.com>
 <CAMuHMdUVfMgUYat8TR__hiOQEWHXL1EYMN11iMc5TGnhnZALLQ@mail.gmail.com> <TY1PR01MB1562C6473AC295F7F58AB2258A0B0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1562C6473AC295F7F58AB2258A0B0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Aug 2018 20:31:47 +0200
Message-ID: <CAMuHMdVkWhUZ8=7QWT3E-eFre7T=VtOOUQ2VScix38-GQp95HQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Add R7S9210 support
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Mon, Aug 27, 2018 at 6:59 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Monday, August 27, 2018 1, Geert Uytterhoeven wrote:
> > Given the differences, and the limited amount of RAM on RZ/A2, I think you
> > would be better off with a separate renesas-cpg-stbcr driver, and an
> > r7s9210-cpg-stbcr counterpart.
>
> If you really think there will be a lot of wasted RAM, then I will look
> into it.
>
> So are you saying I should first copy/rename renesas-cpg-mssr.c to
> renesas-cpg-stbr.c and then start hacking away at it?

Exactly.

It's debatable: from one side, it's good to reuse code. From the other other,
to much conditional logic complicates everything.

The reset controller part will be different anyway.
But the clock domain part and most of the core/module logic is the same.
Perhaps some common code can be spun off?

> > 4. Your module clocks can use e.g. "36" instead of "306" (also in the DTS),
> >    matching the datasheet.
>
> Yes, that would be much nicer!

At least in DTS and the module clock table, you can get that with cpg-mssr, too,
if you use a different macro.

> Just FYI,
> I like this new driver method, but the one downfall is that I have to go
> back and change my timer driver (renesas-ostm.c). The current OSTM
> driver uses TIMER_OF_DECLARE(). But when you use TIMER_OF_DECLARE, your
> timer driver gets probed VERY early in boot, before subsys_initcall, so none
> of your clocks are registered yet and the probe fails.

IC. When CPG/MSSR was introduced, we had ordering issues on R-Car, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
