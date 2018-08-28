Return-Path: <SRS0=H6vz=LL=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180821032020.81254-1-chris.brandt@renesas.com>
 <CAMuHMdUVfMgUYat8TR__hiOQEWHXL1EYMN11iMc5TGnhnZALLQ@mail.gmail.com> <TY1PR01MB15620184F9EA4E62E21D1D688A0B0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB15620184F9EA4E62E21D1D688A0B0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Aug 2018 09:10:37 +0200
Message-ID: <CAMuHMdVd7wT5vPrHFAgHYqNWtJNjbSG7GaaPaMVD12cfkg8E2A@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Add R7S9210 support
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Tue, Aug 28, 2018 at 12:13 AM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Monday, August 27, 2018 1, Geert Uytterhoeven wrote:
> > Given the differences, and the limited amount of RAM on RZ/A2, I think you
> > would be better off with a separate renesas-cpg-stbcr driver, and an
> > r7s9210-cpg-stbcr counterpart.
>
> I went and measured the amount of RAM being used by the driver
> (allocated during boot when the driver is loaded and probed), and it's only 8KB.
> That's not really much compared to other drivers and subsystems being
> loaded in the system. Of course RZ/A tries to be RAM sensitive...but 8KB
> for a clock driver is not my biggest concern.
>
> So with that said, I could add in a driver option to not register the
> reset controller. And, also make a macro so users can specify "36" instead
> of "306" in the DT.
> And then, I no longer have to worry about duplicate code (2 drivers do
> almost the same thing).
>
> What do you think?

OK for me.

Changing the print format in the debug prints is probably too much work,
but those matter less than the clock numbers in the DTS.

> Were you expecting the driver to allocate more than 8K of RAM on boot?

I was thinking mainly about code size. But you're right, (a) you use XIP
(with plenty of FLASH?), and (b) RAM size should be similar for a combined
and a separate driver.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
