From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v6 2/6] dt-bindings: Add the rzn1-clocks.h file
Date: Tue, 22 May 2018 20:44:19 +0200
Message-ID: <CAMuHMdW-HUBRF4rLdfzixcyMUBg7+4XU+-3zayePoyeQiBZ8ZA@mail.gmail.com>
References: <1526983321-41949-1-git-send-email-michel.pollet@bp.renesas.com> <1526983321-41949-3-git-send-email-michel.pollet@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1526983321-41949-3-git-send-email-michel.pollet@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michel Pollet <michel.pollet@bp.renesas.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Phil Edworthy <phil.edworthy@renesas.com>, Michel Pollet <buserror+upstream@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Michel,

On Tue, May 22, 2018 at 12:01 PM, Michel Pollet
<michel.pollet@bp.renesas.com> wrote:
> This adds the constants necessary to use the renesas,rzn1-clocks driver.
>
> Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>

Thanks for your patch!

> ---
>  include/dt-bindings/clock/rzn1-clocks.h | 187 ++++++++++++++++++++++++++++++++
>  1 file changed, 187 insertions(+)
>  create mode 100644 include/dt-bindings/clock/rzn1-clocks.h
>
> diff --git a/include/dt-bindings/clock/rzn1-clocks.h b/include/dt-bindings/clock/rzn1-clocks.h
> new file mode 100644
> index 0000000..8a73db2
> --- /dev/null
> +++ b/include/dt-bindings/clock/rzn1-clocks.h

Given this is part of the DT ABI, and there exist multiple different RZ/N1
SoCs (and there are probably planned more), I wouldn't call this header
file "rzn1-clocks.h", but e.g. "r9a06g032-clocks.h".

> @@ -0,0 +1,187 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * RZ/N1 clock IDs
> + *
> + * Copyright (C) 2018 Renesas Electronics Europe Limited
> + *
> + * Michel Pollet <michel.pollet@bp.renesas.com>, <buserror@gmail.com>
> + * Derived from zx-reboot.c
> + */
> +
> +#ifndef __DT_BINDINGS_RZN1_CLOCK_H__
> +#define __DT_BINDINGS_RZN1_CLOCK_H__
> +
> +#define RZN1_CLKOUT                    0

Similar for the RZN1 prefix.

I'll look at the actual list of clocks later...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
