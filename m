Return-Path: <devicetree-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:60426 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751274Ab3HTW2m (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 20 Aug 2013 18:28:42 -0400
Date: Tue, 20 Aug 2013 23:28:10 +0100
From: Mark Brown <broonie@kernel.org>
Message-ID: <20130820222810.GU30073@sirena.org.uk>
References: <cover.1376912873.git.b42378@freescale.com>
 <ca3061d70ab8bf59afc59031fa7befcfaed26d51.1376912873.git.b42378@freescale.com>
 <5212908E.6050104@wwwdotorg.org>
 <20130820001858.GF30073@sirena.org.uk>
 <52138FDE.3080007@wwwdotorg.org>
 <20130820190701.GR30073@sirena.org.uk>
 <5213C94D.7050304@wwwdotorg.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+AZ+hzazKhrb9rIx"
Content-Disposition: inline
In-Reply-To: <5213C94D.7050304@wwwdotorg.org>
Subject: Re: [PATCH v8 2/2] ASoC: fsl: Add S/PDIF machine driver
Sender: devicetree-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Nicolin Chen <b42378@freescale.com>, lars@metafoo.de, p.zabel@pengutronix.de, s.hauer@pengutronix.de, linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, timur@tabi.org, rob.herring@calxeda.com, shawn.guo@linaro.org, festevam@gmail.com, tomasz.figa@gmail.com, mark.rutland@arm.com, R65777@freescale.com
List-ID: <devicetree@vger.kernel.org>


--+AZ+hzazKhrb9rIx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 20, 2013 at 01:53:49PM -0600, Stephen Warren wrote:
> On 08/20/2013 01:07 PM, Mark Brown wrote:

> > The point is that it might turn into a more correct binding
> > depending on what the S/PDIF device actually is.

> There's *never* an object on the board called a "dummy codec".

Oh, is that what you're talking about?  Yes, that makes sense.  I had
been responding to the comments about the transceivers.

--+AZ+hzazKhrb9rIx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSE+13AAoJELSic+t+oim9JDwP/0RB7DTixRIt8qhqIQpRpGxR
jNOFenHh8frGmVAEUO6XXmxx2zsjptA1FsBHrLU4oRnRwh6d+Hxx8UYbGyAm8pQS
zcNAK267KHEY43tVyh1pEWGuSbIqVSCWQTN3sHWfcA3yk3pccre2gu6Kr2yV/ran
pMDpcQ7zGYdNESUNUX4uNmwWTiZMcM6DOOdcUeIhGmTn8lWLL+gRGpNkxB9fNtQk
gd+jKpIeM/7V8W3GCTtfGQay5r8RSNLo318CGyDyoXs2P347sKrzLdqxD0mmVm0p
DFLkLTMeICV6HhUGWlh60lLtlALhGCtsSqxe8gXlZgsk95wXel5/XtOHBag0cF7z
Aq1rPQPgrp+HAQP5JWSnglPoMOvpEZOcWZN0VMmLC0jQ470LMRsZcWOnVeS4tapF
nh87/bo1kzgqOayIlz3C7svBncbhpKogl9GUmfm77EhXxk3Ikiqr5Iu9eRjrWYD2
MVZrW8etFf5t3G/MMAcTVOvPyGlWPUj6m37BZIuPMyYVlUrP6q3tj+gqO5y7WtN3
jzbDXSZgfw2HujLPpyF3RL5J44WeX5w+l/e8eNYdq52BENJ2wHYGJLcfygbnSZJN
W6B9X9V8UbuoFzv96NxJdfCkKeGb4EFzFR4gK5UUTGydzIOwVzM43A07empJ8abg
YCinEi6uYMVKYaAkGZEL
=SNVc
-----END PGP SIGNATURE-----

--+AZ+hzazKhrb9rIx--
