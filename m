Return-Path: <SRS0=qqZh=OJ=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1542878075-61314-1-git-send-email-biju.das@bp.renesas.com> <1542878075-61314-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1542878075-61314-2-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Nov 2018 10:44:33 +0100
Message-ID: <CAMuHMdXzN5jyX1oUQ_0jmQ9ot6907R9EJtidk73jwg5p8oH8aA@mail.gmail.com>
Subject: Re: [PATCH 1/7] ARM: dts: r8a7744-iwg20m: Add iWave RZ/G1N Qseven SOM
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Biju,

On Thu, Nov 22, 2018 at 10:22 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Add support for iWave RZ/G1N Qseven System On Module.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- /dev/null
> +++ b/arch/arm/boot/dts/r8a7744-iwg20m.dtsi
> @@ -0,0 +1,31 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the iWave RZ/G1N Qseven SOM
> + *
> + * Copyright (C) 2018 Renesas Electronics Corp.
> + */
> +
> +#include "r8a7744.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +       compatible = "iwave,g20m", "renesas,r8a7744";
> +
> +       memory@40000000 {
> +               device_type = "memory";
> +               reg = <0 0x40000000 0 0x40000000>;
> +       };

I could not verify the memory configuration, but I assume it's correct ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
