From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2] arm64: allwinner: h6: orangepi-one-plus: Add Ethernet
 support
Date: Fri, 3 May 2019 16:46:51 +0200
Message-ID: <20190503144651.ttqfha656dykqjzo@flea>
References: <20190503115928.27662-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2rmkjhbiz7qfnwvn"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190503115928.27662-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Trimarchi <michael@amarulasolutions.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--2rmkjhbiz7qfnwvn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 03, 2019 at 05:29:28PM +0530, Jagan Teki wrote:
> Add Ethernet support for orangepi-one-plus board,
>
> - Ethernet port connected via RTL8211E PHY
> - PHY suppiled with
>   GMAC-2V5, fixed regulator with GMAC_EN pin via PD6
>   GMAC-3V, which is supplied by VCC3V3-MAC via aldo2
> - RGMII-RESET pin connected via PD14
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Your commit log should be improved. We can get those informations from
the patch itself...

> ---
> Changes for v2:
> - emac changes on top of https://patchwork.kernel.org/cover/10899529/
>   series
>
>  .../allwinner/sun50i-h6-orangepi-one-plus.dts |  8 ++++
>  .../dts/allwinner/sun50i-h6-orangepi.dtsi     | 42 +++++++++++++++++++
>  2 files changed, 50 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dts
> index 12e17567ab56..9e8ed1053715 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dts
> @@ -9,4 +9,12 @@
>  / {
>  	model = "OrangePi One Plus";
>  	compatible = "xunlong,orangepi-one-plus", "allwinner,sun50i-h6";
> +
> +	aliases {
> +		ethernet0 = &emac;
> +	};
> +};
> +
> +&emac {
> +	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> index 62e27948a3fa..c48e24acaf8a 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> @@ -45,6 +45,48 @@
>  		regulator-max-microvolt = <5000000>;
>  		regulator-always-on;
>  	};
> +
> +	/*
> +	 * The board uses 2.5V RGMII signalling. Power sequence to enable
> +	 * the phy is to enable GMAC-2V5 and GMAC-3V (aldo2) power rails
> +	 * at the same time and to wait 100ms.
> +	 */
> +	reg_gmac_2v5: gmac-2v5 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "gmac-2v5";
> +		regulator-min-microvolt = <2500000>;
> +		regulator-max-microvolt = <2500000>;
> +		startup-delay-us = <100000>;
> +		enable-active-high;
> +		gpio = <&pio 3 6 GPIO_ACTIVE_HIGH>; /* GMAC_EN: PD6 */
> +
> +		/* The real parent of gmac-2v5 is reg_vcc5v, but we need to
> +		 * enable two regulators to power the phy. This is one way
> +		 * to achieve that.
> +		 */
> +		vin-supply = <&reg_aldo2>; /* VCC3V3-MAC: GMAC-3V */
> +	};
> +};
> +
> +&emac {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&ext_rgmii_pins>;
> +	phy-mode = "rgmii";
> +	phy-handle = <&ext_rgmii_phy>;
> +	phy-supply = <&reg_gmac_2v5>;
> +	allwinner,rx-delay-ps = <1500>;
> +	allwinner,tx-delay-ps = <700>;
> +};
> +
> +&mdio {
> +	ext_rgmii_phy: ethernet-phy@1 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <1>;
> +
> +		reset-gpios = <&pio 3 14 GPIO_ACTIVE_LOW>; /* RGMII-RESET: PD14 */
> +		reset-assert-us = <15000>;
> +		reset-deassert-us = <40000>;
> +	};
>  };

... however, at no point in time you explain why you made that switch,
and while most of the definition of the EMAC nodes is in the DTSI, you
only enable it in one DTS.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--2rmkjhbiz7qfnwvn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXMxUWwAKCRDj7w1vZxhR
xRfCAQDVy0LVhlnpOdbjD47WRofRerK8UUI9OFy/pcKdkOrHHwD9GqdywGWCgKB+
W2rCZhn4ntKVt7j9hzPYI7c9zdztUAM=
=I+i9
-----END PGP SIGNATURE-----

--2rmkjhbiz7qfnwvn--
