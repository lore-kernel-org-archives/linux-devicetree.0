From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 2/2] drm/panel: simple: add support for Sharp
 LQ150X1LG11 panels
Date: Wed, 19 Oct 2016 14:27:50 +0200
Message-ID: <20161019122750.GA16158@ulmo.ba.sec>
References: <1475594961-5713-1-git-send-email-peda@axentia.se>
 <1475594961-5713-3-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1202732022=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1475594961-5713-3-git-send-email-peda@axentia.se>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Peter Rosin <peda@axentia.se>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Gustaf =?utf-8?Q?Lindstr=C3=B6m?= <gl@axentia.se>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org


--===============1202732022==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 04, 2016 at 05:29:21PM +0200, Peter Rosin wrote:
> From: Gustaf Lindstr=C3=B6m <gl@axentia.se>
>=20
> The Sharp 15" LQ150X1LG11 panel is an XGA TFT LCD panel.
>=20
> The simple-panel driver is used to get support for essential
> functionality of the panel.
>=20
> Signed-off-by: Gustaf Lindstr=C3=B6m <gl@axentia.se>
> Signed-off-by: Peter Rosin <peda@axentia.se>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel=
/panel-simple.c
> index 85143d1b9b31..58cfe0a7a9d6 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1386,6 +1386,30 @@ static const struct panel_desc sharp_lq123p1jx31 =
=3D {
>  	},
>  };
> =20
> +static const struct drm_display_mode sharp_lq150x1lg11_mode =3D {
> +	.clock =3D 71100,
> +	.hdisplay =3D 1024,
> +	.hsync_start =3D 1024 + 168,
> +	.hsync_end =3D 1024 + 168 + 64,
> +	.htotal =3D 1024 + 168 + 64 + 88,
> +	.vdisplay =3D 768,
> +	.vsync_start =3D 768 + 37,
> +	.vsync_end =3D 768 + 37 + 2,
> +	.vtotal =3D 768 + 37 + 2 + 8,
> +	.vrefresh =3D 60,
> +};
> +
> +static const struct panel_desc sharp_lq150x1lg11 =3D {
> +	.modes =3D &sharp_lq150x1lg11_mode,
> +	.num_modes =3D 1,
> +	.bpc =3D 8,
> +	.size =3D {
> +		.width =3D 304,
> +		.height =3D 228,
> +	},
> +	.bus_format =3D MEDIA_BUS_FMT_RGB565_1X16,

This doesn't match the .bpc =3D 8 above. You'd usually use a .bpc =3D 6 for
RGB565 panels.

Thierry

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYB2bEAAoJEN0jrNd/PrOhq4UP/jwE/avHjFZxs/IcNmBTDJz4
D4NR2vePWkekjBj5a35ggC+DIGEPtBD5xIKpbmZQ91/LVY2m/Vmk/ztcULSrwn5U
VgV1hzEMW4XO6lCMreglNSD4ukvQ5M/vUeCvkusyPKQUTeMdoeZfOItaqSGxJR+p
gyrUG89ruPuORkwgvHivZhx1fKY6gZfRgn26VxZwlFpYCA69KUxuAh5IR59e4Q0l
2qgcGbVn+FZLYiSR58Znt4jo2vnCIT2zji575htpzphTgVfpc/bNlJ+0l/MQQEcl
nj9oWQXoaombtDE53hVuWFq3a6StKvEqEwcPY+F9K4E18fYmdeHiSxAYxQk/9AjE
os8bKu8js/zriHKG66qKR1YwiEM3vlTqv3IiHL1pktgIf5adREmGykofSEpPjWvW
ahT5v/PEmrv5XU2HAlZnSTjjQ93E4SE8UL0zyUl+nPl1HmE+MsbufmKavr1/cWet
OnJ0p3OpRQUDYyJIsqTNT/xbdv2ZeIKRjRt0ESl3YyhzZzW/dRCfr0iOfaoXg13o
fj9G9IcQmM0kAX4D1sISO32kHIEiHZSlcD5fmG0iA3XhanJGxiQ7bXnQ4mCMAwyI
PVd/QmLRM3BpOCeARZYgEG1qUHofYkuXNwEpRLqD6ztBvtzkO5VOxjl31rEYgDty
qHZrPB6jgCvrvgznoFbq
=/g4O
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--

--===============1202732022==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1202732022==--
