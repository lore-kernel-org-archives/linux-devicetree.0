From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 5/6] ARM: dts: sun8i: a83t: Add I2C2 pinmux setting for
 PE pins
Date: Tue, 9 Apr 2019 09:58:34 +0200
Message-ID: <20190409075834.khfdfs2ybictc5ed@flea>
References: <20190408165744.11672-1-wens@kernel.org>
 <20190408165744.11672-6-wens@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lg36cmib6nhpsyhd"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190408165744.11672-6-wens@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
List-Id: devicetree@vger.kernel.org


--lg36cmib6nhpsyhd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 09, 2019 at 12:57:43AM +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
>
> I2C2 is available on the PE pingroup, on the same pins as the camera
> sensor interface (CSI) controller's camera control interface pins.
> This provides an option to use I2C2 instead of that control interface
> to configure camera sensors.
>
> Add a pinctrl node for it. The property /omit-if-no-ref/ is added to
> keep the device tree blob size down if it is unused.
>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--lg36cmib6nhpsyhd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKxQqgAKCRDj7w1vZxhR
xfMAAQCt8TQrrJcRawbPWK0ujCwuxLKIxfQzAwC4ySBAN67KiwEA7eUIdlt8ZEj/
RgKgOU1X5oXUHKfnuJmA+HRbL0khIQw=
=hrDA
-----END PGP SIGNATURE-----

--lg36cmib6nhpsyhd--
