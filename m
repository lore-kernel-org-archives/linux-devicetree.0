From: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH v4 0/2] Add driver and documentation for Alphascale asm9260
 pinctrl
Date: Wed, 22 Apr 2015 21:49:15 +0200
Message-ID: <5537FB3B.1040303@rempel-privat.de>
References: <1428306169.634.51.camel@x220> <1428311043-12012-1-git-send-email-linux@rempel-privat.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="lPNVG2fSrjHIWS7kXN8AkPmvVdO9Hj5Sd"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1428311043-12012-1-git-send-email-linux@rempel-privat.de>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lPNVG2fSrjHIWS7kXN8AkPmvVdO9Hj5Sd
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hallo all,

any updates here? :D

Am 06.04.2015 um 11:04 schrieb Oleksij Rempel:
> changes:
> - v4. As Paul Bolle sugested, fixing License in the header.
>=20
> Oleksij Rempel (2):
>   pinctrl: Add driver for Alphascale asm9260 pinctrl
>   pinctrl: asm9260: add pinctrl add device tree bindings documentation
>=20
>  .../pinctrl/alphascale,asm9260-pinctrl.txt         |  76 +++
>  drivers/pinctrl/Kconfig                            |   8 +
>  drivers/pinctrl/Makefile                           |   1 +
>  drivers/pinctrl/pinctrl-asm9260.c                  | 733 +++++++++++++=
++++++++
>  4 files changed, 818 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/alphascal=
e,asm9260-pinctrl.txt
>  create mode 100644 drivers/pinctrl/pinctrl-asm9260.c
>=20


--=20
Regards,
Oleksij


--lPNVG2fSrjHIWS7kXN8AkPmvVdO9Hj5Sd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iF4EAREIAAYFAlU3+0IACgkQHwImuRkmbWnm2gEAlMhHqow62yWasYx5S+q260hP
VjSYY6cKWNB6KJ8Jqq0A/3zlSkBdRj3vy7C0L4qP46TWtpNHybG/jSagR67/f7TO
=P694
-----END PGP SIGNATURE-----

--lPNVG2fSrjHIWS7kXN8AkPmvVdO9Hj5Sd--
