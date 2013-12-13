From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v6 08/15] usb: phy-mxs: Add implementation of
 nofity_suspend and notify_resume
Date: Thu, 12 Dec 2013 22:32:36 -0600
Message-ID: <20131213043236.GH867@saruman.home>
References: <1386897825-6130-1-git-send-email-peter.chen@freescale.com>
 <1386897825-6130-9-git-send-email-peter.chen@freescale.com>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EemXnrF2ob+xzFeB"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1386897825-6130-9-git-send-email-peter.chen@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Peter Chen <peter.chen@freescale.com>
Cc: balbi@ti.com, shawn.guo@linaro.org, rob.herring@calxeda.com, grant.likely@linaro.org, alexander.shishkin@linux.intel.com, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, festevam@gmail.com, marex@denx.de, kernel@pengutronix.de, m.grzeschik@pengutronix.de, frank.li@freescale.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--EemXnrF2ob+xzFeB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2013 at 09:23:38AM +0800, Peter Chen wrote:
> Implementation of notify_suspend and notify_resume will be different
> according to mxs_phy_data->flags.
>=20
> Signed-off-by: Peter Chen <peter.chen@freescale.com>
> ---
>  drivers/usb/phy/phy-mxs-usb.c |   55 +++++++++++++++++++++++++++++++++++=
+++---
>  1 files changed, 51 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
> index 0ef930a..e3df53f 100644
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -166,8 +166,8 @@ static int mxs_phy_suspend(struct usb_phy *x, int sus=
pend)
>  static int mxs_phy_on_connect(struct usb_phy *phy,
>  		enum usb_device_speed speed)
>  {
> -	dev_dbg(phy->dev, "%s speed device has connected\n",
> -		(speed =3D=3D USB_SPEED_HIGH) ? "high" : "non-high");
> +	dev_dbg(phy->dev, "%s device has connected\n",
> +		(speed =3D=3D USB_SPEED_HIGH) ? "HS" : "FS/LS");

unrelated.

> @@ -179,8 +179,8 @@ static int mxs_phy_on_connect(struct usb_phy *phy,
>  static int mxs_phy_on_disconnect(struct usb_phy *phy,
>  		enum usb_device_speed speed)
>  {
> -	dev_dbg(phy->dev, "%s speed device has disconnected\n",
> -		(speed =3D=3D USB_SPEED_HIGH) ? "high" : "non-high");
> +	dev_dbg(phy->dev, "%s device has disconnected\n",
> +		(speed =3D=3D USB_SPEED_HIGH) ? "HS" : "FS/LS");

unrelated.

> @@ -189,6 +189,48 @@ static int mxs_phy_on_disconnect(struct usb_phy *phy,
>  	return 0;
>  }
> =20
> +static int mxs_phy_on_suspend(struct usb_phy *phy,
> +		enum usb_device_speed speed)
> +{
> +	struct mxs_phy *mxs_phy =3D to_mxs_phy(phy);
> +
> +	dev_dbg(phy->dev, "%s device has suspended\n",
> +		(speed =3D=3D USB_SPEED_HIGH) ? "HS" : "FS/LS");
> +
> +	/* delay 4ms to wait bus entering idle */
> +	usleep_range(4000, 5000);
> +
> +	if (mxs_phy->data->flags & MXS_PHY_ABNORMAL_IN_SUSPEND) {
> +		writel_relaxed(0xffffffff, phy->io_priv + HW_USBPHY_PWD);
> +		writel_relaxed(0, phy->io_priv + HW_USBPHY_PWD);
> +	}
> +
> +	if (speed =3D=3D USB_SPEED_HIGH)
> +		writel_relaxed(BM_USBPHY_CTRL_ENHOSTDISCONDETECT,
> +				phy->io_priv + HW_USBPHY_CTRL_CLR);

why only on HS ? So if !HS and !ABNORMAL, this is no-op.

> +static int mxs_phy_on_resume(struct usb_phy *phy,
> +		enum usb_device_speed speed)
> +{
> +	dev_dbg(phy->dev, "%s device has resumed\n",
> +		(speed =3D=3D USB_SPEED_HIGH) ? "HS" : "FS/LS");
> +
> +	if (speed =3D=3D USB_SPEED_HIGH) {
> +		/* Make sure the device has switched to High-Speed mode */
> +		udelay(500);
> +		writel_relaxed(BM_USBPHY_CTRL_ENHOSTDISCONDETECT,
> +				phy->io_priv + HW_USBPHY_CTRL_SET);
> +	}

likewise, if !HS it's a no-op.

> @@ -235,6 +277,11 @@ static int mxs_phy_probe(struct platform_device *pde=
v)
> =20
>  	platform_set_drvdata(pdev, mxs_phy);
> =20
> +	if (mxs_phy->data->flags & MXS_PHY_SENDING_SOF_TOO_FAST) {
> +		mxs_phy->phy.notify_suspend =3D mxs_phy_on_suspend;
> +		mxs_phy->phy.notify_resume =3D mxs_phy_on_resume;
> +	}

hmm, and seems like you only need notify_* on a buggy device. Sorry
Peter but you don't have enough arguments to make me agree with this
(and previous) patch.

You gotta find a better way to handle this using normal phy
suspend/resume calls.

--=20
balbi

--EemXnrF2ob+xzFeB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBAgAGBQJSqo3kAAoJEIaOsuA1yqREgZsQALQfg09ks4lmQIuvDQpt/DFq
9LbB90eyxWVnKArE356MZ9HIQQtGAp6Q/YDPMl9m/PrswrNpZZDnA+xRjrUlBGsw
0qSK5A91dxWcjYoKGNJguNaDmQuuObqHzPzlYr9diwIul5lo5R5Fxs+3lTBaSV+C
7hhSDtUQ8CVFZNjPbXvWcMC8UaoPIZm/eyWFsQJ3uqQiLQjZslFV1YeqwZZQofZV
wXzh9wAN+TDMq1DolfUDDPGRrhCwlsMZZKlSEqO9f8APlTn7aNFFMwC8rCg4m8vq
n7oKJeZqtPp1YYMqD7MYNNh+IZt9jwjY98QiJgx1Klf7MWrEOACSItU/UqzvahPL
MATqkRqcAp+HONuDlTc+k8/MTbOCHTJPR1JItdOJ+m0869TI8UGVp9q5vcjV0uhc
7t9zfXDHZVRHCQZRq0x0h5zOB/Sos29PrLV99rxA+SSB0nFTrb7MB2DqU0tGq2kM
UOXnZ8cepOM23mRebtV0kXG0NqnrMnN44JmloMsvBa2jyrPBhFbZWuabKQZ2oBen
8w0FKeUvXsKz6TKry0vcFlqbAyWUgz5H51RZDZuLkKAVt3wXISq/M0S2TC0QX3zs
hy2wIoGO6hE8oGdZipsbjPe77OzLABjHsKpZHZB0QFJZwoKB8JVa1MT9hx5vddD/
vAKcDg3u0cOORAUolJx6
=VfYZ
-----END PGP SIGNATURE-----

--EemXnrF2ob+xzFeB--
