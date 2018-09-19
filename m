From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 0/4] Fix A64/R40 HDMI PHY device tree binding
Date: Wed, 19 Sep 2018 11:32:49 +0200
Message-ID: <20180919093249.lkjoaki6bi6ieyht@flea>
References: <20180916043409.62374-1-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7g7ukbp3bqtwy35t"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180916043409.62374-1-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--7g7ukbp3bqtwy35t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 16, 2018 at 12:34:05PM +0800, Icenowy Zheng wrote:
> When adding support for A64 HDMI PHY in 4.19, we assumed that the two
> PLL-VIDEOs can both feed the HDMI PHY clock. However experiments show
> that the mux bit discovered in R40 blob is not applicable on A64. This
> is not discovered, as normally with a single display pipeline only
> PLL-VIDEO0 will be used.
>=20
> In this patchset the second PLL is dropped, and a binding specially for
> R40 HDMI PHY is added (which seems to have the mux).
>=20
> PATCH 1 is dropping second PLL for A64 HDMI PHY, and PATCH 2 to 4
> are adding R40 HDMI PHY binding, as R40 behaves differently with A64
> with this.
>=20
> This patchset targets v4.19 fixes tree, because the binding is
> introduced in v4.19, and if we don't fix it there a wrong binding will
> be left in a stable version released. A64 display pipeline support is
> not yet in v4.19, but R40 support is in it.

Applied 1 and 4 as fixes for 4.19, 2 and 3 for 4.20, since they are
not fixes per se, and the R40 display engine is not enabled in 4.19
anyway.

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--7g7ukbp3bqtwy35t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAluiF8AACgkQ0rTAlCFN
r3RaAw//YLqqhPetvvB7J9Iks0Cmu4R84IAfdn9XQLNI8U7KaFJW90RQTg8EELUX
POCmmXx70uWh1Jo04bl6Q+gSIfEO/PLUakgQiPk9p3FREWs+JG0fsYDLRb6jaVMr
0qBHBdGONSOCnQx1fTejQ6oLUzJo5pz9Zz1ZcXr5y56/NeRN6YncIwnq7bwiBdLo
4Xtv1sGrOf7zkzYsSegPe27QJilF8cv3Nhjnd1UGH1h6jDrZqf3ahsUL/XFgBa2O
JE01KOZ/DeV7ZNBnRgsuhNNsDJKTQTw6ii26uvpZAR/+Fa27DagPc4DJi4kyV/uB
PAHAm3yMlWSecDfPLpFA4EmSjIOkJTieGc0HUowf5UqZeyG5CKiE8k87jQmCdcGm
SEouRTYXakk3EcR3qTeZ/z2vIS96rIvauWbp7fOL7pIxN2j5pfEhPFlFvvrdAwUt
b/2LMzOsArNTBuwvOPFTMol9kiZGvNXlwJv1T3RR7EDNtr14fvPTWPNCr48xRl0p
ENNKZOYkXlG2hKBocKNhI0jmjM/1XvA3DBTXX8V51I/Tv8vgXVgs2TgLhAfVsk5L
6kRHS16OQgn3cIaVg+vjV9QWYASei7wKeNm78gcdqbNhqR3teqEkF3nNcQNyvi+e
WgbW1g+L97J3oOWU/1/YMUXygtUnuhDYzxg7nnGqPXP56rkDMMc=
=gOnr
-----END PGP SIGNATURE-----

--7g7ukbp3bqtwy35t--
