From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/9] drm/panel: simple: add a macro for defining display
 modes in a simpler and less error prone way
Date: Tue, 17 Oct 2017 14:50:45 +0200
Message-ID: <20171017125045.GD27983@ulmo>
References: <1507721021-28174-1-git-send-email-LW@KARO-electronics.de>
 <1507721021-28174-2-git-send-email-LW@KARO-electronics.de>
 <20171017120818.GB684@ulmo>
 <20171017141337.088ba796@karo-electronics.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="AbQceqfdZEv+FvjW"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171017141337.088ba796-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lothar =?utf-8?Q?Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--AbQceqfdZEv+FvjW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 17, 2017 at 02:13:37PM +0200, Lothar Wa=C3=9Fmann wrote:
> Hi,
>=20
> On Tue, 17 Oct 2017 14:08:18 +0200 Thierry Reding wrote:
> > On Wed, Oct 11, 2017 at 01:23:33PM +0200, Lothar Wa=C3=9Fmann wrote:
> > > Create a macro that eases the definition of display mode parameters by
> > > accecpting the parameters:
> > > freq, hactive, hfront-porch, hsynclen, hback-porch,
> > > vactive, vfront-porch, vsynclen, vback-porch, vrefresh
> > > that can be usually directly taken from an LCD datasheet.
> > >=20
> > > Put the calculations that are now open coded repeating the same
> > > parameters multiple times into the macro expansion.
> > >=20
> > > Signed-off-by: Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
> > > ---
> > >  drivers/gpu/drm/panel/panel-simple.c | 14 ++++++++++++++
> > >  1 file changed, 14 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/p=
anel/panel-simple.c
> > > index 474fa75..dec639d 100644
> > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > @@ -411,6 +411,20 @@ static const struct panel_desc ampire_am_480272h=
3tmqw_t01h =3D {
> > >  	.bus_format =3D MEDIA_BUS_FMT_RGB888_1X24,
> > >  };
> > > =20
> > > +#define SP_DISPLAY_MODE(freq, ha, hfp, hs, hbp, va, vfp, vs, vbp, vr=
, flgs) { \
> > > +	.clock =3D freq,							\
> > > +	.hdisplay =3D ha,							\
> > > +	.hsync_start =3D (ha) + (hfp),					\
> > > +	.hsync_end =3D (ha) + (hfp) + (hs),				\
> > > +	.htotal =3D (ha) + (hfp) + (hs) + (hbp),				\
> > > +	.vdisplay =3D (va),						\
> > > +	.vsync_start =3D (va) + (vfp),					\
> > > +	.vsync_end =3D (va) + (vfp) + (vs),				\
> > > +	.vtotal =3D (va) + (vfp) + (vs) + (vbp),				\
> > > +	.vrefresh =3D vr,							\
> > > +	.flags =3D flgs,							\
> > > +	}
> >=20
> > I don't think this simplifies anything. It's now completely non-obvious
> > which parameter is which, so you actually have to go look at the macro
> > definition when you add a new mode to make sure you get them right.
> >=20
> In the original code you have to repeat the same parameters (e.g.
> vertical front porch (vfp)) in multiple places which is error prone.

I don't think this is an issue. The definitions initialize the fields in
the natural order, so the repetitions are where very localized and quite
difficult to actually get wrong. I've never seen anyone get it wrong for
any panel.

Also note that the above notation is only out of convenience to make it
clearer what the active, front-porch, sync and back-porch values are.
You can easily just collapse them into the sum if you're worried about
the repetition.

Alternatively, are you aware of struct display_timing? It's a different
way to describe the timings which doesn't require repeating the values.
simple-panel already supports those as an alternative to the struct
drm_display_mode.

Thierry

--AbQceqfdZEv+FvjW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnl/KUACgkQ3SOs138+
s6EVtBAArXjOUALOO8z6eXgD04g+tl/H9jcVQun89dzWEnu59mgnMB+MjPRacXDk
BAEHoyKDjar11ttFhewnySVDGHs3UYvKG/z4MiPxyY9PdKJPRMXaeTeGsKGrIoXt
aX5nuon0xRUV2qkVvhaXfWIHa5gu2C/7pEbJfGqHDF4X57YnAXBdvd97HaFC/TOT
lnwugMiYuc2E8Bf+Gg56e3cUJUUHKqch7qH3k83+mo6tCcXcqSKUxAT3Wz8qrP9t
2DYOur+ngK1HQnjL7ToOEBtcIFh8ihvMHB4oME14O3CSwPO3qk+CSBeQCbEkq7iT
xiDudcQtVDJhiFjnnpxYhtV0hRjEmTLoa4J31vEAK7NyfZ8Swud8w6fCrGKi8s83
S3OumH4f8CXXeksM2J5rVpvImYhU4Mmf4qWmCgcmzz2/8yd46KfgN4Joe6NuRAjD
IVyvuaAi0RAFmH7NIUmoNIw95DEGd+gkLnGaR2IeWotT/BHEqWCi0YfQ8iIqax8Q
jSD/cGDwROv+TgBl5jOrD8QkRY+jgDvB6DuJjZA61WyM9tYW32jK4JI06Yc3FcWe
W7oqbMSIAZpCH73MMieUb8iPyF5lCuujGaTRNoUhjr9YNnv1gQ4mPKfUgMYnfIef
NCZFMUiXB8IJYPjyUNprUDon8DS0vQ1K0cn/rDmOFRuUM3g2ZUU=
=23ar
-----END PGP SIGNATURE-----

--AbQceqfdZEv+FvjW--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
