From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 4/5] mfd: arizona: Update DT binding documentation for
 mic detection
Date: Wed, 7 Oct 2015 11:00:17 +0100
Message-ID: <20151007100017.GB12635@sirena.org.uk>
References: <1443803363-3251-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1443803363-3251-5-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="I3Hu03FJZWOiEBEs"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1443803363-3251-5-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: lee.jones@linaro.org, cw00.choi@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org


--I3Hu03FJZWOiEBEs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 02, 2015 at 05:29:22PM +0100, Charles Keepax wrote:
> Add additional bindings to allow configuration of the system specific
> microphone detection settings.

This all seems pretty much fine to me - the things it is controlling are
fairly specific to the way the former Wolfson devices do, they only
really make sense with a fairly particular algorithm which isn't widely
implemented.

--I3Hu03FJZWOiEBEs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWFO0xAAoJECTWi3JdVIfQdf4H/RIjOPGlzDHwAZGh+dAkkkOI
iUHARaL5kPP3baFSs8v0WHJ5fCbb4hi8vpIWIBdW7idYz0+G7lr+FeUBSB/i0DJ7
z3ZiDM5tWt/Ypaq2eRNisK6yxiXEt1miVCjmysskiWgYNZqLMZe8xzKH09pEndQ4
W0Q4NUXsqBnRwbICGoW7Ekdml5LUUsSjhe8A688yDLlXok4i2D2eK9TvklPRZgvf
AOGXR2La1JjgKTD1UHRisc4cXq4CNpXYBhQIf8htR3GjIfHIHLuig1wNoI+HKCnz
uSGZXbAQWOOFYbgOmjp+gLHu914OPDYpPovFZg8DTrnhMnn38vUDgrhs+l6M9WI=
=FWNl
-----END PGP SIGNATURE-----

--I3Hu03FJZWOiEBEs--
