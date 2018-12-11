From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a64: Fix the video engine
 compatible
Date: Tue, 11 Dec 2018 09:38:37 +0100
Message-ID: <20181211083837.xskoxru6rokwjnf6@flea>
References: <20181210101429.21512-1-paul.kocialkowski@bootlin.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7ogwtdmvudx3xb24"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181210101429.21512-1-paul.kocialkowski@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org


--7ogwtdmvudx3xb24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 10, 2018 at 11:14:29AM +0100, Paul Kocialkowski wrote:
> When introducing the video-codec node for the video engine, the
> compatible for the H5 was used instead of the compatible for the
> A64. Use the right compatible instead.
>=20
> Fixes: d60ce24740d2 ("arm64: dts: allwinner: a64: Add Video Engine node")
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Queued as a fix for 4.21, thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--7ogwtdmvudx3xb24
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXA93jQAKCRDj7w1vZxhR
xZ3KAQC7nyAgEKtXvl5hldByPUKjCr7UEvtwjI8fWHBevflYgQEAr/4S7Layyixy
gfJUWiGBh9uC/ypi1D+5Vl10+vsingU=
=sQ9p
-----END PGP SIGNATURE-----

--7ogwtdmvudx3xb24--
