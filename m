From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 2/3] media: Add lane checks for Cadence CSI2TX
Date: Sat, 20 Jul 2019 10:26:11 +0200
Message-ID: <20190720082611.qpsbrlwti3wydigk@flea>
References: <20190718111509.29924-1-jank@cadence.com>
 <20190718111509.29924-3-jank@cadence.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jgvxedzjy43xc5rm"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190718111509.29924-3-jank@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jan Kotas <jank@cadence.com>
Cc: mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--jgvxedzjy43xc5rm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

65;5603;1c
On Thu, Jul 18, 2019 at 12:15:08PM +0100, Jan Kotas wrote:
> This patch adds line checks for CSI2TX, to prevent
> clock lane being used as a data lane.
>
> Signed-off-by: Jan Kotas <jank@cadence.com>

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--jgvxedzjy43xc5rm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXTLQIwAKCRDj7w1vZxhR
xatxAP0ZArJB75RtUGlL1iE13NnSYhngB3+XOjCzp1A1y09bgwEA6QhuXaYc0hxB
NdiD2xowXQPWP10goaY8YOoWs1DZQAs=
=Je75
-----END PGP SIGNATURE-----

--jgvxedzjy43xc5rm--
