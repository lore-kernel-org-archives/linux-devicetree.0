From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 2/2] arm64: allwinner: a64: Add Oceanic A64-5inMFD
 initial support
Date: Wed, 27 Feb 2019 16:33:46 +0100
Message-ID: <20190227153346.dwd3stsbsvf7rwly@flea>
References: <20190226060240.8783-1-jagan@amarulasolutions.com>
 <20190226060240.8783-2-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tvidgly74ni2eune"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190226060240.8783-2-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ryan Pannell <ryan@osukl.com>, Michael Trimarchi <michael@amarulasolutions.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com
List-Id: devicetree@vger.kernel.org


--tvidgly74ni2eune
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 26, 2019 at 11:32:40AM +0530, Jagan Teki wrote:
> Oceanic A64-5inMFD is a 5 inch Multi function display baseboard
> designed to mount SoPine SOM.
>=20
> Key features:
> - Allwinner A64 Cortex-A53
> - Mali-400MP2 GPU
> - AXP803 PMIC
> - 2GB DDR3 RAM
> - SD Slot
> - SPI-NOR flash
> - EMAC, RTL8211E
> - MCP2515 CAN
> - MIPI-DSI
> - Goodix 911 CTP
> - USB Host
> - 12V DC power supply
>=20
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  arch/arm64/boot/dts/allwinner/Makefile        |  1 +
>  .../allwinner/sun50i-a64-oceanic-5inmfd.dts   | 46 +++++++++++++++++++
>  2 files changed, 47 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5inm=
fd.dts
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts=
/allwinner/Makefile
> index a5fb1eaa8acf..ec39fe856117 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -2,6 +2,7 @@
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-amarula-relic.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-bananapi-m64.dtb sun50i-a64-ban=
anapi-m64-icn6211.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-nanopi-a64.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-oceanic-5inmfd.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-olinuxino.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-orangepi-win.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-pine64-lts.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5inmfd.dts =
b/arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5inmfd.dts
> new file mode 100644
> index 000000000000..d73d1f55acb9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5inmfd.dts
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2019 Oceanic Systems (UK) Ltd.
> + * Copyright (C) 2019 Amarula Solutions B.V.
> + * Author: Jagan Teki <jagan@amarulasolutions.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "sun50i-a64-sopine.dtsi"
> +
> +/ {
> +	model =3D "Oceanic A64-5inMFD";
> +	compatible =3D "oceanic,a64-5inmfd", "allwinner,sun50i-a64";

The name of the DT is Oceanic 5inMFD, while you call the board
A64-5inMFD here, which name is the actual name?

> +
> +	aliases {
> +		serial0 =3D &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +};
> +
> +&ehci0 {
> +	status =3D "okay";
> +};
> +
> +&ohci0 {
> +	status =3D "okay";
> +};
> +
> +&uart0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart0_pb_pins>;
> +	status =3D "okay";
> +};
> +
> +&usb_otg {
> +	dr_mode =3D "host";
> +	status =3D "okay";
> +};
> +
> +&usbphy {
> +	status =3D "okay";
> +};

Is the OTG controller really is only capable of running in host mode?

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--tvidgly74ni2eune
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXHat2gAKCRDj7w1vZxhR
xa+DAP4s2Hm6kePfyHN+dwx171NHe2etSoKegxkilk/w7w1b4QD9FeeaNqsYrUcy
tWlcf+UW+WV0NE8n2tEOrFlRzGmz+AU=
=Etqt
-----END PGP SIGNATURE-----

--tvidgly74ni2eune--
