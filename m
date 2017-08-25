From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] clk: renesas: cpg-mssr: add R8A7797 support
Date: Fri, 25 Aug 2017 10:35:45 +0200
Message-ID: <CAMuHMdU5CSeoHfBrp-TU8wka-jY3PQfD1YUTDAnfXkU62b7UBg@mail.gmail.com>
References: <20170823125744.424675523@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170823125744.424675523@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Vladimir Barinov <vladimir.barinov@cogentembedded.com>, Simon Horman <horms+renesas@verge.net.au>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Wed, Aug 23, 2017 at 2:52 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add R-Car V3M (R8A7797) Clock Pulse Generator / Module Standby and
> Software Reset support, using the CPG/MSSR driver core and the common
> R-Car Gen3 code.
>
> Based on the original (and large) patch by Daisuke Matsushita
> <daisuke.matsushita.ns@hitachi.com>.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks for your patch!

> +++ linux/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
> @@ -22,6 +22,7 @@ Required Properties:
>        - "renesas,r8a7794-cpg-mssr" for the r8a7794 SoC (R-Car E2)
>        - "renesas,r8a7795-cpg-mssr" for the r8a7795 SoC (R-Car H3)
>        - "renesas,r8a7796-cpg-mssr" for the r8a7796 SoC (R-Car M3-W)
> +      - "renesas,r8a7797-cpg-mssr" for the r8a7797 SoC (R-Car V3M)

Please use "renesas,r8a77970-cpg-mssr", to follow the new 5-digit scheme
started with r8a77995, and "r8a77970".

> @@ -30,8 +31,8 @@ Required Properties:
>      clock-names
>    - clock-names: List of external parent clock names. Valid names are:
>        - "extal" (r8a7743, r8a7745, r8a7790, r8a7791, r8a7792, r8a7793, r8a7794,
> -                r8a7795, r8a7796)
> -      - "extalr" (r8a7795, r8a7796)
> +                r8a7795, r8a7796, r8a7797)
> +      - "extalr" (r8a7795, r8a7796, r8a7797)

Likewise.

> --- linux.orig/drivers/clk/renesas/Kconfig
> +++ linux/drivers/clk/renesas/Kconfig
> @@ -15,6 +15,7 @@ config CLK_RENESAS
>         select CLK_R8A7794 if ARCH_R8A7794
>         select CLK_R8A7795 if ARCH_R8A7795
>         select CLK_R8A7796 if ARCH_R8A7796
> +       select CLK_R8A7797 if ARCH_R8A7797

There's no ARCH_R8A7797 yet.
Should be CLK_R8A77970 and ARCH_R8A77970.

>         select CLK_SH73A0 if ARCH_SH73A0
>
>  if CLK_RENESAS
> @@ -94,6 +95,10 @@ config CLK_R8A7796
>         bool
>         select CLK_RCAR_GEN3_CPG
>
> +config CLK_R8A7797

CLK_R8A77970

> +       bool

bool "R-Car V3M clock support" if COMPILE_TEST

> --- linux.orig/drivers/clk/renesas/Makefile
> +++ linux/drivers/clk/renesas/Makefile
> @@ -13,6 +13,7 @@ obj-$(CONFIG_CLK_R8A7792)             += r8a7792-cp
>  obj-$(CONFIG_CLK_R8A7794)              += r8a7794-cpg-mssr.o
>  obj-$(CONFIG_CLK_R8A7795)              += r8a7795-cpg-mssr.o
>  obj-$(CONFIG_CLK_R8A7796)              += r8a7796-cpg-mssr.o
> +obj-$(CONFIG_CLK_R8A7797)              += r8a7797-cpg-mssr.o

...77970...

>  obj-$(CONFIG_CLK_SH73A0)               += clk-sh73a0.o
>
>  # Family
> Index: linux/drivers/clk/renesas/r8a7797-cpg-mssr.c
> ===================================================================
> --- /dev/null
> +++ linux/drivers/clk/renesas/r8a7797-cpg-mssr.c

...77970...

> +       /* Internal Core Clocks */

> +       CLK_S1,
> +       CLK_S2,

There are no S1 and S2 clocks in Figure 8.1c.

> +static const struct cpg_core_clk r8a7797_core_clks[] __initconst = {

> +       /* Internal Core Clocks */

> +       DEF_FIXED(".s1",        CLK_S1,         CLK_PLL1_DIV2,  4, 1),
> +       DEF_FIXED(".s2",        CLK_S2,         CLK_PLL1_DIV2,  6, 1),

There are no S1 and S2 clocks in Figure 8.1c.

> +       /* Core Clock Outputs */

> +       DEF_FIXED("s1d1",       R8A7797_CLK_S1D1,  CLK_S1,         1, 1),
> +       DEF_FIXED("s1d2",       R8A7797_CLK_S1D2,  CLK_S1,         2, 1),
> +       DEF_FIXED("s1d4",       R8A7797_CLK_S1D4,  CLK_S1,         4, 1),
> +       DEF_FIXED("s2d1",       R8A7797_CLK_S2D1,  CLK_S2,         1, 1),
> +       DEF_FIXED("s2d2",       R8A7797_CLK_S2D2,  CLK_S2,         2, 1),
> +       DEF_FIXED("s2d4",       R8A7797_CLK_S2D4,  CLK_S2,         4, 1),

There are no S1 and S2 clocks in Figure 8.1c.
Please divide CLK_PLL1_DIV2 directly.

> +static const struct mssr_mod_clk r8a7797_mod_clks[] __initconst = {

As usual, I could not verify all parent clocks.

> +static const struct rcar_gen3_cpg_pll_config cpg_pll_configs[8] __initconst = {
> +       /* EXTAL div    PLL1 mult       PLL3 mult */

This struct recently gained a "PLL1 div" column, which should be all ones
for V3M.

> +static int __init r8a7797_cpg_mssr_init(struct device *dev)
> +{
> +       const struct rcar_gen3_cpg_pll_config *cpg_pll_config;
> +       u32 cpg_mode;
> +       int error;
> +
> +       error = rcar_rst_read_mode_pins(&cpg_mode);
> +       if (error)
> +               return error;
> +
> +       cpg_pll_config = &cpg_pll_configs[CPG_PLL_CONFIG_INDEX(cpg_mode)];
> +       if (!cpg_pll_config->extal_div) {

This check is not needed on V3M, as all 8 combinations are valid.

> --- linux.orig/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ linux/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -680,6 +680,12 @@ static const struct of_device_id cpg_mss
>                 .data = &r8a7796_cpg_mssr_info,
>         },
>  #endif
> +#ifdef CONFIG_CLK_R8A7797
> +       {
> +               .compatible = "renesas,r8a7797-cpg-mssr",
> +               .data = &r8a7797_cpg_mssr_info,
> +       },
> +#endif

...77970...

> --- linux.orig/drivers/clk/renesas/renesas-cpg-mssr.h
> +++ linux/drivers/clk/renesas/renesas-cpg-mssr.h
> @@ -138,6 +138,7 @@ extern const struct cpg_mssr_info r8a779
>  extern const struct cpg_mssr_info r8a7794_cpg_mssr_info;
>  extern const struct cpg_mssr_info r8a7795_cpg_mssr_info;
>  extern const struct cpg_mssr_info r8a7796_cpg_mssr_info;
> +extern const struct cpg_mssr_info r8a7797_cpg_mssr_info;

...77970...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
