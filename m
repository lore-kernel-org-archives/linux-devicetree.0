From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/3] mfd: tps65912: Rewrite driver adding DT support and
 using regmap
Date: Sat, 19 Sep 2015 11:40:21 -0700
Message-ID: <20150919184021.GQ30445@sirena.org.uk>
References: <1442339861-30300-1-git-send-email-afd@ti.com>
 <1442339861-30300-3-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MXxcbiX/Q4+iy5U7"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1442339861-30300-3-git-send-email-afd@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--MXxcbiX/Q4+iy5U7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2015 at 12:57:40PM -0500, Andrew F. Davis wrote:
> The old driver does not support DT. Rewrite the driver adding DT support
> and use modern kernel features such as regmap and related helpers.
>=20
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> ---
>  drivers/gpio/gpio-tps65912.c           | 291 ++++++------
>  drivers/mfd/Kconfig                    |  20 +-
>  drivers/mfd/Makefile                   |   3 +-
>  drivers/mfd/tps65912-core.c            | 288 +++++-------
>  drivers/mfd/tps65912-i2c.c             | 233 ++++------
>  drivers/mfd/tps65912-irq.c             | 217 ---------
>  drivers/mfd/tps65912-spi.c             | 236 ++++------
>  drivers/regulator/tps65912-regulator.c | 783 ++++++++++-----------------=
------
>  include/linux/mfd/tps65912.h           | 256 +++++++----
>  9 files changed, 854 insertions(+), 1473 deletions(-)

It's not OK to have a single commit that rewrites multiple drivers over
many subsystems, that's really not something that can be sensibly
reviewed.  You should split this into a patch series which makes one
specific change at a time as covered in SubmittingPatches.  That will
allow the changes to be reviewed much more sensibly.

--MXxcbiX/Q4+iy5U7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJV/awRAAoJECTWi3JdVIfQK6sH/0JQ+2xQbDCQxl8ai+3Ko7Cf
myB2BRCtn20b4PzAkwp/HU24NWZxm3wH1lKSrJ6UqokSQeVS8xIJvfIqPlYGlsKo
grGCkSsBwpzgYERn6IoJfFyz9/ZuSqDQ5J5qm0J+xA/5RqlMArHFLU9p0KRMrktn
PZQsBkIqlU5zj3o5v2F1RCy3Nj1pgSjs0zCn6KblDMNTRYzM2qngbMV0+Z9zpEZn
oO5i6SEgoZJYZ8bTWLgCO3OOiCbVFdqLhyPNKZuan8+P5l0PMxKSEjGV6CTObn6x
TQ7QX7OsCQkxfeWf0K5Am1wjF0mxs8d45rBuGVSX0qy4auEpK1FKqFmBFpGQ6kE=
=G+ij
-----END PGP SIGNATURE-----

--MXxcbiX/Q4+iy5U7--
