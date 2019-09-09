Return-Path: <SRS0=WogO=XE=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1567666360-28035-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1567666360-28035-1-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Sep 2019 19:25:40 +0200
Message-ID: <CAMuHMdU=-CGPw4FF3o7YwEZzd7EA07RNKLSP0gmty8bTQzm6DA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: Add r8a774b1 CPG Core Clock Definitions
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Biju,

On Thu, Sep 5, 2019 at 9:00 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Add all RZ/G2N Clock Pulse Generator Core Clock Outputs, as listed in
> Table 8.2d ("List of Clocks [RZ/G2N]") of the RZ/G2N Hardware User's
> Manual.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
One comment below...

> --- /dev/null
> +++ b/include/dt-bindings/clock/r8a774b1-cpg-mssr.h
> @@ -0,0 +1,57 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Copyright (C) 2019 Renesas Electronics Corp.
> + */
> +#ifndef __DT_BINDINGS_CLOCK_R8A774B1_CPG_MSSR_H__
> +#define __DT_BINDINGS_CLOCK_R8A774B1_CPG_MSSR_H__
> +
> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> +
> +/* r8a774b1 CPG Core Clocks */
> +#define R8A774B1_CLK_Z                 0
> +#define R8A774B1_CLK_ZG                        1
> +#define R8A774B1_CLK_ZTR               2
> +#define R8A774B1_CLK_ZTRD2             3
> +#define R8A774B1_CLK_ZT                        4
> +#define R8A774B1_CLK_ZX                        5
> +#define R8A774B1_CLK_S0D1              6
> +#define R8A774B1_CLK_S0D2              7
> +#define R8A774B1_CLK_S0D3              8
> +#define R8A774B1_CLK_S0D4              9
> +#define R8A774B1_CLK_S0D6              10
> +#define R8A774B1_CLK_S0D8              11
> +#define R8A774B1_CLK_S0D12             12
> +#define R8A774B1_CLK_S1D2              13
> +#define R8A774B1_CLK_S1D4              14
> +#define R8A774B1_CLK_S2D1              15
> +#define R8A774B1_CLK_S2D2              16
> +#define R8A774B1_CLK_S2D4              17
> +#define R8A774B1_CLK_S3D1              18
> +#define R8A774B1_CLK_S3D2              19
> +#define R8A774B1_CLK_S3D4              20
> +#define R8A774B1_CLK_LB                        21
> +#define R8A774B1_CLK_CL                        22
> +#define R8A774B1_CLK_ZB3               23
> +#define R8A774B1_CLK_ZB3D2             24
> +#define R8A774B1_CLK_CR                        25
> +#define R8A774B1_CLK_DDR               26
> +#define R8A774B1_CLK_SD0H              27
> +#define R8A774B1_CLK_SD0               28
> +#define R8A774B1_CLK_SD1H              29
> +#define R8A774B1_CLK_SD1               30
> +#define R8A774B1_CLK_SD2H              31
> +#define R8A774B1_CLK_SD2               32
> +#define R8A774B1_CLK_SD3H              33
> +#define R8A774B1_CLK_SD3               34
> +#define R8A774B1_CLK_RPC               35
> +#define R8A774B1_CLK_RPCD2             36
> +#define R8A774B1_CLK_MSO               37
> +#define R8A774B1_CLK_HDMI              38
> +#define R8A774B1_CLK_CSI0              39
> +#define R8A774B1_CLK_CP                        40
> +#define R8A774B1_CLK_CPEX              41
> +#define R8A774B1_CLK_R                 42
> +#define R8A774B1_CLK_OSC               43
> +#define R8A774B1_CLK_CANFD             44

The only thing I can comment on is the location of the CANFD clock.
For RZ/G2M and RZ/G2E, the clock was added to the end of the list,
as it wasn't listed in the Hardware User's Manual.
In the mean time, Rev. 0.80 of the Hardware User's Manual was released,
which does include the CANFD clock.

If no one objects against this location, for consistency with other
RZ/G2 SoCs, i.e. will queue it in renesas-devel for v5.5, on a branch to
be shared by the clock driver and the DTS user.

> +
> +#endif /* __DT_BINDINGS_CLOCK_R8A774B1_CPG_MSSR_H__ */

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
