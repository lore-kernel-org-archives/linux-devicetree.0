From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 4/5] regulator: lochnagar: Add support for the Cirrus
 Logic Lochnagar
Date: Fri, 19 Oct 2018 12:26:22 +0100
Message-ID: <20181019112622.GB5895@sirena.org.uk>
References: <20181019095003.26046-1-ckeepax@opensource.cirrus.com>
 <20181019095003.26046-4-ckeepax@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="b5gNqxB1S1yM7hjW"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181019095003.26046-4-ckeepax@opensource.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lee.jones@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--b5gNqxB1S1yM7hjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 19, 2018 at 10:50:02AM +0100, Charles Keepax wrote:

Please do not submit new versions of already applied patches, please
submit incremental updates to the existing code.  Modifying existing
commits creates problems for other users building on top of those
commits so it's best practice to only change pubished git commits if
absolutely essential.

> +++ b/drivers/regulator/lochnagar-regulator.c
> @@ -0,0 +1,255 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Lochnagar regulator driver

Please don't mix C and C++ comments like this in the same block, just
have it be a C++ block so it looks consistent.

--b5gNqxB1S1yM7hjW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlvJv14ACgkQJNaLcl1U
h9CEHQf+PHqc2tgv1Kfy2yfK7QJ0WcQGfD+cYkoRa+izvWVAHfElb/sZmJouxUkb
NYZDF51pizrkjR7p+/0Y4HaXJAYwygYO0GGdk6sWUASW10yobyHyCeZsJQWU2eyo
2GHUsm2RB/5dgLV8azPhazUNdI1UNmWYsvMkoh07cj1I/9BQdS/XoYPzx/ePFtf0
IMWE+mhP4nfGAY5GuS8JlGVHLZaMQU6L38J/J4/RgK3+H4+7eB8N4I0EFsGYcSfU
IXxNZsGvmObRQ2bSWs+tJV8IfcufGj+f/kv66ooh5Y1AIVhrksO6kauugASyIs4u
WQ4G2lPTapbOAOAysu0V2JZlQyFQPA==
=devJ
-----END PGP SIGNATURE-----

--b5gNqxB1S1yM7hjW--
