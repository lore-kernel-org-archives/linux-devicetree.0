From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: allwinner: a64-amarula-relic: Add
 GT5663 CTP node
Date: Thu, 18 Apr 2019 13:23:57 +0200
Message-ID: <20190418112357.qic227rdwordmzyh@flea>
References: <20190418083543.11695-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="a2pbzqfiss63fc44"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190418083543.11695-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Trimarchi <michael@amarulasolutions.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com
List-Id: devicetree@vger.kernel.org


--a2pbzqfiss63fc44
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 18, 2019 at 02:05:42PM +0530, Jagan Teki wrote:
> Add Goodix GT5663 capacitive touch controller node on
> Amarula A64-Relic board.
>
> The CTP connected to board with,
> - SDA, SCK from i2c1
> - GPIO-LD0 as AVDD28 supply
> - PH4 gpio as interrupt pin
> - PH8 gpio as reset pin
> - X axis is inverted
> - Y axis is inverted
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v2:
> - drop i2c1, bias-pull-up
>
>  .../allwinner/sun50i-a64-amarula-relic.dts    | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
> index 3575db216016..3819ce396073 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
> @@ -49,6 +49,24 @@
>  	bias-pull-up;
>  };
>
> +&i2c1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c1_pins>;

That's the default already

> +	status = "okay";
> +
> +	touchscreen@5d {
> +		compatible = "goodix,gt5663";
> +		reg = <0x5d>;
> +		AVDD28-supply = <&reg_ldo_io0>;			/* VCC-CTP: GPIO0-LDO */
> +		interrupt-parent = <&pio>;
> +		interrupts = <7 4 IRQ_TYPE_EDGE_FALLING>;
> +		irq-gpios = <&pio 7 4 GPIO_ACTIVE_HIGH>;	/* CTP-INT: PH4 */
> +		reset-gpios = <&pio 7 8 GPIO_ACTIVE_HIGH>;	/* CTP-RST: PH8 */
> +		touchscreen-inverted-x;
> +		touchscreen-inverted-y;
> +	};
> +};
> +
>  &mmc1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&mmc1_pins>;
> @@ -212,6 +230,13 @@
>  	regulator-name = "vdd-cpus";
>  };
>
> +&reg_ldo_io0 {
> +	regulator-min-microvolt = <3300000>;
> +	regulator-max-microvolt = <3300000>;

The name of that regulator is AVDD28, which indicates that it would be
a 2.8V regulator?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--a2pbzqfiss63fc44
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXLheTQAKCRDj7w1vZxhR
xcuMAQDENJX3u2tb51Ouqd0KaweSmp82cNl08J3eeEk3EXwx1AD/ZbROxKtQ4oO7
zIxGGqxjWWXz43UJCj2XnFglwPybcAI=
=KSHf
-----END PGP SIGNATURE-----

--a2pbzqfiss63fc44--
