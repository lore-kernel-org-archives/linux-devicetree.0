From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v6 15/15] usb: phy-mxs: Add sync time after controller
 clear phcd
Date: Thu, 12 Dec 2013 22:39:23 -0600
Message-ID: <20131213043923.GJ867@saruman.home>
References: <1386897825-6130-1-git-send-email-peter.chen@freescale.com>
 <1386897825-6130-16-git-send-email-peter.chen@freescale.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JsihDCElWRmQcbOr"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1386897825-6130-16-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, frank.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--JsihDCElWRmQcbOr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2013 at 09:23:45AM +0800, Peter Chen wrote:
> After clear portsc.phcd, PHY needs 200us stable time for switch
> 32K clock to AHB clock.
>=20
> Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  drivers/usb/phy/phy-mxs-usb.c |   11 +++++++++++
>  1 files changed, 11 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
> index 885f8d9..68bd981 100644
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -156,6 +156,15 @@ static inline bool is_imx6sl_phy(struct mxs_phy *mxs=
_phy)
>  	return mxs_phy->data =3D=3D &imx6sl_phy_data;
>  }
> =20
> +/*
> + * PHY needs some 32K cycles to switch from 32K clock to
> + * bus (such as AHB/AXI, etc) clock.
> + */
> +static void mxs_phy_clock_switch_delay(void)
> +{
> +	usleep_range(300, 400);
> +}

shouldn't this be handled by clk_set_parent() itself ?

--=20
balbi

--JsihDCElWRmQcbOr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBAgAGBQJSqo97AAoJEIaOsuA1yqRE4FEP/3N8dB+OHfLFWABN02xUWmgK
KOj+FDLgIHrRcXBaulC+0XAjjulptyjneKXCgvxx6TbV8lCMSpMHbw+FqfqcwDOs
HXHYtwLw03DNkjTuzLgLKtMwg1G87BgjF1C1OU21WW6meTnTgA1VfTE2toqXqyyh
BvLYgSMDYNZQ22M/VHI/g/8W1kBOR7uzwUI5gaLLsrtrsy8h3gdnGdSKyjnkP81/
/40SUmz0i50szfZgwXCaV1W5ZaV0xk+vNp/xTEExicofYnHUoykTCWllZyqg5hag
7kzXvPz4PSmiIKKbOBGpQfGh0TcHW5hmRxP+Jo3tf5lDfza0TR8D8OPHqroBh4N1
o1A4BtWU7Xc5AOaCr4sBATYBn4/NN519sEUo3U9Ag17EP1wtfRFi66QeB/KoggYI
NbGNWGlaRRHTf+Gs0l8pfHRXiSgXjOLCJb6sXBBvDBCl4TGmbDs38Iofdd7SKsx8
PfwKT+jWAajiy1qZgXqcXc3WZ1pi2ueVxSgol08mJ+7epu7FVy3uKgCcmi0/H+VB
wnYbMS2M+Oo9tsmi36HuQRom9ljHn+SWGQW6hQjc4nGoeLJGeQvhKc9Glgic+pci
KxmtVf1J9YBkV42z9+UvPV4N2yPsXWPC/b8v5HHY3ru+34drr6FNuPUxQk4FsKkD
BRWW2qYWMUC2Ws2YnJWV
=RmKP
-----END PGP SIGNATURE-----

--JsihDCElWRmQcbOr--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
