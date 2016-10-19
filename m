Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <2357731.SxJodxn1PJ@wasted.cogentembedded.com>
References: <9246696.7P1aOyyQt4@wasted.cogentembedded.com> <2357731.SxJodxn1PJ@wasted.cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Oct 2016 11:06:26 +0200
Message-ID: <CAMuHMdW_XSCfy+Kv6uz1pX7q-XFPp=nkaXSehbZJYAeOt6Rf4w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: renesas: cpg-mssr: add R8A7743 support
Content-Type: text/plain; charset=UTF-8
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Sergei,

On Fri, Oct 7, 2016 at 10:47 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add RZ/G1M (R8A7743) Clock  Pulse Generator / Module Standby and Software
> Reset support, using the CPG/MSSR driver core and the common R-Car Gen2
> (and RZ/G) code.
>
> Based on the proof-of-concept R8A7791 CPG/MSSR patch by Geert Uytterhoeven
> <geert+renesas@glider.be>.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks a lot!

With the few minor nits below fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- /dev/null
> +++ renesas/drivers/clk/renesas/r8a7743-cpg-mssr.c

> +static const struct mssr_mod_clk r8a7743_mod_clks[] __initconst = {

> +       DEF_MOD("mmcif0",         315,  R8A7743_CLK_MMC0),

"mmc0"

> +       DEF_MOD("audio-dmac0",    502,  R8A7743_CLK_HP),
> +       DEF_MOD("audio-dmac1",    501,  R8A7743_CLK_HP),

Please sort by numerical clock ID.

> +       DEF_MOD("i2c6",           926,  R8A7743_CLK_CP),

"iicdvfs"

> +static const unsigned int r8a7743_crit_mod_clks[] __initconst = {
> +       MOD_CLK_ID(408),        /* INTC-AP (GIC) */

INTC-SYS

> +};

> +static const struct rcar_gen2_cpg_pll_config cpg_pll_configs[8] __initconst = {
> +       /* EXTAL div    PLL1 mult       PLL3 mult */
> +       { 1,            208,            106,    },
> +       { 1,            208,            88,     },
> +       { 1,            156,            80,     },
> +       { 1,            156,            66,     },
> +       { 2,            240,            122,    },
> +       { 2,            240,            102,    },
> +       { 2,            208,            106,    },
> +       { 2,            208,            88,     },
> +};
> +
> +static int __init r8a7743_cpg_mssr_init(struct device *dev)
> +{
> +       const struct rcar_gen2_cpg_pll_config *cpg_pll_config;
> +       u32 cpg_mode = rcar_gen2_read_modemr();
> +
> +       cpg_pll_config = &cpg_pll_configs[CPG_PLL_CONFIG_INDEX(cpg_mode)];
> +       if (!cpg_pll_config->extal_div) {

This check is not needed, as extal_div is never zero in the above table.

> +               dev_err(dev, "Prohibited setting (cpg_mode=0x%x)\n", cpg_mode);
> +               return -EINVAL;
> +       }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
