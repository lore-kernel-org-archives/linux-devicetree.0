From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] ARM: dts: sun6i: Add clock-output-names to osc24M clock
Date: Wed, 9 Jan 2019 11:11:37 +0100
Message-ID: <20190109101137.sh6ioyvq5wm6ug23@flea>
References: <20190108072526.2621-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nrrmjmmauuftwoov"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190108072526.2621-1-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--nrrmjmmauuftwoov
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 08, 2019 at 03:25:26PM +0800, Chen-Yu Tsai wrote:
> The osc24M clock does not have a "clock-output-names" property, which
> means that the clock name is derived from the node name in Linux. The
> node name was changed in commit acfd5bbe2641 ("ARM: dts: sun6i: Change
> clock node names to avoid warnings"). This breaks Linux as the sunxi-ng
> clock driver implicitly depends on the external clock being named
> "osc24M".
>=20
> Add a "clock-output-names" property to restore the previous behavior.
>=20
> Fixes: acfd5bbe2641 ("ARM: dts: sun6i: Change clock node names to avoid
> 		      warnings")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nrrmjmmauuftwoov
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXDXI2QAKCRDj7w1vZxhR
xZmoAQDm3bL9J9jdFm0jYD84rJW8RuzHZuBZQrjMhlByqYpQvQEAo9PkDmEnw3O+
FXvx0AK+HIKpG+Beknn8yqrrudy3+wI=
=rytg
-----END PGP SIGNATURE-----

--nrrmjmmauuftwoov--
