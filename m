From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v3 2/6] clk: sunxi-ng: mux: Add support for mux tables
Date: Thu, 25 Aug 2016 22:27:04 +0200
Message-ID: <20160825202704.GC32598@lukather>
References: <20160825062200.17206-1-wens@csie.org>
 <20160825062200.17206-3-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="3siQDZowHQqNOShm"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160825062200.17206-3-wens@csie.org>
Sender: linux-clk-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--3siQDZowHQqNOShm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 25, 2016 at 02:21:56PM +0800, Chen-Yu Tsai wrote:
> Some clock muxes have holes, i.e. invalid or unconnected inputs,
> between parent mux values.
>=20
> Add support for specifying a mux table to map clock parents to
> mux values.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--3siQDZowHQqNOShm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXv1SYAAoJEBx+YmzsjxAgEYQP/0r8kd26zTesOgMayp955SQN
erEwSWA4pT77R7OzRqq27SqBMjpY96EK4misr48LTd1unJcVynQ/DjFKvJJAaneR
9upNZY18Mv9PPFcbuYj/tKkR3BDB2y2KDPgvYTZSzZ6/x/uhyh3qlwpHXpc3hefd
Y6JPxNI3CGnkj74secT5E5HfICc+5jR8oR+TDx0kN4nzuHkoXx+x1RZW9kjFJx/F
WlY2LSbLhskbdIbN953CIbv6OwtjWoKOcLkvekJ+/Y+j0mFuJWOouuGAQwPtjvul
7oCFJ5wtG6rkolsY1eWhNdPWOP2fg1zXmc0KzUXCy4OC0+6hqBBqkLtmrky0wtX2
V/xbLG9y9YBCPrI0yTYgT9MnRdwXpBHquqhAwQmFDdqIq7PbZhaD0KQEhgwMKHlP
Ej/2EO2yCarbA/ijq5rnKmOMTL+Vnnr0k3/WCPZrEN0qM3UX/t2g02ivEZKXce63
GK6M+Ml1d6iJvLj/2cxmsTYPIAmYhJOOFORwS6VS71DPi2vwkRvUWSKvcb3C0tnB
tVnDfPTMpfSJf+XUG7ndc2Z53dkbC3/RB0ClmMd50x/K/uQyX3Fpy9m5BqCVZk+y
h5uzoO600QXLIRx1fEpawQkk6ELYROMjJzgJ21CrEDqL3dJhiv94kUnyzklgt3TZ
t6Kvizgdj0BpE8HhGnE9
=/zyL
-----END PGP SIGNATURE-----

--3siQDZowHQqNOShm--
