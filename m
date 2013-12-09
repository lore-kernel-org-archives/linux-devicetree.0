From: Marc Kleine-Budde <mkl@pengutronix.de>
Subject: Re: [PATCH v5 09/15] usb: phy-mxs: Enable IC fixes for related SoCs
Date: Mon, 09 Dec 2013 09:38:17 +0100
Message-ID: <52A58179.2050702@pengutronix.de>
References: <1386570664-6713-1-git-send-email-peter.chen@freescale.com> <1386570664-6713-10-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="WvpP5IrUicPpdwa0OS8rjnSb0MotFPTMC"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1386570664-6713-10-git-send-email-peter.chen@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Peter Chen <peter.chen@freescale.com>
Cc: balbi@ti.com, shawn.guo@linaro.org, rob.herring@calxeda.com, grant.likely@linaro.org, alexander.shishkin@linux.intel.com, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, festevam@gmail.com, marex@denx.de, kernel@pengutronix.de, m.grzeschik@pengutronix.de, frank.li@freescale.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WvpP5IrUicPpdwa0OS8rjnSb0MotFPTMC
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 12/09/2013 07:30 AM, Peter Chen wrote:
> Some PHY bugs are fixed by IC logic, but these bits are not
> enabled by default, so we enable them at driver.

Which bugs are fixed by enabling this bit? Is it only suspend related?
Can you document them or better add a pointer to the documentation.

Further I don't like the idea of adding code, or enabling a feature on
certain hardware, that is broken in the first place and fixing it in a
later patch. Think about squashing it into the correct patch.

> Signed-off-by: Peter Chen <peter.chen@freescale.com>
> ---
>  drivers/usb/phy/phy-mxs-usb.c |   28 ++++++++++++++++++++++++++--
>  1 files changed, 26 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-us=
b.c
> index e3df53f..d1c319b 100644
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
> @@ -63,6 +69,9 @@
>  /* The SoCs who have anatop module */
>  #define MXS_PHY_HAS_ANATOP			BIT(3)
> =20
> +/* IC has bug fixes logic */
> +#define MXS_PHY_NEED_IP_FIX			BIT(4)
> +
>  struct mxs_phy_data {
>  	unsigned int flags;
>  };
> @@ -74,12 +83,14 @@ static const struct mxs_phy_data imx23_phy_data =3D=
 {
>  static const struct mxs_phy_data imx6q_phy_data =3D {
>  	.flags =3D MXS_PHY_SENDING_SOF_TOO_FAST |
>  		MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS |
> -		MXS_PHY_HAS_ANATOP,
> +		MXS_PHY_HAS_ANATOP |
> +		MXS_PHY_NEED_IP_FIX,
>  };
> =20
>  static const struct mxs_phy_data imx6sl_phy_data =3D {
>  	.flags =3D MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS |
> -		MXS_PHY_HAS_ANATOP,
> +		MXS_PHY_HAS_ANATOP |
> +		MXS_PHY_NEED_IP_FIX,
>  };
> =20
>  static const struct of_device_id mxs_phy_dt_ids[] =3D {
> @@ -97,6 +108,16 @@ struct mxs_phy {
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

Are the two is_imx6* functions still needed?

> +
>  static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
>  {
>  	int ret;
> @@ -123,6 +144,9 @@ static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)=

>  		BM_USBPHY_CTRL_ENUTMILEVEL3,
>  	       base + HW_USBPHY_CTRL_SET);
> =20
> +	if (mxs_phy->data->flags & MXS_PHY_NEED_IP_FIX)
> +		writel(BM_USBPHY_IP_FIX, base + HW_USBPHY_IP_SET);
> +
>  	return 0;
>  }

Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--WvpP5IrUicPpdwa0OS8rjnSb0MotFPTMC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)
Comment: Using GnuPG with Icedove - http://www.enigmail.net/

iEYEARECAAYFAlKlgXkACgkQjTAFq1RaXHNwDgCfeiJSus/aXuLNC2O0tCCWDBOT
DlAAnjlL3Dh2B3ztGZ7JvxlceQoa6uN6
=HLLf
-----END PGP SIGNATURE-----

--WvpP5IrUicPpdwa0OS8rjnSb0MotFPTMC--
