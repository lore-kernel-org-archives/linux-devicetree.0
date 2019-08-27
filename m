From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/8] regulator: add support for SY8824C regulator
Date: Tue, 27 Aug 2019 20:44:37 +0100
Message-ID: <20190827194437.GO23391@sirena.co.uk>
References: <20190827163252.4982af95@xhacker.debian>
 <20190827163418.1a32fc48@xhacker.debian>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ch6x/diZ8cQC324S"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190827163418.1a32fc48@xhacker.debian>
Sender: linux-kernel-owner@vger.kernel.org
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--ch6x/diZ8cQC324S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 27, 2019 at 08:45:33AM +0000, Jisheng Zhang wrote:

This looks mostly good and I'll apply it, a couple of small
things though:

> @@ -0,0 +1,192 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * SY8824C regulator driver
> + *

Please send a patch which updates the entire comment block to be
C++ style so it looks consistent.

> +#define BUCK_EN		(1 << 7)
> +#define MODE		(1 << 6)
> +

Please also add prefixes to these to namespace them, especially
MODE is likely to collide with something later.

--ch6x/diZ8cQC324S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1liCQACgkQJNaLcl1U
h9C9rgf/Xy1nABMJdavfpBaTNK/T0dAqzeL4PbecKw+JWZ95N5qd8YzDvedjAyT1
ZZNNKYyF6i8+gLPjEs2h3CCLfZqnYMyGrNnLSOGzW9k/a0DtnLg8+4lIFdls9qKc
CcZyOdp+UrPirPfxpjJCG4hvqXPfex1LNX0T7TU5XL84vPnFaq7LUM5l8bLW4QfQ
xCTK4Fx1UzFGodW/24DpXvI1OI5suqnS2e+PtMPxM56sT8KgjE9Y/ZsGWUi//SLH
ogxrcoA6YG49Y/JWd52cFGiFkLvkrkfPdnqLM+2XtpRSwItqOkdVFnQkIFEg8wQF
KHNnU8/HPD+izR09pC/BF2AB4NgebQ==
=Zq5D
-----END PGP SIGNATURE-----

--ch6x/diZ8cQC324S--
