From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 01/12] usb: otg: add notify_connect_change callback
Date: Mon, 21 May 2012 12:26:36 +0300
Message-ID: <20120521092635.GL8633@arwen.pp.htv.fi>
References: <1337592237-5090-1-git-send-email-richard.zhao@freescale.com>
 <1337592237-5090-2-git-send-email-richard.zhao@freescale.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5VuzLDXibKSJvVYD"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1337592237-5090-2-git-send-email-richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-MeMPY/F8WlbQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--5VuzLDXibKSJvVYD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 21, 2012 at 05:23:46PM +0800, Richard Zhao wrote:
> This let usb phy driver has a chance to change hw settings when connect
> status change.
>=20
> Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  include/linux/usb/otg.h |   13 +++++++++++++
>  1 files changed, 13 insertions(+), 0 deletions(-)
>=20
> diff --git a/include/linux/usb/otg.h b/include/linux/usb/otg.h
> index 38ab3f4..385641d 100644
> --- a/include/linux/usb/otg.h
> +++ b/include/linux/usb/otg.h
> @@ -117,6 +117,10 @@ struct usb_phy {
>  	int	(*set_suspend)(struct usb_phy *x,
>  				int suspend);
> =20
> +	/* notify phy connect status change */
> +	int	(*notify_connect_change)(struct usb_phy *x,
> +					 int port,
> +					 int connected);
>  };
> =20
> =20
> @@ -252,6 +256,15 @@ usb_phy_set_suspend(struct usb_phy *x, int suspend)
>  }
> =20
>  static inline int
> +usb_phy_notify_connect_change(struct usb_phy *x, int port, int connected)
> +{
> +	if (x->notify_connect_change !=3D NULL)

you don't need this !=3D NULL. See that no other wrapper has it. Keep
consistency.

Also, this is the kind of stuff that I have been queueing for Greg so I
should be in Cc.

--=20
balbi

--5VuzLDXibKSJvVYD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPugpKAAoJEIaOsuA1yqREYMkP/21EP0eGV7eeCMlqicWK2NGJ
Df5Hj91zhATF9SqUgmcZX1hnnMZxekEsSCvQSYfWteOnU/OIguFeH8eEDefHwqw3
jwX9GmLSjDtg9Ey/KyW58X/1REO8JuvrTMJnl4tWonaMP+j2JlBdeE/CKmwgIMt1
QqmtqdJ/JQ8ohuTf8rHbFQeNwgYlrpcywCH5tSUijBHzVhQSrXtiD/rC8+kl7/Qa
GG57QqjSbprKP6tEUJx7F8DMbO2WGlyrX+Kp6n1Ei09nwumj+xOC3LvVwhNVrMp7
qXYcseO8p3DRIWT+2tkJXHUQ5Jk586l5T+f9cazY7O34+ffskWiaubDj0fsfPtXi
77nZp+2iLvubxCy4AcTONbuzD7jHEW/nKVa64llmD3Zb37nOpHytms3C8VMHlea6
XQAxtcy3dgK7dRpB++poipee0dbRrRlSYBckwjRHHg0RgiVTATUPSlux9ObLfcqx
bY/rzB3KK2TyMLZqd/khDJwaIIRor3iJYBBbmhRzPWA8X3TTepfTscXIpcRCQij/
oMmeJkk9OinDPyn4nxjfhavqAdyx6F7xKvYfeQiN/0M3K2ksGtur4qhKuzyO8PLv
IX2hyVAUNNC2Ge0GOohaI4FQF7YnDCD7fH+U5kUXZLXl5UTcr/Ysoccfz7Kutf+t
rkhAG6S5nLEqCTSHpeq1
=IBSP
-----END PGP SIGNATURE-----

--5VuzLDXibKSJvVYD--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
