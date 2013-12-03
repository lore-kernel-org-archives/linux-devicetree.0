From: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v4 17/17] usb: phy-mxs: do not set PWD.RXPWD1PT1 for low
 speed connection
Date: Tue, 03 Dec 2013 09:53:11 +0100
Message-ID: <529D9BF7.1080707@pengutronix.de>
References: <1386056231-17258-1-git-send-email-peter.chen@freescale.com> <1386056231-17258-18-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="6BsFK7XeFNDbvDlJhTo9dKc1Sj8IttTEg"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386056231-17258-18-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, frank.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6BsFK7XeFNDbvDlJhTo9dKc1Sj8IttTEg
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 12/03/2013 08:37 AM, Peter Chen wrote:
> At very rare cases, the SoF will not send out after resume with
> low speed connection. The workaround is do not power down
> PWD.RXPWD1PT1 bit during the suspend.

Is this also a fix for newly added code? If so please also squash.

> Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  drivers/usb/phy/phy-mxs-usb.c |   47 +++++++++++++++++++++++++++++++++=
+++++++-
>  1 files changed, 46 insertions(+), 1 deletions(-)
>=20
> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-us=
b.c
> index 542b6ec..5ae4a57 100644
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -69,6 +69,9 @@
>  #define ANADIG_USB2_LOOPBACK_SET		0x244
>  #define ANADIG_USB2_LOOPBACK_CLR		0x248
> =20
> +#define ANADIG_USB1_MISC			0x1f0
> +#define ANADIG_USB2_MISC			0x250
> +
>  #define BM_ANADIG_ANA_MISC0_STOP_MODE_CONFIG	BIT(12)
>  #define BM_ANADIG_ANA_MISC0_STOP_MODE_CONFIG_SL BIT(11)
> =20
> @@ -80,6 +83,11 @@
>  #define BM_ANADIG_USB2_LOOPBACK_UTMI_DIG_TST1	BIT(2)
>  #define BM_ANADIG_USB2_LOOPBACK_TSTI_TX_EN	BIT(5)
> =20
> +#define BM_ANADIG_USB1_MISC_RX_VPIN_FS		BIT(29)
> +#define BM_ANADIG_USB1_MISC_RX_VMIN_FS		BIT(28)
> +#define BM_ANADIG_USB2_MISC_RX_VPIN_FS		BIT(29)
> +#define BM_ANADIG_USB2_MISC_RX_VMIN_FS		BIT(28)
> +
>  #define to_mxs_phy(p) container_of((p), struct mxs_phy, phy)
> =20
>  /* Do disconnection between PHY and controller without vbus */
> @@ -296,12 +304,49 @@ static void mxs_phy_shutdown(struct usb_phy *phy)=

>  	clk_disable_unprepare(mxs_phy->clk);
>  }
> =20
> +static bool mxs_phy_is_low_speed_connection(struct mxs_phy *mxs_phy)
> +{
> +	unsigned int line_state;
> +	/* bit definition is the same for all controllers */
> +	unsigned int dp_bit =3D BM_ANADIG_USB1_MISC_RX_VPIN_FS,
> +		     dm_bit =3D BM_ANADIG_USB1_MISC_RX_VMIN_FS;
> +	unsigned int reg =3D ANADIG_USB1_MISC;
> +
> +	/* If the SoCs don't have anatop, quit */
> +	if (!mxs_phy->regmap_anatop)
> +		return false;
> +
> +	if (mxs_phy->port_id =3D=3D 0)
> +		reg =3D ANADIG_USB1_MISC;
> +	else if (mxs_phy->port_id =3D=3D 1)
> +		reg =3D ANADIG_USB2_MISC;
> +
> +	regmap_read(mxs_phy->regmap_anatop, reg, &line_state);
> +
> +	if ((line_state & (dp_bit | dm_bit)) =3D=3D  dm_bit)
> +		return true;
> +	else
> +		return false;
> +}
> +
>  static int mxs_phy_suspend(struct usb_phy *x, int suspend)
>  {
>  	struct mxs_phy *mxs_phy =3D to_mxs_phy(x);
> +	bool low_speed_connection, vbus_is_on;
> +
> +	low_speed_connection =3D mxs_phy_is_low_speed_connection(mxs_phy);
> +	vbus_is_on =3D mxs_phy_get_vbus_status(mxs_phy);
> =20
>  	if (suspend) {
> -		writel(0xffffffff, x->io_priv + HW_USBPHY_PWD);
> +		/*
> +		 * FIXME: Do not power down RXPWD1PT1 bit for low speed

Is this FIXME still true?

> +		 * connect. The low speed connection will have problem at
> +		 * very rare cases during usb suspend and resume process.
> +		 */
> +		if (low_speed_connection & vbus_is_on)
> +			writel(0xfffbffff, x->io_priv + HW_USBPHY_PWD);
> +		else
> +			writel(0xffffffff, x->io_priv + HW_USBPHY_PWD);
>  		writel(BM_USBPHY_CTRL_CLKGATE,
>  		       x->io_priv + HW_USBPHY_CTRL_SET);
>  		clk_disable_unprepare(mxs_phy->clk);
>=20

Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--6BsFK7XeFNDbvDlJhTo9dKc1Sj8IttTEg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)
Comment: Using GnuPG with Icedove - http://www.enigmail.net/

iEYEARECAAYFAlKdm/cACgkQjTAFq1RaXHPi9wCeMk+tuL7E0eASdomBk/y3cLIb
VpAAn0sUKVqbAdq0UK10hiCUltxCJL1B
=CcOC
-----END PGP SIGNATURE-----

--6BsFK7XeFNDbvDlJhTo9dKc1Sj8IttTEg--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
