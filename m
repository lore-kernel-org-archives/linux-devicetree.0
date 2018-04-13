Return-Path: <SRS0=Uqzc=HC=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1523439447-1084-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1523439447-1084-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1523439447-1084-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Apr 2018 12:36:46 +0200
Message-ID: <CAMuHMdXViS-HoHWaO55FW3vepMt-KOmo-EpF1C-6N=Kq_WgV1Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: cpg-mssr: Add support for R-Car E3
Content-Type: text/plain; charset="UTF-8"
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Shimoda-san,

On Wed, Apr 11, 2018 at 11:37 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Initial support for R-Car E3 (r8a77990), including core and module
> clocks.
>
> Based on the Table 8.2g of "R-Car Series, 3rd Generation User's Manual:
> Hardware ((Rev. 0.80, Oct 31, 2017) with Manual Errata on Feb. 28, 2018".
>
> Inspried by patches by Takeshi Kihara in the BSP.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
> +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
> @@ -26,6 +26,7 @@ Required Properties:
>        - "renesas,r8a77965-cpg-mssr" for the r8a77965 SoC (R-Car M3-N)
>        - "renesas,r8a77970-cpg-mssr" for the r8a77970 SoC (R-Car V3M)
>        - "renesas,r8a77980-cpg-mssr" for the r8a77980 SoC (R-Car V3H)
> +      - "renesas,r8a77990-cpg-mssr" for the r8a77995 SoC (R-Car E3)

r8a77990 SoC

>        - "renesas,r8a77995-cpg-mssr" for the r8a77995 SoC (R-Car D3)

> --- /dev/null
> +++ b/drivers/clk/renesas/r8a77990-cpg-mssr.c
> @@ -0,0 +1,291 @@

> +static const struct cpg_core_clk r8a77990_core_clks[] __initconst = {

> +       /* Core Clock Outputs */

> +       DEF_GEN3_PE("s0d6c",   R8A77990_CLK_S0D6C, CLK_S0, 6, CLK_PE, 6),

... CLK_PE, 2),

> +       DEF_GEN3_PE("s3d1c",   R8A77990_CLK_S3D1C, CLK_S3, 1, CLK_PE, 1),
> +       DEF_GEN3_PE("s3d2c",   R8A77990_CLK_S3D2C, CLK_S3, 2, CLK_PE, 2),
> +       DEF_GEN3_PE("s3d4c",   R8A77990_CLK_S3D4C, CLK_S3, 4, CLK_PE, 4),
> +
> +       DEF_DIV6P1("canfd",    R8A77990_CLK_CANFD, CLK_PLL0D6, 0x244),

I cannot confirm the parent, as Section 8.2.18 ("CAN-FD Clock Frequency
Control Register (CANFDCKCR)") does not specify the source clock frequency
for R-Car E3 (unlike for D3). But 800 MHz sounds sane.

> +       DEF_DIV6P1("csi0",     R8A77990_CLK_CSI0,  CLK_PLL1D2, 0x00c),

I cannot confirm the parent clock, as CSI0 is not documented.
But given PLL1 runs at 1.6 GHz, PLL1/2 is consistent with PLL1/4 on other
R-Car Gen3 SoCs with a faster PLL1 (3.2 GHz).

> +static const struct mssr_mod_clk r8a77990_mod_clks[] __initconst = {

> +       DEF_MOD("vin7",                  804,   R8A77990_CLK_S1D2),
> +       DEF_MOD("vin6",                  805,   R8A77990_CLK_S1D2),

Vin6/7 have been removed in the Feb. errata.

With the above fixed/confirmed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
