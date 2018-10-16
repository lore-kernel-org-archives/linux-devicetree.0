Return-Path: <robherring2@gmail.com>
Date: Tue, 16 Oct 2018 17:47:00 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: Add RZ/A2 pinctrl and GPIO
Message-ID: <20181016224700.GA26385@bogus>
References: <20181005150951.22129-1-chris.brandt@renesas.com>
 <20181005150951.22129-3-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181005150951.22129-3-chris.brandt@renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, jacopo mondi <jacopo@jmondi.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Oct 05, 2018 at 10:09:51AM -0500, Chris Brandt wrote:
> Add device tree binding documentation and header file for Renesas R7S9210
> (RZ/A2) SoCs.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  .../bindings/pinctrl/renesas,rza2-pinctrl.txt      | 76 ++++++++++++++++++++++
>  include/dt-bindings/pinctrl/r7s9210-pinctrl.h      | 47 +++++++++++++
>  2 files changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.txt
>  create mode 100644 include/dt-bindings/pinctrl/r7s9210-pinctrl.h
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.txt
> new file mode 100644
> index 000000000000..5f338054f493
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.txt
> @@ -0,0 +1,76 @@
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
> +
> +  - reg
> +    address base and length of the memory area where the pin controller
> +    hardware is mapped to.
> +
> +Optional properties:
> +  - gpio-controller
> +    Include this in order to enable GPIO functionality. When included, both
> +    gpio_cells and gpio_ranges are then required.
> +  - #gpio-cells
> +    Must be 2
> +  - gpio-ranges
> +    Expresses the total number GPIO ports/pins in this SoC

Are these really optional? I guess in theory a board could use no GPIOs, 
but that seems unlikely. 

> +
> +
> +Example: Pin controller node for RZ/A2M SoC (r7s9210)
> +
> +	pinctrl: pin-controller@fcffe000 {
> +		compatible = "renesas,r7s9210-pinctrl";
> +		reg = <0xfcffe000 0x9D1>;
> +
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		gpio-ranges = <&pinctrl 0 0 176>;
> +	};
> +
> +Sub-nodes
> +---------
> +
> +The child nodes of the pin controller node describe a pin multiplexing
> +function or a GPIO controller alternatively.

But the parent is already a GPIO controller. This needs to be fully 
defined.

> +
> +- Pin multiplexing sub-nodes:
> +  A pin multiplexing sub-node describes how to configure a set of
> +  (or a single) pin in some desired alternate function mode.
> +  The values for the pinmux properties are a combination of port name, pin
> +  number and the desired function index. Use the RZA2_PINMUX macro located
> +  in include/dt-bindings/pinctrl/r7s9210-pinctrl.h to easily define these.
> +  For assigning GPIO pins, use the macro RZA2_PIN_ID also in r7s9210-pinctrl.h
> +  to express the desired port pin.
> +
> +  Example: Board specific pins configuration
> +
> +	&pinctrl {
> +		/* Serial Console */
> +		scif4_pins: serial4 {
> +			pinmux = <RZA2_PINMUX(P9, 0, 4)>,	/* TxD4 */
> +				 <RZA2_PINMUX(P9, 1, 4)>;	/* RxD4 */
> +		};
> +	};
> +
> +  Example: Assigning a GPIO:
> +
> +	leds {
> +		status = "okay";
> +		compatible = "gpio-leds";
> +
> +		led0 {
> +			/* P6_0 */
> +			gpios = <&pinctrl RZA2_PIN_ID(P6, 0) GPIO_ACTIVE_HIGH>;
> +		};
> +	};
