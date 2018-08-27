Return-Path: <SRS0=SWuu=LK=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180821032020.81254-1-chris.brandt@renesas.com>
In-Reply-To: <20180821032020.81254-1-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Aug 2018 18:37:26 +0200
Message-ID: <CAMuHMdUVfMgUYat8TR__hiOQEWHXL1EYMN11iMc5TGnhnZALLQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Add R7S9210 support
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Tue, Aug 21, 2018 at 5:20 AM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add support for the R7S9210 (RZ/A2) Clock Pulse Generator and Module
> Standby.

Thanks for your patch, looks mostly OK to me!

> The Module Standby HW in the RZ/A series is very close to R-Car HW, except
> for how the registers are laid out.
> The MSTP registers are only 8-bits wide, there is no status registers
> (MSTPST), and the register offsets are a little different. Since the RZ/A
> hardware manuals refer to these registers as the Standby Control Registers,
> we'll use that name to distinguish the RZ/A type for the R-Car type.

And it doesn't have the reset control registers, so you should not register
the reset controller (or register a different one, when you add the support).

> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Given the differences, and the limited amount of RAM on RZ/A2, I think you
would be better off with a separate renesas-cpg-stbcr driver, and an
r7s9210-cpg-stbcr counterpart.

That means:

>  .../devicetree/bindings/clock/renesas,cpg-mssr.txt |   3 +-

1. A separate binding document.

>  drivers/clk/renesas/Kconfig                        |   5 +
>  drivers/clk/renesas/Makefile                       |   1 +
>  drivers/clk/renesas/r7s9210-cpg-mssr.c             | 189 +++++++++++++++++++++
>  drivers/clk/renesas/renesas-cpg-mssr.c             |  66 +++++--
>  drivers/clk/renesas/renesas-cpg-mssr.h             |   6 +
>  include/dt-bindings/clock/r7s9210-cpg-mssr.h       |  21 +++
>  7 files changed, 280 insertions(+), 11 deletions(-)
>  create mode 100644 drivers/clk/renesas/r7s9210-cpg-mssr.c
>  create mode 100644 include/dt-bindings/clock/r7s9210-cpg-mssr.h
>
> diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
> index db542abadb75..66ca973edd77 100644
> --- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
> +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
> @@ -13,6 +13,7 @@ They provide the following functionalities:
>
>  Required Properties:
>    - compatible: Must be one of:
> +      - "renesas,r7s9210-cpg-mssr" for the r7s9210 SoC (RZ/A2)
>        - "renesas,r8a7743-cpg-mssr" for the r8a7743 SoC (RZ/G1M)
>        - "renesas,r8a7745-cpg-mssr" for the r8a7745 SoC (RZ/G1E)
>        - "renesas,r8a77470-cpg-mssr" for the r8a77470 SoC (RZ/G1C)
> @@ -37,7 +38,7 @@ Required Properties:
>    - clock-names: List of external parent clock names. Valid names are:
>        - "extal" (r8a7743, r8a7745, r8a77470, r8a7790, r8a7791, r8a7792,
>                  r8a7793, r8a7794, r8a7795, r8a7796, r8a77965, r8a77970,
> -                r8a77980, r8a77990, r8a77995)
> +                r8a77980, r8a77990, r8a77995, r7s9210)
>        - "extalr" (r8a7795, r8a7796, r8a77965, r8a77970, r8a77980)
>        - "usb_extal" (r8a7743, r8a7745, r8a77470, r8a7790, r8a7791, r8a7793,
>                      r8a7794)
> diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
> index 9022bbe1297e..d8ccdaba5103 100644
> --- a/drivers/clk/renesas/Kconfig
> +++ b/drivers/clk/renesas/Kconfig

> @@ -45,6 +46,10 @@ config CLK_RZA1
>         bool "RZ/A1H clock support" if COMPILE_TEST
>         select CLK_RENESAS_CPG_MSTP
>
> +config CLK_R7S9210
> +       bool "RZ/A2 clock support" if COMPILE_TEST
> +       select CLK_RENESAS_CPG_MSSR

2. a separate CLK_RENESAS_CPG_STBCR symbol.

> --- /dev/null
> +++ b/drivers/clk/renesas/r7s9210-cpg-mssr.c

3. Almost all of this can stay the same, modulo some renames.

> +static const struct mssr_mod_clk r7s9210_mod_clks[] __initconst = {
> +       DEF_MOD("ostm0",         306,   R7S9210_CLK_P1C),

4. Your module clocks can use e.g. "36" instead of "306" (also in the DTS),
   matching the datasheet.

> --- /dev/null
> +++ b/include/dt-bindings/clock/r7s9210-cpg-mssr.h

5. Almost all of this can stay the same, modulo some renames.

What do you think?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
