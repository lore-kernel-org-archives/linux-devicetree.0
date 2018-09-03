From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 10/27] drm/sun4i: Add compatible for H6 display engine
Date: Mon, 3 Sep 2018 14:18:45 +0200
Message-ID: <20180903121845.znqhufx24ihcpmkn@flea>
References: <20180902072643.4917-1-jernej.skrabec@siol.net>
 <20180902072643.4917-11-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1325164617=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180902072643.4917-11-jernej.skrabec@siol.net>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, airlied@linux.ie, wens@csie.org, robh+dt@kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1325164617==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="77ysc5vzzbqkmyxl"
Content-Disposition: inline


--77ysc5vzzbqkmyxl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

hi,

On Sun, Sep 02, 2018 at 09:26:26AM +0200, Jernej Skrabec wrote:
> H6 is first Allwinner SoC which supports 10 bit colors, HDR and AFBC.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/gpu/drm/sun4i/sun4i_drv.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/su=
n4i_drv.c
> index dd19d674055c..e5731d092e1a 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_drv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
> @@ -410,6 +410,7 @@ static int sun4i_drv_remove(struct platform_device *p=
dev)
> =20
>  static const struct of_device_id sun4i_drv_of_table[] =3D {
>  	{ .compatible =3D "allwinner,sun4i-a10-display-engine" },
> +	{ .compatible =3D "allwinner,sun50i-h6-display-engine" },
>  	{ .compatible =3D "allwinner,sun5i-a10s-display-engine" },
>  	{ .compatible =3D "allwinner,sun5i-a13-display-engine" },
>  	{ .compatible =3D "allwinner,sun6i-a31-display-engine" },

While it makes sens from an alphabetical point of view, we usually
follow the number order here (so after sun9i).

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--77ysc5vzzbqkmyxl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAluNJqQACgkQ0rTAlCFN
r3TU3g/7BeCLrG4kOHLUDVaR380EbyM6CDNX1B8+Dbpq53AyM+um4m0GRb6bAaIo
V2USXEkIu+NBPjpOEvPTsm2SkApe7ghTLBGnypaw+QCZTDbBnK8vIpwxO22Jt9Uw
WNBAEne8Rx6O9MPUkuzZHrPch6VAWceB/FBAIgMATtYSskLKQP+WjwN8LFQHLxWd
qjRA+K2msn4PVbBmzmmBgKnnV/5wlGDjNpBgcv7MvwxXBLdbW99U54604A9JZKRh
KFf7ZF2wuBbXUM1jkLVuFYPLsxJXFB8AnVLRutBYa7uwlwPL1/n8/RcIRHzc9Cb0
M/vi3wq5NLWxuzs7SFUIGkgBHDcLtBaRDOknfci2c8cDj+kisbfzvpkL4ZiVN9if
FjIIZaOkB2xAdr7Eqau7MO3P9SnQgBPzG2eu8F1NgFlZi1+l1jEuDSUdqni3txAP
6u0MEmq6S0g027ffWy8M0tw9fIJWT3bPnWKJCzX0b2KQ/1wJqVnkBu0L6Jl0hSOc
zw7WSgUvzt0h72PYotCXmC9nEK4hlmJ+rJb+yfB5sSqrFRSJ3hTIDFbnYg+aste+
Rv9OboR8gPWAM5hH1+vovz3DG9X8qkLIXTiGGvNXQY4n0K5qCRJhvqCkWgHh+YtH
rBSMeAo4bqj5Os3BQSVALbWVxPQO8fYCNuqaHqhRAF7eCTlyfME=
=WKT1
-----END PGP SIGNATURE-----

--77ysc5vzzbqkmyxl--

--===============1325164617==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1325164617==--
