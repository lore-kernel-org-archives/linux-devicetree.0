From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 02/10] media: rc: sunxi: Add A31 compatible
Date: Mon, 27 May 2019 09:47:00 +0200
Message-ID: <20190527074700.rvhqua44ixudt52z@flea>
References: <20190526222536.10917-1-peron.clem@gmail.com>
 <20190526222536.10917-3-peron.clem@gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xx34rvresls3nexu"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB55LV3TQKGQESMLRMFA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190526222536.10917-3-peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--xx34rvresls3nexu
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, May 27, 2019 at 12:25:28AM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> Allwiner A31 has a different memory mapping so add the compatible
> we will need it later.
>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/media/rc/sunxi-cir.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
> index 307e44714ea0..29ac33b68596 100644
> --- a/drivers/media/rc/sunxi-cir.c
> +++ b/drivers/media/rc/sunxi-cir.c
> @@ -319,6 +319,7 @@ static int sunxi_ir_remove(struct platform_device *pd=
ev)
>  static const struct of_device_id sunxi_ir_match[] =3D {
>  	{ .compatible =3D "allwinner,sun4i-a10-ir", },
>  	{ .compatible =3D "allwinner,sun5i-a13-ir", },
> +	{ .compatible =3D "allwinner,sun6i-a31-ir", },

We should also move from reset_get_optional to the non optional
variant for the A31, and ignore it otherwise.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
To view this discussion on the web, visit https://groups.google.com/d/msgid=
/linux-sunxi/20190527074700.rvhqua44ixudt52z%40flea.
For more options, visit https://groups.google.com/d/optout.

--xx34rvresls3nexu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOuV9AAKCRDj7w1vZxhR
xYI4APwLA7XkEJEvZo163pjX8FYq/eehfm/B/XlHpRd4MGPiPAEA7XTUsahB0xGh
X93+OkLnWss/BMtLjZmj/mbzvyOITAo=
=oSdS
-----END PGP SIGNATURE-----

--xx34rvresls3nexu--
