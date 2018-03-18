From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCHv2 5/5] arm64: allwinner: a64: Add support for TERES-I
 laptop
Date: Sun, 18 Mar 2018 21:22:51 +0100
Message-ID: <20180318202251.5gpv6sblfr4edxmj@flea>
References: <20180315162510.11669-1-harald@ccbib.org>
 <20180315162510.11669-6-harald@ccbib.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yxlv6fvadu2pgwgy"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180315162510.11669-6-harald@ccbib.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Harald Geyer <harald@ccbib.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Icenowy Zheng <icenowy@aosc.io>, info@olimex.com
List-Id: devicetree@vger.kernel.org


--yxlv6fvadu2pgwgy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 15, 2018 at 04:25:10PM +0000, Harald Geyer wrote:
> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		capslock {
> +			label =3D "leds:green:capslock";

The first part is supposed to be the name of the boards. I did sed
s/leds/teres-i/, and applied, together with all the patches but the
PWM (so I had to drop the backlight node as well).

Please coordinate with Andre about who should send the PWM support.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--yxlv6fvadu2pgwgy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlquypoACgkQ0rTAlCFN
r3T2fg/+OAkOFv89UXeoHwoIN3aKOHSZyNuBlc3vw96MEhJHkz8jZiZ6NSwwV+Aj
B4kJFnN2zBdfymkT5IcFmASVe4lQ6+FU0rmSYzXr07rnnSzG2zQF7R99UgrUbAwc
mL6r6sfq0Ex0Ouk6ePKdSdYkWbfEkEp9BMyMfTBQuTbWR15vFsxeyFZOO7fMSU5d
mijUoxe7ZNo1YYlrQ1rtcm9xdECriV8potsBJWDBToSpEnVHB5yrWfzHF5YLPnde
++bXH/xjsZBMVvN3KtcEHJoyybtHJhvAzysDdLCmQiySAwx5wnChvzLk+C0H6zcV
IUoshUkztspVHtWq1inWL1J8wR2mhQIj8A31Cymxq7G7pnR+ydy3PGhFw+lGzOUD
H5Sz59tm0ZesU6k46W1GjD0QuqX62ATlSMBjoT1TgrbC0XjuRC37UuGeg1FepW67
bEkaFFm9PkSvUpqIu1r1hGWCpzgN9N83T1Yni7LtJfsH/pVRNH6WFMVlQTBOSh3t
wRYU/IgYmALq/0A5OXwrFqvvk9JVuOJx0nKsVUUC8ciLcBoD0544tMK3mkYrmGKO
437SBZQCc7MD2nvEs1t/Q5SrudxcCoBCb8qYOf2cXTfV2GCkSol8otH8HytmFVD/
L+0/eFpFF8dZiGPMdih/yir1JZXCWpZoa5Vh4bPqIvc+q+TyKzQ=
=4pjJ
-----END PGP SIGNATURE-----

--yxlv6fvadu2pgwgy--
