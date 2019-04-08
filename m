Return-Path: <sre@kernel.org>
Date: Mon, 8 Apr 2019 17:10:13 +0200
From: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH v2 2/2] power: supply: ltc3651-charger: Fix device name
 (rename files)
Message-ID: <20190408151013.kcycezi7u2htztoz@earth.universe>
References: <1554722240-22183-1-git-send-email-michael.hennerich@analog.com>
 <1554722240-22183-2-git-send-email-michael.hennerich@analog.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nmffp6qea3dfxbmb"
Content-Disposition: inline
In-Reply-To: <1554722240-22183-2-git-send-email-michael.hennerich@analog.com>
To: michael.hennerich@analog.com
Cc: mike.looijmans@topic.nl, robh+dt@kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, robin.getz@analog.com
List-ID: <devicetree@vger.kernel.org>


--nmffp6qea3dfxbmb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Mon, Apr 08, 2019 at 01:17:20PM +0200, michael.hennerich@analog.com wrot=
e:
> From: Michael Hennerich <michael.hennerich@analog.com>
>=20
> rename only - no functional changes
>=20
> Signed-off-by: Michael Hennerich <michael.hennerich@analog.com>
> ---
>  .../bindings/power/supply/lt3651-charger.txt       |  29 +++
>  .../bindings/power/supply/ltc3651-charger.txt      |  29 ---
>  drivers/power/supply/Makefile                      |   2 +-
>  drivers/power/supply/lt3651-charger.c              | 207 +++++++++++++++=
++++++
>  drivers/power/supply/ltc3651-charger.c             | 207 ---------------=
------
>  5 files changed, 237 insertions(+), 237 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/power/supply/lt3651=
-charger.txt
>  delete mode 100644 Documentation/devicetree/bindings/power/supply/ltc365=
1-charger.txt
>  create mode 100644 drivers/power/supply/lt3651-charger.c
>  delete mode 100644 drivers/power/supply/ltc3651-charger.c

Please resend with git rename detection enabled in!

-- Sebastian

--nmffp6qea3dfxbmb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlyrZE0ACgkQ2O7X88g7
+pojQA/9HUGj4uU24/8axNYJafkOIMwaIOrt+p8YbpNXr8Qu1McGtAMdKmFh1SsW
glVgGDzEGqpFzT0rbhl9hzWlxsIew2r/+xH4P0t8Gy2gcfb+nLB7W5xjoyhRyaY5
zELohZUWjY0MaARQ4eLvhGtVDfGXI3ip68r+7t/1hemn1rYdfBFf9sLEoFNGmkFF
zme6auMUmUCMHNzTuPRYdIE0HZaaFUxIo2g9o3MX8yDVMC+e37pUxlu5APemxMg6
UYpvwL9JsgRJwoqE1GQQq7vAgtFT9K/LPgMXpVmNllAy7HfuIcpNnHjw3MfGJ6bQ
xH+dkA3qtEXKOzFpXPOva7S3f+cXEyG+Tq8JYaPt4HgOHTFaZb/g96r8clIN6ZSD
ztAH3prybRc306LUAAgpsWUQNcu0uDnmg3ZI6K4UiOlPfFto+FGb3DSg1Y2u82WN
8rMUbKVxi+W0vtJpBK9cOIeuu6Ord3dO58GwbBZeFgJwXodCaBRIdsaumsA++5eN
CuExw6ZNDQa6NgXhhnI+EoaYTqIRDUuOzVb3yA0fylmDcYZGoDC5vVAIEkk43xj9
Ac3gdVuNKvSyyrC/NSgDBYWYqOShebpAxHaZpSfC9E5Gxn8m1QrOD/uYKyziU/5t
M5TfjAjLgNj02Ne95vgnDAV45V6lYozQsDkYBSGNGGJGgAK8zf4=
=CYxJ
-----END PGP SIGNATURE-----

--nmffp6qea3dfxbmb--
