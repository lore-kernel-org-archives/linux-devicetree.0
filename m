From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] ARM: dts: sunxi: Add mdio bus sub-node to GMAC
Date: Wed, 14 Aug 2019 08:17:17 +0200
Message-ID: <20190814061717.54uuat3cypxjucfq@flea>
References: <20190814042208.9646-1-wens@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ca47qifq3uyu2lgr"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190814042208.9646-1-wens@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--ca47qifq3uyu2lgr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 14, 2019 at 12:22:08PM +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
>
> The DWMAC binding never supported having the Ethernet PHY node as a
> direct child to the controller, nor did it support the "phy" property
> as a way to specify which Ethernet PHY to use. What seemed to work
> was simply the implementation ignoring the "phy" property and instead
> probing all addresses on the MDIO bus and using the first available
> one.
>
> The recent switch from "phy" to "phy-handle" breaks the assumptions
> of the implementation, and does not match what the binding requires.
> The binding requires that if an MDIO bus is described, it shall be
> a sub-node with the "snps,dwmac-mdio" compatible string.
>
> Add a device node for the MDIO bus, and move the Ethernet PHY node
> under it. Also fix up the #address-cells and #size-cells properties
> where needed.
>
> Fixes: de332de26d19 ("ARM: dts: sunxi: Switch from phy to phy-handle")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ca47qifq3uyu2lgr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXVOnbQAKCRDj7w1vZxhR
xdDUAQCnpVdT3KpOHMNy0ph4E404oIUBtZ6WuuLwZ9M2kNjwgQEAlByupn0xScxl
omeoaNbOWFWe22TFHJ0najT2LdaC2Q0=
=LPlq
-----END PGP SIGNATURE-----

--ca47qifq3uyu2lgr--
