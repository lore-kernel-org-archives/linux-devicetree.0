From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 07/11] drm: sun4i: add support for the TV encoder in
 H3 SoC
Date: Fri, 23 Jun 2017 16:44:06 +0200
Message-ID: <20170623144406.cmib5wabi5qiuqme@flea.lan>
References: <20170604160149.30230-1-icenowy@aosc.io>
 <20170604160149.30230-8-icenowy@aosc.io>
 <20170607093845.cu5kk55nj72roysf@flea.lan>
 <362bb72d74cd7181ae02dbf73b0e724e@aosc.io>
 <20170613074432.btwgc4e7pndtsvbf@flea.lan>
 <5A2149A9-CC7B-4946-9219-A4FE3228B402@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="htddjr5mziyb4jku"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5A2149A9-CC7B-4946-9219-A4FE3228B402-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--htddjr5mziyb4jku
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2017 at 05:51:42PM +0800, Icenowy Zheng wrote:
>=20
>=20
> =E4=BA=8E 2017=E5=B9=B46=E6=9C=8813=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=88=
3:44:32, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> =E5=86=99=E5=88=
=B0:
> >On Sun, Jun 11, 2017 at 02:43:42PM +0800, icenowy-h8G6r0blFSE@public.gmane.org wrote:
> >> =E5=9C=A8 2017-06-07 17:38=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=
=BC=9A
> >> > On Mon, Jun 05, 2017 at 12:01:45AM +0800, Icenowy Zheng wrote:
> >> > > Allwinner H3 features a TV encoder similar to the one in earlier
> >SoCs,
> >> > > but has a internal fixed clock divider that divides the TCON1
> >clock
> >> > > (called TVE clock in datasheet) by 11.
> >> > >=20
> >> > > Add support for it.
> >> > >=20
> >> > > Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> >> > > ---
> >> > > Changes in v2:
> >> > > - Quirk part rewritten.
> >> > >=20
> >> > >  drivers/gpu/drm/sun4i/sun4i_tv.c | 35
> >> > > ++++++++++++++++++++++++++++++++++-
> >> > >  1 file changed, 34 insertions(+), 1 deletion(-)
> >> > >=20
> >> > > diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c
> >> > > b/drivers/gpu/drm/sun4i/sun4i_tv.c
> >> > > index 338b9e5bb2a3..b9ff6d5ea67a 100644
> >> > > --- a/drivers/gpu/drm/sun4i/sun4i_tv.c
> >> > > +++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
> >> > > @@ -13,6 +13,7 @@
> >> > >  #include <linux/clk.h>
> >> > >  #include <linux/component.h>
> >> > >  #include <linux/of_address.h>
> >> > > +#include <linux/of_device.h>
> >> > >  #include <linux/regmap.h>
> >> > >  #include <linux/reset.h>
> >> > >=20
> >> > > @@ -169,14 +170,21 @@ struct tv_mode {
> >> > >  	const struct resync_parameters	*resync_params;
> >> > >  };
> >> > >=20
> >> > > +struct sun4i_tv_quirks {
> >> > > +	int fixed_divider;
> >> > > +};
> >> > > +
> >> > >  struct sun4i_tv {
> >> > >  	struct drm_connector	connector;
> >> > >  	struct drm_encoder	encoder;
> >> > >=20
> >> > >  	struct clk		*clk;
> >> > > +	struct clk		*mod_clk;
> >> > >  	struct regmap		*regs;
> >> > >  	struct reset_control	*reset;
> >> > >=20
> >> > > +	const struct sun4i_tv_quirks *quirks;
> >> > > +
> >> > >  	struct sun4i_drv	*drv;
> >> > >  };
> >> > >=20
> >> > > @@ -391,6 +399,12 @@ static void sun4i_tv_mode_set(struct
> >> > > drm_encoder *encoder,
> >> > >  	struct sun4i_tcon *tcon =3D crtc->tcon;
> >> > >  	const struct tv_mode *tv_mode =3D sun4i_tv_find_tv_by_mode(mode);
> >> > >=20
> >> > > +	if (tv->quirks->fixed_divider) {
> >> > > +		DRM_DEBUG_DRIVER("Applying fixed divider %d on TVE clock\n",
> >> > > +				 tv->quirks->fixed_divider);
> >> > > +		mode->crtc_clock *=3D tv->quirks->fixed_divider;
> >> > > +	}
> >> > > +
> >> >=20
> >> > You're not allowed to change the mode in mode_set, and you
> >shouldn't
> >> > even change it. The output pixel clock is still 27MHz.
> >> >=20
> >> > You should implement that using the states, as we discussed
> >already.
> >>=20
> >> After reading the comments at
> >include/drm/drm_modeset_helper_vtables.h,
> >> I think the atomic_check function is allowed to directly change
> >> the adjust_mode of crtc_state.
> >>=20
> >> And according to other comments at include/drm/drm_modes.h, the
> >> crtc_clock in adjust_mode should be the clock to be really feed
> >> to the hardware.
> >>=20
> >> So I think I can just change this in atomic_check.
> >>=20
> >> However, the mode_set function of sun4i_tv seems to be not
> >> regarding adjusted_mode and still use original mode.
> >>=20
> >> So my current design is:
> >> - Multiply adjusted_mode in atomic_check.
> >> - Feed adjust_mode to TCON code in mode_set function.
> >>=20
> >> Is this proper?
> >>=20
> >> (From my own understanding to the comments I think so.)
> >
> >No, it's not. The pixel clock in the mode is the pixel clock output
> >physically by the connector. You want to use it for an intermediate
> >clock in your pipeline.
> >
> >This is not the same clock, and not the same frequency.
>=20
> So should a multiplier parameter be passed via
> tcon1_mode_set function?

No, and I've explained a couple of times already what you needed to
do. Please read again the previous messages.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--htddjr5mziyb4jku
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZTSk2AAoJEBx+YmzsjxAgPdMP/ApPr8YU7p1FoWIHmx8qUEHX
DpWK0KJD8iVdtHsedUX3j2ryoDQTsB1KSuB4t7cT9O4ikzyCDafHlUOOcuxm8B7i
Fq/gsjONlByHPSntfq1bIjr4GvqVOMbmVJ0EsZhkoWphzLOPQ9ecI1QKrLhWumkN
rllG6Ayd+nLbIDrwC5fXBThE83eQgNmTGb9i0zvHjnOrTZKMEEHGTRbvaS//u5eS
tx0wdLFhvC7Ggil9LEk9Hq8DofEtRdFn1HMnccSMK/Ekq4NZhJjiGsATP9i+U2Fi
sVGky2eCPymoWqJENDMV9Vw1zVEjmUjIULn2j+YRhFgNk/8FugsfKBMuDe8TKg+T
0XakEFZoC2VEZi30EJ42zz2psaUdnTDszfS7TghNNnC5s/QuU7In8yDEUorODOJ/
p7VuUZADGJdTyho/1ed9WLSj/HmvsyIMxs91ejbOcqyhJNBpq6Cqe0fPTVyDHs8I
wzJwIhfawmV8Ok7Wn30GzqeekqjYpJHzCypKdKi2Rd7mpJjAAzXlbMfdv/YPL2Pb
INxP6GRooK5VdJqj7oM2QRS41pERG5Hlxkp+UH3wtKyLOPUaeMh2kqKm+m68GY0s
NPN0rMC/nexNzb7JN5M4lfyXJA7p4rsdMHthFBDSzf1keEYyHuaawOzkiet7bpuY
G9xLFmE8dRRNMZGccVPE
=40Xp
-----END PGP SIGNATURE-----

--htddjr5mziyb4jku--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
