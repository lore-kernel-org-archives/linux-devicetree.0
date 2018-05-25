From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v7 3/5] ARM: dts: Renesas R9A06G032 base device tree file
Date: Fri, 25 May 2018 11:27:46 +0200
Message-ID: <CAMuHMdW5VvZ-wbO7TuZC2z+KFPLq_PhBGe3WbAeES-nezb7tmQ@mail.gmail.com>
References: <1527154169-32380-1-git-send-email-michel.pollet@bp.renesas.com> <1527154169-32380-4-git-send-email-michel.pollet@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1527154169-32380-4-git-send-email-michel.pollet@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michel Pollet <michel.pollet@bp.renesas.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Phil Edworthy <phil.edworthy@renesas.com>, Michel Pollet <buserror+upstream@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Michel,

On Thu, May 24, 2018 at 11:28 AM, Michel Pollet
<michel.pollet@bp.renesas.com> wrote:
> This adds the Renesas R9A06G032 bare bone support.
>
> This currently only handles generic parts (gic, architected timer)
> and a UART.
>
> Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm/boot/dts/r9a06g032.dtsi

> +       soc {
> +               compatible = "simple-bus";
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               interrupt-parent = <&gic>;
> +               ranges;
> +
> +               sysctrl: sysctrl@4000c000 {

system-controller@

> +                       compatible = "renesas,r9a06g032-sysctrl";
> +                       reg = <0x4000c000 0x1000>;
> +                       status = "okay";
> +                       #clock-cells = <1>;
> +               };

With the minor nit above resolved, and pending acceptance of the
sysctrl bindings:

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
