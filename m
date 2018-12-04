Return-Path: <SRS0=yP1+=ON=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20181129130559.66732-1-chris.brandt@renesas.com> <20181129130559.66732-2-chris.brandt@renesas.com>
In-Reply-To: <20181129130559.66732-2-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Dec 2018 16:18:07 +0100
Message-ID: <CAMuHMdVZdQF1Q75zCfRB2+po_J3Q9C4G=s_PNWvhJNZfcDDDeQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: r7s9210: Initial SoC device tree
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Thu, Nov 29, 2018 at 2:07 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Basic support for the RZ/A2 (R7S9210) SoC.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm/boot/dts/r7s9210.dtsi
> @@ -0,0 +1,211 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the R7S9210 SoC
> + *
> + * Copyright (C) 2018 Renesas Electronics Corporation
> + *
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/r7s9210-cpg-mssr.h>
> +
> +/ {

> +       clocks {

Please remove the clocks subnode.
These days clocks live at the root node.

> +       gic: interrupt-controller@e8221000 {
> +               compatible = "arm,gic-400";
> +               #interrupt-cells = <3>;
> +               #address-cells = <0>;
> +               interrupt-controller;
> +               reg = <0xe8221000 0x1000>,
> +                     <0xe8222000 0x1000>;
> +       };
> +
> +       L2: cache-controller@1f003000 {

Please sort nodes by address (per group of devices).

> +               compatible = "arm,pl310-cache";
> +               reg = <0x1f003000 0x1000>;
> +               interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> +               arm,early-bresp-disable;
> +               arm,full-line-zero-disable;
> +               cache-unified;
> +               cache-level = <2>;
> +       };
> +
> +       cpg: clock-controller@fcfe0020 {

fcfe0010, as pointed out by Simon.

> +               compatible = "renesas,r7s9210-cpg-mssr";
> +               reg = <0xfcfe0010 0x455>;
> +               clocks = <&extal_clk>;
> +               clock-names = "extal";
> +               #clock-cells = <2>;
> +               #power-domain-cells = <0>;
> +               #reset-cells = <1>;

Note that resets are not yet supported by the driver.
But probably they will use #reset-cells = <1>, if ever implemented.

> +       };
> +
> +       ostm0: timer@e803b000 {
> +               compatible = "renesas,r7s9210-ostm", "renesas,ostm";
> +               reg = <0xe803b000 0x30>;
> +               interrupts = <GIC_SPI 56 IRQ_TYPE_EDGE_RISING>;
> +               clocks = <&cpg CPG_MOD 36>;
> +               clock-names = "ostm0";

The clock-names property is not documented in the DT bindings.
Moreover, using different names for the clock inputs of the different
channels is strange.

> +       scif0: serial@e8007000 {
> +               compatible = "renesas,scif-r7s9210";
> +               reg = <0xe8007000 18>;

0x18 (for all scif instances)


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
