From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] arm64: dts: allwinner: a64: pine64-plus: Add PHY
 regulator delay
Date: Tue, 27 Aug 2019 15:34:43 +0200
Message-ID: <20190827133443.fdxl5wjmgkerc3uh@flea>
References: <20190825130336.14154-1-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hjrahydg6q3alewh"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190825130336.14154-1-jernej.skrabec@siol.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Ondrej Jirman <megous@megous.com>
List-Id: devicetree@vger.kernel.org


--hjrahydg6q3alewh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 25, 2019 at 03:03:36PM +0200, Jernej Skrabec wrote:
> Depending on kernel and bootloader configuration, it's possible that
> Realtek ethernet PHY isn't powered on properly. It needs some time
> before it can be used.
>
> Fix that by adding 100ms ramp delay to regulator responsible for
> powering PHY.
>
> Fixes: 94dcfdc77fc5 ("arm64: allwinner: pine64-plus: Enable dwmac-sun8i")
> Suggested-by: Ondrej Jirman <megous@megous.com>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

How was that delay found?

It should at least have a comment explaining why it's there.

Thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--hjrahydg6q3alewh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXWUxcwAKCRDj7w1vZxhR
xQcDAP9PcjmKcemio5RyGsvXfmaqZINOqCwOKsTiONK54RVLbQEAgaFOmHxFyHfJ
oQcsq82EY17PkSDieqvgY9JWjjbwrgo=
=kJyJ
-----END PGP SIGNATURE-----

--hjrahydg6q3alewh--
