Return-Path: <SRS0=jzey=HN=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1524227264-24896-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1524227264-24896-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1524227264-24896-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Apr 2018 09:57:33 +0200
Message-ID: <CAMuHMdXCPq7TjDAtu7AffsnZO-rmokjvwZunMByap-iYyjpjRw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: renesas: Add r8a77990 CPG Core Clock Definitions
Content-Type: text/plain; charset="UTF-8"
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Takeshi Kihara <takeshi.kihara.df@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Shimoda-san,

On Fri, Apr 20, 2018 at 2:27 PM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds all R-Car E3 Clock Pulse Generator Core Clock Outputs.
>
> Note that internal CPG clocks (S0, S1, S2, S3, SDSRC) are not included,
> as they are used as internal clock sources only, and never referenced
> from DT.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [shimoda: add SPDX-License-Identifier]
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/include/dt-bindings/clock/r8a77990-cpg-mssr.h
> @@ -0,0 +1,62 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2018 Renesas Electronics Corp.
> + */
> +#ifndef __DT_BINDINGS_CLOCK_R8A77990_CPG_MSSR_H__
> +#define __DT_BINDINGS_CLOCK_R8A77990_CPG_MSSR_H__
> +
> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> +
> +/* r8a77990 CPG Core Clocks */
> +#define R8A77990_CLK_Z2                        0

[...]

> +#define R8A77990_CLK_CSI0              47
> +#define R8A77990_CLK_CP                        49
> +#define R8A77990_CLK_CPEX              50

The numbering should be contiguous.
I'll fix it up while applying, and add "POST3" to the list of internal clocks in
the commit message.

> +
> +#endif /* __DT_BINDINGS_CLOCK_R8A77990_CPG_MSSR_H__ */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
