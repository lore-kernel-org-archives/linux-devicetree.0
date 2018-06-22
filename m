From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v9 3/5] ARM: dts: Renesas R9A06G032 base device tree file
Date: Fri, 22 Jun 2018 14:14:30 +0200
Message-ID: <CAMuHMdXamhn2GZs41i=wHXSRn0HgeHg4=7=g7pg7uni3LizK9w@mail.gmail.com>
References: <1528973829-25493-1-git-send-email-michel.pollet@bp.renesas.com> <1528973829-25493-4-git-send-email-michel.pollet@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1528973829-25493-4-git-send-email-michel.pollet@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michel Pollet <michel.pollet@bp.renesas.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Phil Edworthy <phil.edworthy@renesas.com>, Michel Pollet <buserror+upstream@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Marc Zyngier <Marc.Zyngier@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Michel,

CC MarcZ

On Thu, Jun 14, 2018 at 1:02 PM Michel Pollet
<michel.pollet@bp.renesas.com> wrote:
> This adds the Renesas R9A06G032 bare bone support.
>
> This currently only handles the SYSCTRL block note,
> generic parts (gic, architected timer) and a UART.
>
> Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>

> --- /dev/null
> +++ b/arch/arm/boot/dts/r9a06g032.dtsi

> +       timer {
> +               compatible = "arm,cortex-a7-timer",

Checkpatch says:
WARNING: DT compatible string "arm,cortex-a7-timer" appears
un-documented -- check ./Documentation/devicetree/bindings/

> +                            "arm,armv7-timer";

Documentation/devicetree/bindings/arm/arch_timer.txt says:

    compatible should at least contain "arm,armv7-timer"

but fails to list other possible values?

> +               interrupt-parent = <&gic>;
> +               arm,cpu-registers-not-fw-configured;
> +               always-on;
> +               interrupts =
> +                       <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +                       <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +                       <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +                       <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
> +       };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
