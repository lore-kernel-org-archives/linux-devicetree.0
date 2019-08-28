From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 0/8] regulator: support Silergy SY8824C/SY8824E etc.
Date: Wed, 28 Aug 2019 11:08:52 +0100
Message-ID: <20190828100852.GA4298@sirena.co.uk>
References: <20190828135646.52457ac3@xhacker.debian>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190828135646.52457ac3@xhacker.debian>
Sender: linux-kernel-owner@vger.kernel.org
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2019 at 06:08:09AM +0000, Jisheng Zhang wrote:
> Add support for Silergy SY8824C/SY8824E/SY20276/SY20278 regulator.
>=20
> Changes since v1:
>   - use c++ comment style for SPDX header
>   - add prefix for BUCK_EN and MODE

I already applied v1, please just send incremental updates fixing these
rather than entirely new versions.  As the message sent when applying
patches says:

| If any updates are required or you are submitting further changes they
| should be sent as incremental updates against current git, existing
| patches will not be replaced.

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1mUrMACgkQJNaLcl1U
h9DfAQf/Z/uVU2+OG/dRjjnb9aJg2tEZUnbuMpSBOEc39IJjERea1NqcPGugs1/r
GoDl/aa1erdGnnA7Thw4iMN9fmyqxvL71eTblz0gQ4KcNFYtOAR7EHWUYqM7rXsX
STu+D4ytH5fUspWIqeGROG5kVS6+1x3OO3JDRAobTAO23F4u0Hecq85g2vxGHiHn
ifrjH8uYFs7zExUlvidN4qkF6Lz3vz88XGffPScsoi6ZySBFPQBcmEiWk8namQ+a
z3yDJoVrW84Api/AQ4Oz+0YvHUk2IPwLW9x9rAAhsZJwdYxURhClQgUQOsV+/XA1
hiEzWBdNw8Y1TQMUjjISRBJuh3+eTg==
=kSzK
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
