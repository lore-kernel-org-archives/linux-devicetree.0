From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 0/2] Introduce Tanix TX6 box DT
Date: Mon, 19 Aug 2019 15:44:59 +0200
Message-ID: <20190819134459.vgqaxekwkj423pyk@flea>
References: <20190816205342.29552-1-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="czkf5do6ez7nazvr"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190816205342.29552-1-jernej.skrabec@siol.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--czkf5do6ez7nazvr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 16, 2019 at 10:53:40PM +0200, Jernej Skrabec wrote:
> This series adds support for Tanix TX6 box:
> - Allwinner H6 Quad-core 64-bit ARM Cortex-A53
> - GPU Mali-T720
> - 4GiB DDR3 RAM (3GiB useable)
> - 100Mbps EMAC via AC200 EPHY
> - Cdtech 47822BS Wifi/BT
> - 2x USB 2.0 Host and 1x USB 3.0 Host
> - HDMI port
> - IR receiver
> - 64GiB eMMC
> - 5V/2A DC power supply
>
> Patch 1 adds compatible strings to dt bindings documentation.
>
> Patch 2 adds Tanix TX6 DT.

Applied both, thanks

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--czkf5do6ez7nazvr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXVqn2wAKCRDj7w1vZxhR
xVyBAPoCHTWn7mwS2Vjc+4SW3htnMaF+Tsx7LHIOKuzGpyPjigEAyA75QveVmE7q
ryci36c243oW6/wVymR/Yj730Z2otw0=
=nYs9
-----END PGP SIGNATURE-----

--czkf5do6ez7nazvr--
