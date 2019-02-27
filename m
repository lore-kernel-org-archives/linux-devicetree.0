From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] ARM: dts: sun7i: olimex-lime2: Add regulators for GPIO
 banks
Date: Wed, 27 Feb 2019 10:24:25 +0100
Message-ID: <20190227092425.ombbxgnn7ct2vkqj@flea>
References: <20190226141525.1039-1-plaes@plaes.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="c4iexitjl3he7o4z"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190226141525.1039-1-plaes@plaes.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Priit Laes <plaes@plaes.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Priit Laes <priit.laes@paf.com>
List-Id: devicetree@vger.kernel.org


--c4iexitjl3he7o4z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 26, 2019 at 04:15:25PM +0200, Priit Laes wrote:
> From: Priit Laes <priit.laes@paf.com>
>=20
> Make sure that A20 Olimex Lime2 pin bank regulators are
> properly represented.
>=20
> While pin banks A, B and F are connected to 3.3V static
> regulator, pin banks E and G tied with LDO3 and LDO4 regulators
> with 2.8V reference.
>=20
> Signed-off-by: Priit Laes <priit.laes@paf.com>

Queued for 5.2, thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--c4iexitjl3he7o4z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXHZXSQAKCRDj7w1vZxhR
xduYAQDVtcIIhc/XZLqotrd0piQZ7n2yVwolG2rwqouaml+tygD8DcoKTjPDdP6T
gwxxpApIOD3V3sMKkajLuXe6JIaJawM=
=Pfh3
-----END PGP SIGNATURE-----

--c4iexitjl3he7o4z--
