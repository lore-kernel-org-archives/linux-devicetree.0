From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 03/15] soc: renesas: Add R-Car M3-N support
Date: Wed, 14 Feb 2018 13:48:27 +0100
Message-ID: <CAMuHMdU-pYNwjrXSR7j2kNkJSYsKd=0Kf0Tzq5LHpwA7p4_9MA@mail.gmail.com>
References: <1518515162-23663-1-git-send-email-jacopo+renesas@jmondi.org> <1518515162-23663-4-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1518515162-23663-4-git-send-email-jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jacopo,

Thanks for your patch!

On Tue, Feb 13, 2018 at 10:45 AM, Jacopo Mondi
<jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org> wrote:
> Add support for R-Car M3-N (r8a77965) power areas and reset.
> M3-N power areas are identical to M3-W ones, so just copy and rename
> them.

They are not identical:
  - M3-N does not have the CA53-related areas,
  - M3-W does not have A3VP,
  - M3-N does not have A2VC0 (M3-W also doesn't, according to latest
datasheet?).

The datasheet also mentions A3SH, without further info about the register
block. I think we need to bring this up with Renesas.

>  .../bindings/power/renesas,rcar-sysc.txt           |  1 +
>  .../devicetree/bindings/reset/renesas,rst.txt      |  1 +
>  drivers/soc/renesas/Kconfig                        |  9 ++++--
>  drivers/soc/renesas/Makefile                       |  1 +
>  drivers/soc/renesas/r8a77965-sysc.c                | 37 ++++++++++++++++++++++
>  drivers/soc/renesas/rcar-rst.c                     |  1 +
>  drivers/soc/renesas/rcar-sysc.c                    |  3 ++
>  drivers/soc/renesas/rcar-sysc.h                    |  1 +
>  drivers/soc/renesas/renesas-soc.c                  |  8 +++++
>  include/dt-bindings/power/r8a77965-sysc.h          | 31 ++++++++++++++++++
>  10 files changed, 91 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/soc/renesas/r8a77965-sysc.c
>  create mode 100644 include/dt-bindings/power/r8a77965-sysc.h

The maintainer may ask you to split this patch by functionality...

> --- /dev/null
> +++ b/drivers/soc/renesas/r8a77965-sysc.c
> @@ -0,0 +1,37 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas R-Car M3-N System Controller
> + * Copyright (C) 2018 Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
> + *
> + * Based on Renesas R-Car M3-W System Controller
> + * Copyright (C) 2016 Glider bvba
> + */
> +
> +#include <linux/bug.h>
> +#include <linux/kernel.h>
> +
> +#include <dt-bindings/power/r8a77965-sysc.h>
> +
> +#include "rcar-sysc.h"
> +
> +static const struct rcar_sysc_area r8a77965_areas[] __initconst = {
> +       { "always-on",      0, 0, R8A77965_PD_ALWAYS_ON, -1, PD_ALWAYS_ON },
> +       { "ca57-scu",   0x1c0, 0, R8A77965_PD_CA57_SCU, R8A77965_PD_ALWAYS_ON,
> +         PD_SCU },
> +       { "ca57-cpu0",   0x80, 0, R8A77965_PD_CA57_CPU0, R8A77965_PD_CA57_SCU,
> +         PD_CPU_NOCR },
> +       { "ca57-cpu1",   0x80, 1, R8A77965_PD_CA57_CPU1, R8A77965_PD_CA57_SCU,
> +         PD_CPU_NOCR },
> +       { "cr7",        0x240, 0, R8A77965_PD_CR7,      R8A77965_PD_ALWAYS_ON },
> +       { "a3vc",       0x380, 0, R8A77965_PD_A3VC,     R8A77965_PD_ALWAYS_ON },
> +       { "a2vc0",      0x3c0, 0, R8A77965_PD_A2VC0,    R8A77965_PD_A3VC },

M3-N (and M3-W) does not have A2VC0?

> +       { "a2vc1",      0x3c0, 1, R8A77965_PD_A2VC1,    R8A77965_PD_A3VC },
> +       { "3dg-a",      0x100, 0, R8A77965_PD_3DG_A,    R8A77965_PD_ALWAYS_ON },
> +       { "3dg-b",      0x100, 1, R8A77965_PD_3DG_B,    R8A77965_PD_3DG_A },
> +       { "a3ir",       0x180, 0, R8A77965_PD_A3IR,     R8A77965_PD_ALWAYS_ON },

A3VP is missing?

> +};
> +
> +const struct rcar_sysc_info r8a77965_sysc_info __initconst = {
> +       .areas = r8a77965_areas,
> +       .num_areas = ARRAY_SIZE(r8a77965_areas),
> +};

> --- /dev/null
> +++ b/include/dt-bindings/power/r8a77965-sysc.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2018 Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
> + * Copyright (C) 2016 Glider bvba
> + */
> +
> +#ifndef __DT_BINDINGS_POWER_R8A77965_SYSC_H__
> +#define __DT_BINDINGS_POWER_R8A77965_SYSC_H__
> +
> +/*
> + * These power domain indices match the numbers of the interrupt bits
> + * representing the power areas in the various Interrupt Registers
> + * (e.g. SYSCISR, Interrupt Status Register)
> + */
> +
> +#define R8A77965_PD_CA57_CPU0           0
> +#define R8A77965_PD_CA57_CPU1           1
> +#define R8A77965_PD_A3VP                9
> +#define R8A77965_PD_CA57_SCU           12
> +#define R8A77965_PD_CR7                        13
> +#define R8A77965_PD_A3VC               14
> +#define R8A77965_PD_3DG_A              17
> +#define R8A77965_PD_3DG_B              18
> +#define R8A77965_PD_A3IR               24
> +#define R8A77965_PD_A2VC0              25

M3-N (and M3-W) does not have A2VC0?

> +#define R8A77965_PD_A2VC1              26
> +
> +/* Always-on power area */
> +#define R8A77965_PD_ALWAYS_ON          32
> +
> +#endif /* __DT_BINDINGS_POWER_R8A77965_SYSC_H__ */

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
