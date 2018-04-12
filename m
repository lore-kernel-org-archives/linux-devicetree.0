Return-Path: <SRS0=nXIn=HB=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1523439447-1084-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1523439447-1084-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1523439447-1084-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Apr 2018 14:23:17 +0200
Message-ID: <CAMuHMdXata291k6ViN-eHrw6OLN49p2CJT6yZHqQukL2Yf2Lag@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: Add r8a77990 CPG Core Clock Definitions
Content-Type: text/plain; charset="UTF-8"
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Takeshi Kihara <takeshi.kihara.df@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Shimoda-san,

On Wed, Apr 11, 2018 at 11:37 AM, Yoshihiro Shimoda
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
> @@ -0,0 +1,63 @@
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

[...]

> +#define R8A77990_CLK_CSI0              47

Note that CSI0 is not listed in Table 8.2g ("R-Car E3").
Probably it does exist, given:
  - Table 8.11 ("Register Configuration") says CSI0CKCR exists on R-Car E3,
  - Figure 25.6 ("CSI2 Block Diagram (R-Car E3)") shows CSI0.

> +#define R8A77990_CLK_POST3             48

I noticed these POSTx clocks have been added to all R-Car Gen3 clock tables.
It doesn't look like we will ever need to refer them from DT, so I think we
can treat them as internal clocks, and omit them from the DT bindings.

What do you think?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
