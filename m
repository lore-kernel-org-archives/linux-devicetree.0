Return-Path: <SRS0=BlMk=GS=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1522161443-54428-7-git-send-email-biju.das@bp.renesas.com>
References: <1522161443-54428-1-git-send-email-biju.das@bp.renesas.com> <1522161443-54428-7-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Mar 2018 14:20:39 +0200
Message-ID: <CAMuHMdU42sZzUoiWCUUhWAUqDKHY_WT8wHNz34bN0YZLqUjOhQ@mail.gmail.com>
Subject: Re: [PATCH 06/12] clk: renesas: cpg-mssr: Add r8a77470 support
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Biju,

On Tue, Mar 27, 2018 at 4:37 PM, Biju Das <biju.das@bp.renesas.com> wrote:
> Add RZ/G1C (R8A77470) Clock Pulse Generator / Module Standby and Software
> Reset support.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/clk/renesas/r8a7747x-cpg-mssr.c

For consistency, I'd call this r8a77470-cpg-mssr.c.

> @@ -0,0 +1,229 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * r8a7747 Clock Pulse Generator / Module Standby and Software Reset

r8a77470

> +static const struct cpg_core_clk r8a77470_core_clks[] __initconst = {
> +       /* External Clock Inputs */
> +       DEF_INPUT("extal",      CLK_EXTAL),
> +       DEF_INPUT("usb_extal",  CLK_USB_EXTAL),
> +
> +       /* Internal Core Clocks */
> +       DEF_BASE(".main",       CLK_MAIN, CLK_TYPE_GEN2_MAIN, CLK_EXTAL),
> +       DEF_BASE(".pll0",       CLK_PLL0, CLK_TYPE_GEN2_PLL0, CLK_MAIN),
> +       DEF_BASE(".pll1",       CLK_PLL1, CLK_TYPE_GEN2_PLL1, CLK_MAIN),
> +       DEF_BASE(".pll3",       CLK_PLL3, CLK_TYPE_GEN2_PLL3, CLK_MAIN),
> +
> +       DEF_FIXED(".pll1_div2", CLK_PLL1_DIV2, CLK_PLL1, 2, 1),
> +
> +       /* Core Clock Outputs */
> +       DEF_BASE("lb",   R8A77470_CLK_LB,   CLK_TYPE_GEN2_LB,   CLK_PLL1),

DEF_FIXED("lb", R8A77470_CLK_LB, CLK_PLL1, 24, 1)
and move it down between "b" and "p".

Note: apparently the dependency on MD18 is true for R-Car H2 only, so
I will fix this in the other clock drivers.

> +/*
> + * CPG Clock Data
> + */
> +
> +/*
> + *    MD       EXTAL           PLL0    PLL1    PLL3
> + * 14 13       (MHz)           *1      *2
> + *---------------------------------------------------
> + * 0  0                20              x80/2   x78     x50
> + * 0  1                26              x60/2   x60     x56
> + * 1  0                Prohibitted setting
> + * 1  1                30              x52/2   x52     x50

It looks like all PLL0/PLL1/PLL3 values are already the predivided values,
unlike in other clock drivers? ...

> + *
> + * *1 :        Table 7.4 indicates VCO output (PLL0 = VCO/2)
> + * *2 :        Table 7.4 indicates VCO output (PLL1 = VCO)
> + */
> +#define CPG_PLL_CONFIG_INDEX(md)       ((((md) & BIT(14)) >> 13) | \
> +                                        (((md) & BIT(13)) >> 13))
> +
> +static const struct rcar_gen2_cpg_pll_config cpg_pll_configs[8] __initconst = {

cpg_pll_configs[4]

> +       /* EXTAL div    PLL1 mult       PLL3 mult */
> +       { 1,            78,             50,     },
> +       { 1,            60,             56,     },
> +       { /* Invalid*/                          },
> +       { 1,            52,             50,     },

... so I think these should be multiplied by the predivider, which will allow
to drop the corresponding test for RZ/G1C in rcar_gen2_cpg_clk_register.


> +};
> +
> +static int __init r8a7747x_cpg_mssr_init(struct device *dev)

