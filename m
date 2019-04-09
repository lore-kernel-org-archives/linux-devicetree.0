From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 2/6] dt-bindings: media: sun6i-csi: Add compatible string
 for A83T variant
Date: Tue, 9 Apr 2019 09:57:20 +0200
Message-ID: <20190409075720.2wcb4vxgfrglurca@flea>
References: <20190408165744.11672-1-wens@kernel.org>
 <20190408165744.11672-3-wens@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mxelptzuo73wdvyh"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190408165744.11672-3-wens@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
List-Id: devicetree@vger.kernel.org


--mxelptzuo73wdvyh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 09, 2019 at 12:57:40AM +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
>
> The A83T SoC has a camera sensor interface (known as CSI in Allwinner
> lingo), which is similar to the one found on the A64 and H3. The only
> difference seems to be that support of MIPI CSI through a connected
> MIPI CSI-2 bridge.
>
> Add a compatible string for this variant.
>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--mxelptzuo73wdvyh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKxQYAAKCRDj7w1vZxhR
xS1uAQDasKM/U/lQCplMzhCDbaO7SOT1yQz/VJcAQ3s7pFTz8AD/cQf2EzI1rRkZ
dYubrUhQxDtX1G/+NJQqJVgGzCnNQAk=
=V48v
-----END PGP SIGNATURE-----

--mxelptzuo73wdvyh--
