From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/7] reset: sunxi: allow MFD subdevices probe
Date: Wed, 7 May 2014 22:07:22 -0500
Message-ID: <20140508030722.GL7047@lukather>
References: <1399483554-8824-1-git-send-email-boris.brezillon@free-electrons.com>
 <1399483554-8824-3-git-send-email-boris.brezillon@free-electrons.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QWRRbczYj8mXuejp"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBNXMVONQKGQEDOCC3YI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1399483554-8824-3-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Emilio =?iso-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--QWRRbczYj8mXuejp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2014 at 07:25:49PM +0200, Boris BREZILLON wrote:
> The current implementation uses sunxi_reset_init function for both early
> init and platform device probe.
>=20
> The sunxi_reset_init function uses DT to retrieve device resources, which
> will be an issue if reset controllers are registered from an MFD device
> that define resources from mfd_cell definition.
>=20
> Moreover, we can make of devm functions when we're in the probe context.
>=20
> Signed-off-by: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/reset/reset-sunxi.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/reset/reset-sunxi.c b/drivers/reset/reset-sunxi.c
> index 695bd34..1b5fea6 100644
> --- a/drivers/reset/reset-sunxi.c
> +++ b/drivers/reset/reset-sunxi.c
> @@ -145,7 +145,24 @@ MODULE_DEVICE_TABLE(of, sunxi_reset_dt_ids);
> =20
>  static int sunxi_reset_probe(struct platform_device *pdev)
>  {
> -	return sunxi_reset_init(pdev->dev.of_node);
> +	struct sunxi_reset_data *data;
> +	struct resource *res;
> +
> +	data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	data->membase =3D devm_request_and_ioremap(&pdev->dev, res);
> +	if (!data->membase)
> +		return -ENOMEM;

You'd probably be better off using devm_ioremap_resource so that you
get a meaningful error code.

Apart from this, you have my=20
Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--QWRRbczYj8mXuejp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTavTqAAoJEBx+YmzsjxAgzTEP/RU9zAdEFYEx9f+7qySP4SB9
8493dsLMtY0Q5TaaM747moqmTCyDz3ewKZLsI4NTgRki9x2lUVuFG7IQETarJmJz
fyIWy6lkF4lypKRd6G57xHg7/uax/COC/yP6Znzm7fgfaahf6Lpcvpi7/W9ZNhjJ
xTQ2oerF/k+fCwcNowhOpUfEeyZv1eGFQjHpJCzfpH2i2hjo26Yxjs2uelCOi7sn
7hKdyvVpArEGLm7q7DWawDCNZXe7kbqpH7fM98OQOEmY+dme9r26jT4uDmHUVziO
jzxtJcBdng86SlHLNRs+v2DTnseatvStoh9sxZNGoEreKszqjXHwCqnM0N7g0jQj
U9SS0BdVrx6scX1YCTWuUpKEMrKYr/wliKbZhRwfuwsF9D1AsI3ztcUecYBOiQvO
19fur2OJ9/t5AEkmcga6mo2tbvNBapBb2P8FgKH8XJVOVkyeUc5uJrlDZahChlhM
IPIEOYx5oRHng1FrUc6KW3cH0Qdr6egNVEZdU02E+k1Z8OYqSt66DNZmWuVrxD9N
+DO+hi4WTg2SlE4ibSSe9aX5gMn/T6GhPfTgcJbdmXkvxZazT7REGq4QyoWJq68v
1QIeISrcCpJYnyDGnUUfe5teWlDHDZTHVrwKYm4yxofiuBWiXfkJSXiWZB2X2cXw
xoGKUqsbpza4wgHxo6UH
=m5ST
-----END PGP SIGNATURE-----

--QWRRbczYj8mXuejp--
