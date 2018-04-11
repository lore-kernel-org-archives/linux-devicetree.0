From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 1/3] drm/panel: Add RGB666 variant of Innolux AT070TN92
Date: Wed, 11 Apr 2018 08:28:35 +0200
Message-ID: <20180411062835.oqzd34e2szrnv34b@flea>
References: <20180410213129.24049-1-contact@paulk.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1444589583=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180410213129.24049-1-contact@paulk.fr>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Paul Kocialkowski <contact@paulk.fr>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>, linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1444589583==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7tqqpg34pqzskzur"
Content-Disposition: inline


--7tqqpg34pqzskzur
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 10, 2018 at 11:31:27PM +0200, Paul Kocialkowski wrote:
> This adds timings for the RGB666 variant of the Innolux AT070TN92 panel,
> as found on the Ainol AW1 tablet.
>=20
> Signed-off-by: Paul Kocialkowski <contact@paulk.fr>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel=
/panel-simple.c
> index 5591984a392b..efeb2f2162bc 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1063,6 +1063,29 @@ static const struct panel_desc innolux_at070tn92 =
=3D {
>  	.bus_format =3D MEDIA_BUS_FMT_RGB888_1X24,
>  };
> =20
> +static const struct drm_display_mode innolux_at070tn92_rgb666_mode =3D {
> +	.clock =3D 40000,
> +	.hdisplay =3D 800,
> +	.hsync_start =3D 800 + 112,
> +	.hsync_end =3D 800 + 112 + 1,
> +	.htotal =3D 800 + 112 + 1 + 87,
> +	.vdisplay =3D 480,
> +	.vsync_start =3D 480 + 141,
> +	.vsync_end =3D 480 + 141 + 1,
> +	.vtotal =3D 480 + 141 + 1 + 38,
> +	.vrefresh =3D 60,
> +};

I'm not sure why you'd need different timings if the only difference
is the bus width.

> +static const struct panel_desc innolux_at070tn92_rgb666 =3D {
> +	.modes =3D &innolux_at070tn92_rgb666_mode,
> +	.num_modes =3D 1,
> +	.size =3D {
> +		.width =3D 154,
> +		.height =3D 86,
> +	},
> +	.bus_format =3D MEDIA_BUS_FMT_RGB666_1X18,
> +};
> +
>  static const struct display_timing innolux_g101ice_l01_timing =3D {
>  	.pixelclock =3D { 60400000, 71100000, 74700000 },
>  	.hactive =3D { 1280, 1280, 1280 },
> @@ -2105,6 +2128,9 @@ static const struct of_device_id platform_of_match[=
] =3D {
>  	}, {
>  		.compatible =3D "innolux,at070tn92",
>  		.data =3D &innolux_at070tn92,
> +	}, {
> +		.compatible =3D "innolux,at070tn92-rgb666",
> +		.data =3D &innolux_at070tn92_rgb666,

And this isn't a different device, it's just the integration in the
board that is different, so you shouldn't have a different compatible
here, but rather something like the bus-width property documented in
the Documentation/devicetree/bindings/media/video-interfaces.txt file.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--7tqqpg34pqzskzur
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlrNqwUACgkQ0rTAlCFN
r3QQWQ/+NWa87cWJjJ2jsBdu8HcxgKwidvfuf9dQIu9bLYU0Jd3y7BTcqbbR4XHP
axE+EeI6M3V6q5VoTEJ2hlDKK8m2mLzFY7wIiDmYKICN1LQOI3S5xZGU8r5bDdUx
2byxBqtxVV0droDsi8ZEmWCmiKFLUh+fXpjAqQIQN75hosuFv2DpfFysoLw+9hD+
YUIhI7MQA2OfLg1fcfmXvsfU3Y/KXlw1gR/xRyQv7rBp/PEs0DqmPd+g6UMBHcgP
FOgm4B3qPL32tBWraYNW2VASz8j55ZpVCqNHtfxeqkjC3Rcg9B6LlUeqmhonJ9jx
QGKcojZrLkzhbQgb8NfuPEFuZD58twQr6aXfE1L06k1rbMxB1rrK6zU+Vozao2iX
3yotoFmL0fOu0mo97nXtfj4x4STVUplex9kuWAd8v3qTwtlnFyXxbaUharE6iC53
OS12+LYk5BQa7e+XU4Fhagqd6KDYnVomDMVE1VSB/rtBGZDWMOYv4F2x6v1u55Yu
uX2JcYD5LlH0pOLldc8hKpVeAA6FsZ9aS7jFywCbDf30QQk5kTQpY5qqb7fRP3OB
ZgUaQ6f6tYRdpGnUKKVMImEuYjIJ6U+I5LUsKJBrsuxl69wkeisxxOztIlfayZKv
cKKzq5DaIDjtpsa7pG3YbQanq1wH4JWTlTznm+ukGPFoDXhP9bY=
=3vBz
-----END PGP SIGNATURE-----

--7tqqpg34pqzskzur--

--===============1444589583==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1444589583==--
