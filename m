From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v4 02/11] dt-bindings: thermal: add binding document for
 h6 thermal controller
Date: Mon, 24 Jun 2019 10:47:37 +0200
Message-ID: <20190624084737.k5stgmqi2kx2p52o@flea>
References: <20190623164206.7467-1-tiny.windzz@gmail.com>
 <20190623164206.7467-3-tiny.windzz@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ivprrpimudesnwlt"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190623164206.7467-3-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yangtao Li <tiny.windzz@gmail.com>
Cc: rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org, davem@davemloft.net, gregkh@linuxfoundation.org, mchehab+samsung@kernel.org, linus.walleij@linaro.org, nicolas.ferre@microchip.com, paulmck@linux.ibm.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--ivprrpimudesnwlt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Sun, Jun 23, 2019 at 12:41:57PM -0400, Yangtao Li wrote:
> This patch adds binding document for allwinner h6 thermal controller.
>
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  .../bindings/thermal/sun8i-thermal.yaml       | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/sun8i-thermal.yaml
>
> diff --git a/Documentation/devicetree/bindings/thermal/sun8i-thermal.yaml b/Documentation/devicetree/bindings/thermal/sun8i-thermal.yaml
> new file mode 100644
> index 000000000000..2c5acc61ed03
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/sun8i-thermal.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thermal/sun8i-thermal.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner SUN8I Thermal Controller Device Tree Bindings
> +
> +maintainers:
> +  - Yangtao Li <tiny.windzz@gmail.com>
> +
> +description: |-
> +  This describes the device tree binding for the Allwinner thermal
> +  controller which measures the on-SoC temperatures.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - allwinner,sun50i-h6-ths
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 1

You can drop the minItems there

> +  nvmem-cells:
> +    items:
> +      - description: ths calibrate data
> +
> +  nvmem-cell-names:
> +    items:
> +      - const: calib

And for these two, you don't need the items either, it can be directly
const: calib (and the description for the first one).

> +required:
> +  - compatible
> +  - reg
> +  - reset
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - '#thermal-sensor-cells'
> +
> +examples:
> +  - |
> +    ths: ths@5070400 {
> +         compatible = "allwinner,sun50i-h6-ths";
> +         reg = <0x05070400 0x100>;
> +         clocks = <&ccu CLK_BUS_THS>;
> +         clock-names = "bus";
> +         resets = <&ccu RST_BUS_THS>;
> +         interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;

Did you try to run make dtbs_check? That one will probably not
compile.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ivprrpimudesnwlt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXRCOKQAKCRDj7w1vZxhR
xdBPAQDsYR1iG7lP4B3btdotbt4B3Mnzh74qRV6goFe8yPrtVQEAqTZEFyHblHwJ
MP/jYXkzBszWwvzwTaG37gmvGqItzQg=
=EY/h
-----END PGP SIGNATURE-----

--ivprrpimudesnwlt--
