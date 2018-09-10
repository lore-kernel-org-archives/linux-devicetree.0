Return-Path: <SRS0=slpH=LY=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180907165849.106182-1-chris.brandt@renesas.com>
In-Reply-To: <20180907165849.106182-1-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Sep 2018 16:04:33 +0200
Message-ID: <CAMuHMdXSmq_niZx6HWO-SYgXyzcUzx6VA+EsgvWNcFciR57CKw@mail.gmail.com>
Subject: Re: [PATCH v4] clk: renesas: cpg-mssr: Add R7S9210 support
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Fri, Sep 7, 2018 at 6:59 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add support for the R7S9210 (RZ/A2) Clock Pulse Generator and Module
> Standby.
>
> The Module Standby HW in the RZ/A series is very close to R-Car HW, except
> for how the registers are laid out.
> The MSTP registers are only 8-bits wide, there is no status registers
> (MSTPSR), and the register offsets are a little different. Since the RZ/A
> hardware manuals refer to these registers as the Standby Control Registers,
> we'll use that name to distinguish the RZ/A type from the R-Car type.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v4:
>  * Preserved sort order of SoC listings
>  * Removed R7S9210_CLK_PLL from dt-binding since it's an internal clock
>  * ratio_tab is now a struct making it look a little nicer
>  * Removed CLK_I,...CLK_P0 because they are already defined in dt-bindings
>  * Sorted mod_clks by ascending MSTP number
>  * Removed cast from clk_get_rate(parent)
>  * Corrected register index of stbcr[1]
>  * Don't use MOD_CLK_PACK_10 for non priv->stbyctrl devices (bug fix)

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v4.20.

One possible area for improvement is removing the unused entries in the
module clocks part of the priv->clks[] array:

+       .num_hw_mod_clks = 11 * 32, /* includes STBCR0 which doesn't exist */

Due to having 8-bit instead of 32-bit registers, 11 * 24 entries are not used.
Fixing that means adding more checks in several functions, though, so I
don't know if you want to go that far...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
