From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] regulator: DT: Add support to scale ramp delay based
 on platform behavior
Date: Thu, 31 Mar 2016 11:59:45 -0700
Message-ID: <20160331185945.GT2350@sirena.org.uk>
References: <20160330181623.GQ2350@sirena.org.uk>
 <56FCCC60.3080303@nvidia.com>
 <20160331165145.GF2350@sirena.org.uk>
 <56FD5A9F.5050001@nvidia.com>
 <20160331174741.GO2350@sirena.org.uk>
 <56FD62BA.3040406@nvidia.com>
 <20160331183130.GR2350@sirena.org.uk>
 <56FD6CF7.5080909@nvidia.com>
 <20160331184553.GS2350@sirena.org.uk>
 <56FD6ED6.3020507@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EzyTiZo8w1pFn3ee"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56FD6ED6.3020507@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Bjorn Andersson <bjorn@kryo.se>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Liam Girdwood <lgirdwood@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Gandhar Dighe <gdighe@nvidia.com>, Stuart Yates <syates@nvidia.com>
List-Id: devicetree@vger.kernel.org


--EzyTiZo8w1pFn3ee
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 01, 2016 at 12:09:18AM +0530, Laxman Dewangan wrote:

> The setting for observed value is not there for device configuration.

> Device support 5mV/us and 100mV/us.

> We observed 50mV/us when setting device to 100mV/us.

But you said the device had a configuration for 50mV/us?

--EzyTiZo8w1pFn3ee
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW/XOLAAoJECTWi3JdVIfQEYoH/3N3LLsfFc72LcpnmeREtQWf
oTz6Rcjd4XnuLHpqNuhG3L/jOYAii6uGMjLgJaRy/UtD5YiLfaZ4y1MuvbN80V7o
xGDwcM3stY1rGMAtsnj/1at2usAkEXZoe3A5+RzGoCQ85pe4Ra8yIdVf3UdO/K/J
0jzpLy6PTDwRIVxFjeGodVmIwVpqMlhTs51809DJNcL/dM8DugSFQGxGxAgQ47Zl
IMP17ueP5hih/mtb5zGbC1upTgfLiPvuMIgH36vsj6pvEeFnTX6xyNRKxI2sf5U3
RASl0IZDPzsRtLFjoL4YMlGZK9Qlw6l+RA4LaYBCnskdlP7z3TeodMBVLoySCYE=
=VUvH
-----END PGP SIGNATURE-----

--EzyTiZo8w1pFn3ee--
