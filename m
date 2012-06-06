From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 01/12] usb: otg: add notify_connect/notify_disconnect
 callback
Date: Wed, 6 Jun 2012 11:49:55 +0300
Message-ID: <20120606084954.GA15368@arwen.pp.htv.fi>
References: <1337912665-16615-1-git-send-email-richard.zhao@freescale.com>
 <1337912665-16615-2-git-send-email-richard.zhao@freescale.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1337912665-16615-2-git-send-email-richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, May 25, 2012 at 10:24:14AM +0800, Richard Zhao wrote:
> This let usb phy driver has a chance to change hw settings when connect
> status change.
>=20
> Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Acked-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>

> ---
>  include/linux/usb/otg.h |   21 +++++++++++++++++++++
>  1 files changed, 21 insertions(+), 0 deletions(-)
>=20
> diff --git a/include/linux/usb/otg.h b/include/linux/usb/otg.h
> index 38ab3f4..6dfdc8d 100644
> --- a/include/linux/usb/otg.h
> +++ b/include/linux/usb/otg.h
> @@ -117,6 +117,9 @@ struct usb_phy {
>  	int	(*set_suspend)(struct usb_phy *x,
>  				int suspend);
> =20
> +	/* notify phy connect status change */
> +	int	(*notify_connect)(struct usb_phy *x, int port);
> +	int	(*notify_disconnect)(struct usb_phy *x, int port);
>  };
> =20
> =20
> @@ -252,6 +255,24 @@ usb_phy_set_suspend(struct usb_phy *x, int suspend)
>  }
> =20
>  static inline int
> +usb_phy_notify_connect(struct usb_phy *x, int port)
> +{
> +	if (x->notify_connect)
> +		return x->notify_connect(x, port);
> +	else
> +		return 0;
> +}
> +
> +static inline int
> +usb_phy_notify_disconnect(struct usb_phy *x, int port)
> +{
> +	if (x->notify_disconnect)
> +		return x->notify_disconnect(x, port);
> +	else
> +		return 0;
> +}
> +
> +static inline int
>  otg_start_srp(struct usb_otg *otg)
>  {
>  	if (otg && otg->start_srp)
> --=20
> 1.7.5.4
>=20
>=20

--=20
balbi

--wac7ysb48OaltWcw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPzxmyAAoJEIaOsuA1yqREsGsQALB8BtEH43WtN72L2gt/i9N6
Yt4X1VRfJDCZfVD/7BnwCM2IAZnDuF40x4kGWhG2dmeIUwkpUoLIdHUVSBH7ul0a
nGQwpFkD0Z1VGInfM2HvG4uuKHh1AXW/77j2anVAScliWA3etfDXAacEJCt8OQF0
idT8kmznqvlXTTy6IJG8/P5BySK4GOfne48Na3iGDJq1l1jvW5/nzlhkSY+jf4AP
baWX2a+HyV6fnKQRuL6Fn9ApIkLh/0Pz6+Ah8ZtbAXG0SLz+0Nie3blqzodwbxW/
dkz9wXCZ0oIXdE1bU/Vaq1c/6giwr9AU1Z9tOqwJTziFHcPvZw45MczrIVqOubjH
ez6bX9PvDXQni0jO8+uGfUGEoyuBSwI95GWpjPxgRvAxJCeNfoE0n0YZ1pf1wcan
4ylBNYgghJJCgHXwBa0yO/rMziWyeqKurEXHOe9y6fldM35zFrQa3blMn/5MlGFv
Viqfb/aTG7sU//5MGRp492n4fSSdh7229vqcvTEhMjJh1sfPJLGZIi443T/9ZA/l
JP7BJiDbUjIiZla6ZybvLKXz+SVYHgdfaYclxo1F4NNhp1TdkikBobj9r6z3UjL8
1J49ABEMeBZKZmgTMuFYjabuinFFGPrTT0TZFdsQQpJlnaV7CwZrASfk5reu/fgK
Nc88ZaPckmUAcp8gJH/n
=ucUA
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
