From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Userspace and Device-Tree
Date: Mon, 31 Aug 2015 15:55:00 +0100
Message-ID: <20150831145500.GP12027@sirena.org.uk>
References: <01e601d0e0f9$614450d0$23ccf270$@gmail.com>
 <20150828101227.GD31748@leverpostej>
 <CAAVeFuJCSv74HLws7Adb1fnSbxf8rR5=NYX8GG59K1nLgFs+VA@mail.gmail.com>
 <CAPiN7iU+NzW1oYjXLsLgn7Sh=i6DPMC49WrDcpsa4XvmjpORcw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Z+4AIOC3PbWQhL6C"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPiN7iU+NzW1oYjXLsLgn7Sh=i6DPMC49WrDcpsa4XvmjpORcw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Read <chrisrfq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--Z+4AIOC3PbWQhL6C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 31, 2015 at 07:30:24AM -0700, Chris Read wrote:

> yet.  I would like to see the addition of exporting to the GPIO hogging
> mechanism:
> 1. A boolean to indicate the exporting the GPIO

Why would this be appropriate?  Exporting a GPIO to userspace doesn't
sound like a property of the hardware...

> For the regulator case, it looks like a hogging mechanism might be
> appropriate.

Do you mean something like the existing support for marking regulators
as always enabled?

--Z+4AIOC3PbWQhL6C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJV5GrDAAoJECTWi3JdVIfQ6MYH/jQihvc2lCnOrZXESVTbwSYk
bJPje4Aa8ERpTNlChhXW9GTOWlGa2ipJgUNhp3/PWR2KJ2oHGlSksRW0MiE42bcK
pXjDmQ7TK4HY8VPt4hbRUwM1P8/bygsYwT90cPlEpwMu7MLaqWpU/n9UuQ1x3fkI
QvDydunePup0d0PkF/zic60vlKkDgKbzvo8/e9D1by0SszXzrIJJeE+30W+jVQuO
PIlQTH7B2SbcQPi0hWazCtwCSCkHCUaFxuaCsUWOlfynExpLrg7xaUdLGTJftA8E
88pLg3Eqgcc87Q6eiEkgkU6Na7pVf836V3hQIDQIA+N7XP1voRaxkjt16Dgd6IM=
=lIpa
-----END PGP SIGNATURE-----

--Z+4AIOC3PbWQhL6C--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
