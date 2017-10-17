From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/9] drm/panel: simple: add a macro for defining display
 modes in a simpler and less error prone way
Date: Tue, 17 Oct 2017 14:08:18 +0200
Message-ID: <20171017120818.GB684@ulmo>
References: <1507721021-28174-1-git-send-email-LW@KARO-electronics.de>
 <1507721021-28174-2-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZfOjI3PrQbgiZnxM"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1507721021-28174-2-git-send-email-LW@KARO-electronics.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lothar =?utf-8?Q?Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Cc: David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--ZfOjI3PrQbgiZnxM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2017 at 01:23:33PM +0200, Lothar Wa=C3=9Fmann wrote:
> Create a macro that eases the definition of display mode parameters by
> accecpting the parameters:
> freq, hactive, hfront-porch, hsynclen, hback-porch,
> vactive, vfront-porch, vsynclen, vback-porch, vrefresh
> that can be usually directly taken from an LCD datasheet.
>=20
> Put the calculations that are now open coded repeating the same
> parameters multiple times into the macro expansion.
>=20
> Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel=
/panel-simple.c
> index 474fa75..dec639d 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -411,6 +411,20 @@ static const struct panel_desc ampire_am_480272h3tmq=
w_t01h =3D {
>  	.bus_format =3D MEDIA_BUS_FMT_RGB888_1X24,
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
> +	}

I don't think this simplifies anything. It's now completely non-obvious
which parameter is which, so you actually have to go look at the macro
definition when you add a new mode to make sure you get them right.

Thierry

--ZfOjI3PrQbgiZnxM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnl8q8ACgkQ3SOs138+
s6HA5Q//QAVtmUpLtYQa5t3Uu144p0lmBs6jcBF/mh3DZkm41waBjaXbxENr6CL5
KnFFICvAYUSab3tpzBd1vIJtc5UzF2WJL6FftP6aWX6D1gTk5g6KL0XhJiaf8qQ9
OD8c4qRnAAFIb18NHgkF0aNrYyp5rICwtavV6XR3VGEvqxqaFYTwFP/WiS2YEBWc
92ay7LkY/AzSBWw/tFkHdkBYTm2OU/w9ZVncU9LddoMajOW745Ne2VHhx5BZoPlv
Nr+5UABePW6AoWqdEnqHZvt5kI9vyvR4fynZtsc/LyGQbldmoeiWj1PbsS73iUfO
kfgKUmVGH6o9AQyEX2rHOAdRJlrmIlI8wAbWJNChPIBowuTNMtvRx9XutCg2eo+v
Oa10ntbkDPZ16n8X8KyN5zU94H4EdHYO3BrSrK/byKBpD9g3iR2A2A57YtR3Hvzt
D5HEnCU9igGG0M70S/IchfgjKsZaxxour9GEgrLLQyHqlqxOgx2LcoG2mJt5xY8y
PCzE/wxjFRjRhc53HFYfYl37iYs1Z1uvSFBWx+ucyBTsGgkodE7ljhOJkEntvaPC
ky07MEM6O6aUyCytDRmg6q4BKE37N55omBg3Fp4qsSb7k17kGKPae3OGKksK4Z9y
LL1V0cyW87C09wVDub1Je34fEjPLfo1W44HKqjoz4lLB4WacPVM=
=L4hy
-----END PGP SIGNATURE-----

--ZfOjI3PrQbgiZnxM--
