Return-Path: <SRS0=f8OU=J5=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180711170313.80321-1-chris.brandt@renesas.com> <20180711170313.80321-2-chris.brandt@renesas.com>
In-Reply-To: <20180711170313.80321-2-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Jul 2018 11:58:54 +0200
Message-ID: <CAMuHMdWxFT7PP-Xrd6NqmemmkJE2e-JS8RS1+Xiqz-Ldz6db_w@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: mstp: Add support for r7s9210
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

Thanks for your patch!

On Wed, Jul 11, 2018 at 7:03 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> [PATCH 1/2] clk: renesas: mstp: Add support for r7s9210

Please drop the "mstp", as the largest share of this patch is not about
MSTP clocks.

> Add support for RZ/A2 series.
> The clock HW is similar to RZ/A1, but with different dividers
> and additional clocks sources.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

>  drivers/clk/renesas/Kconfig    |   5 ++
>  drivers/clk/renesas/Makefile   |   1 +
>  drivers/clk/renesas/clk-mstp.c |   3 +
>  drivers/clk/renesas/clk-rz.c   | 155 ++++++++++++++++++++++++++++++++---------

You're adding ca. 100 new lines to an existing driver of 126 lines, most of
which are depending on the result of detect_rz()?
So I think you're best of adding a complete new driver clk-rza2.c, matching
against "renesas,r7s9210-cpg-clocks".
The "renesas,rz-cpg-clocks" won't be needed for RZ/A2.
And perhaps rename clk-rz.c to clk-rza1.c, and change its match string to
"renesas,r7s72100-cpg-clocks"?

BTW, please use fcfe0020 as the base address for the CPG (which requires
changing the register offsets in the driver), to avoid the warning we're
seeing with "make dtbs W=1" for RZ/A1:

    Warning (unique_unit_address): /soc/watchdog@fcfe0000: duplicate
unit-address (also used in node /soc/cpg_clocks@fcfe0000)

BTW2, I guess I can't convince you to write a modern new clock driver using
a single register block, describing all core and module clocks in C tables?
That would avoid making mistakes in keeping the clocks/clock-indices/
clock-output-names properties in the mstp clock nodes in DT in sync.
It would also make your life easier if you ever decide to support software
reset using the Software Reset Control Register in the same register
block.

> --- a/drivers/clk/renesas/clk-mstp.c
> +++ b/drivers/clk/renesas/clk-mstp.c
> @@ -213,6 +213,9 @@ static void __init cpg_mstp_clocks_init(struct device_node *np)
>         if (of_device_is_compatible(np, "renesas,r7s72100-mstp-clocks"))
>                 group->width_8bit = true;
>
> +       if (of_device_is_compatible(np, "renesas,r7s9210-mstp-clocks"))

You can merge the test with the test for RZ/A1 above.

> +               group->width_8bit = true;
> +
>         for (i = 0; i < MSTP_MAX_CLOCKS; ++i)
>                 clks[i] = ERR_PTR(-ENOENT);
>
> diff --git a/drivers/clk/renesas/clk-rz.c b/drivers/clk/renesas/clk-rz.c
> index ac2f86d626b6..199c6ae9704c 100644
> --- a/drivers/clk/renesas/clk-rz.c
> +++ b/drivers/clk/renesas/clk-rz.c
> @@ -24,44 +24,95 @@ struct rz_cpg {
>
>  #define CPG_FRQCR      0x10
>  #define CPG_FRQCR2     0x14
> +#define SWRSTCR3       0xFCFE0468
>
> +/* RZ/A1 */
>  #define PPR0           0xFCFE3200
>  #define PIBC0          0xFCFE7000
>
> -#define MD_CLK(x)      ((x >> 2) & 1)  /* P0_2 */
> +/* RZ/A2 */
> +#define PORTL_PIDR     0xFCFFE074
> +
> +#define RZA1 1
> +#define RZA2 2
>
>  /* -----------------------------------------------------------------------------
>   * Initialization
>   */
> +int detect_rz(void)
> +{
> +       void __iomem *swrstcr3;
> +       static int rz_device;
> +
> +       if (!rz_device) {
> +               swrstcr3 = ioremap_nocache(SWRSTCR3, 1);
> +               BUG_ON(!swrstcr3);
> +               if (ioread8(swrstcr3))
> +                       rz_device = RZA1;
> +               else
> +                       rz_device = RZA2;
> +               iounmap(swrstcr3);
> +       }
> +       return rz_device;
> +}

Please use the compatible value for differentiating (issue is moot with a
separate driver).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
