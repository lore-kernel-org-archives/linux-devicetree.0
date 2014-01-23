From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: ti-abb: Add support for interleaved LDO
 registers
Date: Thu, 23 Jan 2014 16:34:28 +0000
Message-ID: <20140123163428.GP17314@sirena.org.uk>
References: <20140121185553.GW17314@sirena.org.uk>
 <52DED341.3030503@ti.com>
 <20140121215624.GC17314@sirena.org.uk>
 <52DEF56C.1000209@ti.com>
 <20140122201932.GD17314@sirena.org.uk>
 <52E02E85.3030509@ti.com>
 <20140122222523.GA4999@kahuna>
 <20140123122959.GJ17314@sirena.org.uk>
 <20140123162009.GA17432@kahuna>
 <52E142AC.4030200@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ohhUr6qMC+8zx6A6"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <52E142AC.4030200@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: Nishanth Menon <nm@ti.com>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--ohhUr6qMC+8zx6A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 23, 2014 at 10:26:20AM -0600, Nishanth Menon wrote:
> On 01/23/2014 10:20 AM, Nishanth Menon wrote:

> Sigh.. the check was supposed to be:
> if (abb->regs->setup_off || abb->regs->control_off) {

> Darned.. forgot to commit! Grr... anyways.. still looking for feedback
> for the remaining.

Looks sensible enough from a quick scan again - so long as it passes
your testing...  :)

--ohhUr6qMC+8zx6A6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJS4USQAAoJELSic+t+oim92+8P/3SVrmLk0xSJq4IzRnU8ELWa
190t95x5Fk6Fc1y46f0q6lzews8XTMnyfhTgKrV6ixQNB7Caul8UJ5jV8hSIL2Jj
2r4M6qFpiYby27Yc3dQuoZ7CwfB/TC5xDM5NtlUmaCpe0mjcv3ED2tYgqUTWHv+L
vXsHSTAHbCXWrGWLclys7ZNcTW87piGka5nXeKWmK3A0zyloSvFpOM8SdsB2uP6p
gKMYufF6AP0pYuiqTcDve4hswOZ3ZuohKDDaZRG562P/V/gkqRDR8cTr16yRz3jl
v9E1hG2mojed57gs8D7Oh6imWKN5srcnPG7RRaNfohfDH7bJwjbU/RtI7m9Bbutb
UAYvI46lLKsRPWpICLMOA9PyGgD7w9qUi+ktnHfNThxAWMLl/2nh65dGVfXlG0RX
8JEDhTmXDbBRUY4DXNQ1EYNdyST+7w/WdYr3eS1JZ5k5SSlhDXGw9vt21PtmJWlq
YHqhAsU5kvb7r4Jeec67U2X8ak3Oqs8ZTlLSoVqx9L+g1G62CWJMiI4UP4V5hkou
L8QNtcnhPViaIXMhQ4myspHow9EF8kdAgsndjFJr4NKk+7/AaXGIqglqnSnE5ylA
VziW0d/kQ25ffij4GVAH6ATGWsQC/vy31Xm91J0rT48YCLheShiyJ0kkQmOVYT65
NKaUuG6430M+7HNih0nD
=1Ihh
-----END PGP SIGNATURE-----

--ohhUr6qMC+8zx6A6--
