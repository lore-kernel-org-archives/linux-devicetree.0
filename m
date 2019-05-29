From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: sun8i: a83t: Add device node for CSI
 (Camera Sensor Interface)
Date: Wed, 29 May 2019 13:12:36 +0200
Message-ID: <20190529111236.gnk4bics5xrfxyql@flea>
References: <20190520150637.23557-1-megous@megous.com>
 <20190520150637.23557-4-megous@megous.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zlv4nldcdeunkux4"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190520150637.23557-4-megous@megous.com>
Sender: linux-kernel-owner@vger.kernel.org
To: megous@megous.com
Cc: Chen-Yu Tsai <wens@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--zlv4nldcdeunkux4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 20, 2019 at 05:06:37PM +0200, megous@megous.com wrote:
> From: Chen-Yu Tsai <wens@csie.org>
>
> The A83T SoC has a camera sensor interface (known as CSI in Allwinner
> lingo), which is similar to the one found on the A64 and H3. The only
> difference seems to be that support of MIPI CSI through a connected
> MIPI CSI-2 bridge.
>
> Add a device node for it, and pinctrl nodes for the commonly used MCLK
> and 8-bit parallel interface. The property /omit-if-no-ref/ is added to
> the pinctrl nodes to keep the device tree blob size down if they are
> unused.
>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Ondrej Jirman <megous@megous.com>

Applied, thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--zlv4nldcdeunkux4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXO5pJAAKCRDj7w1vZxhR
xfugAP9uM3nhnPYa61YOa1J7hJC/ogaqkG64ngXh7+5a0atLJgEAiFczeAYSxJpM
w49Kak6GmlRewxlL2aBTHVZryI9C5gA=
=G/QN
-----END PGP SIGNATURE-----

--zlv4nldcdeunkux4--
