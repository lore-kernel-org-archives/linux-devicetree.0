Return-Path: <SRS0=QNtu=LT=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180711170313.80321-1-chris.brandt@renesas.com> <20180711170313.80321-3-chris.brandt@renesas.com>
In-Reply-To: <20180711170313.80321-3-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Sep 2018 15:37:58 +0200
Message-ID: <CAMuHMdUEjAkX8sm7w5MG9sW+s9VrHg_c42a8UkEQmdOZXN4swQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: mstp: Document R7S9210 support
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Wed, Jul 11, 2018 at 7:03 PM Chris Brandt <chris.brandt@renesas.com> wrote:
>
> Renesas R7S9210 SoC also has the CPG MSTP clocks.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

FTR, I consider this superseded by "[PATCH v3] clk: renesas: cpg-mssr: Add
R7S9210 support" (https://www.spinics.net/lists/linux-clk/msg29669.html).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
