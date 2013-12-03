From: Marc Kleine-Budde <mkl@pengutronix.de>
Subject: Re: [PATCH v4 09/17] usb: phy-mxs: Enable IC fixes for related SoCs
Date: Tue, 03 Dec 2013 09:27:35 +0100
Message-ID: <529D95F7.8060705@pengutronix.de>
References: <1386056231-17258-1-git-send-email-peter.chen@freescale.com> <1386056231-17258-10-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="qiW0wauqsdieICrhfUDsqbfl8Xg9uvWT2"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1386056231-17258-10-git-send-email-peter.chen@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Peter Chen <peter.chen@freescale.com>
Cc: balbi@ti.com, shawn.guo@linaro.org, rob.herring@calxeda.com, grant.likely@linaro.org, alexander.shishkin@linux.intel.com, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, festevam@gmail.com, marex@denx.de, kernel@pengutronix.de, m.grzeschik@pengutronix.de, frank.li@freescale.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qiW0wauqsdieICrhfUDsqbfl8Xg9uvWT2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 12/03/2013 08:37 AM, Peter Chen wrote:
> Some PHY bugs are fixed by IC logic, but these bits are not
> enabled by default, so we enable them at driver.
>=20
> Signed-off-by: Peter Chen <peter.chen@freescale.com>
> ---
>  drivers/usb/phy/phy-mxs-usb.c |   20 ++++++++++++++++++++
>  1 files changed, 20 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-us=
b.c
> index 8738890..0908d74 100644
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -31,6 +31,10 @@
>  #define HW_USBPHY_CTRL_SET			0x34
>  #define HW_USBPHY_CTRL_CLR			0x38
> =20
> +#define HW_USBPHY_IP				0x90
> +#define HW_USBPHY_IP_SET			0x94
> +#define HW_USBPHY_IP_CLR			0x98
> +
>  #define BM_USBPHY_CTRL_SFTRST			BIT(31)
>  #define BM_USBPHY_CTRL_CLKGATE			BIT(30)
>  #define BM_USBPHY_CTRL_ENAUTOSET_USBCLKS	BIT(26)
> @@ -42,6 +46,8 @@
>  #define BM_USBPHY_CTRL_ENUTMILEVEL2		BIT(14)
>  #define BM_USBPHY_CTRL_ENHOSTDISCONDETECT	BIT(1)
> =20
> +#define BM_USBPHY_IP_FIX                       (BIT(17) | BIT(18))
> +
>  #define to_mxs_phy(p) container_of((p), struct mxs_phy, phy)
> =20
>  /* Do disconnection between PHY and controller without vbus */
> @@ -97,6 +103,16 @@ struct mxs_phy {
>  	struct regmap *regmap_anatop;
>  };
> =20
> +static inline bool is_imx6q_phy(struct mxs_phy *mxs_phy)
> +{
> +	return mxs_phy->data =3D=3D &imx6q_phy_data;
> +}
> +
> +static inline bool is_imx6sl_phy(struct mxs_phy *mxs_phy)
> +{
> +	return mxs_phy->data =3D=3D &imx6sl_phy_data;
> +}

Why don't you use a a BIT() here as in Patch 2/17, too?

Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--qiW0wauqsdieICrhfUDsqbfl8Xg9uvWT2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)
Comment: Using GnuPG with Icedove - http://www.enigmail.net/

iEYEARECAAYFAlKdlfcACgkQjTAFq1RaXHP8fwCfStt3jBW/DhqCCKgDCfKqhrDa
lbwAn2T8j8XYN3A8aGii9vaKXfr10fI/
=HtZt
-----END PGP SIGNATURE-----

--qiW0wauqsdieICrhfUDsqbfl8Xg9uvWT2--
