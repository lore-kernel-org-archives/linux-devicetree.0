From: Marc Kleine-Budde <mkl@pengutronix.de>
Subject: Re: [PATCH v5 15/15] usb: phy-mxs: Add sync time after controller
 clear phcd
Date: Mon, 09 Dec 2013 10:05:17 +0100
Message-ID: <52A587CD.7010203@pengutronix.de>
References: <1386570664-6713-1-git-send-email-peter.chen@freescale.com> <1386570664-6713-16-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="9m8ao2HWBMOBJpM88hfu7D7OKBwhwFAJ4"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1386570664-6713-16-git-send-email-peter.chen@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Peter Chen <peter.chen@freescale.com>
Cc: balbi@ti.com, shawn.guo@linaro.org, rob.herring@calxeda.com, grant.likely@linaro.org, alexander.shishkin@linux.intel.com, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, festevam@gmail.com, marex@denx.de, kernel@pengutronix.de, m.grzeschik@pengutronix.de, frank.li@freescale.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9m8ao2HWBMOBJpM88hfu7D7OKBwhwFAJ4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 12/09/2013 07:31 AM, Peter Chen wrote:
> After clear portsc.phcd, PHY needs 200us stable time for switch
> 32K clock to AHB clock.

If this is a general bugbix, please move it to the start of this series
and add stable on Cc. I think I hit the bug on the second USB port of a
custom MX28 board, the stmp_reset_block() in the USB phy will fail.

Is the problem documented somewhere?

Is it possible to add the delay in the clock framework? I think only the
regulator framework has a configurable delay for the regulator to stabili=
ze.

> Signed-off-by: Peter Chen <peter.chen@freescale.com>
> ---
>  drivers/usb/phy/phy-mxs-usb.c |   11 +++++++++++
>  1 files changed, 11 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-us=
b.c
> index e18fdf3..7ae5225 100644
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -151,6 +151,15 @@ static inline bool is_imx6sl_phy(struct mxs_phy *m=
xs_phy)
>  	return mxs_phy->data =3D=3D &imx6sl_phy_data;
>  }
> =20
> +/*
> + * PHY needs some 32K cycles to switch from 32K clock to
> + * bus (such as AHB/AXI, etc) clock.
> + */
> +static void mxs_phy_clock_switch(void)
> +{
> +	usleep_range(300, 400);
> +}
> +
>  static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
>  {
>  	int ret;
> @@ -276,6 +285,7 @@ static int mxs_phy_init(struct usb_phy *phy)
>  {
>  	struct mxs_phy *mxs_phy =3D to_mxs_phy(phy);
> =20
> +	mxs_phy_clock_switch();
>  	clk_prepare_enable(mxs_phy->clk);
>  	return mxs_phy_hw_init(mxs_phy);
>  }
> @@ -300,6 +310,7 @@ static int mxs_phy_suspend(struct usb_phy *x, int s=
uspend)
>  		       x->io_priv + HW_USBPHY_CTRL_SET);
>  		clk_disable_unprepare(mxs_phy->clk);
>  	} else {
> +		mxs_phy_clock_switch();
>  		clk_prepare_enable(mxs_phy->clk);
>  		writel(BM_USBPHY_CTRL_CLKGATE,
>  		       x->io_priv + HW_USBPHY_CTRL_CLR);
>=20

Marc
--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--9m8ao2HWBMOBJpM88hfu7D7OKBwhwFAJ4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)
Comment: Using GnuPG with Icedove - http://www.enigmail.net/

iEYEARECAAYFAlKlh80ACgkQjTAFq1RaXHNwIQCfUFbJ7ad92JXAXxVqF9JVYHdo
nF0AoJCw6dnimGE8Wd4bm4j8LOlEPCsu
=PtY6
-----END PGP SIGNATURE-----

--9m8ao2HWBMOBJpM88hfu7D7OKBwhwFAJ4--
