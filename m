From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 1/7] ARM: dts: sun8i: tbs-a711: Enable bluetooth
Date: Mon, 1 Apr 2019 10:00:07 +0200
Message-ID: <20190401080007.6vzxijc6vsktg72h@flea>
References: <20190327001843.2420-1-megous@megous.com>
 <20190327001843.2420-2-megous@megous.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4exob3luluxypp5j"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190327001843.2420-2-megous@megous.com>
Sender: linux-kernel-owner@vger.kernel.org
To: megous@megous.com
Cc: wens@csie.org, robh@kernel.org, johan@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--4exob3luluxypp5j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Wed, Mar 27, 2019 at 01:18:37AM +0100, megous@megous.com wrote:
> From: Ondrej Jirman <megous@megous.com>
>
> TBS A711 tablet has a bcm20702a1 bluetooth chip (part of AP6210 WiFi/BT
> module) connected to UART1. Add node for the blutooth chip.
>
> The driver needs brcm/BCM20702A1.hcd firmware file to run.
>
> Signed-off-by: Ondrej Jirman <megous@megous.com>

Applied, thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--4exob3luluxypp5j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKHFBwAKCRDj7w1vZxhR
xXyLAP9bCWtNRTIAWTermq835YSBaQ22WJyb57nv83ywICiwqAEAok5eYrU4JfaB
nDiL02nHvIGGBQRuO2NiiLkRoPaShgU=
=t0jz
-----END PGP SIGNATURE-----

--4exob3luluxypp5j--
