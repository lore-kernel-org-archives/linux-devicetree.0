From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 07/18] drm/sun4i: tcon: Don't rely on encoders to set the
 TCON mode
Date: Thu, 20 Jul 2017 15:34:48 +0200
Message-ID: <20170720133448.uywpaps4xcbgk7rp@flea>
References: <cover.a5e7407c191c66e264164d017f64582039c56acb.1499955058.git-series.maxime.ripard@free-electrons.com>
 <31e3fd8540d85c8f4637af1083c5c2a436403cd2.1499955058.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v66d500j5YWFbTYn_BZcF_q=sM+hr2q+yJ88OmL_j4DVPg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1631811647=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAGb2v66d500j5YWFbTYn_BZcF_q=sM+hr2q+yJ88OmL_j4DVPg@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel.vetter@intel.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============1631811647==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r2dkpawbe5usrbit"
Content-Disposition: inline


--r2dkpawbe5usrbit
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2017 at 11:56:18AM +0800, Chen-Yu Tsai wrote:
> On Thu, Jul 13, 2017 at 10:13 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Just like we did for the TCON enable and disable, for historical reason=
s we
> > used to rely on the encoders calling the TCON mode_set function, while =
the
> > CRTC has a callback for that.
> >
> > Let's implement it in order to reduce the boilerplate code.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/gpu/drm/sun4i/sun4i_crtc.c          | 11 ++++-
> >  drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c  |  1 +-
> >  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c      |  7 +---
> >  drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c |  1 +-
> >  drivers/gpu/drm/sun4i/sun4i_rgb.c           | 15 +------
> >  drivers/gpu/drm/sun4i/sun4i_tcon.c          | 56 ++++++++++------------
> >  drivers/gpu/drm/sun4i/sun4i_tcon.h          | 10 +----
> >  drivers/gpu/drm/sun4i/sun4i_tv.c            |  6 +--
> >  8 files changed, 40 insertions(+), 67 deletions(-)
> >
>=20
> [...]
>=20
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i=
/sun4i_tcon.c
> > index dc70bc2a42a5..c4407910dfaf 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > @@ -106,29 +106,6 @@ void sun4i_tcon_enable_vblank(struct sun4i_tcon *t=
con, bool enable)
> >  }
> >  EXPORT_SYMBOL(sun4i_tcon_enable_vblank);
> >
> > -void sun4i_tcon_set_mux(struct sun4i_tcon *tcon, int channel,
> > -                       struct drm_encoder *encoder)
> > -{
> > -       u32 val;
> > -
> > -       if (!tcon->quirks->has_unknown_mux)
> > -               return;
> > -
> > -       if (channel !=3D 1)
> > -               return;
> > -
> > -       if (encoder->encoder_type =3D=3D DRM_MODE_ENCODER_TVDAC)
> > -               val =3D 1;
> > -       else
> > -               val =3D 0;
> > -
> > -       /*
> > -        * FIXME: Undocumented bits
> > -        */
> > -       regmap_write(tcon->regs, SUN4I_TCON_MUX_CTRL_REG, val);
> > -}
> > -EXPORT_SYMBOL(sun4i_tcon_set_mux);
> > -
> >  static int sun4i_tcon_get_clk_delay(struct drm_display_mode *mode,
> >                                     int channel)
> >  {
> > @@ -147,8 +124,8 @@ static int sun4i_tcon_get_clk_delay(struct drm_disp=
lay_mode *mode,
> >         return delay;
> >  }
> >
> > -void sun4i_tcon0_mode_set(struct sun4i_tcon *tcon,
> > -                         struct drm_display_mode *mode)
> > +static void sun4i_tcon0_mode_set(struct sun4i_tcon *tcon,
> > +                                struct drm_display_mode *mode)
>=20
> Nit on the side: maybe we could mark mode as constant?
> Since the function doesn't change it. Same applies to the
> other mode_set functions. But this could be left to another
> patch.

We totally should. I'll do it.

> >  {
> >         unsigned int bp, hsync, vsync;
> >         u8 clk_delay;
> > @@ -221,10 +198,9 @@ void sun4i_tcon0_mode_set(struct sun4i_tcon *tcon,
> >         /* Enable the output on the pins */
> >         regmap_write(tcon->regs, SUN4I_TCON0_IO_TRI_REG, 0);
> >  }
> > -EXPORT_SYMBOL(sun4i_tcon0_mode_set);
> >
> > -void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon,
> > -                         struct drm_display_mode *mode)
> > +static void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon,
> > +                                struct drm_display_mode *mode)
> >  {
> >         unsigned int bp, hsync, vsync, vtotal;
> >         u8 clk_delay;
> > @@ -312,7 +288,29 @@ void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon,
> >                            SUN4I_TCON_GCTL_IOMAP_MASK,
> >                            SUN4I_TCON_GCTL_IOMAP_TCON1);
> >  }
> > -EXPORT_SYMBOL(sun4i_tcon1_mode_set);
> > +
> > +void sun4i_tcon_mode_set(struct sun4i_tcon *tcon, struct drm_encoder *=
encoder,
> > +                        struct drm_display_mode *mode)
>=20
> (also mark encoder as const?)

