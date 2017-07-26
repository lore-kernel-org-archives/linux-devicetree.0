From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 0/9] mfd: axp20x: Add basic support for AXP813
Date: Wed, 26 Jul 2017 10:32:42 +0200
Message-ID: <20170726083242.k35gnk22h35as55n@flea>
References: <20170726082832.16789-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="hrs6dd53v4fytgzv"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170726082832.16789-1-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--hrs6dd53v4fytgzv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 26, 2017 at 04:28:23PM +0800, Chen-Yu Tsai wrote:
> Hi everyone,
>=20
> This is v2 of my AXP813 support series. The device tree patches are
> based on my A83T MMC support series. These will go through the sunxi
> tree. The dt-binding and mfd patches are based on v4.13-rc1. These
> will go through Lee's mfd tree.
>=20
> Changes since v1:
>=20
>   - Provided relative path for ac100.txt in dt-bindings/mfd/axp20x.txt
>=20
>   - Added Rob's acks to dt-binding patches
>=20
>   - Added Quentin's "mfd: axp20x: use correct platform device id for
>     many PEK" patch to this series. This patch depends on mfd changes
>     in this series. It is included so Lee can take them together in
>     one go.
>=20
>   - Added Lee's mfd-acks to mfd patches
>=20
>   - Added axp818 compatible with axp813 fallback. The two chips are
>     identical except for the markings. The added compatible matches
>     what is actually on the board, to avoid confusing readers.
>=20
>   - Fixed up device tree patches to mention which board is changed
>=20
>   - Added device tree patches for the H8 homlet

For the whole serie,
Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--hrs6dd53v4fytgzv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZeFOqAAoJEBx+YmzsjxAgwTIP/AuEUSfLbTJ4x9TMdg/KUvXf
OUv0XyR2SIJCSb7TI/ZUZCIXqrVaHhsdbJ9Rory3thSH/aJBwdOFxUKVirYfOWaj
KR0V+rqZr6kOom4HGdM6hkU55tIMu73Su8sKSqfFQv2vrVG4q8Kdp/YDErK1HfeB
8KmVLZUn5PQDsque2iR3dOMGuHiGO6ZCt0y3VFRb2V38+VBgQrpDUVs+g5KaZt2l
dNtNxfi6DzttbbhqU3cDn/NPhEDKkENSGhiEvOphf9ofkPYF7UbRaVHjUcJfqsz7
2xPi2g9BPnK4j9raaokrLA7/Cgri8aEMlMJFCswJuQicA76bVq33VsuqXEzNOdPP
iJkAmtU1TjFAZKdw8s4XT9lSszzWZ2j9hWD0o63Zu5vpdAp+x77C1NMmZG/W6cGB
H+uk8lJqiwnBSSnvirA6r6/+I4NkNG4ABKW/yvaY+LtBw89Ti4e5GGNQxyEhL6Jt
ztrDU8xbMRBhF2xcqSI/Pp+L2DBYGEkLBWKzdmR4uGW7KeFi2hOR92t0i1yO/Z4D
VIftYa98MUpWz4P0Dd9A9ZhjPAqkF6bnhxfaVCIJJdSUWAtbPA4M3VGAqeeThLTQ
EyrSfsnDdef2pZY+h26N7L3p8FwYnoYVPEIkPBoOz5hqBtgzTuGdr50t0u4brW1W
J/ixTydXuYJFlJEvt5DH
=qMHF
-----END PGP SIGNATURE-----

--hrs6dd53v4fytgzv--
