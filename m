From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: ti-abb: Add support for interleaved LDO
 registers
Date: Fri, 17 Jan 2014 16:08:21 +0000
Message-ID: <20140117160821.GV17314@sirena.org.uk>
References: <1389900750-27625-1-git-send-email-nm@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tYlHSoJ8Aop8eNG2"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1389900750-27625-1-git-send-email-nm@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: Nishanth Menon <nm@ti.com>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--tYlHSoJ8Aop8eNG2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2014 at 01:32:30PM -0600, Nishanth Menon wrote:
> Certain platforms such as DRA7 have quirky memory maps such as:
> PRM_ABBLDO_DSPEVE_CTRL	0x4ae07e20
> PRM_ABBLDO_IVA_CTRL	0x4ae07e24
> other-registers
> PRM_ABBLDO_DSPEVE_SETUP	0x4ae07e30
> PRM_ABBLDO_IVA_SETUP	0x4ae07e34
>=20
> These need the address allocation to be either shared OR unique
> allocation per register instance.

Is there a system controller involved here by any chance?

--tYlHSoJ8Aop8eNG2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJS2VVyAAoJELSic+t+oim9XwoQAIjGJfqR+6qVUUGLZJFGfFmh
ucGBlJvtAcU/1j+tYln5lGGvUAaurt/LF6/Yltjq0j1pyZ7PdiOoTdL6J7x/s4ZN
oZFuD6FGp5mxRmTXOOhLCT8YCK4BvBlNzPf7OvcPsHnTgHwOQl0XdiHCprWT7fNx
DJhRdOp3blcoVhA7yCb+VtGQTY+0f2dMT/I2LISe7GWh6cFxlQX0CJKSlHDJLqYY
sqRp23v03+R7jq5c5a3WHQJZER8TQzHG4yuE1aY8huZPzYsxQM5Dq95i2qbbXuuC
Yfwhbfbh9DKU4NY159Eoy+pOIwpgCOwSciPlAroiK8KxkuzZDDqPCeRV39BVr0aR
cLrqv2C83lsb7u2wixGlrfmRPGv8+Ldm2zvas9zucFrBf/b86C4h6cV3dwmZ4xjV
lpKWSYzAg+84v2SMpCkeys54xH7dGWNP3qWARbiG/x1uGJDzgaxdoRu/C3O5jyiZ
WgxSfhe8pOK9OtcnMZTkkWrYyhS2iN6CqAvw8keApROB8g7cSwMC2NwEHpmcSqaT
oB6onsG+CqGyYbTk1kVB8OgBHZy5j300qeGcBRo9jTwqnWltDj7YX91qK5VwPyuo
H4uKWsLzzu+ZchhaQC4euuoPG7114EQ28cCA5wfjkdrAssuEnbhs/zNbqNdj3+f5
hSv/toVbOeiBoe3v0i/x
=kV/j
-----END PGP SIGNATURE-----

--tYlHSoJ8Aop8eNG2--
