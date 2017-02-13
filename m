From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 5/8] drm/sun4i: Add encoder type argument to
 sun4i_tcon0_mode_set
Date: Mon, 13 Feb 2017 09:32:32 +0100
Message-ID: <20170213083232.rfezcsr6tcbz7hiw@lukather>
References: <20170211174405.28395-1-plaes@plaes.org>
 <20170211174405.28395-6-plaes@plaes.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0327011421=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170211174405.28395-6-plaes@plaes.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Priit Laes <plaes@plaes.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jonathan Liu <net147@gmail.com>, Quentin Schulz <quentin.schulz@free-electrons.com>, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0327011421==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="43pg3bohg6cbgjxb"
Content-Disposition: inline


--43pg3bohg6cbgjxb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 11, 2017 at 07:44:02PM +0200, Priit Laes wrote:
> Depending on the output type, we have to enable/disable some
> bits conditionally.
>=20
> Signed-off-by: Priit Laes <plaes@plaes.org>
> ---
>  drivers/gpu/drm/sun4i/sun4i_rgb.c  | 2 +-
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 3 ++-
>  drivers/gpu/drm/sun4i/sun4i_tcon.h | 3 ++-
>  3 files changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_rgb.c b/drivers/gpu/drm/sun4i/su=
n4i_rgb.c
> index f5e86fe..3d4eb05 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_rgb.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_rgb.c
> @@ -179,7 +179,7 @@ static void sun4i_rgb_encoder_mode_set(struct drm_enc=
oder *encoder,
>  	struct sun4i_drv *drv =3D rgb->drv;
>  	struct sun4i_tcon *tcon =3D drv->tcon;
> =20
> -	sun4i_tcon0_mode_set(tcon, mode);
> +	sun4i_tcon0_mode_set(tcon, mode, DRM_MODE_ENCODER_DAC);

This is not the proper encoder type. You can just use encoder_type in
drm_encoder.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--43pg3bohg6cbgjxb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYoW8cAAoJEBx+YmzsjxAgLboP/3TWQMBjwpapIx61Cg/cFui/
mgXP4ngkWY5TORfxXWFxMA23XdggmSV3bbKnYxrekExyJ/GxSaIGqVRpdnV7N8o7
iTLxoqQT0O22Q17rqA9y0b4v6HK4ur9JNL3DKtdlpUpSaHLmy31zHQF04zYUfzdE
8cJMvH4N1xm4EuhUZEfQvAW9gdrQxio1bDLqiCmweAK6LWPQrlsjfdJOmJWTXA21
38vZIB3DoKEQ4TYIjhkQ6EC4k5tr3FH1UWlXtrDGlzGJPagl6dNl0q3IVG9yyg53
sBBwF+5Qnxt7F5lXJz4Jg72e1SJ+GfNqWRJAaA7jGLHaGQcxhnJUJ9Af56UoKMXw
c5Bf0AopHnM5NtmZAHGR983iu50cAbR4vNTz77kBHXGaAaHSIgfuaTWYbaModzM1
JMrtYcw5lIdzHB3kniYMSOTMMRksD1T6K0/BlJT/I4FX4fABJgf4+DHDL0pt8jdw
JEwYvWWD0zeY/CnCyvHHFsF8gOrnP8LqKJoCcep1lurs43993Fp3+u7mhZzex5wX
Pl4RlRt3xMHWJN9GmBmDjVnVp0jrWC3QH6FLG1l3UqZj4e3ME49nJ2ewnnPx5WTt
TlP0L2L9Fj35CdbRu9uapUpV4f2RgxVhEzH8PQ8eVKM5ovZU4INl/ox74M7G1wPY
+Vn6jOEqvQnRmApMvhdI
=uimh
-----END PGP SIGNATURE-----

--43pg3bohg6cbgjxb--

--===============0327011421==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0327011421==--
