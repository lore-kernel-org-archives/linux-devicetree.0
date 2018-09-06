Return-Path: <SRS0=OJAt=LU=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180829132841.64787-1-chris.brandt@renesas.com>
In-Reply-To: <20180829132841.64787-1-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Sep 2018 13:55:48 +0200
Message-ID: <CAMuHMdUSVTk0FPmQSYJ+M1e4ds__7882Viseo6ra1TUBvnSbPQ@mail.gmail.com>
Subject: Re: [PATCH v3] clk: renesas: cpg-mssr: Add R7S9210 support
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Wed, Aug 29, 2018 at 3:29 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add support for the R7S9210 (RZ/A2) Clock Pulse Generator and Module
> Standby.

Thanks for your patch!

> The Module Standby HW in the RZ/A series is very close to R-Car HW, except
> for how the registers are laid out.
> The MSTP registers are only 8-bits wide, there is no status registers
> (MSTPST), and the register offsets are a little different. Since the RZ/A

MSTPSR

> hardware manuals refer to these registers as the Standby Control Registers,
> we'll use that name to distinguish the RZ/A type for the R-Car type.

from the R-Car type.

> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

> --- /dev/null
> +++ b/drivers/clk/renesas/r7s9210-cpg-mssr.c
> @@ -0,0 +1,193 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * R7S9210 Clock Pulse Generator / Module Standby
> + *
> + * Based on r8a7795-cpg-mssr.c
> + *
> + * Copyright (C) 2018 Chris Brandt
> + * Copyright (C) 2018 Renesas Electronics Corp.
> + *
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <dt-bindings/clock/r7s9210-cpg-mssr.h>
> +#include "renesas-cpg-mssr.h"
> +
> +#define CPG_FRQCR      0x00
> +#define CPG_CKIOSEL    0xF0
> +#define CPG_SCLKSEL    0xF4

The last two are unused?

> +
> +#define PORTL_PIDR     0xFCFFE074

Unused?

