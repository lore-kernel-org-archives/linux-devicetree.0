From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] ARM: dts: sunxi: Fix PMU compatible strings
Date: Fri, 7 Dec 2018 15:08:43 +0100
Message-ID: <20181207140842.kkqaqefrmgcx6nkw@flea>
References: <20181206191142.14118-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cjloinzbxygaj26u"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181206191142.14118-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Will Deacon <will.deacon@arm.com>, Chen-Yu Tsai <wens@csie.org>
List-Id: devicetree@vger.kernel.org


--cjloinzbxygaj26u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 06, 2018 at 01:11:42PM -0600, Rob Herring wrote:
> "arm,cortex-a15-pmu" is not a valid fallback compatible string for an
> Cortex-A7 PMU, so drop it.
>=20
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--cjloinzbxygaj26u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXAp+6gAKCRDj7w1vZxhR
xdcWAP0SfKjQg2htIHVLOTja6/XP9vJlADsV5ayhochHcLEEPAD/Vo3ihG4M2T73
QOllzOlRh+1G+OZIeKwzgVgx9IGtugI=
=HuER
-----END PGP SIGNATURE-----

--cjloinzbxygaj26u--
