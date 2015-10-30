From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 09/19] drm: sun4i: Add DT bindings documentation
Date: Fri, 30 Oct 2015 18:37:38 +0100
Message-ID: <20151030173738.GD17183@ulmo.nvidia.com>
References: <1446214865-3972-1-git-send-email-maxime.ripard@free-electrons.com>
 <1446214865-3972-10-git-send-email-maxime.ripard@free-electrons.com>
 <CAL_JsqLuUUApGAgdw7U8EJ7p5yrYJg8AKFB32AE9Ufrf47=WpQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DiL7RhKs8rK9YGuF"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqLuUUApGAgdw7U8EJ7p5yrYJg8AKFB32AE9Ufrf47=WpQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Wynter Woods <wynter-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--DiL7RhKs8rK9YGuF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2015 at 11:40:03AM -0500, Rob Herring wrote:
> On Fri, Oct 30, 2015 at 9:20 AM, Maxime Ripard
[...]
> > +Optional properties:
> > +  - allwinner,tv-encoder: phandle to the TV Encoder in our pipeline
> > +  - allwinner,panel: phandle to the panel used in our RGB interface
>=20
> Use of-graph please.

Why? Panels are a really simple resource and a simple phandle is fully
capable of describing the relationship.

Thierry

--DiL7RhKs8rK9YGuF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWM6rhAAoJEN0jrNd/PrOhe5MP/Rz/SQpr6XBAaweD0OTh1bj8
2u3x4pyBd4Z73GS/nVzflQjZf4B6AqwkvV/Nrrr9E2pdo91uacdfL3uW6n7tLIIM
y0rkDnx5YNTkkM8CM9X4wiziYGuJ0oSxTauw1nH2TEpYf0pFzfrDI16u5mJT0/vS
oL+4Iv5kt1F1/Fnk7ttAioEpvhhz9nMuTqzAI7cajq34CN9s6w2J1pizWQokxJI/
w719JEPIL6Qu8d4cx5N7J7XBaP9giBjSvCsR+ShobF35N5hO1U/JoCGnwZaw81H1
W/vl3xiQwn9PZKZk/fiUguHrfFSXcdLmEFCXn6l9Rxr0lTWmkArF+XfDj/g+BrKB
4Y65KTvHLaUWEPL0Zyt/us6rZGoULSV73wZYLmBttkSgDDdVWeTx9R9llsU5CwJG
pHdSf/WF4lZ5KKQw+H/ajFly+jxQLi34mCugaNkWJZ1jmLVE/XVRyXe4GeeuS8rO
31EprNW6EViDFL2VDqo2R2Pu5XKyEcYHuRzBXCSCuZe1FdNkbtoESq+HnqbhF911
Ni5aTra90uAE3cO15w15sLfKxdIadnI7WpgbTGEG+CfVVY3Fra/hNE9hdMTlwTNb
hNodQv+gnrjmCeYaiJPyg4lWXqEqqeOOd40POR9L7RGeyvXRDYiB/q0S4l2eIRKj
LP2c5ial8yO7oeFJx4MP
=RgVR
-----END PGP SIGNATURE-----

--DiL7RhKs8rK9YGuF--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
