From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 04/18] drm/sun4i: Remove useless atomic_check
Date: Mon, 17 Jul 2017 10:47:40 +0200
Message-ID: <20170717084740.5bwzjevaxkedz7zp@flea>
References: <cover.a5e7407c191c66e264164d017f64582039c56acb.1499955058.git-series.maxime.ripard@free-electrons.com>
 <effdc5f1e0fe485b141c057bb66f9dadf7433a88.1499955058.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v67=x+6tdKsKEkY2VS75H561zUfh55h2sNUcrCERr+z72A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="nevk4whgxgpegmxi"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v67=x+6tdKsKEkY2VS75H561zUfh55h2sNUcrCERr+z72A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--nevk4whgxgpegmxi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2017 at 11:15:18AM +0800, Chen-Yu Tsai wrote:
> On Thu, Jul 13, 2017 at 10:12 PM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > The atomic_check callback is optional, and we don't implement anything =
in
> > some parts of our drivers. Let's remove it.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>=20
> Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--nevk4whgxgpegmxi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZbHmsAAoJEBx+YmzsjxAgMdcQAKEhsSF4gtBe0Jd0l0luZv62
aNiRz6c/NMqsuBICOz0ACZBfV1F28OUVLQSKWCh4PPjOjZ3EodbBU7G6qXd63/7Z
7RRbFrWlzA5XecrqbB5kgQwWwQhDsJF5LvXqKRrq/2dOY916Al4MyNpfRmnmt+is
PI/nurwNlLNaLHOA282gQcD+Qi9lToFJBA+x1LiUGwjHjgt2hdihuZwoFcTcr3RP
td1MzwO7Q4ATn1sB3gcb7v57KI44BvZySORI2StHMky+sCAPSOcn//oe6a9fH3Fi
mqIAHf7+DXnK0c1EeRvjpG0XFPdKvCzxpfDsV3Ijgi8p8QRspOCKLpacEhUKEjWi
b17GDTSWCfiG2urd7UOtZW5NmCrq7/J0OZ8Je44Z1Ag8MVSKxm0O9XX7Bs0YieYU
q9glIXbW/mEdjBy44UC4V1aPOr0Fw1DhuydOEfmdLqNkXagu/jVvHR6mqWILCHD3
GHHgtqCgd6zgjQBWigt8CuhGanW2VOWBqGZqUtNF/MOqU0WwJwrBhnc1TIL4M3nb
wnypR+64TApK8u7TR44P7S1QVSwgL7MKRJXeKd9KCJcx/ys0XZBjU0NnKEPuaSKI
iaiQtRNw+IE4qE+VOmQlM9mUhba4KQHn1nymBXDad4zR3iAR17ofTQej7wq2Yoeb
FArKPSit9W+8v37mLjfN
=EhoR
-----END PGP SIGNATURE-----

--nevk4whgxgpegmxi--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
