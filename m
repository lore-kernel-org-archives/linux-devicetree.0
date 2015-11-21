From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 3/4] regulator: tps65086: Add regulator driver for the
 TPS65086 PMIC
Date: Sat, 21 Nov 2015 13:37:39 +0000
Message-ID: <20151121133739.GG26072@sirena.org.uk>
References: <1447974102-24938-1-git-send-email-afd@ti.com>
 <1447974102-24938-4-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OFj+1YLvsEfSXdCH"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1447974102-24938-4-git-send-email-afd@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--OFj+1YLvsEfSXdCH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2015 at 05:01:41PM -0600, Andrew F. Davis wrote:
> Add support for TPS65086 PMIC regulators.
>=20
> The regulators set consists of 3 Step-down Controllers, 3 Step-down
> Converters, 3 LDOs, 3 Load Switches, and a Sink and Source LDO. The
> output voltages are configurable and are meant to supply power to a
> SoC and/or other components.

An earlier version of this patch has already been applied, please don't
resend already applied patches but send incremental patches with any
changes.

--OFj+1YLvsEfSXdCH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWUHOiAAoJECTWi3JdVIfQ2zkH/1om6MWN2crlK7vScrcQ5D2Y
V7YjnuFgqP+fl5Jll5QvcKWf7IIayPR9YxApgW/AyraNT8HGp6ILq5O/4foy2RhE
zQkhsZLoKtd58xsF1h1SFVRyDAdPru/Ql1tabplJHjhiDiqbUAieA80UaGvPj8Vs
/RLVk+URAp79bBEcyyNZCq1xxIsESbTLXvsO5rhTFz12yIqwi5RtT/AkMDJU5JoE
mGBr26m/5dMsjr2utsgbbXUkozVWhZ2k+10TeIfCbTYl2Q5QUdLCnRCqrAizJxZb
McV/1eNGpFoOLxTObSY8A0VdPbtUlopvbz0h9vszYagbGxQLhTwTlZ9SL6IcCdE=
=wycQ
-----END PGP SIGNATURE-----

--OFj+1YLvsEfSXdCH--
