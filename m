From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/9] drm/panel: simple: simplify display_mode definitions
 by using macro
Date: Tue, 17 Oct 2017 15:08:31 +0200
Message-ID: <20171017130831.GA21172@ulmo>
References: <1507721021-28174-1-git-send-email-LW@KARO-electronics.de>
 <1507721021-28174-3-git-send-email-LW@KARO-electronics.de>
 <20171017120937.GC684@ulmo>
 <20171017150516.0cab0cc1@karo-electronics.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1212987425=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20171017150516.0cab0cc1@karo-electronics.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Lothar =?utf-8?Q?Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org


--===============1212987425==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 17, 2017 at 03:05:16PM +0200, Lothar Wa=C3=9Fmann wrote:
> Hi,
>=20
> On Tue, 17 Oct 2017 14:09:37 +0200 Thierry Reding wrote:
> > On Wed, Oct 11, 2017 at 01:23:34PM +0200, Lothar Wa=C3=9Fmann wrote:
> > > Use the newly defined macro to generate the display_mode data entries
> > > for all panels. This reduces the code size significantly and makes the
> > > code more readable.
> > >=20
> > > Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
> > > ---
> > >  drivers/gpu/drm/panel/panel-simple.c | 799 ++++++-------------------=
----------
> > >  1 file changed, 134 insertions(+), 665 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/p=
anel/panel-simple.c
> > > index dec639d..fde9c41 100644
> > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > @@ -89,6 +89,20 @@ struct panel_simple {
> > >  	struct gpio_desc *enable_gpio;
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
> > > +}
> > > +
> > >  static inline struct panel_simple *to_panel_simple(struct drm_panel =
*panel)
> > >  {
> > >  	return container_of(panel, struct panel_simple, base);
> > [...]
> > > @@ -411,33 +415,9 @@ static const struct panel_desc ampire_am_480272h=
3tmqw_t01h =3D {
> > >  	.bus_format =3D MEDIA_BUS_FMT_RGB888_1X24,
> > >  };
> > > =20
> > > -#define SP_DISPLAY_MODE(freq, ha, hfp, hs, hbp, va, vfp, vs, vbp, vr=
, flgs) { \
> > > -	.clock =3D freq,							\
> > > -	.hdisplay =3D ha,							\
> > > -	.hsync_start =3D (ha) + (hfp),					\
> > > -	.hsync_end =3D (ha) + (hfp) + (hs),				\
> > > -	.htotal =3D (ha) + (hfp) + (hs) + (hbp),				\
> > > -	.vdisplay =3D (va),						\
> > > -	.vsync_start =3D (va) + (vfp),					\
> > > -	.vsync_end =3D (va) + (vfp) + (vs),				\
> > > -	.vtotal =3D (va) + (vfp) + (vs) + (vbp),				\
> > > -	.vrefresh =3D vr,							\
> > > -	.flags =3D flgs,							\
> > > -	}
> >=20
> > Your first patch should put this in the right place to begin with so
> > that this patch is really just the conversion.
> >=20
> > Again, I don't think this macro actually improves the way modes are
> > defined.
> >=20
> I'm not happy with this panel driver stuff anyway. With the legacy
> 'display-timings' node that provided the timing data directly in the
> DTB, every bootloader could pick up the timing data and feed it to
> whatever driver it used for the display.
> With the panel driver stuff the whole Linux driver has to be replicated
> in the boot loader in order to be able to use the same DTB as Linux for
> its HW configuration.
> And adding a new panel involves recompiling the kernel and the boot
> loader, rather than adding the timing data from the panel's datasheet
> into the DTB.

This isn't the first time I've heard this. Please read this for more
background information on why the situation is what it is:

	http://sietch-tagr.blogspot.de/2016/04/display-panels-are-not-special.html

Thierry

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnmAM0ACgkQ3SOs138+
s6EcSw/+KRS8sOwqBr3+HiqiwuesfF016ukeRT4kpjPO2gCn9AywuDLqbouwaHFG
GWA5YPWxRFPUHvMoo7i4OWcb1roYl/IZRhbpz6mwl/7hi/esllYrPj5gcoTexZwq
sa0NdO1E1YJIChxYBA+SdDginO1Ww+x7bR4kuAz9baloZ45f/HU2zzeR9q7/4RZ/
QifCKGS4SGtKlROXso36c2KgtpCPN1mxr/G+KEog9uIaRONox0M6m8LgCXLE0ORh
sGkm8vkQC35XwJDxFtnnjeuInZiGqO7ZJtPYKzXTe1/fWBaEmcqkl6a31uKosKcC
h3T/I+24/tzji2ah2dYB7RuTAPwjGStJ2We8K872DQFGXCnCHeyDZOTkqSNGenNp
+Cx9CDPBP/5EQDwtqSD1uftnHcQM8hvZ00JcBOzwpT7OM214AJcbPrpNI0ZvwFTa
5qsboQe3GOt27uV9g3ZNXdeodTxY1v7w8q1/jS04yFOwT3J5dlvqPOVKMF3LwNYK
+tTtM1f07/LHh0wwxlishgF9obu/GZspFhb2KSffIDNwuxapGPZnRLYNQvOAlUhS
SZ/oP3sN3l455ZFc8XZjpN1JvF5oAT1EmycW6r4/lLVIY94xnQ+irLwWVcU33S6R
wBbArR052euiY7rOeFxKxgivp8m6ryrvw+AwH0I+30SyLrfJjhY=
=1JSM
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--

--===============1212987425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1212987425==--
