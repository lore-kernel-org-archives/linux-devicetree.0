From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 1/6] clk: sunxi-ng: a83t: Add pll-video0 as parent of
 csi-mclk
Date: Tue, 9 Apr 2019 09:57:09 +0200
Message-ID: <20190409075709.mdh62rdpiqmcfjmc@flea>
References: <20190408165744.11672-1-wens@kernel.org>
 <20190408165744.11672-2-wens@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ljfwd3xjzjevfhm6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190408165744.11672-2-wens@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
List-Id: devicetree@vger.kernel.org


--ljfwd3xjzjevfhm6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 09, 2019 at 12:57:39AM +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
>
> Allwinner's BSP for the A83T lists pll-video0 as the first parent to
> csi-mclk with index 0. This parent is not listed in the datasheet, but
> actually works, and makes more sense considering the index is the
> default value out of reset.
>
> Add pll-video0 as a parent to csi-mclk with index 0.
>
> Fixes: 05359be1176b ("clk: sunxi-ng: Add driver for A83T CCU")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ljfwd3xjzjevfhm6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKxQVQAKCRDj7w1vZxhR
xW9UAP9bCO7liBbWiegGWBL/zx+00RNayMeVqwJyb5qxd4gVYQD+O39nkEH/FRKA
iV3T3zEzgmfYwY3zYDTskH6Zyg6Kzgg=
=URzt
-----END PGP SIGNATURE-----

--ljfwd3xjzjevfhm6--
