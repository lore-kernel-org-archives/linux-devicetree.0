Return-Path: <SRS0=7tr2=KE=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180711170313.80321-1-chris.brandt@renesas.com>
In-Reply-To: <20180711170313.80321-1-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Jul 2018 10:10:52 +0200
Message-ID: <CAMuHMdWL5v3GDBL-Lix7CU-=WDmdAPgFS75FqHYkMbphW4cgLw@mail.gmail.com>
Subject: Re: [PATCH 0/2] clk: renesas: mstp: Add support for RZ/A2
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

(Oops, I wrote this response, but forgot to send it)

On Wed, Jul 11, 2018 at 7:03 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add support for RZ/A2 series.
> The clock HW is similar to RZ/A1, but with different dividers
> and additional clocks sources.

Thanks for your series!

> Chris Brandt (2):
>   clk: renesas: mstp: Add support for r7s9210
>   clk: renesas: mstp: Document R7S9210 support
>
>  .../bindings/clock/renesas,cpg-mstp-clocks.txt     |   1 +
>  drivers/clk/renesas/Kconfig                        |   5 +
>  drivers/clk/renesas/Makefile                       |   1 +
>  drivers/clk/renesas/clk-mstp.c                     |   3 +
>  drivers/clk/renesas/clk-rz.c                       | 155 ++++++++++++++++-----
>  5 files changed, 131 insertions(+), 34 deletions(-)

No patch to update
Documentation/devicetree/bindings/clock/renesas,rz-cpg-clocks.txt?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
