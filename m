From: Marc Kleine-Budde <mkl@pengutronix.de>
Subject: Re: [PATCH v5 08/15] usb: phy-mxs: Add implementation of nofity_suspend
 and notify_resume
Date: Mon, 09 Dec 2013 09:31:28 +0100
Message-ID: <52A57FE0.5030009@pengutronix.de>
References: <1386570664-6713-1-git-send-email-peter.chen@freescale.com> <1386570664-6713-9-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="FCBUjgb2dgwxMuHLmWQOLKB6KWl5xSibp"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1386570664-6713-9-git-send-email-peter.chen@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Peter Chen <peter.chen@freescale.com>
Cc: balbi@ti.com, shawn.guo@linaro.org, rob.herring@calxeda.com, grant.likely@linaro.org, alexander.shishkin@linux.intel.com, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, festevam@gmail.com, marex@denx.de, kernel@pengutronix.de, m.grzeschik@pengutronix.de, frank.li@freescale.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FCBUjgb2dgwxMuHLmWQOLKB6KWl5xSibp
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 12/09/2013 07:30 AM, Peter Chen wrote:
> Implementation of notify_suspend and notify_resume will be different
> according to mxs_phy_data->flags.
>=20
> Signed-off-by: Peter Chen <peter.chen@freescale.com>
> ---
>  drivers/usb/phy/phy-mxs-usb.c |   55 +++++++++++++++++++++++++++++++++=
+++++---
>  1 files changed, 51 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-us=
b.c
> index 0ef930a..e3df53f 100644
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -166,8 +166,8 @@ static int mxs_phy_suspend(struct usb_phy *x, int s=
uspend)
>  static int mxs_phy_on_connect(struct usb_phy *phy,
>  		enum usb_device_speed speed)
>  {
> -	dev_dbg(phy->dev, "%s speed device has connected\n",
> -		(speed =3D=3D USB_SPEED_HIGH) ? "high" : "non-high");
> +	dev_dbg(phy->dev, "%s device has connected\n",
> +		(speed =3D=3D USB_SPEED_HIGH) ? "HS" : "FS/LS");

What about creating a mxs_phy_dbg() function that adds the "HS" "FS/LS"
prefix when printing?

Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--FCBUjgb2dgwxMuHLmWQOLKB6KWl5xSibp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)
Comment: Using GnuPG with Icedove - http://www.enigmail.net/

iEYEARECAAYFAlKlf+EACgkQjTAFq1RaXHOEqQCfTlSWndNN28/vVCTmNHcHS47f
rdIAoIW/tBXL1PL2g505f1wJ39EQm2I4
=Mesv
-----END PGP SIGNATURE-----

--FCBUjgb2dgwxMuHLmWQOLKB6KWl5xSibp--
