From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 00/11] ARM: sun8i: a23: Enable display pipeline
Date: Fri, 25 Jan 2019 10:44:22 +0100
Message-ID: <20190125094422.cpisr63pk7af3nnq@flea>
References: <20190125032314.20915-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rscg5zrsk3zckgor"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190125032314.20915-1-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--rscg5zrsk3zckgor
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 25, 2019 at 11:23:03AM +0800, Chen-Yu Tsai wrote:
> Hi everyone,
>=20
> This series enables the display pipeline on the Allwinner A23 SoC.
> A few fixes are included for corner cases when the frontend isn't
> enabled.
>=20
> The A23 display pipeline is very much the same as the A33, except
> that the A23 does not have the SAT IP block embedded within the
> display backend.
>=20
> MIPI DSI is not covered as I do not have a device that uses it.
>=20
> Patch 1 fixes the pll-mipi clock on the A23.
>=20
> Patch 2 adds compatible strings for the various hardware blocks
> of the A23 display pipeline.
>=20
> Patch 3 through 5 fix some issues in our DRM plane support, namely
> declaring support for formats when we shouldn't.
>=20
> Patch 6 adds support for the A23 display pipeline to the driver.
>=20
> Patch 7 is a small cleanup before moving the display pipeline device
> nodes.
>=20
> Patch 8 moves the display nodes from the A33-specific dtsi file to
> the A23-A33 shared dtsi file. Note that the MIPI DSI device nodes are
> not moved.
>=20
> Patch 9 adds compatible strings to the display nodes in the A23-specific
> dtsi file.
>=20
> Patch 10 enables the display pipeline for the shared A23/A33 Q8 tablet
> dtsi file. The compatible string should be filled in by the tablet dts
> files.
>=20
> Patch 11 fills in the compatible string for the standard A23 Q8 tablet.
> Note the compatible string is not for the specific model used in the
> tablet, as it varies between production runs. Rather it is just one that
> works.
>=20
> Please have a look. Patch 3 might be worth applying as a fix, but might
> not be worth the trouble. It could just as easily be applied for -next
> and then backported.
>=20
> Also, the fixes tags are no longer line wrapped, unlike patches I've
> sent in the past.

Applied all, thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--rscg5zrsk3zckgor
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXEradQAKCRDj7w1vZxhR
xU1iAP4gdJXMRt2zbfjcLw4OB2DzAijDTr0FQfYjolcT9AHgHgD+I0KOJCZ9tJAM
iiCJXi+JYKLhP+SyLjnL4p20FOAw+ww=
=+w+u
-----END PGP SIGNATURE-----

--rscg5zrsk3zckgor--
