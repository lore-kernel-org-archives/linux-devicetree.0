Return-Path: <SRS0=WMI5=VC=the-dreams.de=wsa@kernel.org>
Date: Fri, 5 Jul 2019 20:32:58 +0200
From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 1/2] dt-bindings: i2c: mv64xxx: Fix the example compatible
Message-ID: <20190705183257.GE4717@kunai>
References: <20190703095338.11266-1-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q8BnQc91gJZX4vDc"
Content-Disposition: inline
In-Reply-To: <20190703095338.11266-1-maxime.ripard@bootlin.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--Q8BnQc91gJZX4vDc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 03, 2019 at 11:53:37AM +0200, Maxime Ripard wrote:
> One example has a compatible that isn't a valid combination according to
> the binding, and now that the examples are validated as well, this
> generates a warning.
>=20
> Let's fix this.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

Applied to for-next, thanks!


--Q8BnQc91gJZX4vDc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0fl9kACgkQFA3kzBSg
KbZ/Zg/9H9neW53cvp7kWX6WeLflgcdGPzNI4l7r3Jlj3jZRa/a3edZJH6PRNoGD
VPkSaMkOIVdGUXE5SNMcGovDzDkHI0Aam7Pim/nFakcec1dQ44kW6EANZjycCfRr
k1K/2bHLtDAZNDVGvYQNyVidZqMlaXE5o9rrx87Tn+8FxFrr5gqzpyFocEZ2xntX
aJrh774Lm6Tse1orW2+lpm+PwSjDlaTsWxLsgdlZKLa6KZ60k94mgmqcXbFUmmj/
knQG/d9JvXjq9POjgesSnD1Aj3TRM/exE+Wi2oQ0C6OT8FAtPNSmHzx/KU3XFjQh
1X9f2R3Nxg7oqjpTSOrI7N/NFhxCfg9LmQahJWQYCuPY5jAXZgh0a6RCbeYDOb6y
IF5n4p3+ItA3a9rWjt5oUGwYRClfWQuHUqqb485mAb9vAohWAgX8fD9FTC4rf7Fp
LEsNPg8GzvjmWjObCTtFGKK5OS/cFskOyjU1STkXDWYjIi4EmSvqq9Ed4dmUJW/Q
PmmInLLVx2v1qFwSWdCaxPMPzn/+wQkDzZrQe9b1L5DAHb02kpOD52/EPBTL1ioF
tA5XvzztBVE38QugLF753wfi33htXRPGhuRj8qTBdaWq9/hSfV5/KYKQSZCOTkka
O/hz+ElP0EANE2gbJPLohWHJgkuNk+DoDDudMqExNyuxgIuYS5Q=
=SqsJ
-----END PGP SIGNATURE-----

--Q8BnQc91gJZX4vDc--
