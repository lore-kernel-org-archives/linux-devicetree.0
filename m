Return-Path: <SRS0=F8cI=J4=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180712030149.91385-1-chris.brandt@renesas.com> <20180712030149.91385-2-chris.brandt@renesas.com>
In-Reply-To: <20180712030149.91385-2-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jul 2018 14:54:50 +0200
Message-ID: <CAMuHMdX4BPxQY__2DYrUGMBFZPMm_x_jxaBvG+EAPR0fWreAew@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: shmobile: Add basic RZ/A2 SoC support
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Thu, Jul 12, 2018 at 5:02 AM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add the RZ/A2 SoC to the Renesas SoC collection.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

> --- /dev/null
> +++ b/arch/arm/mach-shmobile/setup-r7s9210.c
> @@ -0,0 +1,27 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * r7s9210 processor support
> + *
> + * Copyright (C) 2018  Renesas Electronics Corporation
> + * Copyright (C) 2018  Chris Brandt
> + *
> + */
> +
> +#include <linux/kernel.h>
> +
> +#include <asm/mach/arch.h>
> +
> +#include "common.h"
> +
> +static const char *const r7s9210_boards_compat_dt[] __initconst = {
> +       "renesas,r7s9210",
> +       NULL,
> +};
> +
> +DT_MACHINE_START(R7S72100_DT, "Generic R7S9210 (Flattened Device Tree)")
> +       .l2c_aux_val    = 0,
> +       .l2c_aux_mask   = ~0,
> +       .init_early     = shmobile_init_delay,
> +       .init_late      = shmobile_init_late,
> +       .dt_compat      = r7s9210_boards_compat_dt,
> +MACHINE_END

I'm wondering if you could do without any board code, i.e. without
setup-r7s9210.c?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
