From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/4] regulator: Add regulator driver for ATC260x PMICs
Date: Mon, 17 Jun 2019 17:30:15 +0100
Message-ID: <20190617163015.GD5316@sirena.org.uk>
References: <20190617155011.15376-1-manivannan.sadhasivam@linaro.org>
 <20190617155011.15376-4-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ROA1rv1+fHr2QGor"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190617155011.15376-4-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: lee.jones@linaro.org, lgirdwood@gmail.com, robh+dt@kernel.org, afaerber@suse.de, linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org, thomas.liau@actions-semi.com, devicetree@vger.kernel.org, linus.walleij@linaro.org
List-Id: devicetree@vger.kernel.org


--ROA1rv1+fHr2QGor
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 17, 2019 at 09:20:10PM +0530, Manivannan Sadhasivam wrote:

> +++ b/drivers/regulator/atc260x-regulator.c
> @@ -0,0 +1,389 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Regulator driver for ATC260x PMICs

Please make the entire comment a C++ one so this looks more intentional.

> + * Copyright (C) 2019 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

You definitely didn't assign copyright to your employer?

--ROA1rv1+fHr2QGor
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0HwBYACgkQJNaLcl1U
h9AlQgf/cOduPIgVfw037hso/F8J/DY12ynhZ3O7IPyWtiaUIazr9Y3zB2dch0EH
mMdmUFiGT9ijRDAj2tlkLGAKfsD+/4pfGnxaTLL/unOM7uvWHLcT4j1L0eo2FGEa
nARIZZng3pZnEp/Yo3E/DzMJGNKxQ+NCYEnkClzI4Je9Kg/SB0vKijbMEMkstH9v
RfEclPCayi30RQ/cbRv7YUbDBc7GMD2JRVBn4Xv+hVLszHqTbJa/RZ/cJADQS3uZ
KmWHEHurfwYJIX314fbjiBCcHNWfZQ0kiFZsHNJGYmxwKHZiPg9DyQSh5Zk9s41l
mKfXniiw5dpGYEgsDok3f/gEh10XgA==
=bXNF
-----END PGP SIGNATURE-----

--ROA1rv1+fHr2QGor--
