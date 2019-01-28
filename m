From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 4/5] ARM: dts: sun5i: q8-tablet: Add LCD Panel power
 supply
Date: Mon, 28 Jan 2019 11:53:08 +0100
Message-ID: <20190128105308.jynl4hdptiprkhqo@flea>
References: <20190127144838.3578-1-wens@csie.org>
 <20190127144838.3578-5-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nzgdkp24ycyqpod3"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190127144838.3578-5-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--nzgdkp24ycyqpod3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 27, 2019 at 10:48:37PM +0800, Chen-Yu Tsai wrote:
> The A13 Q8 tablet, following the A13 reference tablet design, has the
> system's fixed 3.3V rail feed the VCC supply of the LCD panel.
> Additional voltage rails used by the panel are generated using a
> regulator fed from the unregulated IPSOUT output of the PMIC. The latter
> is unrepresentable in the device tree. Both are controlled with MOSFETs
> by the enable GPIO added in the previous patch. The actual enable or
> reset pin for the panel is tied directly to LCD-VCC after the MOSFET.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nzgdkp24ycyqpod3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXE7fFAAKCRDj7w1vZxhR
xTsJAP4lShKIc4E7kP7BDzoBlb9H7+MuXbm+Z4cAOHdUngD7yQEA6DWAGlYD+iM7
nuxiy1NvZe3U96ZAy8XnBMpC6eNj3wk=
=wHYU
-----END PGP SIGNATURE-----

--nzgdkp24ycyqpod3--
