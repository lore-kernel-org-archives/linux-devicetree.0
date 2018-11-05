From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v3 00/28] Allwinner H6 DE3 and HDMI support
Date: Mon, 5 Nov 2018 10:43:41 +0100
Message-ID: <20181105094341.qedt7jvnxooiojki@flea>
References: <20181104182705.18047-1-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="46or3tqg6zho2rip"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181104182705.18047-1-jernej.skrabec@siol.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: wens@csie.org, robh+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, airlied@linux.ie, architt@codeaurora.org, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--46or3tqg6zho2rip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 04, 2018 at 07:26:37PM +0100, Jernej Skrabec wrote:
> This series adds support for Display Engine 3.0 and HDMI 2.0a, which
> can be found on H6 SoC.
>=20
> Display Engine 3.0 in comparison to 2.0 mostly adds features needed for
> displaying and processing 10-bit and AFBC formats, which are not yet
> supported by this series.
>=20
> H6 is also the first SoC which supports IOMMU, but support for it is
> not yet added.
>=20
> This series is based on linux-next at next-20181102.
>=20
> I suggest all patches go through allwinner tree, except DRM patches,
> which should go through drm-misc tree.

Applied all patches up to the 26. The two last one however should not
use the clk bindings define you added in the first clk patches, since
clk and dt patches are going through different tree.

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--46or3tqg6zho2rip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCW+AQzQAKCRDj7w1vZxhR
xVIMAP4qGI+8fBa+vQxXwJp/m/0eAS+8LQd22DCU9THY6PWzggEAtx48VjehKIZJ
QEmvOcA8rTqxZSzuAnclZTVr676CdQQ=
=9xxI
-----END PGP SIGNATURE-----

--46or3tqg6zho2rip--
