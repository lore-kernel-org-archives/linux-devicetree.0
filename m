From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] regulator: DT: Add support to scale ramp delay based
 on platform behavior
Date: Thu, 31 Mar 2016 12:22:27 -0700
Message-ID: <20160331192227.GU2350@sirena.org.uk>
References: <20160331165145.GF2350@sirena.org.uk>
 <56FD5A9F.5050001@nvidia.com>
 <20160331174741.GO2350@sirena.org.uk>
 <56FD62BA.3040406@nvidia.com>
 <20160331183130.GR2350@sirena.org.uk>
 <56FD6CF7.5080909@nvidia.com>
 <20160331184553.GS2350@sirena.org.uk>
 <56FD6ED6.3020507@nvidia.com>
 <20160331185945.GT2350@sirena.org.uk>
 <56FD7379.2000307@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3e0+L7380OK+0MAI"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56FD7379.2000307@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Bjorn Andersson <bjorn@kryo.se>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Liam Girdwood <lgirdwood@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Gandhar Dighe <gdighe@nvidia.com>, Stuart Yates <syates@nvidia.com>
List-Id: devicetree@vger.kernel.org


--3e0+L7380OK+0MAI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 01, 2016 at 12:29:05AM +0530, Laxman Dewangan wrote:
> On Friday 01 April 2016 12:29 AM, Mark Brown wrote:

> /**
> Here is the case,
> PMIC supports 2 ramp time configurations 5mv/us and 100mV/us. This is

This looks like a typo given a lot of the other content and the fact
that this is a concern.

> But here is the stuff without typo ;-)
> Device supports 5mV/us and 100mV/us which is not in observed value.

So why doesn't the device end up configuring 100mV/us when asked for
50mv/us?  That's reasonably expected - the configured ramp rate is a
maximum rate given that this is used to limit inrush current.

--3e0+L7380OK+0MAI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW/XjxAAoJECTWi3JdVIfQYmUH/07x7e5inBCXp3h1jaqM+a+r
KFxM6M3ua4QuQ/+5MjvLI3+7HETkWI1aHI8dSvZ8CPX20hjdzXg+EB+J63jLMpMW
oh9eLWmAM76t/soenfeNrpBW5sbNaJ/tyROFVGzcEcde/rp1hd18va7AjrM7FfFm
HHE1apIdDBA1Vgp/GlPZGhH8zvWEWgJi7zdcZI5yh6hbjtSkwrxlAVRfdsD71dZQ
cJ5OSpNMM9Dy/GECKF6yJP5nLj+wy65o7U6riO8eHw84Mm5QDYF0xiwYGFdraYol
pqX+4sWeecEl38dsFLFuCMfA3sO+tFdNVMFyadx9A+FE9zBByJ2FcnGT41mlFz8=
=o2Y2
-----END PGP SIGNATURE-----

--3e0+L7380OK+0MAI--
