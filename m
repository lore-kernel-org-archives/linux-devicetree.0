From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/6] regulator: of: Add enable GPIO configuration function
Date: Wed, 22 Jun 2016 11:35:32 +0100
Message-ID: <20160622103532.GK28202@sirena.org.uk>
References: <20160622082558.20935-1-acourbot@nvidia.com>
 <20160622082558.20935-3-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OX2aLCKeO1apYW07"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160622082558.20935-3-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, gnurou@gmail.com
List-Id: devicetree@vger.kernel.org


--OX2aLCKeO1apYW07
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 22, 2016 at 05:25:54PM +0900, Alexandre Courbot wrote:
> Several regulator drivers are using an enable GPIO with similar DT
> properties, yet each driver is parsing these properties its own way. Add
> the of_get_regulator_gpio_config() function which is able to parse all
> known properties and update the regulator_config accordingly.

Why is this a function and not something data driven in the core?

--OX2aLCKeO1apYW07
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXamnzAAoJECTWi3JdVIfQk2IH/1138RYfrZyYFb857iowBWKu
L5IJ1GrNIFbJI17QSzLFSiudJqlH9b2+lx2ODkoVG2MSKVHzk7avtfNHnYIC7I3p
Rbvy/CoqAleKvMSFEIGgn1lCBTOU3mq4YjRZvBMDCCRZZM7WebvDFJ6kFvOVQ6hb
DVWwbEvPBOlIsWbaa6V2g3wCOnEDNzwC30j3/0CCeJoqvD0dbRL/NvAfR1BzbMhY
c+gipSQrFQB3v3JXH6cJvoNWNz+TTT23hfch5kXOiXAPOnZ1YtYJRobYd9QhuWLN
i1Cr7PBvc69Sy62sKh8ejNya03IWqeem0dA/YNe9bUGh5Yvr12BLxbFBEIYxn0o=
=z6sr
-----END PGP SIGNATURE-----

--OX2aLCKeO1apYW07--
