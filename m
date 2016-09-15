From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 4/4] regulator: Prevent falling too fast
Date: Thu, 15 Sep 2016 15:39:45 +0100
Message-ID: <20160915143945.GJ27974@sirena.org.uk>
References: <20160906190524.GB79728@google.com>
 <20160912185633.GH27946@sirena.org.uk>
 <20160913172140.GC62872@google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="e5GLnnZ8mDMEwH4V"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160913172140.GC62872-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--e5GLnnZ8mDMEwH4V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 13, 2016 at 10:21:40AM -0700, Matthias Kaehlcke wrote:

> Optimizing the delay time depends on the SoC; we have not measured
> this across a wide variety of devices and thus have very conservative
> numbers. The percentage is based on the trigger for OVP on the
> regulator. In this case, OVP kicks in when the FB node is 20% over
> regulation, which is equivalent to a 16% drop in voltage (1/1.2). For
> our device safe-fall-percent is set to 16 and slowest-decay-rate is
> 225.

The obvious question here is how the OVP hardware knows about the new
voltage and why we're bodging this in the regulator core rather than in
the OVP hardware.

> > I'd like to see some more thorough analysis than just an "apparently"
> > here.  It's making the code more fiddly for something very handwavy.

> It's well-understood why it's a percentage. DVS is controlled by
> offsetting the FB current, and as above, OVP is based on how far you
> are from the FB target.

You might think you understand this clearly but nobody reading the
commit message or looking at the code later on is going to be able
do so when your commit message only contains vague handwaving.

--e5GLnnZ8mDMEwH4V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJX2rKuAAoJECTWi3JdVIfQ0yEH/2K8uh2SPvQhHQk8rD/7EKHs
TTdzMF7Fb5KQPI/6u4vgZio7AX9crwaq/C3zlMWJM5+DaTx41O1WQrcgV9aoxDaX
UgQwdZ1UDCBm1h7nMMHcz64Te1FuBkw/68dYLj2XbApLFFc29qVYBmPLsMYMR3ci
Y7aAZhVBO7uDZjsBXK1ok1D5xzsaQL15lI4A4QTiXV2ac36OMfQlUo8qYP1i+3pj
tLoZeXvx7NrRF8uyCqGd1mDjr3LELlXI2OkCjGY4R56dvpeSHkvXu0wpRwVfCnPH
9F+KiG0kUcqka8DgKZYAK2WY/9IdjBZ75rTuvLItolgvjU2DmWvkNieCIhC6xh8=
=IqKo
-----END PGP SIGNATURE-----

--e5GLnnZ8mDMEwH4V--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
