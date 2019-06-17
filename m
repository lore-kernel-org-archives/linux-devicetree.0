From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/4] regulator: Add regulator driver for ATC260x PMICs
Date: Mon, 17 Jun 2019 17:54:00 +0100
Message-ID: <20190617165400.GE5316@sirena.org.uk>
References: <20190617155011.15376-1-manivannan.sadhasivam@linaro.org>
 <20190617155011.15376-4-manivannan.sadhasivam@linaro.org>
 <20190617163015.GD5316@sirena.org.uk>
 <20190617163413.GA16152@Mani-XPS-13-9360>
 <a38d26d1-213c-31ef-9cc7-1d4bdda4ceab@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eT+isKliMkztK06K"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a38d26d1-213c-31ef-9cc7-1d4bdda4ceab@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, lee.jones@linaro.org, lgirdwood@gmail.com, robh+dt@kernel.org, linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org, thomas.liau@actions-semi.com, devicetree@vger.kernel.org, linus.walleij@linaro.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org


--eT+isKliMkztK06K
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2019 at 06:38:53PM +0200, Andreas F=E4rber wrote:
> Am 17.06.19 um 18:34 schrieb Manivannan Sadhasivam:
> > On Mon, Jun 17, 2019 at 05:30:15PM +0100, Mark Brown wrote:

> >>> @@ -0,0 +1,389 @@
> >>> +// SPDX-License-Identifier: GPL-2.0+
> >>> +/*
> >>> + * Regulator driver for ATC260x PMICs

> >> Please make the entire comment a C++ one so this looks more intentiona=
l.

> No, this is intentional and the official style requested by GregKH.

The important bit for the tools is the first line, the rest of it the
tools don't care about.

> He suggested I patch the SPDX documentation to make this clearer, but I
> did not find time for this yet (and am not the one making this rule).

The other regulator API files are all the way I suggest...

--eT+isKliMkztK06K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0HxacACgkQJNaLcl1U
h9Ajxwf+Nb+pLbzQmwjNKosrH3fv70fMfbz4cH0bwwpA8IfE8kkDkD8+R5xM2XEE
IjWs97/+dLz9ZKKOW+ueil9ySOIs9xXMfYfCCKEY97KMa+v8MCpmS0GPXpVszCwW
r9LrLC8CXddWKroaUloEE+zoNvz3vCA6jbuIxV30hFa4qKELfxlq7PdVm+jnUTKy
0F9rLO6/cGJ1kxg1wSHvhYagG3aDAyD7hDv9qfrFR9OyPc487ePeBpnOWDddVc1Z
mGjV9yM7xxUXpb1kkHVn9Ug/3j7b/CHxJc0OAYnVHzQPrbJ8rtt61jCx9owFuXO9
CwcUmE7kPQ3qijmR6SEvlJcL5TVAUA==
=RJ5C
-----END PGP SIGNATURE-----

--eT+isKliMkztK06K--
