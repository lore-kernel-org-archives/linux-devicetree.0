From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v4 10/11] dt-bindings: thermal: add binding document for
 h3 thermal controller
Date: Mon, 24 Jun 2019 10:50:50 +0200
Message-ID: <20190624085050.horyiz4wp24kzjui@flea>
References: <20190623164206.7467-1-tiny.windzz@gmail.com>
 <20190623164206.7467-11-tiny.windzz@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ytcr75eegmcwn5yh"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190623164206.7467-11-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yangtao Li <tiny.windzz@gmail.com>
Cc: rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org, davem@davemloft.net, gregkh@linuxfoundation.org, mchehab+samsung@kernel.org, linus.walleij@linaro.org, nicolas.ferre@microchip.com, paulmck@linux.ibm.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--ytcr75eegmcwn5yh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jun 23, 2019 at 12:42:05PM -0400, Yangtao Li wrote:
> This patch adds binding document for allwinner h3 thermal controller.
>
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  .../bindings/thermal/sun8i-thermal.yaml       | 29 +++++++++++++++++--
>  1 file changed, 26 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/thermal/sun8i-thermal.yaml b/Documentation/devicetree/bindings/thermal/sun8i-thermal.yaml
> index 2c5acc61ed03..1eaf68b5dd5a 100644
> --- a/Documentation/devicetree/bindings/thermal/sun8i-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/sun8i-thermal.yaml
> @@ -16,6 +16,7 @@ description: |-
>  properties:
>    compatible:
>      enum:
> +      - allwinner,sun8i-h3-ths
>        - allwinner,sun50i-h6-ths
>
>    reg:
> @@ -29,13 +30,22 @@ properties:
>
>    clocks:
>      minItems: 1
> -    maxItems: 1
> +    maxItems: 2
>
>    clock-names:
> -    const: bus
> +    items:
> +      - const: bus
> +      - const: ahb

You need a min/maxItems here as well. Otherwise, on the H6, you will
have a warning since you asked for an array of two items, bus and ahb,
while you only have a single one.

>    '#thermal-sensor-cells':
> -    const: 1
> +    enum: [ 0, 1 ]
> +    description: |
> +      Definition depends on soc version:
> +
> +      For "allwinner,sun8i-h3-ths",
> +      value must be 0.
> +      For "allwinner,sun50i-h6-ths",
> +      value must be 1.

This must be checked using a conditional.

Something like:

if:
  properties:
    compatible:
      const: allwinner,sun8i-h3-ths

then:
  properties:
    "#thermal-sensor-cells":
      const: 0

else:
  properties:
    "#thermal-sensor-cells":
      const: 1

>    nvmem-cells:
>      items:
> @@ -55,6 +65,19 @@ required:
>    - '#thermal-sensor-cells'
>
>  examples:
> +  - |
> +    ths: ths@1c25000 {
> +         compatible = "allwinner,sun8i-h3-ths";
> +         reg = <0x01c25000 0x400>;
> +         clocks = <&ccu CLK_BUS_THS>, <&ccu CLK_THS>;
> +         clock-names = "bus", "ahb";
> +         resets = <&ccu RST_BUS_THS>;
> +         interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> +         nvmem-cells = <&tsen_calib>;
> +         nvmem-cell-names = "calib";
> +         #thermal-sensor-cells = <0>;
> +    };

Same remark here, it won't compile

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ytcr75eegmcwn5yh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXRCO6gAKCRDj7w1vZxhR
xT5JAP9EnWnCbO23gVZGh5xK3A73eXeJMaPcwVSRyTcxDaC75wEA5lbrfaOfqwX9
AZ4QA27PC8pe3lFJDh+4y7Q+DPT+7wI=
=s6LE
-----END PGP SIGNATURE-----

--ytcr75eegmcwn5yh--
