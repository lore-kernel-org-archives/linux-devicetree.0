From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 01/13] ARM: shmobile: r8a7792: add clock index macros
Date: Wed, 1 Jun 2016 09:22:19 +0200
Message-ID: <CAMuHMdVZ_8z3coEXswM0VSNPx0=yxdBmAmJjwHyZ9PyB5RZRfQ@mail.gmail.com>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
	<2280165.siMXMbFrFe@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2280165.siMXMbFrFe-gHKXc3Y1Z8zGSmamagVegGFoWSdPRAKMAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Wed, Jun 1, 2016 at 12:09 AM, Sergei Shtylyov
<sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
> Add macros usable by the device tree sources to reference the R8A7792
> clocks  by index.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>
> ---
>  include/dt-bindings/clock/r8a7792-clock.h |  104 ++++++++++++++++++++++++++++++
>  1 file changed, 104 insertions(+)
>
> Index: renesas/include/dt-bindings/clock/r8a7792-clock.h
> ===================================================================
> --- /dev/null
> +++ renesas/include/dt-bindings/clock/r8a7792-clock.h
> @@ -0,0 +1,104 @@
> +/*
> + * Copyright (C) 2016 Cogent Embedded, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#ifndef __DT_BINDINGS_CLOCK_R8A7792_H__
> +#define __DT_BINDINGS_CLOCK_R8A7792_H__
> +
> +/* CPG */
> +#define R8A7792_CLK_MAIN               0
> +#define R8A7792_CLK_PLL0               1
> +#define R8A7792_CLK_PLL1               2
> +#define R8A7792_CLK_PLL3               3
> +#define R8A7792_CLK_LB                 4
> +#define R8A7792_CLK_QSPI               5
> +#define R8A7792_CLK_SDH                        6
> +#define R8A7792_CLK_SD0                        7
> +#define R8A7792_CLK_SD1                        8

As Simon already pointed out, there are no ...SD* clocks on V2H.

> +#define R8A7792_CLK_Z                  9

> +/* MSTP1 */
> +#define R8A7792_CLK_TMU1               11
> +#define R8A7792_CLK_TMU3               21
> +#define R8A7792_CLK_TMU2               22
> +#define R8A7792_CLK_CMT0               24
> +#define R8A7792_CLK_TMU0               25
> +#define R8A7792_CLK_VSP1DU1            27
> +#define R8A7792_CLK_VSP1DU0            28
> +#define R8A7792_CLK_VSP1_SY            31

These are called ...VSP1_DU1, ...VSP1_DU0, and ...VSP1_S on all other
R-Car Gen2 SoCs.

> +/* MSTP2 */
> +#define R8A7792_CLK_MSIOF1             8
> +#define R8A7792_CLK_SYS_DMAC0          18

This is ...SYS_DMAC1

> +#define R8A7792_CLK_SYS_DMAC1          19

... and this is ...SYS_DMAC0

> +/* MSTP9 */
> +#define R8A7792_CLK_GPIO7              4
> +#define R8A7792_CLK_GPIO6              5
> +#define R8A7792_CLK_GPIO5              7
> +#define R8A7792_CLK_GPIO4              8
> +#define R8A7792_CLK_GPIO3              9
> +#define R8A7792_CLK_GPIO2              10
> +#define R8A7792_CLK_GPIO1              11
> +#define R8A7792_CLK_GPIO0              12
> +#define R8A7792_CLK_GPIO11             13
> +#define R8A7792_CLK_GPIO10             14
> +#define R8A7792_CLK_CAN1               15
> +#define R8A7792_CLK_CAN0               16

These are called ...RCAN1 and ...RCAR0 on all other R-Car Gen2 SoCs.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
