From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 3/3] mfd: tps65912: Rewrite driver adding DT support
 and using regmap
Date: Wed, 23 Sep 2015 10:53:17 -0700
Message-ID: <20150923175317.GU30445@sirena.org.uk>
References: <1443024459-15770-1-git-send-email-afd@ti.com>
 <1443024459-15770-4-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1a0hRYDdJmE1GM/c"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1443024459-15770-4-git-send-email-afd@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--1a0hRYDdJmE1GM/c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 23, 2015 at 11:07:39AM -0500, Andrew F. Davis wrote:

>  drivers/gpio/Kconfig                   |   6 +
>  drivers/gpio/Makefile                  |   1 +
>  drivers/gpio/gpio-tps65912.c           | 138 ++++++++++++
>  drivers/mfd/Kconfig                    |  24 ++
>  drivers/mfd/Makefile                   |   3 +
>  drivers/mfd/tps65912-core.c            | 114 ++++++++++
>  drivers/mfd/tps65912-i2c.c             |  86 ++++++++
>  drivers/mfd/tps65912-spi.c             |  85 +++++++
>  drivers/regulator/Kconfig              |   6 +
>  drivers/regulator/Makefile             |   1 +
>  drivers/regulator/tps65912-regulator.c | 240 ++++++++++++++++++++
>  include/linux/mfd/tps65912.h           | 393 +++++++++++++++++++++++++++++++++

Please submit this like a normal driver, not as one enormous patch
covering every subsystem.

--1a0hRYDdJmE1GM/c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWAucIAAoJECTWi3JdVIfQmBcH/jTZvSxB4uYCxRvqZNaSY0zI
mnnwVTMAlmALBEeJ8JGRjxfDOJfi1x3v5tWVgZ01y0wtiRbmFjuNJTY7r/zWM/L8
DzDVO66wuwKHVT63tcwNhOG4c9mveZuVje/Clc5drElhQww2iRc0/1BzRYSBFEj3
vTqe+wBJg1N12aTMcbGA+9WBmAgVXsPeQuU+Kb653cQghpAdUqxBeLkGoRoo9ie4
FSzfIDY3yUiiYInxI83wpI/h2HtJarWliD1XOG5b07ywwEqNbcDqk1CKKIZqO0Hq
GRetgUSWhnUeb4/PF8egYMxQuWDXW6/qcgKEO2qt12GpEvynzLHulyY2+yA0ANU=
=Qmg2
-----END PGP SIGNATURE-----

--1a0hRYDdJmE1GM/c--
