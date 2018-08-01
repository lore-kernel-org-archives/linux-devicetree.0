Return-Path: <SRS0=ReDA=KQ=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1532936891-25034-1-git-send-email-biju.das@bp.renesas.com> <1532936891-25034-5-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1532936891-25034-5-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Aug 2018 10:46:07 +0200
Message-ID: <CAMuHMdX5NOvxjDUbG0be2e4fmRe5d0hXoi+cJ1B+5-6FHrRk_Q@mail.gmail.com>
Subject: Re: [PATCH 4/5] clk: renesas: Add r8a774a1 CPG Core Clock Definitions
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Biju,

On Mon, Jul 30, 2018 at 9:54 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Add all RZ/G2M Clock Pulse Generator Core Clock Outputs, as listed in
> Table 8.2b ("List of Clocks [RZ/G2M]") of the RZ/G2M Hardware User's
> Manual.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/include/dt-bindings/clock/r8a774a1-cpg-mssr.h
> @@ -0,0 +1,59 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Copyright (C) 2018 Renesas Electronics Corp.
> + */
> +#ifndef __DT_BINDINGS_CLOCK_R8A774A1_CPG_MSSR_H__
> +#define __DT_BINDINGS_CLOCK_R8A774A1_CPG_MSSR_H__
> +
> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> +
> +/* r8a774a1 CPG Core Clocks */
> +#define R8A774A1_CLK_Z                 0
> +#define R8A774A1_CLK_Z2                        1
> +#define R8A774A1_CLK_ZG                        2
> +#define R8A774A1_CLK_ZTR               3
> +#define R8A774A1_CLK_ZTRD2             4
> +#define R8A774A1_CLK_ZT                        5
> +#define R8A774A1_CLK_ZX                        6
> +#define R8A774A1_CLK_S0D1              7
> +#define R8A774A1_CLK_S0D2              8
> +#define R8A774A1_CLK_S0D3              9
> +#define R8A774A1_CLK_S0D4              10
> +#define R8A774A1_CLK_S0D6              11
> +#define R8A774A1_CLK_S0D8              12
> +#define R8A774A1_CLK_S0D12             13
> +#define R8A774A1_CLK_S1D2              14
> +#define R8A774A1_CLK_S1D4              15
> +#define R8A774A1_CLK_S2D1              16
> +#define R8A774A1_CLK_S2D2              17
> +#define R8A774A1_CLK_S2D4              18
> +#define R8A774A1_CLK_S3D1              19
> +#define R8A774A1_CLK_S3D2              20
> +#define R8A774A1_CLK_S3D4              21
> +#define R8A774A1_CLK_LB                        22
> +#define R8A774A1_CLK_CL                        23
> +#define R8A774A1_CLK_ZB3               24
> +#define R8A774A1_CLK_ZB3D2             25
> +#define R8A774A1_CLK_ZB3D4             26
> +#define R8A774A1_CLK_CR                        27
> +#define R8A774A1_CLK_CRD2              28
> +#define R8A774A1_CLK_SD0H              29
> +#define R8A774A1_CLK_SD0               30
> +#define R8A774A1_CLK_SD1H              31
> +#define R8A774A1_CLK_SD1               32
> +#define R8A774A1_CLK_SD2H              33
> +#define R8A774A1_CLK_SD2               34
> +#define R8A774A1_CLK_SD3H              35
> +#define R8A774A1_CLK_SD3               36
> +#define R8A774A1_CLK_RPC               37
> +#define R8A774A1_CLK_RPCD2             38
> +#define R8A774A1_CLK_MSO               39
> +#define R8A774A1_CLK_HDMI              40
> +#define R8A774A1_CLK_CSI0              41
> +#define R8A774A1_CLK_CP                        42
> +#define R8A774A1_CLK_POST2             43

POST2 is an internal clock, which doesn't need to be referred to from DT.
So please drop it from the bindings.

> +#define R8A774A1_CLK_CPEX              44
> +#define R8A774A1_CLK_R                 45
> +#define R8A774A1_CLK_OSC               46

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
