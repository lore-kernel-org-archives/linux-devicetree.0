From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/5] phy: sun4i: add support for USB phy0
Date: Tue, 28 Oct 2014 22:47:56 +0100
Message-ID: <20141028214756.GF9255@lukather>
References: <cover.1414444953.git.rbyshko@gmail.com>
 <668c1b5541fc0175957573bd5f8d40dd2eaccae1.1414444953.git.rbyshko@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L2Brqb15TUChFOBK"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <668c1b5541fc0175957573bd5f8d40dd2eaccae1.1414444953.git.rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--L2Brqb15TUChFOBK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Roman,

Thanks for your patches

On Mon, Oct 27, 2014 at 10:43:01PM +0100, Roman Byshko wrote:
> The driver for sun4i USB phys currently supports
> only phy1 and phy2 which are used for USB host
> controllers. This patch adds support for USB phy0,
> which is used by the musb hdrc USB controller.

Like Andreas already pointed out, your signed-off-by is missing from
all your patches.

> ---
>  drivers/phy/phy-sun4i-usb.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/phy/phy-sun4i-usb.c b/drivers/phy/phy-sun4i-usb.c
> index 0baf5ef..a24728b 100644
> --- a/drivers/phy/phy-sun4i-usb.c
> +++ b/drivers/phy/phy-sun4i-usb.c
> @@ -157,6 +157,10 @@ static int sun4i_usb_phy_init(struct phy *_phy)
>  		return ret;
>  	}
> =20
> +	/* Regulation 45 ohms */
> +	if (phy->index =3D=3D 0)
> +		sun4i_usb_phy_write(phy, PHY_RES45_CAL_EN, 0x01, 1);

What is this code supposed to do?

Some define for this bit and/or a better comment would be nice.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--L2Brqb15TUChFOBK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUUA8MAAoJEBx+YmzsjxAgM0QP/2ZXa7TA8q6vNv1+wTapPFg0
2CD6nTL+KDzDceNqm3U58dH0qjNqOXxKcEgoaxDD69FE/HJn4F7y1JHDHMSrNJDd
B/26qHFA2UYqAEltVpVGQRhz5zolKZmpiQ2w4vADiA2z+UYVbkqu7oDKuaKu7otH
Wb/eedjYXWHf9+WTWA1K0sdbBUz605L7+i71AUQx5A8IiPzIb8hfLRW0gO6iJCr4
4QUHKGr102rQK3jJ7vcaFN+Wc3rxvP4+Ge3HLTB6v05j6e8jnqHG2NwNkwY8wbbp
ICKRoORFe7XubVsyOsNx74bJdS8fMGHP34Ia77oetXmPc75LuiIZ3UV3hbV8PmAG
4vrcKO3Dctdhgm+jlgc4YM6nbvR2lCCd3Y0lmFrv9WhcTjE+8qr0h6k2M5CURSRk
Zt9DDwbF4l1WytS0gwJkfRbNj7X1TPoIu6fuv6rvQiskQTlPcCFYy2DXtNLd8WLJ
vehqTYVozqxGPmUPxMLvp7Q4wfZ19Vs/IGD4S3mrkHuI7oJVsCJxb8M1HPG67sUT
QlzeA7/4DlPOAGDKObiquJwvipWVO+Zamq37C9iYnNXeXBpU8ZrNu1RLr7Bm5SDe
4ZxLmztQvqFSiomAXc2u3iDnhEMlW4/7PXrqXl8HDuyV0AgDiR07hzS14AsblRaV
MaxK2lL/MownZOuibJCV
=HpcL
-----END PGP SIGNATURE-----

--L2Brqb15TUChFOBK--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
