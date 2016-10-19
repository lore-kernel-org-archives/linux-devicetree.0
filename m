From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 2/2] drm/panel: simple: add support for Sharp
 LQ150X1LG11 panels
Date: Wed, 19 Oct 2016 14:31:53 +0200
Message-ID: <20161019123153.GB16158@ulmo.ba.sec>
References: <1475594961-5713-1-git-send-email-peda@axentia.se>
 <1475594961-5713-3-git-send-email-peda@axentia.se>
 <20161019122750.GA16158@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0699374986=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20161019122750.GA16158@ulmo.ba.sec>
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


--===============0699374986==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uZ3hkaAS1mZxFaxD"
Content-Disposition: inline


--uZ3hkaAS1mZxFaxD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 19, 2016 at 02:27:50PM +0200, Thierry Reding wrote:
> On Tue, Oct 04, 2016 at 05:29:21PM +0200, Peter Rosin wrote:
> > From: Gustaf Lindstr=C3=B6m <gl@axentia.se>
> >=20
> > The Sharp 15" LQ150X1LG11 panel is an XGA TFT LCD panel.
> >=20
> > The simple-panel driver is used to get support for essential
> > functionality of the panel.
> >=20
> > Signed-off-by: Gustaf Lindstr=C3=B6m <gl@axentia.se>
> > Signed-off-by: Peter Rosin <peda@axentia.se>
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/pan=
el/panel-simple.c
> > index 85143d1b9b31..58cfe0a7a9d6 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -1386,6 +1386,30 @@ static const struct panel_desc sharp_lq123p1jx31=
 =3D {
> >  	},
> >  };
> > =20
> > +static const struct drm_display_mode sharp_lq150x1lg11_mode =3D {
> > +	.clock =3D 71100,
> > +	.hdisplay =3D 1024,
> > +	.hsync_start =3D 1024 + 168,
> > +	.hsync_end =3D 1024 + 168 + 64,
> > +	.htotal =3D 1024 + 168 + 64 + 88,
> > +	.vdisplay =3D 768,
> > +	.vsync_start =3D 768 + 37,
> > +	.vsync_end =3D 768 + 37 + 2,
> > +	.vtotal =3D 768 + 37 + 2 + 8,
> > +	.vrefresh =3D 60,
> > +};
> > +
> > +static const struct panel_desc sharp_lq150x1lg11 =3D {
> > +	.modes =3D &sharp_lq150x1lg11_mode,
> > +	.num_modes =3D 1,
> > +	.bpc =3D 8,
> > +	.size =3D {
> > +		.width =3D 304,
> > +		.height =3D 228,
> > +	},
> > +	.bus_format =3D MEDIA_BUS_FMT_RGB565_1X16,
>=20
> This doesn't match the .bpc =3D 8 above. You'd usually use a .bpc =3D 6 f=
or
> RGB565 panels.

Are you actually using the .bpc field in your driver? If yes, can you
please test if things work correctly if you set it to 6? If it's unused
I'm leaning towards just applying this with .bpc set to 6 and hope for
the best (and fix it if somebody finds that it's broken).

So no need to resend, just let me know what you think.

Thierry

--uZ3hkaAS1mZxFaxD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYB2e4AAoJEN0jrNd/PrOhZxQP/iRypBV20G3r+f0U8qrePI7c
s9WUw7DsyLcaezYDO3IFlPW/u77TZ/JExjhRVAEEziFgzQJWZ5o/BibkYt0O3L09
9gnzbhyyJPxt6ri471FIOHiGMG+jcE194rP9gsljp+wiaJ6I9UppzIKbg674eIh7
yX4WmleJdgYjLA4wNJJY12NpfvFmmoGkC2jwNF3AWBpCS0nfuZu/pOJKjSbVnReB
KCH71oZ/3K04fQtTvg6U+tClW28DDVdSp2G72+CYGe2tmvGm8jXh2k77RH92vxof
yD18XRsh//ZYb1QNvQjxU7pNez7YFPC6E5UV+yqSYqt8pTp5I8gTXC9y9LW7k8Rg
Jzm+0SlZ27x6kiW0hlMxT4o2O9znUctGuhst6I3Dv7xWLPxTZ9a9XLUR/nW5Dl+i
jWG2MNbNBOaNn0Fu00lN+pgj6JPzfPzRvoOdp8fpfnf/agv3+lVxp0gCdwW/7RJ9
V3GjXoiJtnhmnnJ3uuotLxKQ4PqN8eehPgcG6irvTkKMcy2/tw5cLD9awHL3zJUS
7fUmoegfgOydcm/sQS6OuDiXBrkHzyXyKDXacPATZnZggZg8hU41Hi9QZsa8Dfhf
03FULBGwItXsDQEOCSbmkbH+0SqIfZsGC87TPAsuD3BfXj/4hhZ/VukYY5RUKmYF
sa1OdY8IjrDYJhjow1/3
=NHOa
-----END PGP SIGNATURE-----

--uZ3hkaAS1mZxFaxD--

--===============0699374986==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0699374986==--
