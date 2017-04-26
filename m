From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v4 3/9] dt-bindings: pinctrl: Add RZ/A1 bindings doc
Date: Wed, 26 Apr 2017 11:02:39 +0200
Message-ID: <CAMuHMdXKvuXTgQTbq_XV7PcjqL7Fj_T3wH0zXZWqwxk=5VZ4gA@mail.gmail.com>
References: <1491401247-7030-1-git-send-email-jacopo+renesas@jmondi.org> <1491401247-7030-4-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1491401247-7030-4-git-send-email-jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jacopo,

On Wed, Apr 5, 2017 at 4:07 PM, Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org> wrote:
> Add device tree bindings documentation for Renesas RZ/A1 gpio and pin

GPIO

> controller.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>

Thank you for the extensive documentation, incl. good examples!

> ---
>  .../bindings/pinctrl/renesas,rza1-pinctrl.txt      | 218 +++++++++++++++++++++
>  1 file changed, 218 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
> new file mode 100644
> index 0000000..46584ef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
> @@ -0,0 +1,218 @@
> +Renesas RZ/A1 combined Pin and GPIO controller
> +
> +The Renesas SoCs of RZ/A1 family feature a combined Pin and GPIO controller,

Renesas SoCs of the RZ/A1 family

> +named "Ports" in the hardware reference manual.
> +Pin multiplexing and GPIO configuration is performed on a per-pin basis
> +writing configuration values to per-port register sets.
> +Each "port" features up to 16 pins, each of them configurable for GPIO
> +function (port mode) or in alternate function mode.
> +Up to 8 different alternate function modes exist for each single pin.
> +
> +Pin controller node
> +-------------------
> +
> +Required properties:
> +  - compatible
> +    this shall be "renesas,r7s72100-ports".
> +
> +  - reg
> +    address base and length of the memory area where pin controller

the pin controller hardware

> +    hardware is mapped to.
> +
> +Example:
> +Pin controller node for RZ/A1H SoC (r7s72100)
> +
> +pinctrl: pin-controller@fcfe3000 {
> +       compatible = "renesas,r7s72100-ports";
> +
> +       reg = <0xfcfe3000 0x4230>;
> +};
> +
> +Sub-nodes
> +---------
> +
> +The child nodes of the pin controller node describe a pin multiplexing
> +function or a gpio controller alternatively.

"GPIO", to be consistent (there are more to fix)

> +
> +- Pin multiplexing sub-nodes:
> +  A pin multiplexing sub-node describes how to configure a set of
> +  (or a single) pin in some desired alternate function mode.
> +  A single sub-node may define several pin configurations.
> +  Some alternate functions require special pin configuration flags to be
> +  supplied along with the alternate function configuration number.
> +  When hardware reference manual specifies a pin function to be either

the hardware reference manual

> +  "bi-directional" or "software IO driven", use the generic properties from

from the

> +  <include/linux/pinctrl/pinconf_generic.h> header file to instruct the
> +  pin controller to perform the desired pin configuration operations.
> +  Please refer to pinctrl-bindings.txt to get to know more on generic
> +  pin properties usage.

> +  Supported generic properties:

Optional generic properties?

> +    - bi-directional:
> +      for pins requiring bi-directional operations.
> +    - input-enable:
> +      for pins requiring software driven IO input operations.
> +    - output-enable:
> +      for pins requiring software driver IO output operations.

I think you can move this here:

    The hardware reference manual specifies when a pin has to be configured to
    work in bi-directional mode.

> +
> +  Example:
> +  A serial communication interface with a TX output pin and an RX input pin.

[...]

> +  Pin #4 on port #1 is configured as alternate function #1.
> +  Pin #5 on port #1 is configured as alternate function #1.
> +  Both need to work in bi-directional mode.
> +  The hardware reference manual specifies when a pin has to be configured to
> +  work in bi-directional mode.

... and remove the two lines above here...

> +
> +  Example 3:
> +  Multi-function timer input and output compare pins.
> +  Configure TIOC0A as software driven input and TIOC0B as software driven
> +  output.

[...]

> +  Pin #0 on port #4 is configured as alternate function #2 with IO direction
> +  specified by software as input.
> +  Pin #1 on port #4 is configured as alternate function #1 with IO direction
> +  specified by software as output.
> +  The hardware reference manual specifies when a pin has to be configured with
> +  input/output direction specified by software.

... and here.

> +
> +- GPIO controller sub-nodes:
> +  Each port of the r7s72100 pin controller hardware is itself a gpio controller.
> +  Different SoCs have different number of available pins per port, but

numbers of

> +  generally speaking, each of them can be configured in GPIO ("port") mode
> +  on this hardware.
> +  Describe gpio-controllers using sub-nodes with the following properties.

GPIO controllers

> +
> +  Required properties:
> +    - gpio-controller
> +      empty property as defined by the gpio bindings documentation.
> +    - #gpio-cells
> +      number of cells required to identify and configure a GPIO.
> +      Shall be 2.
> +    - gpio-ranges
> +      Describes a gpio controller specifying its specific pin base, the pin
> +      base in the global pin numbering space, and the number of controlled
> +      pins, as defined by the gpio bindings documentation. Refer to this file

Documentation/devicetree/bindings/gpio/gpio.txt

> +      for a more detailed description.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
