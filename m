From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] clk: renesas: cpg-mssr: add R8A7745 support
Date: Wed, 2 Nov 2016 16:47:17 +0100
Message-ID: <CAMuHMdUD_U5YqOnWv3Oo8P_Oxbh=qMP9wAtJmEgt-2eW4y3XqQ@mail.gmail.com>
References: <13079532.zQoaX56ouR@wasted.cogentembedded.com> <5012234.NZmvoVqhq0@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <5012234.NZmvoVqhq0@wasted.cogentembedded.com>
Sender: linux-clk-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Thu, Oct 27, 2016 at 10:43 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add RZ/G1E (R8A7745) Clock  Pulse Generator / Module Standby and Software
> Reset support, using the CPG/MSSR driver core and the common R-Car Gen2
> (and RZ/G) code.
>
> Based on the proof-of-concept R8A7791 CPG/MSSR patch by Geert Uytterhoeven
> <geert+renesas@glider.be>.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks a lot for your patch!

> --- /dev/null
> +++ linux/drivers/clk/renesas/r8a7745-cpg-mssr.c
> @@ -0,0 +1,261 @@

> +static const struct cpg_core_clk r8a7745_core_clks[] __initconst = {

> +       /* Core Clock Outputs */

> +       DEF_FIXED("z2",     R8A7745_CLK_Z2,    CLK_PLL0,          1, 1),

If you remove the "div = 3" in rcar-gen2-cpg.c, you can use "... 3, 1" here,
cfr. zg, zx, and zs below.

> +       DEF_FIXED("zg",     R8A7745_CLK_ZG,    CLK_PLL1,          6, 1),
> +       DEF_FIXED("zx",     R8A7745_CLK_ZX,    CLK_PLL1,          3, 1),
> +       DEF_FIXED("zs",     R8A7745_CLK_ZS,    CLK_PLL1,          6, 1),

> +static const struct mssr_mod_clk r8a7745_mod_clks[] __initconst = {

> +       DEF_MOD("fdp1-1",         118,  R8A7745_CLK_ZS),

FDP1-1 does not exist on RZ/G1E.

With these fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
