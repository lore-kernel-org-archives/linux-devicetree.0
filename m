From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v5 2/2] clk: renesas: cpg-mssr: add R8A7743 support
Date: Mon, 7 Nov 2016 11:09:22 +0100
Message-ID: <CAMuHMdXmoGoTQP0QdG_1xg7fTyaa8x5ujbVW9XoJ5GQgg+oEpQ@mail.gmail.com>
References: <1737840.BeMyoUTlpl@wasted.cogentembedded.com> <7514228.6CSyDUjs5Q@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <7514228.6CSyDUjs5Q@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Wed, Nov 2, 2016 at 10:59 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add RZ/G1M (R8A7743) Clock  Pulse Generator / Module Standby and Software
> Reset support, using the CPG/MSSR driver core and the common R-Car Gen2
> (and RZ/G) code.
>
> Based on the proof-of-concept R8A7791 CPG/MSSR patch by Geert Uytterhoeven
> <geert+renesas@glider.be>.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> ---
> Changes in version 5:
> - describe the Z clock as PLL0/VCO divided by 2.

Why did you do that?

> --- /dev/null
> +++ renesas/drivers/clk/renesas/r8a7743-cpg-mssr.c
> @@ -0,0 +1,270 @@

> +       DEF_FIXED("z",     R8A7743_CLK_Z,       CLK_PLL0,           2, 1),

FTR, previous version had

       DEF_BASE("z",    R8A7743_CLK_Z,    CLK_TYPE_GEN2_Z,     CLK_PLL0),

which made the "z" clock configurable.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
