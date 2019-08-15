From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 1/2] regulator: act8865: operating mode and suspend
 state support
Date: Thu, 15 Aug 2019 17:52:44 +0100
Message-ID: <20190815165244.GA54921@sirena.co.uk>
References: <1565721176-8955-1-git-send-email-raagjadav@gmail.com>
 <1565721176-8955-2-git-send-email-raagjadav@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1565721176-8955-2-git-send-email-raagjadav@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Raag Jadav <raagjadav@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>
List-Id: devicetree@vger.kernel.org


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 14, 2019 at 12:02:55AM +0530, Raag Jadav wrote:
> Implement ->set_mode(), ->get_mode() and ->set_suspend_xx() hooks
> for act8865 with unlocked expert registers.

This breaks the build because it depends on patch 2:

drivers/regulator/act8865-regulator.c:22:10: fatal error: dt-bindings/regulator/active-semi,8865-regulator.h: No such file or directory
 #include <dt-bindings/regulator/active-semi,8865-regulator.h>
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1VjdsACgkQJNaLcl1U
h9DGoQf/U7SNQL5EaBGBy7/X3RqNXsOh5/zVXWrjoxsQb7s9IYT7DrN5ESS491h0
muZWo1k9R3SrDXao8/mxE9V+k7Jv9tF4Rw/5SCHT9lYE71aUMrFlWQ2Rn5yqRaXu
/eEyoKkjkqRFo75iK5TR5zBw1ae7mC3leSeUxbTGspKxFrsJKcVNausaIF60/M9Z
VPKfVbisLdSZD8GuXW3WAY/vpI7EuXuMBqHsiJXqv9LD1GrTbpVRaaAQr7BKHoMe
OJqLTYg+Dne7YF7jCnh29v6plsyOnRgkTWHPSTL9r55WcGL1gSD+WwspvJU+XFTU
1QXbYjANxj2DF2TXIQv26F/WgeBIrA==
=MsMV
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
