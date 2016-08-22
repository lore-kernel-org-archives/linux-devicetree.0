From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 0/4] Add AXP209 GPIO driver
Date: Mon, 22 Aug 2016 15:36:14 +0200
Message-ID: <20160822133614.GN7104@lukather>
References: <20160720141139.25098-1-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="E0h0CbphJD8hN+Gf"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160720141139.25098-1-maxime.ripard@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Lee Jones <lee.jones@linaro.org>, Chen-Yu Tsai <wens@csie.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
List-Id: devicetree@vger.kernel.org


--E0h0CbphJD8hN+Gf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 20, 2016 at 04:11:35PM +0200, Maxime Ripard wrote:
> Hi,
>=20
> The axp209 PMIC used in combination to some Allwinner SoCs has a bunch
> of GPIOs accessible. Some boards use these to control their backlight
> or a few LEDs.
>=20
> There's supposed to be 4 of them, but the fourth one has a different
> configuration register scheme, and I couldn't find any board that was
> using this GPIO. It will be probably be supported eventually, but
> until then, we support only the first 3 GPIOs.

I merged the patches 3 and 4.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--E0h0CbphJD8hN+Gf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXuv/OAAoJEBx+YmzsjxAgaG0QAJPgD8gE7aN7D8ZaC/l9s9nD
Inb0Z6cAbRFJAb3p3j6N/KM2+8xe3u4um7+sIozZ5ixiW4SrKDTL7tGoteRMa+Hx
rgCbGWSS7mCAlih+DX6oYtgWrGLP5CJXnfGG9SOZ3ApZIlZ6BEjO/Oa7WVaehO2D
lI5RL9b+ux8a9gKDCOmuzusIEoICxEDujd2wvmGgVzst9NCq2x424riQZ2K4ucES
6bKs6KfxsAZEwm2IUzcn/7vy1RIJoj2LXkr7PYMGE82jhrcYK52MCz3Mth5tFufA
x4P5IJraEUit2wWDUTVHfqX1HT05exMat0AheBisFIFrVwXyUGgQgzjDvP59qaoL
KsVHySj/ogIvahXp/kSy9sXvoCBD4H5054x6AeW4hZ+4YU7dF+naFSkr+k+JU6uB
lhXrA0qfzEaNOynWDTufuX7f4Bs5g+H4vsxVZfLPeN3b4SziG16IbCb67q0aSKxh
EN0wEWROy7m+Rtws4oYN3FrswmDK1A1Mf9p+yCUIqhuYHNNg06HuQAGKxL0o9vF1
0KoyfVRIf6QvmRYz5hYnZ9SfRmX7CtEOoFG0nyD8mlBnoWAPCHRn0jLHN+rVcUSN
r1Bgi9okVimKvgM8LI5SfAsaSmzyvppElloiRkzEl/OBVX2QLY9zD41M8YG9rETX
tXcaFu43aMWdVR734ZBn
=4Veq
-----END PGP SIGNATURE-----

--E0h0CbphJD8hN+Gf--
