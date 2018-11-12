Return-Path: <SRS0=X2xC=NX=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20181107182733.62155-1-chris.brandt@renesas.com> <20181107182733.62155-3-chris.brandt@renesas.com>
In-Reply-To: <20181107182733.62155-3-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Nov 2018 17:06:45 +0100
Message-ID: <CAMuHMdX3QJq+QgU-wwFLawyLwqqoUDLS=uwNqRhJqVtP0_yLNQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] dt-bindings: pinctrl: Add RZ/A2 pinctrl and GPIO
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Jacopo Mondi <jacopo@jmondi.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Wed, Nov 7, 2018 at 7:27 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add device tree binding documentation and header file for Renesas R7S9210
> (RZ/A2) SoCs.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks for your patch!

> new file mode 100644
> index 000000000000..622d37a7225b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.txt
> @@ -0,0 +1,88 @@
> +Renesas RZ/A2 combined Pin and GPIO controller
> +
> +The Renesas SoCs of the RZ/A2 series feature a combined Pin and GPIO controller.
> +Pin multiplexing and GPIO configuration is performed on a per-pin basis.
> +Each port features up to 8 pins, each of them configurable for GPIO
> +function (port mode) or in alternate function mode.
> +Up to 8 different alternate function modes exist for each single pin.
> +
> +Pin controller node
> +-------------------
> +
> +Required properties:
> +  - compatible: should be:
> +    - "renesas,r7s9210-pinctrl": for RZ/A2M

On RZ/A1, the datasheet called this "Ports", and the corresponding compatible
value is "renesas,r7s72100-ports".
On RZ/A2, the datasheet calls this "GPIO", so perhaps "renesas,r7s9210-gpio"?
Hmm, then you may want to call the single node gpio-controller instead of
pin-controller (and all references to it)? It's really both.

On RZ/A1, it's different, as you have a single pin-controller node, with GPIO
subnodes.

> +  - reg
> +    Address base and length of the memory area where the pin controller
> +    hardware is mapped to.
> +  - gpio-controller
> +    This pin controller also controls pins as GPIO
> +  - #gpio-cells
> +    Must be 2
> +  - gpio-ranges
> +    Expresses the total number GPIO ports/pins in this SoC

number of

> +
> +
> +Example: Pin controller node for RZ/A2M SoC (r7s9210)
> +
> +       pinctrl: pin-controller@fcffe000 {
> +               compatible = "renesas,r7s9210-pinctrl";
> +               reg = <0xfcffe000 0x9D1>;

0x9d1

BTW, that's a real odd number. What about rounding up to the hardware
granularity, i.e. 0x1000?

> +
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +               gpio-ranges = <&pinctrl 0 0 176>;
> +       };
> +
> +Sub-nodes
> +---------
> +
> +The child nodes of the pin controller designate pins to be used for
> +specific peripheral functions or as GPIO.
> +
> +- Pin multiplexing sub-nodes:
> +  A pin multiplexing sub-node describes how to configure a set of
> +  (or a single) pin in some desired alternate function mode.
> +  The values for the pinmux properties are a combination of port name, pin
> +  number and the desired function index. Use the RZA2_PINMUX macro located
> +  in include/dt-bindings/pinctrl/r7s9210-pinctrl.h to easily define these.
> +  For assigning GPIO pins, use the macro RZA2_PIN_ID also in r7s9210-pinctrl.h

RZA2_PIN

> +  to express the desired port pin.
> +
> +  Required properties:
> +    - pinmux:
> +      integer array representing pin number and pin multiplexing configuration.
> +      When a pin has to be configured in alternate function mode, use this
> +      property to identify the pin by its global index, and provide its
> +      alternate function configuration number along with it.
> +      When multiple pins are required to be configured as part of the same
> +      alternate function they shall be specified as members of the same
> +      argument list of a single "pinmux" property.
> +      Helper macros to ease assembling the pin index from its position
> +      (port where it sits on and pin number) and alternate function identifier
> +      are provided by the pin controller header file at:
> +      <include/dt-bindings/pinctrl/r7s9210-pinctrl.h>

include/dt-bindings/pinctrl/r7s9210-pinctrl.h (or
<dt-bindings/pinctrl/r7s9210-pinctrl.h>)

> +      Integers values in "pinmux" argument list are assembled as:
> +      ((PORT * 8 + PIN) | MUX_FUNC << 16)

> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/r7s9210-pinctrl.h
> @@ -0,0 +1,47 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Defines macros and constants for Renesas RZ/A2 pin controller pin
> + * muxing functions.
> + */
> +#ifndef __DT_BINDINGS_PINCTRL_RENESAS_RZA2_H
> +#define __DT_BINDINGS_PINCTRL_RENESAS_RZA2_H
> +
> +#define RZA2_PINS_PER_PORT     8
> +
> +/* Port names as labeled in the Hardware Manual */
> +#define P0 0
> +#define P1 1
> +#define P2 2
> +#define P3 3
> +#define P4 4
> +#define P5 5
> +#define P6 6
> +#define P7 7
> +#define P8 8
> +#define P9 9
> +#define PA 10
> +#define PB 11
> +#define PC 12

This may conflict with MIPS again ;-)
Oh, you don't include the bindings header in the driver source file, and doing
so would cause issues with (previous version of) the enum...

Still, would it make sense to call these PORTx instead of Px?
The register descriptions use PORTx.<reg>.

> +#define PD 13
> +#define PE 14
> +#define PF 15
> +#define PG 16
> +#define PH 17
> +/* No I */
> +#define PJ 18
> +#define PK 19
> +#define PL 20
> +#define PM 21

There's no PM in my datasheet. Should that be JP0?
Oh, the register descriptions do use PORTM.

> +
> +/*
> + * Create the pin index from its bank and position numbers and store in
> + * the upper 8 bits the alternate function identifier

These are not really the upper 8 bits, unless your wordsize is 24-bit ;-)

"upper 16 bits", like on RZ/A1?

> + */
> +#define RZA2_PINMUX(b, p, f)   ((b) * RZA2_PINS_PER_PORT + (p) | (f << 16))

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
