From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 1/2] clk: renesas: add R8A7797 CPG core clock definitions
Date: Fri, 25 Aug 2017 09:23:49 +0200
Message-ID: <CAMuHMdXukditjmD_C3d1bMkfk38EpG5sWzepRMbzuHqORju7Jg@mail.gmail.com>
References: <20170823125740.342120870@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170823125740.342120870-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Wed, Aug 23, 2017 at 2:52 PM, Sergei Shtylyov
<sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
> Add macros usable by the device tree sources to reference the R8A7797 CPG
> clocks  by index.
>
> Based on the original (and large) patch by Daisuke Matsushita
> <daisuke.matsushita.ns-FCd8Q96Dh0JBDgjK7y7TUQ@public.gmane.org>.

Please refer to Table 8.2c ("List of Clocks [R-Car V3M]") of the R-Car Series,
3rd Generation Hardware User's Manual (Rev. 0.55, Jun. 30, 2017).

> Signed-off-by: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>
> ---
>  include/dt-bindings/clock/r8a7797-cpg-mssr.h |   48 +++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>
> Index: linux/include/dt-bindings/clock/r8a7797-cpg-mssr.h
> ===================================================================
> --- /dev/null
> +++ linux/include/dt-bindings/clock/r8a7797-cpg-mssr.h

Please use "r8a77970-cpg-mssr.h", to follow the new 5-digit scheme started
with r8a77995.

> @@ -0,0 +1,48 @@
> +/*
> + * Copyright (C) 2016 Renesas Electronics Corp.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +#ifndef __DT_BINDINGS_CLOCK_R8A7797_CPG_MSSR_H__
> +#define __DT_BINDINGS_CLOCK_R8A7797_CPG_MSSR_H__

...R8A77970...

> +
> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> +
> +/* r8a7797 CPG Core Clocks */
> +#define R8A7797_CLK_Z2                 0

#define R8A77970_...

> +#define R8A7797_CLK_CSIREF             26

The CSIREF clock was dropped in Rev. 0.54 of the datasheet.
Please remove it.

> +#define R8A7797_CLK_FRAY               27
> +#define R8A7797_CLK_CP                 28
> +#define R8A7797_CLK_CPEX               29
> +#define R8A7797_CLK_R                  30
> +#define R8A7797_CLK_OSC                        31

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

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
