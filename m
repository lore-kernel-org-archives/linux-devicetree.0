From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] arm64: dts: allwinner: h6: Move GIC device node fix base
 address ordering
Date: Mon, 28 Jan 2019 11:51:09 +0100
Message-ID: <20190128105109.xijxn7wndund3ric@flea>
References: <20190127163930.985-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tixpi6cs6e2fc5of"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190127163930.985-1-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--tixpi6cs6e2fc5of
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 28, 2019 at 12:39:30AM +0800, Chen-Yu Tsai wrote:
> The GIC device node was placed out of order in the initial device tree
> submission. Move it so the nodes are correctly sorted by base address
> again.
>=20
> Fixes: e54be32d0273 ("arm64: allwinner: h6: add the basical Allwinner H6 =
DTSI file")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--tixpi6cs6e2fc5of
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXE7enAAKCRDj7w1vZxhR
xUEhAPsFv64cA9oqagr7M+btWbx1dy+BrVWq0CZlEBlcM9I5FAD/fiYfjkCqeqoi
tdqrZhJGV4pDJJKRpVHL1qNcjBk06Qo=
=iVZa
-----END PGP SIGNATURE-----

--tixpi6cs6e2fc5of--
