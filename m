From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/6] regulator: core: Allow simultaneous use of enable op
 and GPIO
Date: Wed, 22 Jun 2016 11:34:32 +0100
Message-ID: <20160622103432.GJ28202@sirena.org.uk>
References: <20160622082558.20935-1-acourbot@nvidia.com>
 <20160622082558.20935-2-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ed/6oDxOLijJh8b0"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160622082558.20935-2-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, gnurou@gmail.com
List-Id: devicetree@vger.kernel.org


--ed/6oDxOLijJh8b0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 22, 2016 at 05:25:53PM +0900, Alexandre Courbot wrote:
> The current regulator enable/disable mechanism does not call the driver
> enable/disable op if an enable GPIO is set. It may be desirable to use
> both mechanisms though, e.g. in the case of a PWM regulator that also
> has an enable GPIO.
>=20
> _regulator_is_enabled() is also updated in order to take both enable
> conditions into account.

This is going to break or at least reduce the performance of a lot of
users - it is very common for regulators to have configurable support
for a GPIO enable in addition to a register enable with the GPIO enable
replacing a register enable for improved performance.  If you have some
strange device that requires GPIO and other operations the driver should
handle that, if nothing else it's likely that there are sequencing
requirements between the two which we are probably not going to get
right for everyone in the core.

--ed/6oDxOLijJh8b0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXamm3AAoJECTWi3JdVIfQqUIH/RXwPp5XDZ45kUelY0D2b/i5
3nq4Bw8T2Tjn4swVXs8XcSJCAUpy+gCXujoP5Bl8P97QR/9gauAy4LhSfSvVPIiv
eBmc+fxTdyg4J/GntVUkX7nfbaQ65hwvXhrhGuRA+0PBavWE1s7uQEfLZtvAcgZ9
0yPffVgNbSZjREa3m8bDhaN4E2Om8SLWhonb2d5TCkLhvTAOvQj1WK8YyLNwK4Bj
W35d6jjrHXAg3bl51C9ebo4lSy0/jEujzf9TkGxERWCuzUMi7phCFdo4nFWGSGSc
zjDFH1To2gprBiHEHrnkFR3KAPbfj2BzfWGmwUfJjeVSPwR2h9kKq1smI+W9a/Y=
=Nj7h
-----END PGP SIGNATURE-----

--ed/6oDxOLijJh8b0--
