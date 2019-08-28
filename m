From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/8] regulator: add support for SY8824C regulator
Date: Wed, 28 Aug 2019 11:13:34 +0100
Message-ID: <20190828101334.GB4298@sirena.co.uk>
References: <20190827163252.4982af95@xhacker.debian>
 <20190827163418.1a32fc48@xhacker.debian>
 <20190827194437.GO23391@sirena.co.uk>
 <20190828112705.5e683693@xhacker.debian>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="IiVenqGWf+H9Y6IX"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190828112705.5e683693@xhacker.debian>
Sender: linux-kernel-owner@vger.kernel.org
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--IiVenqGWf+H9Y6IX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2019 at 03:38:29AM +0000, Jisheng Zhang wrote:
> On Tue, 27 Aug 2019 20:44:37 +0100 Mark Brown wrote:

> >=20
> > Please send a patch which updates the entire comment block to be
> > C++ style so it looks consistent.

> Do you mean update the following style

> A:
>=20
> // SPDX-License-Identifier: GPL-2.0
> /*
>  * SY8824C regulator driver
>  * ...

> as B:

> // SPDX-License-Identifier: GPL-2.0
> // SY8824C regulator driver
> // ...

> I'm not sure which style is correct. But I see B is commonly used
> in lots .c source files in other dirs, such as kernel/ mm/ etc.

Yes, please - update to style B.

--IiVenqGWf+H9Y6IX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1mU80ACgkQJNaLcl1U
h9DQbAf9Etbge3YinPdjAxIYYWtuPv6r2hsxMHOm1iKbI1gItlt6aNtFLLilT4kk
pv2lx+YEFNZXPP/cuwzsgtKEfMkPEM4KDsz85mY+3v8y350N+RiVIX1nUirnDEYs
mWaLoK6D+DrKAPgDgH23zcNH6KoTKNYIPpUfdVQT/jiSXUWXRFDQnsko0e/zb2sw
cJjadPq1V8qjMFaR+xAOh/sT+LLKseWgIYgxWBXgKSj/in8Bbpk09Fy+rONS6/D7
5QRfNaUshg+L7SPK+TRfIs39VNnpuGQI3FqzHyzoht4uApVVmbozKx3KOy7SBks1
72cq7+eqDXUZFMnI5nToM26kFj/K9w==
=/Kyl
-----END PGP SIGNATURE-----

--IiVenqGWf+H9Y6IX--
