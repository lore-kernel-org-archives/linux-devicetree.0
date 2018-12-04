Return-Path: <SRS0=yP1+=ON=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20181129130559.66732-1-chris.brandt@renesas.com> <20181129130559.66732-3-chris.brandt@renesas.com>
In-Reply-To: <20181129130559.66732-3-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Dec 2018 17:01:35 +0100
Message-ID: <CAMuHMdX-kqoVRs-VouhwEwv+gHmUsyHcUH9iyAaZyRQE-VWJ9A@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: r7s9210-rza2mevb: Add support for RZ/A2M EVB
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Thu, Nov 29, 2018 at 2:07 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add support for Renesas RZ/A2M evaluation board.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thanks for your patch!

> index 000000000000..9570aeb8f1ce
> --- /dev/null
> +++ b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
> @@ -0,0 +1,133 @@
> +/*
> + * Device Tree Source for the RZA2MEVB board
> + *
> + * Copyright (C) 2018 Renesas Electronics
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dual
> + * licensing only applies to this file, and not this project as a
> + * whole.

Let's see about the license...

> +/ {
> +       model = "RZA2MEVB";
> +       compatible = "renesas,rza2mevb", "renesas,r7s9210";
> +
> +       aliases {
> +               serial0 = &scif4;
> +       };
> +
> +       chosen {
> +               bootargs = "ignore_loglevel earlycon rootfstype=cramfs root=mtd:rootfs";

I wouldn't put "earlycon" in the default bootargs.
It's meant for debugging.

> +               stdout-path = "serial0:115200n8";
> +       };
> +
> +       memory@80000000 {

40000000

> +               device_type = "memory";
> +               reg = <0x40000000 0x00800000>;   /* HyperRAM */
> +       };
> +
> +       lbsc {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +       };
> +
> +       leds {
> +               status = "okay";

Please drop this line, "okay" is the default.

> +               compatible = "gpio-leds";
> +
> +               led0 {
> +                       gpios = <&pinctrl RZA2_PIN(PORT6, 0) GPIO_ACTIVE_HIGH>;

There's a second (yellow green) LED connected to PC_1.
Hence

        red {
                gpios = <&pinctrl RZA2_PIN(PORT6, 0) GPIO_ACTIVE_HIGH>;
        };
        green {
                gpios = <&pinctrl RZA2_PIN(PORTC, 1) GPIO_ACTIVE_HIGH>;
        }

> +               };
> +       };

> +&pinctrl {
> +

Please drop this blank line.

> +       /* Serial Console */
> +       scif4_pins: serial4 {
> +               pinmux = <RZA2_PINMUX(PORT9, 0, 4)>,    /* TxD4 */
> +                        <RZA2_PINMUX(PORT9, 1, 4)>;    /* RxD4 */
> +       };
> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
