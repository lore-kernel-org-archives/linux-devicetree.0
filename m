From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] regulator: DT: Add support to scale ramp delay based
 on platform behavior
Date: Wed, 30 Mar 2016 11:16:23 -0700
Message-ID: <20160330181623.GQ2350@sirena.org.uk>
References: <20160229174751.GQ21240@tuxbot>
 <20160301022326.GC18327@sirena.org.uk>
 <56D5111E.6090606@nvidia.com>
 <20160302033833.GV18327@sirena.org.uk>
 <56D65F7E.3090907@nvidia.com>
 <20160302043506.GC18327@sirena.org.uk>
 <56E81103.8010903@nvidia.com>
 <CAJAp7OgUjN+Ymh+vM8g9Wex0JDRSOFkvpTKHm8fXYkDgTQ+0Tw@mail.gmail.com>
 <56ED0F58.7060005@nvidia.com>
 <56FBD4A3.7080208@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7kZSb73GAX5WIGXJ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56FBD4A3.7080208@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Bjorn Andersson <bjorn@kryo.se>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Liam Girdwood <lgirdwood@gmail.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Stephen Warren <swarren@wwwdotorg.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Gandhar Dighe <gdighe@nvidia.com>, Stuart Yates <syates@nvidia.com>
List-Id: devicetree@vger.kernel.org


--7kZSb73GAX5WIGXJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 30, 2016 at 06:59:07PM +0530, Laxman Dewangan wrote:

> Like to add property as "regulator-device-ramp-delay" which will be used for
> PMIC configuration and regulator-ramp-delay will be used for delay
> calculation. This is case when advertised ramp delay does not match with the
> platform measured ramp delay.

Why -device?

--7kZSb73GAX5WIGXJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW/Bf2AAoJECTWi3JdVIfQKgkH/icEt3K+PJqQVGkd3BT+OVse
euDUzv/Mq1rA7FeEWl/SrYV/NWS6D6eucdo5E4Ya4JIBzzXhLfYDtBQjWrMsorMO
sRc9e+Ko7g4OIwjhSDlpqH1g4OrjvOP40Br9U6puoD4fWPSH41H8jRjPp43BNbMU
7GqUqrWpZ+vkd8RaA6/XiLwPuN96HMZkejZ23cuPStiKNNzAowfCaXrL2vc2Jmxf
r+GH5psG4k8sdee3TVepyBMcUMD4ILHKF5ZPpFG3gkgFiHcZSo+rgc8mx0DEoOia
d7CLFQNbBQUxAkckGj8jbfXmaHseuU8XdQ8yYHBqSg5/ApLZSNOAkOrI9mkbjGY=
=eqZK
-----END PGP SIGNATURE-----

--7kZSb73GAX5WIGXJ--
