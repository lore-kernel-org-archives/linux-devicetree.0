Return-Path: <SRS0=ReDA=KQ=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1532936891-25034-1-git-send-email-biju.das@bp.renesas.com> <1532936891-25034-6-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1532936891-25034-6-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Aug 2018 11:26:50 +0200
Message-ID: <CAMuHMdV1vQkBg+d8HmNDVPZOBiH-tmRbmE+ZcWcnqMaP1zgWhg@mail.gmail.com>
Subject: Re: [PATCH 5/5] clk: renesas: cpg-mssr: Add r8a774a1 support
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Biju,

On Mon, Jul 30, 2018 at 9:54 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Add RZ/G2M (R8A774A1) Clock Pulse Generator / Module Standby and Software
> Reset support.
>
> Based on the Table 8.2b of "RZ/G Series, 2nd Generation User's Manual:
> Hardware ((Rev. 0.61, June 12, 2018)".
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/clk/renesas/r8a774a1-cpg-mssr.c

> +static const struct cpg_core_clk r8a774a1_core_clks[] __initconst = {

> +       DEF_DIV6_RO("osc",      R8A774A1_CLK_OSC,   CLK_EXTAL, CPG_RCKCR,  8),
> +       DEF_DIV6_RO("r_int",    CLK_RINT,          CLK_EXTAL, CPG_RCKCR, 32),

RZ/G2M does not have the CPG_RCKCR register.
The internal R CLK is an internal clock, hence please name it ".r".

Please have a look at "clk: renesas: rcar-gen3: OSC and RCLK improvements"
(https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=2063)

> +/*
> + * CPG Clock Data
> + */
> +
> +/*
> + *   MD                EXTAL           PLL0    PLL1    PLL2    PLL3    PLL4
> + * 14 13 19 17 (MHz)
> + *-------------------------------------------------------------------
> + * 0  0  0  0  16.66 x 1       x180    x192    x144    x192    x144
> + * 0  0  0  1  16.66 x 1       x180    x192    x144    x128    x144
> + * 0  0  1  0  Prohibited setting
> + * 0  0  1  1  16.66 x 1       x180    x192    x144    x192    x144
> + * 0  1  0  0  20    x 1       x150    x160    x120    x160    x120
> + * 0  1  0  1  20    x 1       x150    x160    x120    x106    x120
> + * 0  1  1  0  Prohibited setting
> + * 0  1  1  1  20    x 1       x150    x160    x120    x160    x120
> + * 1  0  0  0  25    x 1       x120    x128    x96     x128    x96
> + * 1  0  0  1  25    x 1       x120    x128    x96     x84     x96
> + * 1  0  1  0  Prohibited setting
> + * 1  0  1  1  25    x 1       x120    x128    x96     x128    x96
> + * 1  1  0  0  33.33 / 2       x180    x192    x144    x192    x144
> + * 1  1  0  1  33.33 / 2       x180    x192    x144    x128    x144
> + * 1  1  1  0  Prohibited setting
> + * 1  1  1  1  33.33 / 2       x180    x192    x144    x192    x144
> + */
> +#define CPG_PLL_CONFIG_INDEX(md)       ((((md) & BIT(14)) >> 11) | \
> +                                        (((md) & BIT(13)) >> 11) | \
> +                                        (((md) & BIT(19)) >> 18) | \
> +                                        (((md) & BIT(17)) >> 17))
> +
> +static const struct rcar_gen3_cpg_pll_config cpg_pll_configs[16] __initconst = {
> +       /* EXTAL div    PLL1 mult/div   PLL3 mult/div */
> +       { 1,            192,    1,      192,    1,      },
> +       { 1,            192,    1,      128,    1,      },
> +       { 0, /* Prohibited setting */                   },
> +       { 1,            192,    1,      192,    1,      },
> +       { 1,            160,    1,      160,    1,      },
> +       { 1,            160,    1,      106,    1,      },
> +       { 0, /* Prohibited setting */                   },
> +       { 1,            160,    1,      160,    1,      },
> +       { 1,            128,    1,      128,    1,      },
> +       { 1,            128,    1,      84,     1,      },
> +       { 0, /* Prohibited setting */                   },
> +       { 1,            128,    1,      128,    1,      },
> +       { 2,            192,    1,      192,    1,      },
> +       { 2,            192,    1,      128,    1,      },
> +       { 0, /* Prohibited setting */                   },
> +       { 2,            192,    1,      192,    1,      },
> +};

Please add the new OSC predividers. You're gonna need them for the
corrected OSC clock.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
