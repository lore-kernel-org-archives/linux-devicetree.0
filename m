From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 10/18] drm/sun4i: tcon: Move out the tcon0 common setup
Date: Thu, 20 Jul 2017 15:55:55 +0200
Message-ID: <20170720135555.u2xuubrt4tpjy6us@flea>
References: <cover.a5e7407c191c66e264164d017f64582039c56acb.1499955058.git-series.maxime.ripard@free-electrons.com>
 <45529eeddc5d5eab9bcfa74982343eeb36fe11f6.1499955058.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v65TfUKyWg=vxWP-YhM3Be1i=N1OmNTO16aFk2VTCg4VXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="towfwuuo5ib4qmky"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v65TfUKyWg=vxWP-YhM3Be1i=N1OmNTO16aFk2VTCg4VXg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--towfwuuo5ib4qmky
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 18, 2017 at 11:41:36AM +0800, Chen-Yu Tsai wrote:
> On Thu, Jul 13, 2017 at 10:13 PM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > Some channel0 setup has to be done, no matter what the output interface=
 is
> > (RGB, CPU, LVDS). Move that code into a common function in order to avo=
id
> > duplication.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> >  drivers/gpu/drm/sun4i/sun4i_tcon.c | 26 ++++++++++++++++----------
> >  1 file changed, 16 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i=
/sun4i_tcon.c
> > index a3bbf9994cfa..f051862d635e 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > @@ -125,15 +125,26 @@ static int sun4i_tcon_get_clk_delay(struct drm_di=
splay_mode *mode,
> >         return delay;
> >  }
> >
> > -static void sun4i_tcon0_mode_set(struct sun4i_tcon *tcon,
> > -                                struct drm_display_mode *mode)
> > +static void sun4i_tcon0_mode_set_common(struct sun4i_tcon *tcon,
> > +                                       struct drm_display_mode *mode)
> > +{
> > +       /* Configure the dot clock */
> > +       clk_set_rate_protect(tcon->dclk, mode->crtc_clock * 1000);
>=20
> I'd prefer not changing APIs in a code move. It also means we could
> apply this sooner than later. Otherwise,

You're right, I've changed it.

> Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--towfwuuo5ib4qmky
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZcLZqAAoJEBx+YmzsjxAgrgUP/RWsfltatomHiN7IIrHZQlPn
QALaJR7BtkVC/xVvIwY/cgohMu6Ysf2bjsANfHuFaVLqWF+0VbWXmNehZo0Uyyxe
xf5ZW5nLqWjo3aEyHNIB+09kW9clFVIIDnBqzqzDDa9EUPtJg7Q5YHi8CAVgroQt
fV8rbzxjEqcRxkSIdlu+FhFAyilEOsDsDKrAombhInIunWHNpRNIhe3LJuOLPhMx
Tk/aonmCcXolf2+flixRuMhwKqVYZAvec+/pYIMGTwR74n7hyItNOS+x/m1AQy+N
Rf2HmkUm3D8iRkxoYJKZBDUb0sQbeNNUFvLgzgkW0LqDr/YzMSsfZKy4ntCtibVP
Dp5QYAefN2A8VThZMQQizWrVx2LLLtQGlFTlDDz1fjKWW6HvsqjLl37tf3lFh6qM
ax/e+8DiJOq0nJrkuulopyzU5sTOiD/cnQOojBrmZnyila7S1DkCHJgqu0nuyKtV
20p6XeW/BloLiLf8ytx1X7jrXMXaQ4Cc6koHnJd8RLh8Z0FG+ZMcXaEJQ7DuprxB
T30ffsAumVrt2jNTNtcMnrfbbDLJTTVQcrkcpj9HueYWj5yvhcXM2Jeg1HOSnvUO
2UGM+mBwgMaSYwf0mCUcx2OvXsWR5bpReNxiGcYwD/jaU9zKUwjxGknFm/1pmJSL
7N7R9I9bUewPZexYtd40
=OwQ/
-----END PGP SIGNATURE-----

--towfwuuo5ib4qmky--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
