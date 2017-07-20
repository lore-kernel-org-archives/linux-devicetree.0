From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 09/18] drm/sun4i: tcon: Adjust dotclock dividers range
Date: Thu, 20 Jul 2017 16:55:00 +0200
Message-ID: <20170720145500.kpwj7iscrwyjqi5q@flea>
References: <cover.a5e7407c191c66e264164d017f64582039c56acb.1499955058.git-series.maxime.ripard@free-electrons.com>
 <74db696da66cffafe1e729fe2df73b437c8fd483.1499955058.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v67WtqukOHPNkyzA+s8GAUR6fnomvT6Sqp8547euHH3G-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="r5esdzgtixfa3va3"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v67WtqukOHPNkyzA+s8GAUR6fnomvT6Sqp8547euHH3G-Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--r5esdzgtixfa3va3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2017 at 12:14:37PM +0800, Chen-Yu Tsai wrote:
> On Thu, Jul 13, 2017 at 10:13 PM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > It seems like the dotclock dividers are a bit less strict range, and can
> > operate even with a smaller than 6 divider. Loose the boundaries a bit.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> >  drivers/gpu/drm/sun4i/sun4i_dotclock.c | 20 +++++++++++++++++++-
> >  1 file changed, 19 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_dotclock.c b/drivers/gpu/drm/s=
un4i/sun4i_dotclock.c
> > index d401156490f3..0b844c0dd102 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_dotclock.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_dotclock.c
> > @@ -77,7 +77,25 @@ static long sun4i_dclk_round_rate(struct clk_hw *hw,=
 unsigned long rate,
> >         u8 best_div =3D 1;
> >         int i;
> >
> > -       for (i =3D 6; i <=3D 127; i++) {
> > +       /*
> > +        * There's something odd here.
> > +        *
> > +        * In the A13 user manual, this is stated to be >=3D 6 when
> > +        * dclk1 and dclk2 are used (without any hint on how to use
> > +        * them), and >=3D 4 when only dclk is used.
>=20
> You set it in TCON0_IO_POL_REG, which sets the clock phase delay.

oh, so it's d for delay? I assumed it was for dotclock.

> I think we were setting this before, but you removed it as part of
> the previous TCON clean up patches?

Hmmm, I might have.. :)

> In the A33, there are even more options, like DCLK / 2 (with 0 or 90
> degree phase delay).

Where did you find this documentation? I was under the impression that
all that DCLK stuff was in the higher bits of the DCLK register, but
apparently there's more to it.

> > +        *
> > +        * In the A33 user manual, when only dclk is used, it is set
> > +        * to be >=3D 6 in the former case, and >=3D 1 in the
> > +        * latter. There's also some (obscure) explanations about the
> > +        * dclk1 and dclk2 vs dclk that seems to be in the upper 4
> > +        * bits. What those clocks are and what bit does what is not
> > +        * really clear.
>=20
> Looks like mux bits to me. How they differ from TCON0_IO_POL_REG is
> beyond me ATM.

It might be some additional dividers too.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--r5esdzgtixfa3va3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZcMREAAoJEBx+YmzsjxAgnZkQAJQw1i3gWP/a0CS7c/AyImwo
TiIPa/qO4vp01tpyxj0MIcbQFdHEsEDKXm0gP7Iw+qck10SIFqeiVL2k4YgA+6Of
avYCjtWXgKF2QJYuNNQGVp33gJ/G0v1d/QczJaZ2WpE7UfVZOW2PYRewQ89EdGRf
M3foQ89ykp0dPykB2w3g4D6Nnzkfvwc4CFpw5qEOHfx+xRshrao4VoPlC/DAZ6jF
Z1iLJmlxkeHr3Zw5LNYILZYp9B4On+Ar/xdzYM+c3uP1iwwi1dXYmX+bQ0SM1DbU
xUM/0tjoHbOanv2AIhgAdKtbrf8KsCLndkCAql/OULSR1NzGWE5TrDAyhWRsXqea
06ysw7koIIvLjarYHOh6SCvv5eXt0oLvjLXs3TTuMiJvCcgFFi60Cou2UnG2SuUP
TRVQJxtxWSsl/YzwyIlDAPnyWGpBjYomKpNGr2CX/ODDxuhD85eCc2DPidCoz/ms
S5fY8zFrSt2lJTipPi/uQJ8VRJaOlqf811doluppHJGKRFNwXcGwpBHi/uuxozir
c58s/zHoPfCtCrCLSGp6iTzsZdPFJ3m6aMrcJ7pSYKUZ1+ZeMh1rT0ByUHD+cZNs
7jaB/JrB6kWeSeZfrvWA0/3dXck83dNt99bqDbi8G7aDSKJwhApswr/hcVOe0SH1
5d1GNB2jA38AnxdhhOwp
=z1VI
-----END PGP SIGNATURE-----

--r5esdzgtixfa3va3--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
