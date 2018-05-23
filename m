From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v6 5/6] ARM: dts: Renesas RZN1D-DB Board base file
Date: Wed, 23 May 2018 11:13:40 +0200
Message-ID: <CAMuHMdWu69Mfn-JhBgvChZ3tvzUvCOeYKowzizQt3DcWJLeR0A@mail.gmail.com>
References: <1526983321-41949-1-git-send-email-michel.pollet@bp.renesas.com> <1526983321-41949-6-git-send-email-michel.pollet@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1526983321-41949-6-git-send-email-michel.pollet@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michel Pollet <michel.pollet@bp.renesas.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Phil Edworthy <phil.edworthy@renesas.com>, Michel Pollet <buserror+upstream@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Michel,

On Tue, May 22, 2018 at 12:01 PM, Michel Pollet
<michel.pollet@bp.renesas.com> wrote:
> This adds a base device tree file for the RZN1-DB board, with only the
> basic support allowing the system to boot to a prompt. Only one UART is
> used, with only a single CPU running.
>
> Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm/boot/dts/r9a06g032-rzn1d400-db.dts
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the RZN1D-DB Board
> + *
> + * Copyright (C) 2018 Renesas Electronics Europe Limited
> + *
> + */
> +
> +/dts-v1/;
> +
> +#include "r9a06g032.dtsi"
> +
> +/ {
> +       model = "RZN1D-DB Board";
> +       compatible = "renesas,rzn1d400-db",
> +                       "renesas,r9a06g032", "renesas,rzn1";

Please drop the "renesas,rzn1".

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