r8a77470_cpg_mssr_init

> --- a/drivers/clk/renesas/rcar-gen2-cpg.c
> +++ b/drivers/clk/renesas/rcar-gen2-cpg.c
> @@ -16,6 +16,7 @@
>  #include <linux/init.h>
>  #include <linux/io.h>
>  #include <linux/slab.h>
> +#include <linux/sys_soc.h>
>
>  #include "renesas-cpg-mssr.h"
>  #include "rcar-gen2-cpg.h"
> @@ -257,10 +258,21 @@ static const struct clk_div_table cpg_sd01_div_table[] = {
>         {  0,  0 },
>  };
>
> +static const struct clk_div_table rz_g1c_cpg_sd01_div_table[] = {
> +       {  5, 12 }, {  6, 16 }, {  7, 18 }, {  8, 24 },
> +       { 10, 36 }, { 11, 48 }, { 12, 10 }, {  0,  0 },
> +};

This table is identical to cpg_sd01_div_table[], except for the missing first
entry. So perhaps you could just use &cpg_sd01_div_table[1] instead?

> +
> +
>  static const struct rcar_gen2_cpg_pll_config *cpg_pll_config __initdata;
>  static unsigned int cpg_pll0_div __initdata;
>  static u32 cpg_mode __initdata;
>
> +static const struct soc_device_attribute r8a7747xes[] = {
> +       { .soc_id = "r8a77470", .revision = "ES2.*" },

So this does not apply to ES3.0 and later?
What about ES1.*?

> +       { /* sentinel */ }
> +};

> @@ -303,7 +315,10 @@ struct clk * __init rcar_gen2_cpg_clk_register(struct device *dev,
>                 break;
>
>         case CLK_TYPE_GEN2_PLL1:
> -               mult = cpg_pll_config->pll1_mult / 2;
> +               if (soc_device_match(r8a7747xes))
> +                       mult = cpg_pll_config->pll1_mult;
> +               else
> +                       mult = cpg_pll_config->pll1_mult / 2;

If think this can be dropped if the values in cpg_pll_configs[] are
multiplied by 2.

> @@ -314,7 +329,10 @@ struct clk * __init rcar_gen2_cpg_clk_register(struct device *dev,
>                 return cpg_z_clk_register(core->name, parent_name, base);
>
>         case CLK_TYPE_GEN2_LB:
> -               div = cpg_mode & BIT(18) ? 36 : 24;
> +               if (soc_device_match(r8a7747xes))
> +                       div = 24;
> +               else
> +                       div = cpg_mode & BIT(18) ? 36 : 24;

Can be dropped if LB is modeled as a fixed clock instead.

>                 break;
>
>         case CLK_TYPE_GEN2_ADSP:
> @@ -326,12 +344,20 @@ struct clk * __init rcar_gen2_cpg_clk_register(struct device *dev,
>                 break;
>
>         case CLK_TYPE_GEN2_SD0:
> -               table = cpg_sd01_div_table;
> +               if (soc_device_match(r8a7747xes))
> +                       table = rz_g1c_cpg_sd01_div_table;
> +               else
> +                       table = cpg_sd01_div_table;

table = cpg_sd01_div_table;
if (soc_device_match(r8a7747xes))
        table++;

> +
>                 shift = 4;
>                 break;
>
>         case CLK_TYPE_GEN2_SD1:
> -               table = cpg_sd01_div_table;
> +               if (soc_device_match(r8a7747xes))
> +                       table = rz_g1c_cpg_sd01_div_table;
> +               else
> +                       table = cpg_sd01_div_table;

Likewise.

> +
>                 shift = 0;
>                 break;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
