From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 2/2] clk: renesas: cpg-mssr: add R8A7745 support
Date: Mon, 7 Nov 2016 09:41:31 +0100
Message-ID: <CAMuHMdVbEP+pB6Bi1WmXy9MZREa30RiLZiZ0p+8YxYvuMUDj4g@mail.gmail.com>
References: <3539878.XFtRJDB9iq@wasted.cogentembedded.com> <4419870.yM1Fh9cWBP@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <4419870.yM1Fh9cWBP@wasted.cogentembedded.com>
Sender: linux-clk-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Sat, Nov 5, 2016 at 11:34 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add RZ/G1E (R8A7745) Clock  Pulse Generator / Module Standby and Software
> Reset support, using the CPG/MSSR driver core and the common R-Car Gen2
> (and RZ/G) code.
>
> Based on the proof-of-concept R8A7791 CPG/MSSR patch by Geert Uytterhoeven
> <geert+renesas@glider.be>.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> ---
> Changes in version 3:
> - removed the FDP1-1 module clock;
> - added Geert's tag.
>
> Changes in version 2:
> - changed the Z2 clock's divisor to 3.

> --- /dev/null
> +++ linux/drivers/clk/renesas/r8a7745-cpg-mssr.c
> @@ -0,0 +1,260 @@

> +static const struct cpg_core_clk r8a7745_core_clks[] __initconst = {

> +       /* Core Clock Outputs */

> +       DEF_FIXED("acp",    R8A7745_CLK_ACP,   CLK_EXTAL,         2, 1),

This clock is called CPEX instead of ACP in rev. 1.00 of the RZ/G Series User's
Manual: Hardware.

> +};
> +
> +static const struct mssr_mod_clk r8a7745_mod_clks[] __initconst = {

> +       DEF_MOD("thermal",        522,  CLK_EXTAL),

RZ/G1E does not have the thermal sensor (confirmed by rev. 1.00).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
