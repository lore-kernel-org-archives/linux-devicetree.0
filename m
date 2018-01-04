From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/2] arm64: dts: sunxi: Switch MMC nodes away from
 cd-inverted property
Date: Thu, 4 Jan 2018 16:04:10 +0100
Message-ID: <20180104150410.c2m2p4suca66chko@flea.lan>
References: <20171222205738.2389-1-tuomas@tuxera.com>
 <20171222205738.2389-2-tuomas@tuxera.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kzr2lz22eorktoha"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171222205738.2389-2-tuomas-yrGDUoBaLx3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tuomas Tynkkynen <tuomas-yrGDUoBaLx3QT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--kzr2lz22eorktoha
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 22, 2017 at 10:57:38PM +0200, Tuomas Tynkkynen wrote:
> Using the cd-inverted property is not useful when GPIOs are used as card
> detects since the polarity can be specified with the usual
> GPIO_ACTIVE_(HIGH|LOW) GPIO flags. It has also caused confusion for
> U-Boot developers, so migrate all sunxi boards away from cd-inverted.
>=20
> Signed-off-by: Tuomas Tynkkynen <tuomas-yrGDUoBaLx3QT0dZR+AlfA@public.gmane.org>

Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--kzr2lz22eorktoha
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpOQmkACgkQ0rTAlCFN
r3SFUA//aVRr/ODTTM4M5OAWrHHhRjMFaTvfFzkLIk6oCAnWtz6FUcAugL/cNc7u
g+zEiXpuO30voCNcLWk0vx4XyMZIajsM3mE8rVvqdQsKgbXgGbWa3clN0Ag4Yme/
+Ao4ButdwMdn5w3v3o9r+/LzzNBqIMQTLUxkWV040qIkd+soevMsk8G+Opi766As
Uv6AdHTaM8SpNOB7fPZgY3zuuTJU8+kFbDWBX7evEhX4UttJuMjuax1LoQRrMX7g
1gFuOMmw/n0Vj4mEEfTAaaKVVOOO8hgjVhnZhy6gOFkaruL6pdP1tPfq3gR/XsVW
0rZQnIQvYy0BIvxpEKwibF0c6IaJK/rfVn7sg6qVYmgx77FqcUQBlxLGxbzznW6+
o5NfxeODZA3J+6zHegCjhz7QVN/rIf3kUwuB1ExVYqLdSnlgf6mL70N7DLoYi3n7
GriiK3JPM4NVAOqlSKHu5xY71sel4bzyW858rE1RSTSlAHgb07nnzoz0JOR8rPqR
M8u6SfyhEuo2VlHrF+WjNAHrbP+JYlBq1zb1gTQ+9EEByyF7k3xjaMstYpgvnbqq
2fXbcF0/TbQbVPFR5h/tQYKmQ1+b9F6yzm8Hb4Z13QLl/M2QSUDAP5DvCLie1aDB
kpl8zFIikyOIyh3Uk5JLzIMwM23S+mva+iybPmc27v7H7uaaU5E=
=wOUb
-----END PGP SIGNATURE-----

--kzr2lz22eorktoha--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
