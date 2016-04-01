From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] regulator: DT: Add support to scale ramp delay based
 on platform behavior
Date: Fri, 1 Apr 2016 09:11:21 -0700
Message-ID: <20160401161121.GZ2350@sirena.org.uk>
References: <20160331183130.GR2350@sirena.org.uk>
 <56FD6CF7.5080909@nvidia.com>
 <20160331184553.GS2350@sirena.org.uk>
 <56FD6ED6.3020507@nvidia.com>
 <20160331185945.GT2350@sirena.org.uk>
 <56FD7379.2000307@nvidia.com>
 <20160331192227.GU2350@sirena.org.uk>
 <56FD7F07.7010404@nvidia.com>
 <20160331203942.GV2350@sirena.org.uk>
 <56FE2009.4020302@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="J8ZfMsDg90ddfAv1"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56FE2009.4020302@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Bjorn Andersson <bjorn@kryo.se>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Liam Girdwood <lgirdwood@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Gandhar Dighe <gdighe@nvidia.com>, Stuart Yates <syates@nvidia.com>
List-Id: devicetree@vger.kernel.org


--J8ZfMsDg90ddfAv1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 01, 2016 at 12:45:21PM +0530, Laxman Dewangan wrote:
> On Friday 01 April 2016 02:09 AM, Mark Brown wrote:

> >Is the error in the observed values a function of the capacitance that
> >we can calcuate here?

> As per datasheet, There is no direct equation for ramp time deviation when
> regulator output current cross the regulator current limit.

OK, so it's really a current limit that's kicking in rather than a ramp
rate control (though if it's a current limit I'm still not clear why the
target rate limits where we cap)?  Can we do something based on the
maximum load configured and the current limit?  That sounds more generic
anyway, a current limiting feature is quite common.  If we implement the
current limit interface for the regulator and then specify what the
maximum load is we should be able to do the calculations you quoted from
the datasheet I'd have thought (unless I'm missing something).

> So providing configured and observed value direct will help much here.

Only if we never do anything like reconfigure the ramp rate at runtime
which some other user might want to do, and it does rely on every system
integrator to notice that the ramp rate is inaccurate and work out how
to work around it for their system.  What would be better would be if we
could figure out a way of describing this based on something more
directly observable.

--J8ZfMsDg90ddfAv1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW/p2oAAoJECTWi3JdVIfQShIH/RxYArq0WSLJ8bJkR2x6fklh
9kiI4srAZTtjRgBf06cqLU1QRmwRM99Aagykprn14ghbpYYvOd3OLouS/M7/qfG4
PpPPvuzV4ju8fgVsfyeAwMstGY0sLiv2rQxWJAtpwLr84L3FxibBSv0Lzfd7PQAh
g0NiKEdtK/IDbQy0G6klhe7oG0UpL7gmWqDK+6D/RUOGW8+K1YM9XHDW7bX+3+RJ
G3i+dN8ii25qQTABJPpCOjxvMZ35XO5NUlOZTaLC4Yk3XVofK/fbFTNz2mn9MxtG
Mh0LL7yloB29BFAXDSl12qLZrWNl8HITmO6Ny8Inb+gmWgerPeGFg2O2xH14FwU=
=PE5S
-----END PGP SIGNATURE-----

--J8ZfMsDg90ddfAv1--
