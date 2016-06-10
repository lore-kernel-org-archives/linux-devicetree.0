From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 2/6] drm/panel: simple: Add support for LG
 LP097QX1-SPA1 2048x1536 panel
Date: Fri, 10 Jun 2016 15:26:17 +0200
Message-ID: <20160610132617.GH27142@ulmo.ba.sec>
References: <1465386727-27647-1-git-send-email-ykk@rock-chips.com>
 <1465386753-27730-1-git-send-email-ykk@rock-chips.com>
 <CACvgo50T++tDB-kC4=ZMRpHPxOoqn_E8+=LVbj7n_HOUgeTaMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ewQ5hdP4CtoTt3oD"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACvgo50T++tDB-kC4=ZMRpHPxOoqn_E8+=LVbj7n_HOUgeTaMA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Yakir Yang <ykk@rock-chips.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, devicetree <devicetree@vger.kernel.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>
List-Id: devicetree@vger.kernel.org


--ewQ5hdP4CtoTt3oD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 08, 2016 at 01:20:22PM +0100, Emil Velikov wrote:
> Hi Yakir,
>=20
> On 8 June 2016 at 12:52, Yakir Yang <ykk@rock-chips.com> wrote:
> > The LG LP097QX1-SPA1 is an 9.7", 2048x1536 (QXGA) TFT-LCD panel
> > connected using eDP interfaces.
> >
> > Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> > ---
> > Changes in v2: None
> >
> >  drivers/gpu/drm/panel/panel-simple.c | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/pan=
el/panel-simple.c
> > index 3a7bdf1..41020e1 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -1040,6 +1040,28 @@ static const struct panel_desc lg_lp120up1 =3D {
> >         },
> >  };
> >
> > +static const struct drm_display_mode lg_lp097qx1_spa1_mode =3D {
> I believe that lg_lp097qx1_spa1 should be moved/sorted before lg_lp120up1.
>=20
> > +static const struct panel_desc lg_lp097qx1_spa1 =3D {
> > +       .modes =3D &lg_lp097qx1_spa1_mode,
> > +       .num_modes =3D 1,
> > +       .size =3D {
> > +               .width =3D 2048,
> > +               .height =3D 1536,
> These are the physical dimensions of the panel. From the documentation
> (at the top of the file)
>=20
> @width: width (in millimeters) of the panel's active display area
> ...
>=20
> Thierry, perhaps it's worth renaming 'size' it to
> "physical_{size,dimensions}" and/or alike to make it clearer ?

I like size because it's nice and short, and it's accurate. 2048x1536 is
a resolution, not a size. Like you said, it's already documented, and if
people looked at other descriptors they should realize that it's not the
same as the horizontal and vertical resolutions.

> Looks like we have a few cases were people got confused -
> innolux_zj070na_01p and samsung_ltn101nt05.

Yeah, well, I'm to blame for that, I should've reviewed more carefully.
Thanks for bringing that to my attention, I'll go fix those up.

Thierry

--ewQ5hdP4CtoTt3oD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXWr/5AAoJEN0jrNd/PrOhW/cQAKUYBHe+Y5AYB5ysyrxHxBgO
yfgp6Fjtv+wBW55zF5EDMG2Ex7Ww+87SEiKxeUkbbxTrBGgYxkf2BIQS1fo/QxoY
14zRB6oAT4aBjxrmwIxeA2PELT6NavdZ4KT4FfePiQG6HAFC5zXHy1/QPJeLElFx
N6voTEmD23Tp9yMHfzS6yxL12CN4P3M4oYpPuWuVbHerCyU4bowv3okWkZ0oXb9x
H8YVomcG+yMa/in0s5QJhftNUYlOQ2TSovT2MtLqv60zkbsnkYfR5WNwZJT9LWi4
kI9wOYeD2FSRklL4L9oWTWI4hrWDVWHmWvuwle93WphELcA2Cby3T1O6IhrP/ZLg
uYRjO9BrFp5jOhpKW5yGvrrgYdBsOo7RJHevvlQUY+lanpc/5vNM64FKHundWaCD
RYAr8D6P1segyT2roUF2f4DmBrn1ZBokNY8Ft2MboGcsfDEpAeQGlJShfZj3UzAL
A6v90BEn3j6s4L7JpBZViSG6vgKIaIFFfQxK71mkq+LznJijGAnrjBwi5hu/4yRh
7L3RzlOyqsaMMknjzeFa1CbtU08f1Gh32nog9zNp+Gcswl23EBjb3FjZzE/eL+z6
8ndgQzGUocaWDWzW04JVXb72y/4rba8zr/kxAB9dhr1bCHBkd/c30MQEhn9I5CVN
WglSup1NO97b7yBz6YML
=NDkq
-----END PGP SIGNATURE-----

--ewQ5hdP4CtoTt3oD--
