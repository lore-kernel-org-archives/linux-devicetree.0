From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 2/6] media: cedrus: Add a quirk for not setting DMA offset
Date: Tue, 29 Jan 2019 10:07:50 +0100
Message-ID: <20190129090750.z6wvjwpf56gqpeby@flea>
References: <20190128205504.11225-1-jernej.skrabec@siol.net>
 <20190128205504.11225-3-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="z7ggbe62bt2dbro2"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190128205504.11225-3-jernej.skrabec@siol.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: wens@csie.org, mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--z7ggbe62bt2dbro2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 28, 2019 at 09:55:00PM +0100, Jernej Skrabec wrote:
> H6 VPU doesn't work if DMA offset is set.
>=20
> Add a quirk for it.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--z7ggbe62bt2dbro2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXFAX5gAKCRDj7w1vZxhR
xYgUAQC1t6ZxHaK1qPcnKHGmydsp3cLXOdYNLpJWkEjBW9+MvAD/c5Tm7sVFMjVA
LATVkrse842ne2vtuTo11P34zp6p6AU=
=muDF
-----END PGP SIGNATURE-----

--z7ggbe62bt2dbro2--
