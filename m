Return-Path: <SRS0=6OCh=MH=sirena.org.uk=broonie@kernel.org>
Date: Tue, 25 Sep 2018 10:09:15 -0700
From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/3] Add GPIO brownout detection support
Message-ID: <20180925170915.GP20825@sirena.org.uk>
References: <20180925094230.32679-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ftQmbtOmUf2cr8rB"
Content-Disposition: inline
In-Reply-To: <20180925094230.32679-1-m.felsch@pengutronix.de>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: dmitry.torokhov@gmail.com, mark.rutland@arm.com, robh+dt@kernel.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-input@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>


--ftQmbtOmUf2cr8rB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 25, 2018 at 11:42:27AM +0200, Marco Felsch wrote:

> Marco Felsch (3):
>   spi: switch to SPDX license identifier

This seems like a completely unrelated change, why is it part of this
series?

>   spi: make OF helper available for others
>   Input: add generic gpio brownout driver
>=20
>  .../bindings/input/gpio-brownout.txt          |  36 ++++
>  drivers/input/misc/Kconfig                    |  12 ++
>  drivers/input/misc/Makefile                   |   1 +
>  drivers/input/misc/gpio-brownout.c            | 166 ++++++++++++++++++
>  drivers/spi/spi.c                             |  18 +-
>  include/linux/spi/spi.h                       |  30 ++--
>  6 files changed, 239 insertions(+), 24 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/gpio-brownout=
=2Etxt
>  create mode 100644 drivers/input/misc/gpio-brownout.c
>=20
> --=20
> 2.19.0
>=20

--ftQmbtOmUf2cr8rB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAluqa7oACgkQJNaLcl1U
h9DEFwf/eIRyV7unTUW9uRaBxfQoc7ooYrPOptsLg683UDGIRBYzU0qclcLolrT8
/V1YDMEPc4S3YaVkQ/Ph6jbND1+0WqxYRhDNXd29+6aCu7X+NqGLI4ssXo3NvN1y
1XzLIHw0gY0ZTBSndlk3DLBdfo6lb+106M/X7UWEigQLrfPnoNG9Z3occ2pa/aTv
fEYNft37c6/pbj2SwjbJV7wrVjypPjSNwKJvJ4sXzYRrseIboAj7oBaJm0xT5oal
GJfyUhFakEEPg5zSzz66i/YjOxPu1cMgfKnfBJUYw+KzJ4+o7gSBbwH+C/wb3cFM
P4+CM4SZjlj1MbsmdQirSXruJM7chA==
=k/5Y
-----END PGP SIGNATURE-----

--ftQmbtOmUf2cr8rB--