> +static u8 cpg_mode;
> +
> +/* Internal Clock ratio table */
> +static const unsigned int ratio_tab[5][5] = {
> +                       /* I,  G,  B, P1, P0 */

Use a struct instead?

struct {
        unsigned int i;
        unsigned int g;
        unsigned int ib
        unsigned int p1;
        unsigned int p0;
} ratio_tab[5] = { ... }

> +                       {  2,  4,  8, 16, 32 }, /* FRQCR = 0x012 */
> +                       {  4,  4,  8, 16, 32 }, /* FRQCR = 0x112 */
> +                       {  8,  4,  8, 16, 32 }, /* FRQCR = 0x212 */
> +                       { 16,  8, 16, 16, 32 }, /* FRQCR = 0x322 */
> +                       { 16, 16, 32, 32, 32 }, /* FRQCR = 0x333 */

The P0 divider is fixed to 32, so you can remove it from the table?

> +                       };
> +
> +enum rz_clk_types {
> +       CLK_TYPE_RZA_MAIN = CLK_TYPE_CUSTOM,
> +       CLK_TYPE_RZA_PLL,
> +};
> +
> +enum clk_ids {
> +       /* Core Clock Outputs exported to DT */
> +       LAST_DT_CORE_CLK = R7S9210_CLK_P0,
> +
> +       /* External Input Clocks */
> +       CLK_EXTAL,
> +
> +       /* Internal Core Clocks */
> +       CLK_MAIN,
> +       CLK_PLL,
> +       CLK_I,
> +       CLK_G,
> +       CLK_B,
> +       CLK_P1,
> +       CLK_P1C,
> +       CLK_P0,

The last six are not used and can be removed
(the driver uses R7S9210_CLK_* instead).

> +
> +       /* Module Clocks */
> +       MOD_CLK_BASE
> +};
> +
> +static struct cpg_core_clk r7s9210_core_clks[] = {
> +       /* External Clock Inputs */
> +       DEF_INPUT("extal",     CLK_EXTAL),
> +
> +       /* Internal Core Clocks */
> +       DEF_BASE(".main",       CLK_MAIN, CLK_TYPE_RZA_MAIN, CLK_EXTAL),
> +       DEF_BASE(".pll",       CLK_PLL, CLK_TYPE_RZA_PLL, CLK_MAIN),
> +
> +       /* Core Clock Outputs */
> +       DEF_FIXED("i",      R7S9210_CLK_I,     CLK_PLL,          2, 1),
> +       DEF_FIXED("g",      R7S9210_CLK_G,     CLK_PLL,          4, 1),
> +       DEF_FIXED("b",      R7S9210_CLK_B,     CLK_PLL,          8, 1),
> +       DEF_FIXED("p1",     R7S9210_CLK_P1,    CLK_PLL,         16, 1),
> +       DEF_FIXED("p1c",    R7S9210_CLK_P1C,   CLK_PLL,         16, 1),
> +       DEF_FIXED("p0",     R7S9210_CLK_P0,    CLK_PLL,         32, 1),
> +};
> +
> +static const struct mssr_mod_clk r7s9210_mod_clks[] __initconst = {
> +       DEF_MOD_STB("ostm0",     36,    R7S9210_CLK_P1C),
> +       DEF_MOD_STB("ostm1",     35,    R7S9210_CLK_P1C),
> +       DEF_MOD_STB("ostm2",     34,    R7S9210_CLK_P1C),

I think the table is easier to read if you sort by MSTP number.

> +
> +       DEF_MOD_STB("scif0",     47,    R7S9210_CLK_P1C),
> +       DEF_MOD_STB("scif1",     46,    R7S9210_CLK_P1C),
> +       DEF_MOD_STB("scif2",     45,    R7S9210_CLK_P1C),
> +       DEF_MOD_STB("scif3",     44,    R7S9210_CLK_P1C),
> +       DEF_MOD_STB("scif4",     43,    R7S9210_CLK_P1C),
> +
> +       DEF_MOD_STB("ether0",    65,    R7S9210_CLK_B),
> +       DEF_MOD_STB("ether1",    64,    R7S9210_CLK_B),
> +
> +       DEF_MOD_STB("i2c0",      87,    R7S9210_CLK_P1),
> +       DEF_MOD_STB("i2c1",      86,    R7S9210_CLK_P1),
> +       DEF_MOD_STB("i2c2",      85,    R7S9210_CLK_P1),
> +       DEF_MOD_STB("i2c3",      84,    R7S9210_CLK_P1),
> +
> +};
> +
> +struct clk * __init rza2_cpg_clk_register(struct device *dev,
> +       const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
> +       struct clk **clks, void __iomem *base,
> +       struct raw_notifier_head *notifiers)
> +{
> +       const struct clk *parent;
> +       unsigned int mult = 1;
> +       unsigned int div = 1;
> +       u16 frqcr;
> +       u8 index;
> +       int i;
> +
> +       parent = clks[core->parent];
> +       if (IS_ERR(parent))
> +               return ERR_CAST(parent);
> +
> +       switch (core->id) {
> +       case CLK_MAIN:
> +               break;
> +
> +       case CLK_PLL:
> +               if (cpg_mode)
> +                       mult = 44;      /* Divider 1 is 1/2 */
> +               else
> +                       mult = 88;      /* Divider 1 is 1 */
> +               break;
> +
> +       default:
> +               return ERR_PTR(-EINVAL);
> +       }
> +
> +       /* Adjust the dividers based on the current FRQCR setting */
> +       if (core->id == CLK_MAIN) {
> +
> +               /* If EXTAL is above 12MHz, then we know it is Mode 1 */
> +               if (clk_get_rate((struct clk *)parent) > 12000000)

Why the cast?

> +                       cpg_mode = 1;
> +
> +               frqcr = clk_readl(base + CPG_FRQCR) & 0xFFF;
> +               if (frqcr == 0x012)
> +                       index = 0;
> +               else if (frqcr == 0x112)
> +                       index = 1;
> +               else if (frqcr == 0x212)
> +                       index = 2;
> +               else if (frqcr == 0x322)
> +                       index = 3;
> +               else if (frqcr == 0x333)
> +                       index = 4;
> +               else
> +                       BUG_ON(1);      /* Illegal FRQCR value */
> +
> +               for (i = 0; i < ARRAY_SIZE(r7s9210_core_clks); i++) {
> +                       switch (r7s9210_core_clks[i].id) {
> +                       case R7S9210_CLK_I:
> +                               r7s9210_core_clks[i].div = ratio_tab[index][0];
> +                               break;
> +                       case R7S9210_CLK_G:
> +                               r7s9210_core_clks[i].div = ratio_tab[index][1];
> +                               break;
> +                       case R7S9210_CLK_B:
> +                               r7s9210_core_clks[i].div = ratio_tab[index][2];
> +                               break;
> +                       case R7S9210_CLK_P1:
> +                       case R7S9210_CLK_P1C:
> +                               r7s9210_core_clks[i].div = ratio_tab[index][3];
> +                               break;
> +                       case R7S9210_CLK_P0:
> +                               r7s9210_core_clks[i].div = ratio_tab[index][4];
> +                               break;
> +                       }
> +               }
> +       }
> +
> +       return clk_register_fixed_factor(NULL, core->name,
> +                                        __clk_get_name(parent), 0, mult, div);
> +}
> +
> +const struct cpg_mssr_info r7s9210_cpg_mssr_info __initconst = {
> +       /* Core Clocks */
> +       .core_clks = r7s9210_core_clks,
> +       .num_core_clks = ARRAY_SIZE(r7s9210_core_clks),
> +       .last_dt_core_clk = LAST_DT_CORE_CLK,
> +       .num_total_core_clks = MOD_CLK_BASE,
> +
> +       /* Module Clocks */
> +       .mod_clks = r7s9210_mod_clks,
> +       .num_mod_clks = ARRAY_SIZE(r7s9210_mod_clks),
> +       .num_hw_mod_clks = 11 * 32, /* includes STBCR0/1/2 which don't exist */

According to the HW manual, STBCR1/2 do not exist?

> +
> +       /* Callbacks */
> +       .cpg_clk_register = rza2_cpg_clk_register,
> +
> +       /* RZ/A2 has Standby Control Registers */
> +       .stbyctrl = true,
> +};

> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -73,6 +73,17 @@ static const u16 smstpcr[] = {
>
>  #define        SMSTPCR(i)      smstpcr[i]
>
> +/*
> + * Standby Control Register offsets (RZ/A)
> + * Base address is FRQCR register
> + */
> +
> +static const u16 stbcr[] = {
> +       0x000, 0x000, 0x014, 0x410, 0x414, 0x418, 0x41C, 0x420,

stbcr[1] should be 0x010?

> +       0x424, 0x428, 0x42C, 0x430, 0x434, 0x460,

The last 3 don't exist?

> +};

> @@ -240,8 +270,14 @@ struct clk *cpg_mssr_clk_src_twocell_get(struct of_phandle_args *clkspec,
>
>         case CPG_MOD:
>                 type = "module";
> -               idx = MOD_CLK_PACK(clkidx);
> -               if (clkidx % 100 > 31 || idx >= priv->num_mod_clks) {
> +               if (priv->stbyctrl) {
> +                       idx = MOD_CLK_PACK_10(clkidx);
> +                       range_check = 7 - (clkidx % 10);
> +               } else {
> +                       idx = MOD_CLK_PACK_10(clkidx);

MOD_CLK_PACK()

> +                       range_check = 31 - (clkidx % 100);
> +               }
> +               if (range_check < 0 || idx >= priv->num_mod_clks) {
>                         dev_err(dev, "Invalid %s clock index %u\n", type,
>                                 clkidx);
>                         return ERR_PTR(-EINVAL);
> @@ -740,6 +776,12 @@ static const struct of_device_id cpg_mssr_match[] = {
>                 .compatible = "renesas,r8a77995-cpg-mssr",
>                 .data = &r8a77995_cpg_mssr_info,
>         },
> +#endif
> +#ifdef CONFIG_CLK_R7S9210
> +       {
> +               .compatible = "renesas,r7s9210-cpg-mssr",
> +               .data = &r7s9210_cpg_mssr_info,
> +       },

Please preserve sort order.

> --- a/drivers/clk/renesas/renesas-cpg-mssr.h
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.h
> @@ -78,6 +78,13 @@ struct mssr_mod_clk {
>  #define DEF_MOD(_name, _mod, _parent...)       \
>         { .name = _name, .id = MOD_CLK_ID(_mod), .parent = _parent }
>
> +/* Convert from sparse base-10 to packed index space */
> +#define MOD_CLK_PACK_10(x)     ((x / 10) * 32 + (x % 10))

"PACK" is a bit of a misnomer, as it no longer packs, but expands from base-10
to base-32  ;-)


> @@ -111,6 +122,7 @@ struct cpg_mssr_info {
>         unsigned int num_core_clks;
>         unsigned int last_dt_core_clk;
>         unsigned int num_total_core_clks;
> +       bool stbyctrl;
>
>         /* Module Clocks */
>         const struct mssr_mod_clk *mod_clks;
> @@ -149,6 +161,7 @@ extern const struct cpg_mssr_info r8a77970_cpg_mssr_info;
>  extern const struct cpg_mssr_info r8a77980_cpg_mssr_info;
>  extern const struct cpg_mssr_info r8a77990_cpg_mssr_info;
>  extern const struct cpg_mssr_info r8a77995_cpg_mssr_info;
> +extern const struct cpg_mssr_info r7s9210_cpg_mssr_info;

Please preserve sort order.

> --- /dev/null
> +++ b/include/dt-bindings/clock/r7s9210-cpg-mssr.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Copyright (C) 2018 Renesas Electronics Corp.
> + *
> + */
> +
> +#ifndef __DT_BINDINGS_CLOCK_R7S9210_CPG_MSSR_H__
> +#define __DT_BINDINGS_CLOCK_R7S9210_CPG_MSSR_H__
> +
> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> +
> +/* R7S9210 CPG Core Clocks */
> +#define R7S9210_CLK_PLL                        0

Should that be an internal clock, not referred to from DT?
There's already the internal CLK_PLL clock.

> +#define R7S9210_CLK_I                  1
> +#define R7S9210_CLK_G                  2
> +#define R7S9210_CLK_B                  3
> +#define R7S9210_CLK_P1                 4
> +#define R7S9210_CLK_P1C                        5
> +#define R7S9210_CLK_P0                 6

The comment in Figure 6.1 suggests there's also P0C, but that may be a
mistake, as I can find no other references to it?

What about other clocks: BSCCLK, OCTCLK, HYPCLK, and SPICLK?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
