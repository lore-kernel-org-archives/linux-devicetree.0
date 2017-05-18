From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v3 14/21] drm/sun4i: tcon: multiply the vtotal when not
 in interlace
Date: Thu, 18 May 2017 09:51:21 +0200
Message-ID: <20170518075121.tfhnbljutcseaxzq@flea.home>
References: <cover.463df61c38224ecbfb5bf1cf192deeb63718b693.1495006350.git-series.maxime.ripard@free-electrons.com>
 <a8d8a93ddbac69e5dddd9c89a147f8cf2ad043a4.1495006350.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v65ZWHi_Dhsy__yVrz7330pfyMbBDTqoEE37NcSXOU_W7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0514809665=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAGb2v65ZWHi_Dhsy__yVrz7330pfyMbBDTqoEE37NcSXOU_W7Q@mail.gmail.com>
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, devicetree <devicetree@vger.kernel.org>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>, linux-clk <linux-clk@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============0514809665==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7n4nzmqpeqi4h6oi"
Content-Disposition: inline


--7n4nzmqpeqi4h6oi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 17, 2017 at 05:50:45PM +0800, Chen-Yu Tsai wrote:
> On Wed, May 17, 2017 at 3:40 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > It appears that the total vertical resolution needs to be doubled when
> > we're not in interlaced. Make sure that is the case.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/gpu/drm/sun4i/sun4i_tcon.c | 25 +++++++++++++++++++++----
> >  1 file changed, 21 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i=
/sun4i_tcon.c
> > index 62e254aedb57..a0f9a8a516c7 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > @@ -153,7 +153,7 @@ static int sun4i_tcon_get_clk_delay(struct drm_disp=
lay_mode *mode,
> >  void sun4i_tcon0_mode_set(struct sun4i_tcon *tcon,
> >                           struct drm_display_mode *mode)
> >  {
> > -       unsigned int bp, hsync, vsync;
> > +       unsigned int bp, hsync, vsync, vtotal;
> >         u8 clk_delay;
> >         u32 val =3D 0;
> >
> > @@ -192,9 +192,26 @@ void sun4i_tcon0_mode_set(struct sun4i_tcon *tcon,
> >         DRM_DEBUG_DRIVER("Setting vertical total %d, backporch %d\n",
> >                          mode->crtc_vtotal, bp);
> >
> > +       /*
> > +        * The vertical resolution needs to be doubled in all
> > +        * cases. We could use crtc_vtotal and always multiply by two,
> > +        * but that leads to a rounding error in interlace when vtotal
> > +        * is odd.
> > +        *
> > +        * This happens with TV's PAL for example, where vtotal will
> > +        * be 625, crtc_vtotal 312, and thus crtc_vtotal * 2 will be
> > +        * 624, which apparently confuses the hardware.
> > +        *
> > +        * To work around this, we will always use vtotal, and
> > +        * multiply by two only if we're not in interlace.
> > +        */
> > +       vtotal =3D mode->vtotal;
> > +       if (!(mode->flags & DRM_MODE_FLAG_INTERLACE))
> > +               vtotal =3D vtotal * 2;
> > +
> >         /* Set vertical display timings */
> >         regmap_write(tcon->regs, SUN4I_TCON0_BASIC2_REG,
> > -                    SUN4I_TCON0_BASIC2_V_TOTAL(mode->crtc_vtotal * 2) |
> > +                    SUN4I_TCON0_BASIC2_V_TOTAL(vtotal) |
> >                      SUN4I_TCON0_BASIC2_V_BACKPORCH(bp));
> >
> >         /* Set Hsync and Vsync length */
> > @@ -279,9 +296,9 @@ void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon,
> >         /* Set vertical display timings */
> >         bp =3D mode->crtc_vtotal - mode->crtc_vsync_start;
> >         DRM_DEBUG_DRIVER("Setting vertical total %d, backporch %d\n",
> > -                        mode->vtotal, bp);
> > +                        mode->crtc_vtotal, bp);
>=20
> You should duplicate the logic from channel 0 to channel 1.
> In fact, interlaced modes happen predominantly on channel 1,
> for composite and HDMI modes.

Gaah, you're right, this was obviously meant for the channel 1.. I'll
resend.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--7n4nzmqpeqi4h6oi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZHVJ5AAoJEBx+YmzsjxAgwmAP/AqM020fZxTOL21MC8RcgpRe
B1hFZGA1sqIntH2S872AiJ/TNiMrTxdPgdS8DelhbXGp+aI9z/PqUJMX+JnqT1Cu
6hw2vRb3nkHGBzpI7pm6UyKM8QTwRBaLlIFQ/b/CwIF0dpGJ7bUAHol+SOXJb0IU
/oMx9whfrdrdgyj89reHjT3iW2ASU2zFF/iVam2MwhBlzCvhcCTjB/QiJM2MEXrl
Zz0yYNwUIJNX20JoQVVUmdjpnv2R7dr50g7TLEkFUa9hNWYFNVn+QQ1owkQ7eCVP
Iju403KDD1yasT9AgZ8QatqNtq7RvQ0oDppB6KqIvW8y2mB9aOBzluWwUJZoR0Pl
TVCdTIsZrOATnEl/Bcvk0S25bTba/8P5YvlWKop77YG8hSNUtpgaT69+q7YJrO/9
osjLkwrCYKrBXNcWotR4PxeDG1/WuBDaLAAlzx1exPTvzZeIiTUBWnuaY6lCFJvo
+D9s4mbHWe+wyhnUssyeYJiCTW+DGY8VrUl+kwMEtJ9FiYOjl2CxU/sJwIOpudwg
MY3tIRPMJ+A580NRaUeRHdTFM1kVGvpWcc7hukrVAQlm7vcan+1qs9XP/og4wOwj
5xTQ9WWNqIn+UvX6yC1dVHTfMr1McB8GhJs/bXHYqlQmcb33Krsm3MTD15vNVXqM
7OJj/Oav2igDgeZxgsz7
=DOlg
-----END PGP SIGNATURE-----

--7n4nzmqpeqi4h6oi--

--===============0514809665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0514809665==--
