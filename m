From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 01/15] clk: sunxi-ng: Add check for minimal rate to NM PLLs
Date: Mon, 26 Feb 2018 10:38:00 +0100
Message-ID: <20180226093800.uwbo54wrdcwmsyzh@flea.lan>
References: <20180224214545.3740-1-jernej.skrabec@siol.net>
 <20180224214545.3740-2-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0300863989=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180224214545.3740-2-jernej.skrabec@siol.net>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie, mturquette@baylibre.com, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, sboyd@kernel.org, wens@csie.org, robh+dt@kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0300863989==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="73ci3fsbvg6labpp"
Content-Disposition: inline


--73ci3fsbvg6labpp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Feb 24, 2018 at 10:45:31PM +0100, Jernej Skrabec wrote:
> Some NM PLLs doesn't work well when their output clock rate is set below
> certain rate.
>=20
> Add support for that constrain.

In such a case, you should round the rate to the minimum the clock can
operate at, and not return an error.

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--73ci3fsbvg6labpp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlqT1XgACgkQ0rTAlCFN
r3R80Q/9H17omm6C3YzI5Iio3y7R/y6XVWsQI+vmAkvLe6uhJiHN3CnHcxB3KbZp
aLOpd9UNa7a7+y+laW962Py+nYjY3SLxmJiTy3Cm/r++Wqw6JUBhVKOOcZJQ6lQH
WVnnLN7egl6SdV6Rau491Cw6gixZUwOvoJ5S4ip8aaKm7L3sgE6ypMhAWBj5KHM1
7DlvmpRr0EYaoFdUHNOiiU8B2hUiJvQh457OqVfF0tKZJSRujqpBjKBi6j3WHaKR
OBnHhj3ND2qjnpZNUBPPfQwzPM0l5vQUbgqmDerJmb7bO8vgsrekGeg5AsF1qZsK
r7MbzQO7HvgU6WUi2PfFUNA6IRT0OtV3grAxqiu8r7ehd+8mWwf2u0PFO4jOpM1j
vypQiT9GJFLxgfcu4Nk+ZPU9kBO9FTgvWaKBZLiPLCmzEosTagc2MbXHKyeH13T9
Y3DdMN0JRir1RK7rK7mMNkADBxZrfO3dLNTn3X3rRedpaw8kdBeUOXFCVjBmF0l2
vKIR5nNWJ7bJgnHZUsm5bzct1VCzAr65cItFMk+4c8zLotw2Ku8Q+9QwgkTeWpOu
+torKDKtakDZTMhNOizgJqQ6cQu/p3WZVJ1YgtMGb1ZJhGIYsU2FGp6rEibvS1rs
o1aiA+iSdOjs9offi2pcYJgEJYGnvqj/m4BZoJ9Nv0ikl5+jucg=
=jhPH
-----END PGP SIGNATURE-----

--73ci3fsbvg6labpp--

--===============0300863989==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0300863989==--
