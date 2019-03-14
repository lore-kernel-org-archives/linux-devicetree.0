From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] ARM: dts: sun8i-h3: Add support for the RerVision H3-DVK
 board
Date: Thu, 14 Mar 2019 16:50:11 +0100
Message-ID: <20190314155011.znrhrxp6jyrxdodt@flea>
References: <20190314130656.8010-1-paul.kocialkowski@bootlin.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gkwgnztfmwdi3bs5"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190314130656.8010-1-paul.kocialkowski@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org


--gkwgnztfmwdi3bs5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 14, 2019 at 02:06:56PM +0100, Paul Kocialkowski wrote:
> This is an H3-based board that sticks close to the reference design.
>=20
> Supported features:
> * UART
> * DRAM
> * MMC
> * eMMC
> * Ethernet
> * USB host
> * USB peripheral
> * HDMI
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  arch/arm/boot/dts/Makefile                   |   1 +
>  arch/arm/boot/dts/sun8i-h3-rervision-dvk.dts | 119 +++++++++++++++++++
>  2 files changed, 120 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun8i-h3-rervision-dvk.dts
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index bd40148a15b2..8db275b75214 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1078,6 +1078,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
>  	sun8i-h3-orangepi-plus.dtb \
>  	sun8i-h3-orangepi-plus2e.dtb \
>  	sun8i-h3-orangepi-zero-plus2.dtb \
> +	sun8i-h3-rervision-dvk.dtb \
>  	sun8i-r16-bananapi-m2m.dtb \
>  	sun8i-r16-nintendo-nes-classic.dtb \
>  	sun8i-r16-nintendo-super-nes-classic.dtb \
> diff --git a/arch/arm/boot/dts/sun8i-h3-rervision-dvk.dts b/arch/arm/boot=
/dts/sun8i-h3-rervision-dvk.dts
> new file mode 100644
> index 000000000000..94b71e064eb6
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-h3-rervision-dvk.dts
> @@ -0,0 +1,119 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2019 Bootlin
> + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + */
> +
> +/dts-v1/;
> +#include "sun8i-h3.dtsi"
> +#include "sunxi-common-regulators.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +
> +/ {
> +	model =3D "RerVision H3-DVK";
> +	compatible =3D "rervision,h3-dvk", "allwinner,sun8i-h3";
> +
> +	aliases {
> +		ethernet0 =3D &emac;
> +		serial0 =3D &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	connector {
> +		compatible =3D "hdmi-connector";
> +		type =3D "a";
> +
> +		port {
> +			hdmi_connector_input: endpoint {
> +				remote-endpoint =3D <&hdmi_connector_output>;

Those are pretty long labels, how would you feel about hdmi_con_in and
hdmi_out_con, as we've used on all the other boards?

> +&mmc2_8bit_pins {
> +	drive-strength =3D <40>;
> +	bias-pull-up;
> +};

bias-pull-up is already set by default, and a 30mA drive strength
should cover what the spec asks for. Did you encounter any issue with
this?

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--gkwgnztfmwdi3bs5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXIp4MwAKCRDj7w1vZxhR
xUGmAP9bda6GQ7eidD06h2KNY90UC3Gls/nX7OjeiHngEvp0aAD/bGJmEy8Wic9o
0M6IE88lOXzQtoP28M0j9Z2AQQbijQ0=
=wDzW
-----END PGP SIGNATURE-----

--gkwgnztfmwdi3bs5--
