From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v6 3/6] dt-bindings: clock: renesas,rzn1-clocks: document
 RZ/N1 clock driver
Date: Tue, 22 May 2018 20:42:46 +0200
Message-ID: <CAMuHMdUW-tteZ26J4rd9=KsrHotjCs7BR_pjyjFQnfoOF5=oFQ@mail.gmail.com>
References: <1526983321-41949-1-git-send-email-michel.pollet@bp.renesas.com> <1526983321-41949-4-git-send-email-michel.pollet@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1526983321-41949-4-git-send-email-michel.pollet@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michel Pollet <michel.pollet@bp.renesas.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Phil Edworthy <phil.edworthy@renesas.com>, Michel Pollet <buserror+upstream@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Michel,

On Tue, May 22, 2018 at 12:01 PM, Michel Pollet
<michel.pollet@bp.renesas.com> wrote:
> The Renesas RZ/N1 Family (Part #R9A06G0xx) requires a driver
> to provide the SoC clock infrastructure for Linux.
>
> This documents the driver bindings.
>
> Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/renesas,rzn1-clocks.txt
> @@ -0,0 +1,44 @@
> +* Renesas RZ/N1 Clock Driver
> +
> +This driver provides the clock infrastructure used by all the other drivers.
> +
> +One of the 'special' feature of this infrastructure is that Linux doesn't
> +necessary 'own' all the clocks on the SoC, some other OS runs on
> +the Cortex-M3 core and that OS can access and claim it's own clocks.
> +
> +Required Properties:
> +
> +  - compatible: Must be
> +    - "renesas,r9a06g032-clocks" for the RZ/N1D
> +    and "renesas,rzn1-clocks" as a fallback.

Why the fallback? I doubt all existing (and future) RZ/N1D SoCs provide the
exact same clock hierarchy.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
