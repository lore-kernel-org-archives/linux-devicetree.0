From: Marc Kleine-Budde <mkl@pengutronix.de>
Subject: Re: [PATCH v5 12/15] usb: phy: Add set_wakeup API
Date: Mon, 09 Dec 2013 09:41:54 +0100
Message-ID: <52A58252.6090502@pengutronix.de>
References: <1386570664-6713-1-git-send-email-peter.chen@freescale.com> <1386570664-6713-13-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="iUmGBa37g6xwU8xOCWdAGhLK19b8D3LKx"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1386570664-6713-13-git-send-email-peter.chen@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Peter Chen <peter.chen@freescale.com>
Cc: balbi@ti.com, shawn.guo@linaro.org, rob.herring@calxeda.com, grant.likely@linaro.org, alexander.shishkin@linux.intel.com, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, festevam@gmail.com, marex@denx.de, kernel@pengutronix.de, m.grzeschik@pengutronix.de, frank.li@freescale.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--iUmGBa37g6xwU8xOCWdAGhLK19b8D3LKx
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 12/09/2013 07:31 AM, Peter Chen wrote:
> This API is used to set wakeup enable at PHY registers, in that
> case, the PHY can be waken up from suspend due to external events,

I' no native speaker, but I think it's "to be woken up".

> like vbus change, dp/dm change and id change.
>=20
> Signed-off-by: Peter Chen <peter.chen@freescale.com>
> ---
>  include/linux/usb/phy.h |   16 ++++++++++++++++
>  1 files changed, 16 insertions(+), 0 deletions(-)
>=20
> diff --git a/include/linux/usb/phy.h b/include/linux/usb/phy.h
> index a747960..c6ebe1d 100644
> --- a/include/linux/usb/phy.h
> +++ b/include/linux/usb/phy.h
> @@ -111,6 +111,13 @@ struct usb_phy {
>  	int	(*set_suspend)(struct usb_phy *x,
>  				int suspend);
> =20
> +	/*
> +	 * Set wakeup enable for PHY, in that case, the PHY can be
> +	 * waken up from suspend status due to external events,
> +	 * like vbus change, dp/dm change and id.
> +	 */
> +	int	(*set_wakeup)(struct usb_phy *x, bool enabled);
> +
>  	/* notify phy connect status change */
>  	int	(*notify_connect)(struct usb_phy *x,
>  			enum usb_device_speed speed);
> @@ -270,6 +277,15 @@ usb_phy_set_suspend(struct usb_phy *x, int suspend=
)
>  }
> =20
>  static inline int
> +usb_phy_set_wakeup(struct usb_phy *x, bool enabled)
> +{
> +	if (x && x->set_wakeup)

can x be NULL?

> +		return x->set_wakeup(x, enabled);
> +	else
> +		return 0;
> +}
> +
> +static inline int
>  usb_phy_notify_connect(struct usb_phy *x, enum usb_device_speed speed)=

>  {
>  	if (x && x->notify_connect)
>=20

Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--iUmGBa37g6xwU8xOCWdAGhLK19b8D3LKx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)
Comment: Using GnuPG with Icedove - http://www.enigmail.net/

iEYEARECAAYFAlKlglIACgkQjTAFq1RaXHNXLQCfX4Fb0GI5yphiTWsmEP3P4VG8
2xMAnR/FW+PEmP1RMsN9J/Pbj+vR9KcN
=yI7e
-----END PGP SIGNATURE-----

--iUmGBa37g6xwU8xOCWdAGhLK19b8D3LKx--
