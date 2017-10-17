From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/9] drm/panel: simple: simplify display_mode definitions
 by using macro
Date: Tue, 17 Oct 2017 14:09:37 +0200
Message-ID: <20171017120937.GC684@ulmo>
References: <1507721021-28174-1-git-send-email-LW@KARO-electronics.de>
 <1507721021-28174-3-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="R+My9LyyhiUvIEro"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1507721021-28174-3-git-send-email-LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lothar =?utf-8?Q?Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--R+My9LyyhiUvIEro
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2017 at 01:23:34PM +0200, Lothar Wa=C3=9Fmann wrote:
> Use the newly defined macro to generate the display_mode data entries
> for all panels. This reduces the code size significantly and makes the
> code more readable.
>=20
> Signed-off-by: Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 799 ++++++-----------------------=
------
>  1 file changed, 134 insertions(+), 665 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel=
/panel-simple.c
> index dec639d..fde9c41 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -89,6 +89,20 @@ struct panel_simple {
>  	struct gpio_desc *enable_gpio;
>  };
> =20
> +#define SP_DISPLAY_MODE(freq, ha, hfp, hs, hbp, va, vfp, vs, vbp, vr, fl=
gs) { \
> +	.clock =3D freq,							\
> +	.hdisplay =3D ha,							\
> +	.hsync_start =3D (ha) + (hfp),					\
> +	.hsync_end =3D (ha) + (hfp) + (hs),				\
> +	.htotal =3D (ha) + (hfp) + (hs) + (hbp),				\
> +	.vdisplay =3D (va),						\
> +	.vsync_start =3D (va) + (vfp),					\
> +	.vsync_end =3D (va) + (vfp) + (vs),				\
> +	.vtotal =3D (va) + (vfp) + (vs) + (vbp),				\
> +	.vrefresh =3D vr,							\
> +	.flags =3D flgs,							\
> +}
> +
>  static inline struct panel_simple *to_panel_simple(struct drm_panel *pan=
el)
>  {
>  	return container_of(panel, struct panel_simple, base);
[...]
> @@ -411,33 +415,9 @@ static const struct panel_desc ampire_am_480272h3tmq=
w_t01h =3D {
>  	.bus_format =3D MEDIA_BUS_FMT_RGB888_1X24,
>  };
> =20
> -#define SP_DISPLAY_MODE(freq, ha, hfp, hs, hbp, va, vfp, vs, vbp, vr, fl=
gs) { \
> -	.clock =3D freq,							\
> -	.hdisplay =3D ha,							\
> -	.hsync_start =3D (ha) + (hfp),					\
> -	.hsync_end =3D (ha) + (hfp) + (hs),				\
> -	.htotal =3D (ha) + (hfp) + (hs) + (hbp),				\
> -	.vdisplay =3D (va),						\
> -	.vsync_start =3D (va) + (vfp),					\
> -	.vsync_end =3D (va) + (vfp) + (vs),				\
> -	.vtotal =3D (va) + (vfp) + (vs) + (vbp),				\
> -	.vrefresh =3D vr,							\
> -	.flags =3D flgs,							\
> -	}

Your first patch should put this in the right place to begin with so
that this patch is really just the conversion.

Again, I don't think this macro actually improves the way modes are
defined.

Thierry

--R+My9LyyhiUvIEro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnl8wEACgkQ3SOs138+
s6G05BAAmxDnDwL2sPRtyNmZX+ArActynntxHLLiNSstfXXb9Mf5LhpcwJ1x7+HF
K5jvHQgBRCS5RAk9w1ruKYGMGD/wkYHvkF8GJPm+kQlVn5oPf+dCWtyUmpO85ZZ+
Bnb+Kq9c3FkFJ2BdCjBJ2hOtf6tdOuEj9lMtXDjqYV244Ijl45tURd//nJfOBIH4
9HG9RDDAcfSRr7Fbs5PrYwMF+es3TNQH26qWSY9TGDlJYLlyk29viFK6uzt4rRbZ
Aiw4l2FaUCpAxFY2FjA8a66GfXKn4IqZBX7UNdCAuoMsZma5jV0yQ1bXqPY7qgoJ
P3pL/DLOVt6+slJFvScyYROsc+E7FmOtZ7oXvH+Alr/tsBPGEMvDCNM83ZwM3xFN
rQvNl/GrLBiJqTj7jRiWk9YUp71QcbuMD7hKWA3uKnVXyFNVxJKrEM7sHbMpz79m
1uhIoJEnpSjEAWmuxy06FWnyEk71QR9b/qfRKPzrl6X5F/0nKm1MSmy9fah00Tm3
6i5xd/2bhYbKvwcMb5KcP2Nd42op3QY6UvZqdnIuXeY3u1s2sWTL7efDxf4DCqpp
eOHAlK7Bl2xmboh/Ea5y+C1Zieuwjn7Svn1P3tEgMEAcOPxJPbpZl/71BCa4Lqw/
ToFzkmuwH/2R9e4ecWVQ93avSN2PObBXPtGhsEkVcGravlqL83I=
=Xtil
-----END PGP SIGNATURE-----

--R+My9LyyhiUvIEro--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
