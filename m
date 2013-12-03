From: Marc Kleine-Budde <mkl@pengutronix.de>
Subject: Re: [PATCH v4 02/17] usb: phy-mxs: Add platform judgement code
Date: Tue, 03 Dec 2013 09:38:20 +0100
Message-ID: <529D987C.8080905@pengutronix.de>
References: <1386056231-17258-1-git-send-email-peter.chen@freescale.com> <1386056231-17258-3-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="NKxoqFqsmoDeCPmt4jXBbQDuliRHhQ81r"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1386056231-17258-3-git-send-email-peter.chen@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Peter Chen <peter.chen@freescale.com>
Cc: balbi@ti.com, shawn.guo@linaro.org, rob.herring@calxeda.com, grant.likely@linaro.org, alexander.shishkin@linux.intel.com, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, festevam@gmail.com, marex@denx.de, kernel@pengutronix.de, m.grzeschik@pengutronix.de, frank.li@freescale.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--NKxoqFqsmoDeCPmt4jXBbQDuliRHhQ81r
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 12/03/2013 08:36 AM, Peter Chen wrote:
> The mxs-phy has several bugs and features at different
> versions, the driver code can get it through of_device_id.data.
>=20
> Signed-off-by: Peter Chen <peter.chen@freescale.com>
> ---
>  drivers/usb/phy/phy-mxs-usb.c |   58 +++++++++++++++++++++++++++++++++=
+------
>  1 files changed, 49 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-us=
b.c
> index 545844b..f6cbc78 100644
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -1,5 +1,5 @@
>  /*
> - * Copyright 2012 Freescale Semiconductor, Inc.
> + * Copyright 2012-2013 Freescale Semiconductor, Inc.
>   * Copyright (C) 2012 Marek Vasut <marex@denx.de>
>   * on behalf of DENX Software Engineering GmbH
>   *
> @@ -20,6 +20,7 @@
>  #include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/io.h>
> +#include <linux/of_device.h>
> =20
>  #define DRIVER_NAME "mxs_phy"
> =20
> @@ -34,13 +35,55 @@
>  #define BM_USBPHY_CTRL_ENUTMILEVEL2		BIT(14)
>  #define BM_USBPHY_CTRL_ENHOSTDISCONDETECT	BIT(1)
> =20
> +#define to_mxs_phy(p) container_of((p), struct mxs_phy, phy)
> +
> +/* Do disconnection between PHY and controller without vbus */
> +#define MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS	BIT(0)
> +
> +/*
> + * The PHY will be in messy if there is an wakeup after putting
                                           ^^
                                           a
Do you mean "messy state"?

> + * bus to suspend (set portsc.suspendM) but before setting PHY to low
> + * power mode (set portsc.phcd).
> + */

Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--NKxoqFqsmoDeCPmt4jXBbQDuliRHhQ81r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)
Comment: Using GnuPG with Icedove - http://www.enigmail.net/

iEYEARECAAYFAlKdmHwACgkQjTAFq1RaXHNxwwCglg9Zu8icKfznzBYEAAubz27E
uBQAnjIHVfFbBfwrEc4i9QLkdZdxgCTy
=kWOh
-----END PGP SIGNATURE-----

--NKxoqFqsmoDeCPmt4jXBbQDuliRHhQ81r--
