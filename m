Return-Path: <SRS0=QNtu=LT=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180829132841.64787-1-chris.brandt@renesas.com> <TY1PR01MB1562F79382CA2AA33AA661EB8A020@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1562F79382CA2AA33AA661EB8A020@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Sep 2018 16:31:08 +0200
Message-ID: <CAMuHMdVZbaGxwuL6aJfv0Nsoxyrj_M7nL0X1Oo6_KoDYJTwi-w@mail.gmail.com>
Subject: Re: [PATCH v3] clk: renesas: cpg-mssr: Add R7S9210 support
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Wed, Sep 5, 2018 at 4:12 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Wednesday, August 29, 2018, Chris Brandt wrote:
> > Add support for the R7S9210 (RZ/A2) Clock Pulse Generator and Module
> > Standby.
>
> I ran into an issue with this driver.
>
> The issue is that the registers needed for this driver are scattered
> throughout the address space.
>
> I can't just reserve one big block of addresses that cover everything
> because then I can't reserve any of the addresses that sit in the middle.

Yeah, this address range is kind of a "syscon" block.

> For example, my watchdog timer driver doesn't work with this driver
> because it cannot allocate its register region.
>
> So, I think I need to rework this driver to add the ability to add
> multiple address regions.

Your main driver for this block (clock?) can register the watchdog.
Either directly with the watchdog subsystem, or by registering an
"rza_wdt" platform device.

One more vote for a separate rza2-cpg-stb-wdt driver?...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
