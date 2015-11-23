From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 3/4] regulator: tps65086: Add regulator driver for the
 TPS65086 PMIC
Date: Mon, 23 Nov 2015 19:00:26 +0000
Message-ID: <20151123190026.GS26072@sirena.org.uk>
References: <1447974102-24938-1-git-send-email-afd@ti.com>
 <1447974102-24938-4-git-send-email-afd@ti.com>
 <20151121133739.GG26072@sirena.org.uk>
 <5650D6D2.5060108@ti.com>
 <20151122131321.GM26072@sirena.org.uk>
 <56534FA7.2040200@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gh9b96O0vZdbsJLX"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56534FA7.2040200@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--gh9b96O0vZdbsJLX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 23, 2015 at 11:40:55AM -0600, Andrew F. Davis wrote:

> But which of_node?

> regulator_config->of_node
> regulator_config->dev->of_node

> The second is the only one I see getting used, the first is only
> used when drivers provide their own init_data and automatic init
> data getting fails.

The configuration of_node is there to override the device one if there
were some reason to do it.  This should only happen in a situation where
we weren't able to use the core parsing, with modern drivers it
indicates a problematic binding so the code deliberately doesn't handle
it.  Anything with a problematic binding will have generated the
init_data in driver code anyway.  If we come up with a reason to extend
the interface we can do that but for now there is no need.

> The same issue is present in GPIO (gpiolib.c:612), where the of_node

Line number references are complately unhelpful if you don't say what
you're looking at (for me that's a call to irq_find_mapping() which I'm
guessing isn't what you were talking about).

> in the config takes precedence over the one in config->dev, the
> opposite is true for regulators, this is very confusing and should be
> standardized.

No, they both do the same thing.

--gh9b96O0vZdbsJLX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWU2JHAAoJECTWi3JdVIfQJngH/05nIstrMpGtor1eNPQ2mLpm
VXKYyZmSHz6pqBFDaJI07xWMqWNnOjOtuL7udfLqIjYoPlHr/XSkJuZO6cP65IeN
8OvGTaF/5Q33J3pBdHoyBiZJz8XiLPfCkvSimI4NZ7Nh6EfbXemLJmMGGtkuhOJq
VF4Qb1LrKhvIjRn0On+ZBjIvSIMk0B9M0miVPX5xvFlApqD6N3nS9TpCIGSs5SSz
fVuz/m6aW7qZ/qA3kMCjRg7ZlncynKTP5VgJKf2o57txU8j9tHpo3bxbJhaFC7MA
EeapvO1ji7b8HjhfCy/8fwI+8adrsj8GQErdQF5JjQkkIMi1yoO6/2htgSBs9bA=
=bumZ
-----END PGP SIGNATURE-----

--gh9b96O0vZdbsJLX--
