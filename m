From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 3/5] media: uapi: Add RGB bus formats for the
 GiantPlus GPM940B0 panel
Date: Wed, 3 Apr 2019 18:32:59 +0200
Message-ID: <20190403163259.GS5238@ulmo>
References: <20190314122622.7597-1-paul@crapouillou.net>
 <20190314122622.7597-3-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="D+M1YvVlDncl3vD5"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190314122622.7597-3-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>, od@zcrc.me, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--D+M1YvVlDncl3vD5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 14, 2019 at 01:26:20PM +0100, Paul Cercueil wrote:
> The GiantPlus GPM940B0 is a 24-bit TFT panel where the RGB components
> are transferred sequentially on a 8-bit bus.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>=20
> Notes:
>     v2: New patch
>=20
>  include/uapi/linux/media-bus-format.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Please make sure you Cc the media maintainers on this one when you send
the next version. Adding them now.

>=20
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/m=
edia-bus-format.h
> index d6a5a3bfe6c4..f31724d6cd40 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -34,7 +34,7 @@
> =20
>  #define MEDIA_BUS_FMT_FIXED			0x0001
> =20
> -/* RGB - next is	0x101b */
> +/* RGB - next is	0x101d */
>  #define MEDIA_BUS_FMT_RGB444_1X12		0x1016
>  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
>  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
> @@ -54,6 +54,8 @@
>  #define MEDIA_BUS_FMT_RGB888_1X24		0x100a
>  #define MEDIA_BUS_FMT_RGB888_2X12_BE		0x100b
>  #define MEDIA_BUS_FMT_RGB888_2X12_LE		0x100c
> +#define MEDIA_BUS_FMT_RGB888_3X8_BE		0x101b
> +#define MEDIA_BUS_FMT_RGB888_3X8_LE		0x101c

The list looks roughly sorted, but these are not. That said, there are
others that don't seem like they are sorted either. All the more
important to get feedback from the media maintainers.

Thierry

--D+M1YvVlDncl3vD5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyk4DoACgkQ3SOs138+
s6HScg/9GyEDoCdxMtlPqDRYKP5xRAlt0XNtZfHL5ibuM/8vU6LU6b5JqAZIpi4a
vJSzJitF9SE7vm7nBcmjZlKvxrOL9AusPveEVlmxuXniokaG5l+H5Tj2so7ut3hc
ogYvh5Ofi9IgaI/PDkkfkqHdKABo+khmgorlMALjAhEyUC+315D4LU/bcoxpycgz
gZNjhlzSeTgG7VIbbnl8lyoMgVJvwktahzO2RDkV4gDmLeJXmQY7Tq8ADE6RWKls
xejx/kyRwdvPl87nESKw5qbtHY0Z4cAwnH9j/MDsYPtvFKCei9fJj+7/5nByGtuV
O9cdE7aKo26mzLOOEH7vc8+bMBYllIgBILmDyGC/KCbXN4ATWABX7Wg8g7oM+xaS
n8vfaRG627LIOYRNq3XTRutW17mFyjze8D1e1RHNIVEUrX0OtDA4g2hIQn2lm7o2
zb/FfV7AH24L7n4z9i/uy5GOrAZseztoThqUt2MnRhVr2BXY5mt4caV3LEHMDdBJ
qR7BpJbn2gZ3b+IITh8468TdowwMhEDoGEALIv8FeaKXePyKdPmDF03fSueMOfj4
4PFN4yHOADhz5XdP2tG+Lnl0vIOxImAf4bBOzYRXXpu19j1WfgAYNgLXI+RExKuJ
sHnXe+Jm2Jtj417ICallpwjt/YVaBvM3ONvsTgi3uNmPYq1zOWk=
=yjYj
-----END PGP SIGNATURE-----

--D+M1YvVlDncl3vD5--
