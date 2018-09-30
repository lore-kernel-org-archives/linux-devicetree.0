Return-Path: <SRS0=uYqo=MM=the-dreams.de=wsa@kernel.org>
Date: Mon, 1 Oct 2018 00:30:07 +0200
From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 1/4] dt-bindings: i2c: rcar: Add r8a77470 support
Message-ID: <20180930223007.GA1059@kunai>
References: <1537551421-4259-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1537551421-4259-2-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Content-Disposition: inline
In-Reply-To: <1537551421-4259-2-git-send-email-fabrizio.castro@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Biju Das <biju.das@bp.renesas.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>
List-ID: <devicetree@vger.kernel.org>


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 21, 2018 at 06:36:58PM +0100, Fabrizio Castro wrote:
> Although the I2C IP found in the RZ/G1C is not exactly the same
> as the one found in the R-Car Gen2 family or R-Car Gen3 family,
> it can still be considered as compatible with R-Car Gen2 from
> a software perpective.
> This patch therefore documents the SoC specific compatible string,
> and the compatibility with Gen2 fallback is retained.
>=20
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>

Applied to for-next, thanks!


--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAluxTmcACgkQFA3kzBSg
KbYTNg//dRQfmZfdQwU23LsXsVU/nFP7RSgIUt/J6hUTGLu0XkdR9M1ZCznIstAn
n7nQ7HwM/7GBC81cAyrMMDXW4R8HY6sdJxEdeQyVaUVyUwXWUMPSt96kUuFh9kt9
ZWEJfQjAAnmwZIB1tJ6+r+f2c2ZA6FXTi7ZXem197d7jWASia14hIvFEUSELMPao
MwO4UO2e/+irH0gpA5m+mJBhHN4F+DOkmRQ83o+aWkU9Nl/LiSHFBC/A0O2nkXxV
p2xHGhz9LLJhLQylfb5PxkWnjSkDYntr1z022rrfqW2Rl+mAd3PYyLTy9ktE9Z5T
KkOzh4QMCfACYfB0DYw8rXeSLdapAtkLpIuo33aSjjjY+BfzoyvjOn4hI+SiZMqi
9GpxUEPIhA9mRUU7F/TvUYhxxyIvvzLhOcNd+55GSgmg4TErbH9T2C/yiP5tJguM
hblAmmvdG1Aee1JTQdXcJE5mlVL4gSlhmrVzZ/NMSKg2hb3t/ad4JFGUrVYNxhCe
3C3ZOyJZJUCFMElpQPpn6Mpk4t8TxfKX92ZLvSaiWE7oWSTGm9EMW7TxBlshKRsC
MSOxLGlKSzbW0mRkOJQIzxdhNRTEfad0GGhwlZYjdQupUVwrJHpDLqtXm+7uhJwf
6ybHn2wpRZs11kF1FUHylte6gWEMgh1TCofrXnBhpzFQBHEvryQ=
=b+ft
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--
