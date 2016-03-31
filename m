From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] regulator: DT: Add support to scale ramp delay based
 on platform behavior
Date: Thu, 31 Mar 2016 11:45:53 -0700
Message-ID: <20160331184553.GS2350@sirena.org.uk>
References: <56ED0F58.7060005@nvidia.com>
 <56FBD4A3.7080208@nvidia.com>
 <20160330181623.GQ2350@sirena.org.uk>
 <56FCCC60.3080303@nvidia.com>
 <20160331165145.GF2350@sirena.org.uk>
 <56FD5A9F.5050001@nvidia.com>
 <20160331174741.GO2350@sirena.org.uk>
 <56FD62BA.3040406@nvidia.com>
 <20160331183130.GR2350@sirena.org.uk>
 <56FD6CF7.5080909@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oaK9NA/DDdTag9m3"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56FD6CF7.5080909@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Bjorn Andersson <bjorn@kryo.se>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Liam Girdwood <lgirdwood@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Gandhar Dighe <gdighe@nvidia.com>, Stuart Yates <syates@nvidia.com>
List-Id: devicetree@vger.kernel.org


--oaK9NA/DDdTag9m3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 01, 2016 at 12:01:19AM +0530, Laxman Dewangan wrote:
> On Friday 01 April 2016 12:01 AM, Mark Brown wrote:

> >So the PMIC actually has a setting for the rate you're seeing but for
> >some resaon you can't use it?

> PMIC has the different rate setting what I am seeing on platform (measured).
> HW team measured the ramp dealy with specific configuration of rate setting
> on PMIC which is not default (OTP-One time programmed from Vendor).

That doesn't tell me what happens if you just configure the device to
deliver the rate you're observing...

--oaK9NA/DDdTag9m3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW/XBcAAoJECTWi3JdVIfQ1FMH/2/rcpoLpFJ0cvNcVGiTh0pT
6MB8nI6ya8vtZhzZdgAnGlqWGSSNi06Kx1lYIheF6p/KHNETQQSCdDUp33c9LN1H
V0bfFQGTdUEwTMgJgyB2hHXGeldaXPxnsEfCdCwgqbPm9EHBcoSBFHHXH8tJJo7l
UeKJC5IHgKYMvti53ep624ohOknKj6ae2mM22KQjXaSbO1MMALhdvZdGqdOXyq+h
Jg4Vh+XDQI0boqQIfnx/TznJQNmVRbLViT0l2+cP0V3wS+3L8ASnmk4Y0lGIMxUs
HvnegQy4sYa8g+vl86r01xYsd1RYt6a2O57KIecZFrZTXSYmt6yf0z8Wx3qiz9I=
=FMM/
-----END PGP SIGNATURE-----

--oaK9NA/DDdTag9m3--
