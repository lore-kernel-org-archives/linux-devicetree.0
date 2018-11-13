Return-Path: <SRS0=chU0=NY=jmondi.org=jacopo@kernel.org>
Date: Tue, 13 Nov 2018 20:15:08 +0100
From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v4 2/2] dt-bindings: pinctrl: Add RZ/A2 pinctrl and GPIO
Message-ID: <20181113191508.GA19257@w540>
References: <20181107182733.62155-1-chris.brandt@renesas.com>
 <20181107182733.62155-3-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Content-Disposition: inline
In-Reply-To: <20181107182733.62155-3-chris.brandt@renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Chris,
    thanks for the patch

Just two minor things, so please add my
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>


On Wed, Nov 07, 2018 at 01:27:33PM -0500, Chris Brandt wrote:
> Add device tree binding documentation and header file for Renesas R7S9210
> (RZ/A2) SoCs.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> v3:
>  - Added Reviewed-by
> v2:
>  * Moved gpio-controller to required
>  * Wrote a better description of what the sub-nodes are for
>  * Added pinmux property description
>  * Changed macro RZA2_PIN_ID to RZA2_PIN
> ---
>  .../bindings/pinctrl/renesas,rza2-pinctrl.txt      | 88 ++++++++++++++++++++++
>  include/dt-bindings/pinctrl/r7s9210-pinctrl.h      | 47 ++++++++++++
>  2 files changed, 135 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.txt
>  create mode 100644 include/dt-bindings/pinctrl/r7s9210-pinctrl.h
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.txt
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

s/should/shall ?

> +    - "renesas,r7s9210-pinctrl": for RZ/A2M
> +  - reg
> +    Address base and length of the memory area where the pin controller
> +    hardware is mapped to.
> +  - gpio-controller
> +    This pin controller also controls pins as GPIO
> +  - #gpio-cells
> +    Must be 2
> +  - gpio-ranges
> +    Expresses the total number GPIO ports/pins in this SoC
> +
> +

Two empty lines.

Thanks
   j

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
> +      Integers values in "pinmux" argument list are assembled as:
> +      ((PORT * 8 + PIN) | MUX_FUNC << 16)
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
> +			gpios = <&pinctrl RZA2_PIN(P6, 0) GPIO_ACTIVE_HIGH>;
> +		};
> +	};
> diff --git a/include/dt-bindings/pinctrl/r7s9210-pinctrl.h b/include/dt-bindings/pinctrl/r7s9210-pinctrl.h
> new file mode 100644
> index 000000000000..1e2671b61c0a
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
> +#define RZA2_PINS_PER_PORT	8
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
> +
> +/*
> + * Create the pin index from its bank and position numbers and store in
> + * the upper 8 bits the alternate function identifier
> + */
> +#define RZA2_PINMUX(b, p, f)	((b) * RZA2_PINS_PER_PORT + (p) | (f << 16))
> +
> +/*
> + * Convert a port and pin label to its global pin index
> + */
> + #define RZA2_PIN(port, pin)	((port) * RZA2_PINS_PER_PORT + (pin))
> +
> +#endif /* __DT_BINDINGS_PINCTRL_RENESAS_RZA2_H */
> --
> 2.16.1
>

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJb6yK8AAoJEHI0Bo8WoVY8IgwP/3qmIOSLSr6dokAZvh9SFjyG
dgYBTmV8/ea8KCEqiv/CfB7YB4p1b/WBX94izycsPS5hcvsFfPR/uVJMXSvWMekC
q/qqRye50V9lQpPkHSUtDesoJxYeUYCVSXbbbv9V01k3j7wKszJFjQ4M4yBOoYJQ
wUA7WhwYuPEwdYBMEt8/r+NfDqePq3Qp60L7UpzTH6pKYTrXa6nWdYvGU2UA4fnl
YpNhLQenK0GtMFNFCDoQAHdrjbA7xo2sghxvvbuMT6fpDHJaBhPNZONWmElqHoCT
Du2mzluM3qQilc22mWhWbJCbXyxeZw0F78YP8O445T0aXnR26GgfI9BQELk3j6+u
ib+APqsQdYY4XVnnb80PaT4R35SnQlp8IngjycXLI8Iyc46HmmXPi6/v+IqmJJVU
2T1Xs1hgfMdPMyjbz0YV3uBtQsBCV4+WORmNK9YmR4EGPi2DJPvBGHuY5sP1JdwP
1zKtS1p74KdfyE3E/l4beehkKAdvjs4lxQT9VeMh03MOtA370SuMj4Rjyvcz7+UC
3wcsnMqhqVE7V3pyvIVtaqJJSFQRc8GtgBXGMIxThRd+zLbY6e86GODQ1cT2wSko
qL88+/qN3RR4eHOcFq4hKmBIS1kCpyyY1zXCh4FodaLeOmbxLJw53Qxc786CLwGI
IERJaxvSBZQMjgPulYNd
=+yG/
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
