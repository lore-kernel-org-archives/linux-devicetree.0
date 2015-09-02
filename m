From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Userspace and Device-Tree
Date: Wed, 2 Sep 2015 10:17:05 +0100
Message-ID: <20150902091705.GA5313@sirena.org.uk>
References: <CAPiN7iWq0EN+Pph82MHvNKn2pUNEh3Vs4ymjMpdB212x2fq0sQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pIpim1HsfXagChBe"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPiN7iWq0EN+Pph82MHvNKn2pUNEh3Vs4ymjMpdB212x2fq0sQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Read <chrisrfq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--pIpim1HsfXagChBe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 01, 2015 at 03:19:44PM -0700, Chris Read wrote:
> On Tue, Sep 1, 2015 at 1:17 PM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> > At least in the case of regulators those are specifically for use in
> > board file cases, they should never have direct DT bindings.

> My understanding, is that we're trying very hard to avoid having any board
> files, and that DT use was intended to facilitate getting away from them.
> Perhaps my interpretation of the need to avoid board files is extreme?

Only on ARM, and in any case that code predates DT being used on ARM.

> It would involve creating a kernel module (not really a driver, since
> it doesn't actually control hardware) as well as modifications to the DT.

Your summary pretty much matches what I'm thinking yes.

--pIpim1HsfXagChBe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJV5r6QAAoJECTWi3JdVIfQjGEH/30ScEppDMLDhoeoeGHHyQVg
cIxoqvFza/l1TV+xDGR0St2qg6fei5JoeBQPgQqgZWANEiNwJ2VybsHzQWg522S7
8bdlA/Ym6qAYfT5orOfO2uJLgd0tq9zAJkz1FtnlL4sxZun2DCuB0Sf4LS11TytL
0FkJPFdqK4qfAzKpyEMhNxVU8PbBht5CVK2LfrY2laPz5ot98SWSa0IFcyMAD2Un
sWCxjnbacizQaGBOao+x/x6hKH3ehuCLG+FOg+cMit8hs8dRpJNrtVAD8GSvSSy8
Y3nwQioMKNVlUIJKWWOQDgQuS4stae3R5VMS+Kvbh2z1CNmBjY6r4FZZMsQ+QFw=
=7VJA
-----END PGP SIGNATURE-----

--pIpim1HsfXagChBe--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
