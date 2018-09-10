Return-Path: <SRS0=slpH=LY=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180829132841.64787-1-chris.brandt@renesas.com>
 <CAMuHMdUSVTk0FPmQSYJ+M1e4ds__7882Viseo6ra1TUBvnSbPQ@mail.gmail.com> <TY1PR01MB15620B77FCA81E17753508058A010@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB15620B77FCA81E17753508058A010@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Sep 2018 15:18:01 +0200
Message-ID: <CAMuHMdUO7RXkYHhGfgaMrXh_D9oCpLxnGWNUKDUmHhtsAHLNQw@mail.gmail.com>
Subject: Re: [PATCH v3] clk: renesas: cpg-mssr: Add R7S9210 support
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Thu, Sep 6, 2018 at 4:31 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> > What about other clocks: BSCCLK, OCTCLK, HYPCLK, and SPICLK?
>
> At this time, I'm considering them 'out of scope' from this driver as
> they really need to be set up early in device boot (ie, u-boot).
> Unless you were just thinking of adding them as #defines, but never
> really using them.

OK, you can always add them later, when the need arises.
include/dt-bindings/clock/*.h is append-only.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
