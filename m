Return-Path: <sre@kernel.org>
Date: Fri, 5 Apr 2019 16:37:47 +0200
From: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH] power: supply: ltc3651-charger.c: Fix typo in device name
Message-ID: <20190405143747.didydf5neea4iqcq@earth.universe>
References: <1553608635-29376-1-git-send-email-michael.hennerich@analog.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cm33ifb5i6erih3w"
Content-Disposition: inline
In-Reply-To: <1553608635-29376-1-git-send-email-michael.hennerich@analog.com>
To: michael.hennerich@analog.com
Cc: mike.looijmans@topic.nl, robh+dt@kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, robin.getz@analog.com
List-ID: <devicetree@vger.kernel.org>


--cm33ifb5i6erih3w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 26, 2019 at 02:57:15PM +0100, michael.hennerich@analog.com wrot=
e:
> From: Michael Hennerich <michael.hennerich@analog.com>
>=20
> There never was a device called LTC3651, it always was just LT3651.
> This circumstance makes it pretty difficult to identify what this
> driver is meant to control. This patch is a minimal invasive attempt
> to fix this issue without affecting existing systems.
>=20
>=20
> Signed-off-by: Michael Hennerich <michael.hennerich@analog.com>
> ---

Please change subject to "power: supply: ltc3651-charger: Fix device name"

Also we probably should change the filenames and Kconfig name.

-- Sebastian

>  .../devicetree/bindings/power/supply/ltc3651-charger.txt         | 8 +++=
++---
>  drivers/power/supply/Kconfig                                     | 6 +++=
---
>  drivers/power/supply/ltc3651-charger.c                           | 9 +++=
------
>  3 files changed, 11 insertions(+), 12 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/power/supply/ltc3651-charg=
er.txt b/Documentation/devicetree/bindings/power/supply/ltc3651-charger.txt
> index 71f2840..f012449 100644
> --- a/Documentation/devicetree/bindings/power/supply/ltc3651-charger.txt
> +++ b/Documentation/devicetree/bindings/power/supply/ltc3651-charger.txt
> @@ -1,7 +1,9 @@
> -ltc3651-charger
> +Analog Devices LT3651 Charger Power Supply bindings: ltc3651-charger
> =20
>  Required properties:
> - - compatible: "lltc,ltc3651-charger"
> +- compatible: Should contain one of the following:
> + * "lltc,ltc3651-charger",
> + * "lltc,lt3651-charger"
>   - lltc,acpr-gpios: Connect to ACPR output. See remark below.
> =20
>  Optional properties:
> @@ -20,7 +22,7 @@ attributes to detect changes.
>  Example:
> =20
>  	charger: battery-charger {
> -		compatible =3D "lltc,ltc3651-charger";
> +		compatible =3D "lltc,lt3651-charger";
>  		lltc,acpr-gpios =3D <&gpio0 68 GPIO_ACTIVE_LOW>;
>  		lltc,fault-gpios =3D <&gpio0 64 GPIO_ACTIVE_LOW>;
>  		lltc,chrg-gpios =3D <&gpio0 63 GPIO_ACTIVE_LOW>;
> diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
> index e901b9879..6816a86 100644
> --- a/drivers/power/supply/Kconfig
> +++ b/drivers/power/supply/Kconfig
> @@ -476,11 +476,11 @@ config CHARGER_MANAGER
>            with help of suspend_again support.
> =20
>  config CHARGER_LTC3651
> -	tristate "LTC3651 charger"
> +	tristate "Analog Devices LT3651 charger"
>  	depends on GPIOLIB
>  	help
> -	  Say Y to include support for the LTC3651 battery charger which reports
> -	  its status via GPIO lines.
> +	  Say Y to include support for the Analog Devices (Linear Technology)
> +	  LT3651 battery charger which reports its status via GPIO lines.
> =20
>  config CHARGER_MAX14577
>  	tristate "Maxim MAX14577/77836 battery charger driver"
> diff --git a/drivers/power/supply/ltc3651-charger.c b/drivers/power/suppl=
y/ltc3651-charger.c
> index eea63ff..07ed537 100644
> --- a/drivers/power/supply/ltc3651-charger.c
> +++ b/drivers/power/supply/ltc3651-charger.c
> @@ -1,11 +1,7 @@
> +// SPDX-License-Identifier: GPL-2.0+
>  /*
> + *  Driver for Analog Devices (Linear Technology) LT3651 charger IC.
>   *  Copyright (C) 2017, Topic Embedded Products
> - *  Driver for LTC3651 charger IC.
> - *
> - *  This program is free software; you can redistribute it and/or modify=
 it
> - *  under  the terms of the GNU General  Public License as published by =
the
> - *  Free Software Foundation;  either version 2 of the License, or (at y=
our
> - *  option) any later version.
>   */
> =20
>  #include <linux/device.h>
> @@ -190,6 +186,7 @@ static int ltc3651_charger_probe(struct platform_devi=
ce *pdev)
> =20
>  static const struct of_device_id ltc3651_charger_match[] =3D {
>  	{ .compatible =3D "lltc,ltc3651-charger" },
> +	{ .compatible =3D "lltc,lt3651-charger" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, ltc3651_charger_match);
> --=20
> 2.7.4
>=20

--cm33ifb5i6erih3w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlynaDcACgkQ2O7X88g7
+pr+ug//WWl9nxPTmIvCXV7yGAk4nmLhtj1TPHthL6w8tREn2Yl4amVTdxDPB76u
ird3uR16+zXst5udPSDaGenA4YNu86wyThawanbz4ecIRjyQlTZuI8p4+g3h6MbQ
eXQpoNlATNckcmcK2FbFBUdjbxXJ73phWamO0+4AE/nzVDilHJvkjrCf7mshPlv4
D/rlnHPFZqjQ7mLPHlPR++DkXUMC+QsCl1rbT0DQV7xyAWYd3/7ZOOghuPdgNXh2
xn32moMmbiD1YzM4WYVoeaNqFtI9uXzpxXTXbYDsX2Hwn2IBr7UvS0K4/vbWlskS
Y7qbIaDKHTTLLwKzSt0jdM9btVR3uaJS2cIK1cw4E2HZXgiRGDtknmc5Y8VVjN1J
lo9KjxEWICMHnVPTX/VGyE3jSrSFLC9ta3PtHCI6Z1HwFBwjUDKGBJdCIIKyc2ui
XJwwLZqIlN7v81YkkFVdup0EM7whr1HT0P7gqoZsGkojuYAYFbM/WqAcR61C9eOk
y8ZWY6QTEvdWIIJ3GezliNbrqq8XTWJF45MaFhOB9/NCnP2GQCAOAzzTFsN+aoFQ
g6Y99QawtZ2ji9FjxjkH+RKbtD+l1X6NKGCe7kqPQei7RjN957DNFwS6am1nES6b
bDA+cxp26aW2NUNqf6yBj4XKoSRM1FFgLAmUD8fjf2quscw7m7Y=
=KYK7
-----END PGP SIGNATURE-----

--cm33ifb5i6erih3w--
