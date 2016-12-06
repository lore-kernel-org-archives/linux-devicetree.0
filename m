From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v12 0/4] dtc: Dynamic DT support
Date: Tue, 6 Dec 2016 08:48:38 +0100
Message-ID: <20161206074838.sxtu2wm6r6b574bx@lukather>
References: <1480957528-8367-1-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tgh7trodyq5wyzuh"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1480957528-8367-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--tgh7trodyq5wyzuh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 05, 2016 at 07:05:21PM +0200, Pantelis Antoniou wrote:
> This patchset adds Dynamic DT support in the DTC compiler
> as used in a number of boards like the beaglebone/rpi/chip and others.
>=20
> The first patch documents the internals of overlay generation, while
> the second one adds dynamic object/overlay support proper.
>=20
> The third patch adds a test method that can is used by the subsequent
> patch which adds a few overlay tests verifying operation.
>=20
> The following 3 patches add support for the syntactic sugar version
> of &foo { }; in a similar manner.
>=20
> This patchset is against DTC mainline and is also available for a pull
> request from https://github.com/pantoniou/dtc/tree/overlays

Tested-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--tgh7trodyq5wyzuh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYRm1SAAoJEBx+YmzsjxAglx0P/R/ZGhMYVyUMKKwyp7GZ+LX9
cFQ6WuCJZaMqx/SHR1XNrzHkusqWJ0FLwdryGM107oI9adlGRgO6bW6hkby3n774
NWpFFE4R227yGY5Uyp/GT+pzZ9ZqfclrmDrLzaUnnFqhqkuMjZRq5P9E5FYpXhZt
WoQHOJrNbo9vilFLGB4o7/R8gJc70WZ6dD5IIvBFBsxlGZY7fqorcOdrhPL0Oeik
N1CLbMXersz4ROm35uihIlBpNcL9yEp8ethC8rUEtoA3mPFGS2GdyOI55LHaXYSw
DzPU84ZBvQXwLwedmhO1CIA9og3JXqY9ZCcUwRbrNaulRyBB9sdGNETSI2YIDSCH
u/P2f3kTRFH2g0dhlGmYW1dI634n2v4aEiB8ipKv3fOwfdDa1X1B2rIMe1ah5JgE
qseSyNpc4la4iVH+a/hPkuzgWp1dCRQyL6gG6FSfQyai+PzqeUeOrku+C53Yz58C
buEycNY0kSBVslW6wl0rO2VNsrtfeHUbwJHwea0yeHYWnP6xXpsAUooQ8bxHWu3Z
+iRj/nbdNHAMaVGf9pfpSfDJwA45hoEM0VSEzVQmhJ1BQynRSB8slOt7eqxryt1O
4ZXrQiHfPWcUZfVX3W+Uqw8FgM4ojlJ/x/5y0OukHJnHVXjEfQgyfH4jsuwmLyVu
4IexrKDgwKBGH0L1TdrK
=98Ai
-----END PGP SIGNATURE-----

--tgh7trodyq5wyzuh--
