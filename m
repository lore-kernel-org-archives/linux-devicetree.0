From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 2/5] ARM: dts: sun5i: q8-tablet: Move panel properties to
 correct node level
Date: Mon, 28 Jan 2019 11:52:19 +0100
Message-ID: <20190128105219.wcqbvhwx7jol6xru@flea>
References: <20190127144838.3578-1-wens@csie.org>
 <20190127144838.3578-3-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6yewbv6ulml6pqsg"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190127144838.3578-3-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--6yewbv6ulml6pqsg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 27, 2019 at 10:48:35PM +0800, Chen-Yu Tsai wrote:
> The panel backlight and enable GPIO comments were incorrectly placed
> in the input port, while it should have been in the panel node itself.
>=20
> Move them to the correct position.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--6yewbv6ulml6pqsg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXE7e4gAKCRDj7w1vZxhR
xfueAQCjCmHYrA3dtRPvjiEa025rCGRZz+ocfCBr1Hiv45CA6AEAix/jzeKZsxQ0
VFWfkwqFeDEf6n3kTXp9u82cb38QmQA=
=l5GA
-----END PGP SIGNATURE-----

--6yewbv6ulml6pqsg--
