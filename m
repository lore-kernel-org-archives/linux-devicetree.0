From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 04/11] ARM: dts: r8a7745: initial SoC device tree
Date: Wed, 2 Nov 2016 11:03:07 +0100
Message-ID: <CAMuHMdVcHVZmZ_b4UXgG9-3kbAOydocS2mvLLFB1FAhSMQwbow@mail.gmail.com>
References: <4121805.SRTmqJtRfv@wasted.cogentembedded.com> <4144867.5S9itKOJEU@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <4144867.5S9itKOJEU@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sat, Oct 29, 2016 at 12:17 AM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> The  initial R8A7745 SoC device tree including CPU0, GIC, timer, SYSC, RST,
> CPG, and the required clock descriptions.
>
> Based on the original (and large) patch by Dmitry Shifrin
> <dmitry.shifrin@cogentembedded.com>.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> ---
>  arch/arm/boot/dts/r8a7745.dtsi |  120 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 120 insertions(+)
>
> Index: renesas/arch/arm/boot/dts/r8a7745.dtsi
> ===================================================================
> --- /dev/null
> +++ renesas/arch/arm/boot/dts/r8a7745.dtsi

> +               gic: interrupt-controller@f1001000 {
> +                       compatible = "arm,gic-400";
> +                       #interrupt-cells = <3>;
> +                       #address-cells = <0>;
> +                       interrupt-controller;
> +                       reg = <0 0xf1001000 0 0x1000>,
> +                             <0 0xf1002000 0 0x1000>,
> +                             <0 0xf1004000 0 0x2000>,
> +                             <0 0xf1006000 0 0x2000>;
> +                       interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(2) |
> +                                     IRQ_TYPE_LEVEL_HIGH)>;

You may want to align IRQ_TYPE_LEVEL_HIGH with GIC_CPU_MASK_SIMPLE.

> +               };
> +
> +               timer {
> +                       compatible = "arm,armv7-timer";
> +                       interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) |
> +                                     IRQ_TYPE_LEVEL_LOW)>,
> +                                    <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) |
> +                                     IRQ_TYPE_LEVEL_LOW)>,
> +                                    <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) |
> +                                     IRQ_TYPE_LEVEL_LOW)>,
> +                                    <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) |
> +                                     IRQ_TYPE_LEVEL_LOW)>;

Likewise.

> +               };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