Yep.

> > +{
> > +       switch (encoder->encoder_type) {
> > +       case DRM_MODE_ENCODER_NONE:
> > +               sun4i_tcon0_mode_set(tcon, mode);
> > +               break;
> > +       case DRM_MODE_ENCODER_TVDAC:
> > +               /*
> > +                * FIXME: Undocumented bits
> > +                */
> > +               if (tcon->quirks->has_unknown_mux)
> > +                       regmap_write(tcon->regs, SUN4I_TCON_MUX_CTRL_RE=
G, 1);
> > +               /* Fallthrough */
> > +       case DRM_MODE_ENCODER_TMDS:
> > +               sun4i_tcon1_mode_set(tcon, mode);
>=20
> IIRC you need to clear the mux bit here. So ...
>=20
> > +               break;
> > +       default:
> > +               DRM_DEBUG_DRIVER("Unknown encoder type, doing nothing..=
=2E\n");
> > +       }
>=20
> I think keeping the muxing in a separate function would be cleaner.
> The above is already slightly messy if you add the bit clearing part.
> With all the other muxing possibilities in the other SoC this is
> going to get really messy.

Ok.

> > +}
> > +EXPORT_SYMBOL(sun4i_tcon_mode_set);
> >
> >  static void sun4i_tcon_finish_page_flip(struct drm_device *dev,
> >                                         struct sun4i_crtc *scrtc)
>=20
> [...]
>=20
> Thanks for working on this. Now we've decoupled the TCON/CRTC code
> from all the encoders.

Yeah, I still have mixed feelings about this, but it was the sensible
thing I guess.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--r2dkpawbe5usrbit
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZcLF4AAoJEBx+YmzsjxAg7y0P/34rm0M60XQnJebDF5SCneQB
oEyMnHo/5MgetDFwuxcIj00lmfwG27k/Z0971P5FQ4CuvF58cVuaMx43mm5sg9d6
21ZPxK/A8vCJArmbN9HNZBLobrEVAgX+KdaZlsS4Ly5JSFdcXOf5wWE9TA6UY2dh
I2WNomv8tA15rBkBZOEZVcEn/7rx9ZxkHvl8CMnAGfZaccOI7x+NK6DyrpaNS5Z8
2nK8JbnB96jcYna6h9yqS8WloJSY3icdEbI3/GXN1ppETGclqJcyZ+ljHgTWZh7t
BE2rGs1aAVN1MB2H5QH69lirKZUxekxNy5/uQtwZC7xwt6cmnI64RjYH09lDWA4q
CyVSLcjl+xGO3jw9mmsjRVYlGdpL/UX1JTJsKTbZ7V7U4Rfku+d7xJJbZvFeDfmu
ao7unO5Iq1mh4wwY0mcqh0P17HAIWtn452nBlTcdMWAZKH4o40zFoj5vTRdgcVmW
md5Apq6FAwKMSLhdopv71Pj9xUBI4uUDN/9tHh8jn7ZzzHIVwaB0eOC1pQ8BbrOD
Y9nSxlcQCiQ00foYBpXlomiICOuy13g/VQ1O3jTacThvmsDJI/Zm3YiPO2JZHFg3
0tQ9wwm/YBsdA7bteaVfgUloWH1XSwGUbzL9j7xQqwWrYeBw4hkLDSKQdQWphrr/
f94jvYj6JhtB/q9UTiT/
=h2Ay
-----END PGP SIGNATURE-----

--r2dkpawbe5usrbit--

--===============1631811647==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1631811647==--
