Return-Path: <SRS0=qqZh=OJ=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1542878075-61314-1-git-send-email-biju.das@bp.renesas.com> <1542878075-61314-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1542878075-61314-3-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Nov 2018 09:53:12 +0100
Message-ID: <CAMuHMdUzPDW=3569eN1XLSC90=TXiRE272KgBdv8cf7iw=XRbw@mail.gmail.com>
Subject: Re: [PATCH 2/7] ARM: dts: r8a7744: Initial SoC device tree
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Biju,

On Thu, Nov 22, 2018 at 10:23 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Basic support for the RZ/G1N (R8A7744) SoC. Added placeholders
> to avoid compilation error with the common platform code.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

> --- /dev/null
> +++ b/arch/arm/boot/dts/r8a7744.dtsi
> @@ -0,0 +1,369 @@

> +       soc {

> +               gic: interrupt-controller@f1001000 {
> +                       compatible = "arm,gic-400";
> +                       #interrupt-cells = <3>;
> +                       #address-cells = <0>;
> +                       interrupt-controller;
> +                       reg = <0 0xf1001000 0 0x1000>, <0 0xf1002000 0 0x2000>,
> +                             <0 0xf1004000 0 0x2000>, <0 0xf1006000 0 0x2000>;
> +                       interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;

Tehcnically, this mask should be GIC_CPU_MASK_SIMPLE(1)
until you add the second CPU node.

> +       timer {
> +               compatible = "arm,armv7-timer";
> +               interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +                                     <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +                                     <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +                                     <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;

Likewise.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
