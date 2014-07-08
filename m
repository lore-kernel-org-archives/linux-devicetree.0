From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: topology: Use a clock if possible to get the
 CPU frequency
Date: Tue, 8 Jul 2014 09:39:40 +0200
Message-ID: <20140708073940.GH13423@lukather>
References: <20140630124919.GC28647@lukather>
 <CAKfTPtCgpc1J888hbqxoaF5UfcUoRwcpokme32WHPpsPAAawUQ@mail.gmail.com>
 <20140630140146.GD28647@lukather>
 <CAKfTPtAu+mSVO8dvg_Z6w_nYWndap+FY5VGKeg-0pae_4JqR=A@mail.gmail.com>
 <20140630145847.GE28647@lukather>
 <CAKfTPtDvQJ5i=t8FN0gLQex0yAC4NNgewTnGKdiCeGk7nQwZYg@mail.gmail.com>
 <20140703071016.GB31996@lukather>
 <CAKfTPtBonwH0PoEkKazUS9bPaR631Vu7p7qZ0AF1whmXq_53wg@mail.gmail.com>
 <20140704080255.GO31996@lukather>
 <CAKfTPtBPR9QA9h4bF3EkCZufpF+X84N7JzjU88CptR1RtiNrdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OpLPJvDmhXTZE4Lg"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKfTPtBPR9QA9h4bF3EkCZufpF+X84N7JzjU88CptR1RtiNrdg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--OpLPJvDmhXTZE4Lg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 04, 2014 at 11:22:33AM +0200, Vincent Guittot wrote:
> >>  I still think that using the current rate with clk_get_rate is not a
> >> good solution.
> >
> > Well, it's just as good as using clock-frequency, really. If you want
> > the CPU max frequency, it's not the right property (plus, since the
> > changed behaviour is not documented in Linux anywhere, the only
> > reference we have is the ePAPR on this).
> >
> >> Could you give us more details about why you nee to use current clock ?
> >
> > Honestly, I just want to remove that big warning at boot on the
> > A7-based SoCs we have :)
>=20
> so Why not changing the log message ? It's clearly not an error to not
> have clock-frequency

Because the next SoCs we're going to support will be HMP, so we're
only delaying the issue by a few month if we're doing so.

It doesn't fix the underlying issue where you're using a standard
property for a (slightly) different usage.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--OpLPJvDmhXTZE4Lg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTu6A7AAoJEBx+YmzsjxAgeU0P/RaiF2HPzk72j2wjoI3LpQEg
ZApxFTfKUNiWBBPVRTPdN3GIbCpYYPOI00qb7GV7Tra/ikPVzp+12LYo3ll0N7av
vXZ3VYtQK7uluNN33p9ZxvHSIX0p+8ImbgBHvwN4hDHq4eWH5GQmiSmf/utM9Tg/
/aNwDgHt8EMsrQMlw21eZ5U18GiKGW/RNaBGGBpDwW58wiU55+rJ8r6VadJmfSFk
4Z+0vblLAUfalLfG+9sRtQlCJ+IT5A/X6tJnNzOhWILkCn3tDaloOAYjGzA+iYAq
0Oko1+DwZhzV3i3eWPZTFR++bCNVZwXqGhv91Z55RuND90+QY+rgdd+Aq4yhepCm
o+ZhBBnQ7KzvcWu3fuZQroAB5NsV9MYSl7/I9wRk92S40d2An9lAQ80KDrnS824w
TceuDHc1zfkRCHm97oZtQtktV7qUxRwxuqalU5AzJ3kYOVyThZ2A954Zt8cxpbU6
ulkXqbO0eQBe/QPk8mSSlyq7hgHkDmXGnwPzTeO4w6DjF3DVK2Hmd4JWrGz9epMc
hopN2/skE6TwVUbqiFDhuNYxKlois2QtlVSsKVYJpHzxeUiU31hGUCk/eF5x0n+o
IHoiTmJPKR7wpmR6xFuWK1wkYDOzuih547trJ2oJETs0Dd5/0Sc5MbaPRxT2GkkE
mNVQGNMSovyk5/28N1da
=Kf+A
-----END PGP SIGNATURE-----

--OpLPJvDmhXTZE4Lg--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
