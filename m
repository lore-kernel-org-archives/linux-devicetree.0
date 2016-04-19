From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] regulator: DT: Add support to scale ramp delay based
 on platform behavior
Date: Tue, 19 Apr 2016 16:47:40 +0100
Message-ID: <20160419154740.GX3217@sirena.org.uk>
References: <20160331203942.GV2350@sirena.org.uk>
 <56FE2009.4020302@nvidia.com>
 <20160401161121.GZ2350@sirena.org.uk>
 <570370E5.3070901@nvidia.com>
 <20160412010226.GO3351@sirena.org.uk>
 <570CF822.4050002@nvidia.com>
 <20160413065310.GK14664@sirena.org.uk>
 <571601E7.2000901@nvidia.com>
 <20160419105545.GT3217@sirena.org.uk>
 <57160EDB.5040704@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FxQkOwrLuQ+yAGv2"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <57160EDB.5040704@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Bjorn Andersson <bjorn@kryo.se>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Liam Girdwood <lgirdwood@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Gandhar Dighe <gdighe@nvidia.com>, Stuart Yates <syates@nvidia.com>
List-Id: devicetree@vger.kernel.org


--FxQkOwrLuQ+yAGv2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 19, 2016 at 04:26:27PM +0530, Laxman Dewangan wrote:

> Now, for property, I will add
>  maxim,ramp-delay

Please call it something that makes it obvious that it's a register
value rather than a time like ramp-setting or something.

--FxQkOwrLuQ+yAGv2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXFlMbAAoJECTWi3JdVIfQj1UH/RWMpznIXxCCNwjWDFau9Tro
mLP8E98ztEEAD9LPmfL/KRtMG8mACP6oSrfPSJCFzF/E499uVc3ZRUEgKyRLVEbo
tNwk20csaJRqVPoLeASse+ssgjce20mCrc71NxI5iMA5UeNFjs/AN6wdVSDvgbOJ
FU8hdmmFa49tK92R6CQZSce9tUl1ShdfXKlY7s7lpoaDPVcy0CioRMS8b44bz2C+
2uBJEsLVTwaZBnWy1+AHE7XUNSwSKCyOr1dB/7XM8QHxjmh9rpUQWWQtGDajwLLj
hwTD9CfH5H64pIyeoaCNlver3ClfXz2iR0IAShEdCHAitGNoGO9G1f3CZs2l3/Q=
=eXtD
-----END PGP SIGNATURE-----

--FxQkOwrLuQ+yAGv2--
