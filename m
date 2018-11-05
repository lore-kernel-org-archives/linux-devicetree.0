From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 1/7] clk: sunxi-ng: sun50i: h6: Fix MMC clock mux width
Date: Mon, 5 Nov 2018 09:41:54 +0100
Message-ID: <20181105084154.l7g2dp33qlasgnrg@flea>
References: <20181031183634.29640-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ecup2xmbdcmn2nj5"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181031183634.29640-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--ecup2xmbdcmn2nj5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 01, 2018 at 12:06:28AM +0530, Jagan Teki wrote:
> MUX bits for MMC clock register range are 25:24 where 24 is shift
> and 2 is width So fix the width number from 3 to 2.
>=20
> Fixes: 524353ea480b ("clk: sunxi-ng: add support for the Allwinner H6 CCU=
")
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Applied for 4.21, thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ecup2xmbdcmn2nj5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCW+ACUQAKCRDj7w1vZxhR
xbSRAQCN4bjLaSm1Tx9GEK/FzPNYkdkTMqXfRfLXvbveWy9ucQD+Oq7J8rOd35/N
BHp18t+Rq54zZLbqZitV+c/8pJuqmA0=
=k91D
-----END PGP SIGNATURE-----

--ecup2xmbdcmn2nj5--
