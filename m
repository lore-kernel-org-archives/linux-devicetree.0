From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v3 1/6] arm64: dts: allwinner: h6: move MMC pinctrl to
 dtsi
Date: Mon, 8 Apr 2019 12:41:57 +0200
Message-ID: <20190408104157.tdxg2al3fpanhqqu@flea>
References: <20190408092619.23152-1-peron.clem@gmail.com>
 <20190408092619.23152-2-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="z3higc46mou4if3b"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190408092619.23152-2-peron.clem@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--z3higc46mou4if3b
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 08, 2019 at 11:26:14AM +0200, Cl=E9ment P=E9ron wrote:
> There is only one pinmuxing available for each MMC controller.
>
> Move the pinctrl to the SOC
>
> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi | 2 --
>  arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts  | 4 ----
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi          | 4 ++++
>  3 files changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch=
/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> index b2526dac2fcf..62e27948a3fa 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> @@ -56,8 +56,6 @@
>  };
>
>  &mmc0 {
> -	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&mmc0_pins>;
>  	vmmc-supply =3D <&reg_cldo1>;
>  	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>;
>  	bus-width =3D <4>;
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts b/arch/=
arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
> index bdb8470fc8dc..4802902e128f 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
> @@ -104,8 +104,6 @@
>  };
>
>  &mmc0 {
> -	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&mmc0_pins>;
>  	vmmc-supply =3D <&reg_cldo1>;
>  	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>;
>  	bus-width =3D <4>;
> @@ -113,8 +111,6 @@
>  };
>
>  &mmc2 {
> -	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&mmc2_pins>;
>  	vmmc-supply =3D <&reg_cldo1>;
>  	vqmmc-supply =3D <&reg_bldo2>;
>  	non-removable;
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/bo=
ot/dts/allwinner/sun50i-h6.dtsi
> index 3e4bb0b0de69..006d3b6418af 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> @@ -278,6 +278,8 @@
>  			resets =3D <&ccu RST_BUS_MMC0>;
>  			reset-names =3D "ahb";
>  			interrupts =3D <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> +		        pinctrl-names =3D "default";

This is indented with spaces and not tabulations. This error is
reported by checkpatch.

> +			pinctrl-0 =3D <&mmc0_pins>;
>  			status =3D "disabled";
>  			#address-cells =3D <1>;
>  			#size-cells =3D <0>;
> @@ -306,6 +308,8 @@
>  			resets =3D <&ccu RST_BUS_MMC2>;
>  			reset-names =3D "ahb";
>  			interrupts =3D <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&mmc0_pins>;

I guess you meant mmc2?

Can you test your patches before sending them please?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--z3higc46mou4if3b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKsldQAKCRDj7w1vZxhR
xXGnAP99TBRvSJ0rpD/2Yfgh6WXHm7ypxBGhdz34nxuZCeghpAEAiRChgRYD5zk3
uXjFTbssB+DHZmn119gguJEO9itM1QA=
=fgYB
-----END PGP SIGNATURE-----

--z3higc46mou4if3b--
