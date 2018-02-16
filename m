From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 05/15] ARM64: dts: Add R-Car Salvator-x M3-N support
Date: Fri, 16 Feb 2018 10:20:20 +0100
Message-ID: <CAMuHMdUSXE2k4QwbpRvFChtfFj6_RYxCwst8yvbkA1GxhvacfQ@mail.gmail.com>
References: <1518515162-23663-1-git-send-email-jacopo+renesas@jmondi.org> <1518515162-23663-6-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1518515162-23663-6-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Jacopo,

On Tue, Feb 13, 2018 at 10:45 AM, Jacopo Mondi
<jacopo+renesas@jmondi.org> wrote:

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> @@ -0,0 +1,495 @@
> +// SPDX-License-Identifier: GPL-2.
> +/*
> + * Device Tree Source for the r8a77965 SoC
> + *
> + * Copyright (C) 2018 Jacopo Mondi <jacopo+renesas@jmondi.org>
> + *
> + * Based on r8a7796.dtsi
> + * Copyright (C) 2016 Renesas Electronics Corp.
> + */
> +
> +#include <dt-bindings/clock/r8a77965-cpg-mssr.h>

For the initial submission, it's better to use hardcoded numbers than the
R8A77965_CLK_* definitions, as the latter go in through a different tree.
Hence you should replace above include by

    #include <dt-bindings/clock/renesas-cpg-mssr.h>

and replace R8A77965_CLK_* by hardcoded numbers in all r8a77965.dtsi
patches.

> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/power/r8a77965-sysc.h>

For the initial submission, it's better to use hardcoded numbers than the
R8A77965_PD_* definitions, as the latter go in through a different tree.
Hence you should drop the above include, and replace R8A77965_PD_*
by hardcoded numbers in all r8a77965.dtsi patches.

The hardcoded numbers can be replaced by symbolic definitions later,
when the definitions have hit mainline.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
