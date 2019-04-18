From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: a64-amarula-relic: Add OV5640
 camera node
Date: Thu, 18 Apr 2019 13:20:05 +0200
Message-ID: <20190418112005.fxo6mpso3ibuqzvu@flea>
References: <20190418083813.11776-1-jagan@amarulasolutions.com>
 <20190418083813.11776-2-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lcsblazyrtnlskic"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190418083813.11776-2-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Trimarchi <michael@amarulasolutions.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com
List-Id: devicetree@vger.kernel.org


--lcsblazyrtnlskic
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Apr 18, 2019 at 02:08:13PM +0530, Jagan Teki wrote:
> Amarula A64-Relic board by default bound with OV5640 camera,
> so add support for it with below pin information.
>
> - PE13, PE12 via i2c-gpio bitbanging
> - CLK_CSI_MCLK as external clock
> - PE1 as external clock pin muxing
> - ALDO1 as AVDD supply
> - DLDO3 as DOVDD supply
> - ELDO3 as DVDD supply
> - PE14 gpio for reset pin
> - PE15 gpio for powerdown pin
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>
>  .../allwinner/sun50i-a64-amarula-relic.dts    | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
> index 3819ce396073..56c76b712e3b 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
> @@ -22,6 +22,41 @@
>  		stdout-path = "serial0:115200n8";
>  	};
>
> +	i2c-csi {

That node should be named i2c

> +		compatible = "i2c-gpio";
> +		sda-gpios = <&pio 4 13 GPIO_ACTIVE_HIGH>; /* CSI-SDA: PE13 */
> +		scl-gpios = <&pio 4 12 GPIO_ACTIVE_HIGH>; /* CSI-SCK: PE12 */

There's no need to document what those pins are here for, it's already
in the property name.

> +		i2c-gpio,delay-us = <5>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ov5640: camera@3c {
> +			compatible = "ovti,ov5640";
> +			reg = <0x3c>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&csi_mclk_pin>;
> +			clocks = <&ccu CLK_CSI_MCLK>;
> +			clock-names = "xclk";
> +
> +			AVDD-supply = <&reg_aldo1>;
> +			DOVDD-supply = <&reg_dldo3>;
> +			DVDD-supply = <&reg_eldo3>;
> +			reset-gpios = <&pio 4 14 GPIO_ACTIVE_LOW>; /* CSI-RST-R: PE14 */
> +			powerdown-gpios = <&pio 4 15 GPIO_ACTIVE_HIGH>; /* CSI-STBY-R: PE15 */
> +
> +			port {
> +				ov5640_ep: endpoint {
> +					remote-endpoint = <&csi_ep>;
> +					bus-width = <8>;
> +					hsync-active = <1>; /* Active high */
> +					vsync-active = <0>; /* Active low */
> +					data-active = <1>;  /* Active high */
> +					pclk-sample = <1>;  /* Rising */
> +				};
> +			};
> +		};
> +	};
> +
>  	wifi_pwrseq: wifi-pwrseq {
>  		compatible = "mmc-pwrseq-simple";
>  		clocks = <&rtc 1>;
> @@ -30,6 +65,24 @@
>  	};
>  };
>
> +&csi {
> +	status = "okay";
> +
> +	port {
> +		#address-cells = <1>;
> +		#size-cells = <0>;

This isn't needed, you don't have a reg property in your child node.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--lcsblazyrtnlskic
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXLhdZQAKCRDj7w1vZxhR
xYZNAP97st5WinIiU7yjctC3Q8tY/jIYEM24XiCuypHbxxEttwD+NHg9E7SK6NIs
GWQkA71y5BG/Xs+7Gde323eUhKNLZQQ=
=pUZc
-----END PGP SIGNATURE-----

--lcsblazyrtnlskic--
