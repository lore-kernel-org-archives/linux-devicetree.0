From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: dt-bindings: Convert fixed-regulator to
 json-schema
Date: Mon, 14 Jan 2019 12:01:03 +0000
Message-ID: <20190114120103.GB11073@sirena.org.uk>
References: <20190110221903.3990-6-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yNb1oOkm5a9FJOVX"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190110221903.3990-6-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
List-Id: devicetree@vger.kernel.org


--yNb1oOkm5a9FJOVX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 10, 2019 at 04:19:03PM -0600, Rob Herring wrote:
> Convert the fixed-regulator binding to DT schema format using
> json-schema.

This looks good but has collided with some other changes from Linus, can
you please respin against them?

--yNb1oOkm5a9FJOVX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlw8ef4ACgkQJNaLcl1U
h9C1egf9EyDGFsMmJv/xo3E2kJqh/9tf9dUeYFgj16wNrEOBt5DRZuPNgxzMPRAe
fCFq481WOjcwxQ/B5bEI/TpZFX+rOx1nsaxYPs2ZOtPu4OjN9gZlZLzuzT35+S5c
aJeCbd8Ok/XRhZuyxd3b3M7UY60CYUQpfUK1AUyZ+39/mfa1y7eN6TT3HM9OMYD0
lz1rhAKaPNw27ugIq+kIYDIbgungxphH0l+j/0waTsIugbS86dVnMxC2abfdlFBv
yKtTULJ7Ca90Ygiw0pd5yz75KJzeDVh5K3s9rut3TkghiQl3jKwMrvyG87s0SQtJ
gBcqKNpWOIQKAjaFX2EpiSvc3xiUcg==
=8aBq
-----END PGP SIGNATURE-----

--yNb1oOkm5a9FJOVX--
