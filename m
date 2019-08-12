From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: regulator: act8865 regulator modes and
 suspend states
Date: Mon, 12 Aug 2019 12:11:40 +0100
Message-ID: <20190812111140.GG4592@sirena.co.uk>
References: <1565423335-3213-1-git-send-email-raagjadav@gmail.com>
 <1565423335-3213-3-git-send-email-raagjadav@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="w/VI3ydZO+RcZ3Ux"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1565423335-3213-3-git-send-email-raagjadav@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Raag Jadav <raagjadav@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>
List-Id: devicetree@vger.kernel.org


--w/VI3ydZO+RcZ3Ux
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 10, 2019 at 01:18:55PM +0530, Raag Jadav wrote:

> + * ACT8865 regulators as follows:
> + * ACT8865_REGULATOR_MODE_FIXED:	It is specific to DCDC regulators and it
> + *					specifies the usage of fixed-frequency
> + *					PWM.

Ah, _FIXED doesn't mean what it sounded like - this should map to _FAST.
The reason you use forced PWM is to avoid any delay in the hardware
figuring out that it needs to go into PWM mode in the case of rapid load
changes.

--w/VI3ydZO+RcZ3Ux
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1RSWsACgkQJNaLcl1U
h9BgOwf+L+0uD2AkY2mKb2rgbO4kz8XM2/qXa/Guj883xw8zawXENnnGXMu1g+i3
0gO9qV1QdTKin8sA2YFzlSqIreIjIh5EBwxcTDBizvq7+QO40zJVxLi4kvMNEQcN
O144ApoOUPDU4HhhaZM9fW9+kx13IAgn4cficrqDdnoL2pZ8sNWsQP28vjprfgWH
45DxGYJqrrhnXW3unBkGBT/z6Cu5DhCo9NYnNY6+G2eQqNtD+UacEu2K+HQuVuUj
g/0Tg8h9ZhsIX+z1eo2Idorf7jkvd4QctqaA4DJHIKezvyD+7STfmAIwyobXC0Nh
fDr0HHOLg3E7HBBIXu8mX4GEVDJkZw==
=mPsh
-----END PGP SIGNATURE-----

--w/VI3ydZO+RcZ3Ux--
