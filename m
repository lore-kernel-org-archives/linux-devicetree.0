From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/7] drm/tinydrm: Add helper functions
Date: Tue, 7 Feb 2017 12:11:28 +0100
Message-ID: <20170207111128.GE29507@ulmo.ba.sec>
References: <20170131160319.9695-1-noralf@tronnes.org>
 <20170131160319.9695-3-noralf@tronnes.org>
 <20170206085629.GD27607@ulmo.ba.sec>
 <20170206090918.6rqr6l7pd62znl5j@phenom.ffwll.local>
 <20170206093556.GF27607@ulmo.ba.sec>
 <CAKMK7uHgW15EPpPSU2se7r89JCGD_oTvn9ZJptYaNJAWMKb9Fg@mail.gmail.com>
 <20170206110847.GH27607@ulmo.ba.sec>
 <20170206155303.2fwihmlh6ln4eskt@phenom.ffwll.local>
 <CAPM=9tywXAt8v4VwjHA7OhsW6Xg=w8gDeY5s+fHjhdmuUUG7gg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="SNIs70sCzqvszXB4"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPM=9tywXAt8v4VwjHA7OhsW6Xg=w8gDeY5s+fHjhdmuUUG7gg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--SNIs70sCzqvszXB4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 07, 2017 at 08:28:16AM +1000, Dave Airlie wrote:
> >
> > I definitely don't want that we don't attempt this. But brought from ye=
ars
> > of experience, I recommend to merge first (with pre-refactoring already
> > applied, but helpers only extracted, not yet at the right spot), and th=
en
> > follow up with. Because on average, there's way too many trees with
> > overloaded maintainers who maybe look at your patch once per kernel
> > release cycle.
> >
> > If you know that backlight and spi isn't one of these areas (anything t=
hat
> > goes through takashi/sound is a similar good experience for us on the i=
915
> > side), then I guess we can try. But then Noralf has already written a f=
ew
> > months worth of really great refactoring, and I'm seriously starting to
> > feel guilty for volunteering him for all of this. Even though he seems =
to
> > be really good at it, and seems to not mind, it's getting a bit silly.
> > Given that I'd say up to Noralf.
> >
> > In short, there's always a balance.
>=20
> I don't think we can make a rule for this, it will always depend on the
> code. There is always going to be stuff we put in drm that should go
> elsewhere, and stuff that is elsewhere that drm should use.
>=20
> I think however if we do add stuff like this, someone should keep track
> of them and try to make them get further into the kernel.

Yes, I think having some sort of TODO in drivers/gpu/drm could help
track things that we know should eventually be moved out. It could serve
as a list of janitorial tasks for newcomers that want to get their hands
dirty and tackle relatively trivial tasks.

That's not meant to devalue such contributions. Code would be in a
mostly finished form, so it'd be mostly about moving things into the
correct subsystem, interacting with maintainers, making sure things are
kept working along the way, that kind of thing. No in-depth knowledge
of DRM/KMS would be required, but perhaps be picked up along the way.

Thierry

--SNIs70sCzqvszXB4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliZq2AACgkQ3SOs138+
s6FPmRAAt04ktOL+ujyDlvNtac+6jXlnw3Uyj1O8QalIA9MkZYZlki/agah1dN8z
KMODYjX0yRhTHVMVsWbROhuM3+MbAjhwSWPyx/VnY6opm4VSBQXJpw8Ad5AB/uLj
ci4ohReg21YUxe22h/FTJ5UaiRoibDf661wy9ptfOiKNSfFIUXUGarYkwFmA89LI
4ebBy0UOuwXmKvCtKpSIgdUoMmk57SelQdzK/qm8WnVqDk8MoD4sdCOItxmkfmk3
tgU8g9qxjhKeW62zz0N7hXVmUhTPOFSbVUcxI2ful0aYOaB9mjUHkCm6ZN04+BpB
6ftgfr3zo7g93L8csv315P48HgYYNN6H6AKptS7bm/TYPzWgw8Ep39Lc/k7Mpw1P
2XZHNIVSaebl7FkrI06UYtclkjg5t36w4DTbygJ+zZf1TxwogC3fnKa/RIoVUU5m
DXo9+qX9lkrQH1XU7KuW0AVnT0vBpmzPD0ElJEbxN/ZMdU1cz+xhaU7+h4wBvGsa
4EpfrEABszyVLtuL7XLTq7vmyi8V67jXsbvi7y0EfeEwfD3WsWGX9ZfmqsNfKXP0
42mxj1r8UWUWt65056j3F1sr7OVw7/9LqjQBPIbNVD42jfebdkGH3JkS4nHqWrVA
JaaWdObZHsqxNuiC/+ey/jjCklQ1KNd4nkE9Y/1/yJHqEC3b354=
=V/jA
-----END PGP SIGNATURE-----

--SNIs70sCzqvszXB4--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
