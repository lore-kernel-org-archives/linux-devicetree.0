From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 5/5] ARM: dts: sun5i: q8-tablet: Use
 bananapi,s070wv20-ct16 panel compatible
Date: Mon, 28 Jan 2019 11:53:44 +0100
Message-ID: <20190128105344.y7m5gruyamsp3r7s@flea>
References: <20190127144838.3578-1-wens@csie.org>
 <20190127144838.3578-6-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="twqhz7ijjeox7jmv"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190127144838.3578-6-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--twqhz7ijjeox7jmv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 27, 2019 at 10:48:38PM +0800, Chen-Yu Tsai wrote:
> The compatible string for the LCD panel used for the Q8 tablets are just
> a placeholder that was shown to be compatible with the actual panels
> found on these devices. The real panels do not have any identifiable
> markings and vary between production runs.
>=20
> The compatibe string previously used had a pixel clock that could not
> be accurately reproduced on Allwinner hardware, and discussions on
> whether a margin should be added to the display drivers and how large
> a margin was acceptable had stalled.
>=20
> Now that we have a panel model that is actually used with Allwinner
> hardware, has the same dimensions, and the timings have been shown to
> work with the nameless panels, we can use that one instead.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--twqhz7ijjeox7jmv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXE7fOAAKCRDj7w1vZxhR
xb0SAQCen0HJZMPM7YPMTT/lFOVFjJ1E275HdjloKPHfl2nYZgD/V66ZJEYxbzdi
9BAQshREanIdghSWrwSpXbURp4wd9Qc=
=GUyW
-----END PGP SIGNATURE-----

--twqhz7ijjeox7jmv--
