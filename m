Return-Path: <SRS0=/k5O=M6=jmondi.org=jacopo@kernel.org>
Date: Thu, 18 Oct 2018 22:51:31 +0200
From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: Add RZ/A2 pinctrl and GPIO
Message-ID: <20181018205131.GF11703@w540>
References: <20181005150951.22129-1-chris.brandt@renesas.com>
 <20181005150951.22129-3-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+jhVVhN62yS6hEJ8"
Content-Disposition: inline
In-Reply-To: <20181005150951.22129-3-chris.brandt@renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--+jhVVhN62yS6hEJ8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Chris,

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

I have some concerns here, I'll reply to Rob on this
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

I think you should list the required properties ('pinmux') and the pin
configuration flags the hardware supports. From a quick look to the
manual I only see a configurable drive strength, but I might have
missed something.

> diff --git a/include/dt-bindings/pinctrl/r7s9210-pinctrl.h b/include/dt-bindings/pinctrl/r7s9210-pinctrl.h
> new file mode 100644
> index 000000000000..39ac74ba520b
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
> + #define RZA2_PIN_ID(port, pin)	((port) * RZA2_PINS_PER_PORT + (pin))

Why not just RZA2_PIN() :) ?

Thanks
   j

> +
> +#endif /* __DT_BINDINGS_PINCTRL_RENESAS_RZA2_H */
> --
> 2.16.1
>

--+jhVVhN62yS6hEJ8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbyPJTAAoJEHI0Bo8WoVY89ScP/i/eTXuJ+WqKfGMLn4eRRalO
wNCqWlxz+Xp7/RSZG/KjUvw6zExZrLugjWyrP3QqmAm9G4r6DVvt7NGyN20imNQw
YuQ9rWZY/93hwBwkvLA34KOi50f8weVw5xU3HkEkMJ7urONI0pfqnxMeZ3vYKlbI
Iwy+o9ZZriFS95vK7t01L7WxK+JgYaqCDi7qokJCOnzkvFxDlgqJsUiVswnI8jzY
e5rMbhz25swprde7GqlQGsnQNLQgSzm5Dn0fOxcKmrulEaVSwEN+oXXtxcHTHWoX
W2q+Sps4HKJBlC/C/RGsxUxjOiqgz+o5LyXzdK0goCZDykxYALlo/DnPBpGouxQF
dq58uv7pF8TodxXYg53yULMtTjChArkJrPXLS8AwfjiTIzaeGQje8eCkoRx2CfQD
eGVtSKijuNHM0/npi1JwMlu+XuMpHySel5wKW0j3FG4zvumz2AIk4nAcugVz8A2J
u5ue9tStoEz0lGWssVkSOIwEdyNMggTgiU5LYG6SskcIYo6aNCiocEca+/1Umwmx
pum5gsboiiVBhMfEqxMXDJHRmztIwl7Dl67V2Eztd7F3Lo6JbRWxj3E52WrH42U1
8a3qu+wjePcgMtYK0d8ZcXw5kPKcDQoGqItDatgJgprIHqnV0g4aeJx/IaL37p9+
JiIHaSM3BsPkPUx4iPjZ
=ABjy
-----END PGP SIGNATURE-----

--+jhVVhN62yS6hEJ8--
