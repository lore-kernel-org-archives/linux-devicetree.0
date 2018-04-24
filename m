From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 1/7] ARM: dts: sun8i: h3: fix ALL-H3-CC H3 ver VCC-1V2
 regulator voltage
Date: Tue, 24 Apr 2018 13:52:21 +0200
Message-ID: <20180424115221.tlb6r44u2drz7hnn@flea>
References: <20180424113424.13196-1-wens@csie.org>
 <20180424113424.13196-2-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="li5y6zrle3355vak"
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180424113424.13196-2-wens@csie.org>
Sender: stable-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--li5y6zrle3355vak
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 24, 2018 at 07:34:18PM +0800, Chen-Yu Tsai wrote:
> The voltage of the VCC-1V2 regulator on the ALL-H3-CC H3 ver. should be
> 1.2V, not the 3.3V currently defined in the device tree.
>=20
> Fix the voltage in the device tree.
>=20
> Fixes: 6ca358645d4d ("ARM: dts: sun8i: h3: Add dts file for Libre
> 		      Computer Board ALL-H3-CC H3 ver.")
> Cc: <stable@vger.kernel.org> # 4.16.x
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--li5y6zrle3355vak
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlrfGnQACgkQ0rTAlCFN
r3SaJxAAimCkIOtOoantuy10iemRZuYJSYGEEpMbY/B+2mnt2SjbFMTOtQWDVR3W
xxJtIScAVd5NrvZevgoovo7LKoSHQwPKWy6gNuKmplZmA9OCYb4q7xR3knObH+vQ
28b7iecf5ZsxoDhop+TwpB0Dscs8MFB/gyriWglLqtGgrQwBHT1pOn9ttuOhase1
VbaIkIiuA8L9DsPubgp7l2xvhr6kDXscog/JSj/MiBK/MMiof8m3CteS0THh6dUG
xRhfxCFiwwZJZkK/Ynmw2Bx3PS1CpDJCZGcVHgJG+TbKBaXtn69Sn3/eSEhHXsUD
+tp7tzlZZZhaY++wkYVkQllY1n2zzxGYYK/tCmEC+JNMj2MBkzaMfmVLA4IN9KtT
UTYtLbnbi8rploxtgQqNRLmBENWS//yID29UC3IULQ9GPQmhSsmbkrCZtN5Ph5P8
n9SFODx5fD1fZxTx/NWZd379O8Jr1WAtDmbKSdgOAJqxC1exndhqiTi7T2+jGURT
8t37+tbP6PiXWrusguhn1zFqEXqOjCi6XabW+unXuPgFXjpjgN/XqoCDEp6rhbd+
fDAMC7H7eOi3OZp5fyZA6acKt2by6dg53ivAOh6vhvH1ir7FBCAD7n1wuq4FLRxC
TLw3LH+yDZYVSpX9i0qER97UDT/xJ1Em5sqeGukQpMxzz5CvdgM=
=Hmfo
-----END PGP SIGNATURE-----

--li5y6zrle3355vak--
