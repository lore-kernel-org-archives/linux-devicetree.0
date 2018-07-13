From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: pfuze100: add optional pfuze-disable-sw
 binding
Date: Fri, 13 Jul 2018 12:50:10 +0100
Message-ID: <20180713115010.GA16228@sirena.org.uk>
References: <20180712110240.3006-1-m.felsch@pengutronix.de>
 <20180712110240.3006-2-m.felsch@pengutronix.de>
 <20180712153121.GF10369@sirena.org.uk>
 <20180713083039.4z3ulwtg2ekx5n23@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180713083039.4z3ulwtg2ekx5n23@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, fabio.estevam@nxp.com, Anson.Huang@nxp.com, kernel@pengutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 13, 2018 at 10:30:39AM +0200, Marco Felsch wrote:
> On 18-07-12 16:31, Mark Brown wrote:
> > On Thu, Jul 12, 2018 at 01:02:39PM +0200, Marco Felsch wrote:

> > > +Optional properties:
> > > +- pfuze-disable-sw: Disable all unused switch regulators to save power

> > This is a bit of a confused way of specifying things that depends on the
> > Linux implementation, and the property sounds like a double negative
> > too.  I'd say something like "pfuze-support-disable" and then explicitly
> > say that this is a workaround for backwards compatibility.

> I can't find the double negative. Anyway your binding sounds better. So
> I will use yours. Should we add a vendor prefix too to be clear? I will
> also add some more informations to mark it as workaround.

The property doesn't disable the use of switch regulators, it enables
their disabling.  A vendor prefix is probably required but I can't
entirely follow the DT rules there, it certainly shouldn't hurt anyway.

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAltIke8ACgkQJNaLcl1U
h9ASxwf+I+jR/6P3ZK6bGKjK57+MO7Nxv16hDmOm0MCk3VaH5worcAEZpTBIkWk5
FvlNmlzEtJnKWmLaIk1mKw895Yrjel1ZqicsXrV2lrE8ic/E2xJJ4UGsoRWcws4G
a+Mm4ZoxlxNfowNQhDzH08dxFBdDh3xDcQ1Z+HGzsjFDTsBhXEyg6Hi20k2ZO6bP
jEwNQYdS8Y6Pn+v8f71+wlccLsXHQupnSgidQbVlUsBoTZOn5B6V5fVjZZPLhYcN
NsZkmzJieJv/qQTqpfQvfUc4oTOPZPKs0gW/Nrh3dFq6ygAoXwWCDVurn+tD2uCE
9WyqcbDLSpmfpRFDdRKnjDoppZBq/g==
=5Yj7
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
