Return-Path: <SRS0=H6vz=LL=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180821032020.81254-1-chris.brandt@renesas.com>
 <CAMuHMdUVfMgUYat8TR__hiOQEWHXL1EYMN11iMc5TGnhnZALLQ@mail.gmail.com>
 <TY1PR01MB15620184F9EA4E62E21D1D688A0B0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdVd7wT5vPrHFAgHYqNWtJNjbSG7GaaPaMVD12cfkg8E2A@mail.gmail.com> <TY1PR01MB1562485EE3C0F9C5A3827CDD8A0A0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1562485EE3C0F9C5A3827CDD8A0A0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Aug 2018 19:35:41 +0200
Message-ID: <CAMuHMdVBcKP_RTw1B4fty5u5OhStZPydigKVob+7+uc4YWFzDg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Add R7S9210 support
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Tue, Aug 28, 2018 at 7:18 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> Since my config for RZ/A2 does not set CONFIG_RESET_CONTROLLER, none of
> the reset code is built and cpg_mssr_reset_controller_register() just
> ends up being an empty function.

Let's try shmobile_defconfig instead :-)

Seriously, you do have to prevent registering the reset controller when
running on RZ/A2 (based on cpg_mssr_info.stbyctrl or some other indicator).

> So basically my only change at this point is to make DTS and the module
> clock table use "36" instead of "306".
>
> Are you OK with the idea of adding a macro ("STBCR_ID") in
> include/dt-bindings/clock/renesas-cpg-mssr.h?
>
>
> DTS:
> --------------------
>         ostm0: timer@e803b000 {
>                 compatible = "renesas,r7s9210-ostm", "renesas,ostm";
>                 reg = <0xe803b000 0x30>;
>                 interrupts = <GIC_SPI 56 IRQ_TYPE_EDGE_RISING>;
>                 clocks = <&cpg CPG_MOD STBCR_ID(36)>;
>                 clock-names = "ostm0";
>                 power-domains = <&cpg>;
>                 status = "disabled";
>         };

When running on RZ/A2, I'd use a different pack function in
cpg_mssr_clk_src_twocell_get() instead, so you can just write:

    clock = <&cpg CPG_MOD 36>;

> r7s9210-cpg-mssr.c:
> --------------------
> static const struct mssr_mod_clk r7s9210_mod_clks[] __initconst = {
>         DEF_MOD("ostm0",        STBCR_ID(36),   R7S9210_CLK_P1C),
>         DEF_MOD("ostm1",        STBCR_ID(35),   R7S9210_CLK_P1C),
>         DEF_MOD("ostm2",        STBCR_ID(34),   R7S9210_CLK_P1C),

... and a different DEF_MOD() macro here, so you can just write:

    DEF_MOD("ostm0",        36,   R7S9210_CLK_P1C),

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
