From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v8 02/15] drm/sun4i: tcon: Compute DCLK dividers based on
 format, lanes
Date: Mon, 11 Mar 2019 16:38:47 +0100
Message-ID: <20190311153847.oz6ruqmptaq2befn@flea>
References: <20190311133637.18334-1-jagan@amarulasolutions.com>
 <20190311133637.18334-3-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="unl66vzthkbzxsc5"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190311133637.18334-3-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, Michael Trimarchi <michael@amarulasolutions.com>, linux-amarula@amarulasolutions.com, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--unl66vzthkbzxsc5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2019 at 07:06:24PM +0530, Jagan Teki wrote:
> pll-video =3D> pll-mipi =3D> tcon0 =3D> tcon0-pixel-clock is the typical
> MIPI clock topology in Allwinner DSI controller.
>=20
> TCON dotclock driver is computing the desired DCLK divider based on
> panel pixel clock along with input DCLK min, max divider values from
> tcon driver and that would eventually set the pll-mipi clock rate.
>=20
> The current code allows the TCON clock divider to have a default 4
> for min, max ranges that would fail to compute the desired pll-mipi
> rate while supporting new panels.
>=20
> So, add the computation logic 'format/lanes' to dclk min and max dividers
> and instead of default 4. This computation logic align with Allwinner A64
> BSP, hoping that would work even for A33.

Last time we discussed this, we found out that this wasn't the case,
even in the BSP.

What compelling evidence have you found that makes you say otherwise?

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--unl66vzthkbzxsc5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXIaBBwAKCRDj7w1vZxhR
xQmDAP0fEPwWNXxHnuOzc2Hp56CvHmpJBy1gADfKKVXjLURIdwD+Mwmlmq8ey7vM
b5JlVu2kucnFP5+EM9iGeaCILBsREw0=
=4Bo1
-----END PGP SIGNATURE-----

--unl66vzthkbzxsc5--
