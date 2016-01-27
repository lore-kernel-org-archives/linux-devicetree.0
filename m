From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v8 4/5] regulator: tps65912: Add regulator driver for the
 TPS65912 PMIC
Date: Wed, 27 Jan 2016 20:25:22 +0000
Message-ID: <20160127202522.GE25316@sirena.org.uk>
References: <1453736627-2634-1-git-send-email-afd@ti.com>
 <1453736627-2634-5-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DqhR8hV3EnoxUkKN"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1453736627-2634-5-git-send-email-afd@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--DqhR8hV3EnoxUkKN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 25, 2016 at 09:43:46AM -0600, Andrew F. Davis wrote:
> This patch adds support for TPS65912 PMIC regulators.
>=20
> The regulators set consists of 4 DCDCs and 10 LDOs. The output
> voltages are configurable and are meant to supply power to the
> main processor and other components.

Acked-by: Mark Brown <broonie@kernel.org>

--DqhR8hV3EnoxUkKN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWqSexAAoJECTWi3JdVIfQkUQH/Auc115yyTOEkAZ69D+3tKqM
Hsxyg/MTER/QF/0OhFOfnpM+1xKcpeFwxnxZl159Efz/a94wFIbwBd2qHIv9PWl7
VZOspkMGJtAUww4L1FWsMjgU6dki+16dJ8bk1kBIphZoSDlzijmeaE0lMwKOTs1o
qheyG2Fkm+g+ksk7x/frNJgmV5l5u8IFCCEsB7qnP50eynm3poRU/mphoSKsmO1C
fFv4KIvt/jDrMvOcShIglqI05sVF19wASJzSJAZkb7JwERlW8Fn4WXgSDPUh7kYI
C1iY0w1a7BmC0m1yTreIoMvqGVwmPeGbn0G7LWDy5AR3JjzseR1lELkU8qXRfcY=
=aSMt
-----END PGP SIGNATURE-----

--DqhR8hV3EnoxUkKN--
