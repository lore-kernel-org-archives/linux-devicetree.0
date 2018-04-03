Return-Path: <SRS0=EX5Z=GY=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1522265176-33226-4-git-send-email-biju.das@bp.renesas.com>
References: <1522265176-33226-1-git-send-email-biju.das@bp.renesas.com> <1522265176-33226-4-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Apr 2018 13:35:02 +0200
Message-ID: <CAMuHMdWY5KPoowUostOpyRsZQTLuG+REQed0o7ChE3xoo8UAzg@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] clk: renesas: Add r8a77470 CPG Core Clock Definitions
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Biju,

On Wed, Mar 28, 2018 at 9:26 PM, Biju Das <biju.das@bp.renesas.com> wrote:
> Add all RZ/G1C Clock Pulse Generator Core Clock Outputs, as listed in
> Table 7.2 ("List of Clocks [RZ/G1C]") of the RZ/G1C Hardware User's
> Manual.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> V1->V2:
> * incorporated geert's review comment
>
>  include/dt-bindings/clock/r8a77470-cpg-mssr.h | 36 +++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 include/dt-bindings/clock/r8a77470-cpg-mssr.h
>
> diff --git a/include/dt-bindings/clock/r8a77470-cpg-mssr.h b/include/dt-bindings/clock/r8a77470-cpg-mssr.h
> new file mode 100644
> index 0000000..ffc123c
> --- /dev/null
> +++ b/include/dt-bindings/clock/r8a77470-cpg-mssr.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Copyright (C) 2018 Renesas Electronics Corp.
> + */
> +#ifndef __DT_BINDINGS_CLOCK_R8A77470_CPG_MSSR_H__
> +#define __DT_BINDINGS_CLOCK_R8A77470_CPG_MSSR_H__
> +
> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> +
> +/* r8a77470 CPG Core Clocks */
> +#define R8A77470_CLK_Z2                0
> +#define R8A77470_CLK_ZTR       2

These should be numbered consecutively, unless there is a good reason not
to do so.

Sorry for not noticing before, fixing up while applying...

> +#define R8A77470_CLK_ZTRD2     3
> +#define R8A77470_CLK_ZT                4
> +#define R8A77470_CLK_ZX                5
> +#define R8A77470_CLK_ZS                6
> +#define R8A77470_CLK_HP                7
> +#define R8A77470_CLK_B         9
> +#define R8A77470_CLK_LB                10
> +#define R8A77470_CLK_P         11
> +#define R8A77470_CLK_CL                12
> +#define R8A77470_CLK_CP                13
> +#define R8A77470_CLK_M2                14
> +#define R8A77470_CLK_ZB3       16
> +#define R8A77470_CLK_SDH       19
> +#define R8A77470_CLK_SD0       20
> +#define R8A77470_CLK_SD1       21
> +#define R8A77470_CLK_SD2       22
> +#define R8A77470_CLK_MP                24
> +#define R8A77470_CLK_QSPI      25
> +#define R8A77470_CLK_CPEX      26
> +#define R8A77470_CLK_RCAN      27
> +#define R8A77470_CLK_R         28
> +#define R8A77470_CLK_OSC       29

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
