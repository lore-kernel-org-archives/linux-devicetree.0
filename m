From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 13/15] ARM: dts: sun8i: r40: Add clock accuracy for
 external oscillators
Date: Wed, 28 Nov 2018 11:28:00 +0100
Message-ID: <20181128102800.sijdx26dded6mc2y@flea>
References: <20181128093013.24442-1-wens@csie.org>
 <20181128093013.24442-15-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jafmkafzzzgkepai"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181128093013.24442-15-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Alessandro Zummo <a.zummo@towertech.it>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--jafmkafzzzgkepai
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 28, 2018 at 05:30:11PM +0800, Chen-Yu Tsai wrote:
> The R40 datasheet specifies a tolerance range for the external
> oscillators used. Add them to the device tree as the clock accuracy.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--jafmkafzzzgkepai
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCW/5tsAAKCRDj7w1vZxhR
xfRCAP9IcwRUe/p2hqLOXNIjemX9rcgKTbIDsTLXp9fDHNC1bwEAy1LP9YV9SQmE
MJyB7ZJPXYqkkUnIrJcY/IVMDwuqEAA=
=L7S9
-----END PGP SIGNATURE-----

--jafmkafzzzgkepai--
