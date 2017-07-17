From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 02/18] drm/sun4i: Add if statement instead of depends on
Date: Mon, 17 Jul 2017 10:45:15 +0200
Message-ID: <20170717084515.itlooaskmgvcylty@flea>
References: <cover.a5e7407c191c66e264164d017f64582039c56acb.1499955058.git-series.maxime.ripard@free-electrons.com>
 <d51d45d57d2bacaa5bafcd861aa0142fcaf0ad77.1499955058.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v64KXCm1SzCz1hSkk1WOA03rju5_v_Q9XdF=cSs26Wz+Tw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="euxz6jytayx6afi3"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v64KXCm1SzCz1hSkk1WOA03rju5_v_Q9XdF=cSs26Wz+Tw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--euxz6jytayx6afi3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2017 at 11:09:07AM +0800, Chen-Yu Tsai wrote:
> On Thu, Jul 13, 2017 at 10:12 PM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > The depends on relationship is obvious, and using an if statement will
> > propagate it to every option without the need for each and every one of
> > them to define it.
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

--euxz6jytayx6afi3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZbHkbAAoJEBx+YmzsjxAgJYkP/A7zpkkqi1wc2AdA0wR9ecl4
QGPjFdH3chXxVOKzwwmDdFRvI0hgVHVif7JVjNTq3mBFuljzqC4kArSRjiLL3ozO
QmL1O4B2k7WvxmR34Qfb4fz7erMIC4OGJ9+mXH143k57LzgYem/yVUZ5mNzOHSFQ
wJXnhSO32y98WQr++y5tMyMeM7uL9CR373uovhHAZ/C2iADK1o6TgT73AVgNwxyW
iHpvxu8/Rp9YTDZI4zZ9dAT/Q/xhJUOzV4NjQpP6HD419LDzXheimvDkgZkAEjGz
OYhiPvcOwuHF6u7D1QVnXeQPChJMj5Cr/XIB63j7LQSe4+2JSDo09Y4riWUZsL7O
e8jcNlPMetp0xDVRWLtdDal2qr8GzNYmu1UHMbG7yADSJDGPwCVPpTdNEKehF1RP
taR5ytyfoNo5tDFahI3XiJLQFgdSELmFxaL/mbacHlpwyG59l4btcpdamCkrMg5l
xheD/vE+dxhIwJZKQ+Oist/qKpwzb4ivyH+2byMlzI5+u1UOlWjcdytswuWuakQ1
Z5wVzMY7wMwknRPYe5K5jyfsiC02/fWlsuzSnhoCpNUdrMeqGia66UE/D9moh+jJ
bgzUmtTW19fP9M1wdbcsKxEpFim9l3tXlHOV7KIdwyDaFL5MnMLSyihLy78JuWp+
dTyaTpJD93cFFa46bf+e
=d1qt
-----END PGP SIGNATURE-----

--euxz6jytayx6afi3--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
