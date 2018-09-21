From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 1/7] regulator/mfd: Support ROHM BD71847 power
 management IC
Date: Fri, 21 Sep 2018 10:29:59 -0700
Message-ID: <20180921172959.GG20825@sirena.org.uk>
References: <cover.1536912922.git.matti.vaittinen@fi.rohmeurope.com>
 <3996792a07fea45d94d4d712ed05527199cc4ac0.1536912922.git.matti.vaittinen@fi.rohmeurope.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uc35eWnScqDcQrv5"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3996792a07fea45d94d4d712ed05527199cc4ac0.1536912922.git.matti.vaittinen@fi.rohmeurope.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, sboyd@kernel.org, mazziesaccount@gmail.com, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--uc35eWnScqDcQrv5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 14, 2018 at 11:27:46AM +0300, Matti Vaittinen wrote:
> BD71847 is reduced version of BD71837. DVS bucks 3 and 4 are
> removed as is LDO7. Voltage ranges of some regulators are
> expanded.
>=20
> Add initial support for BD71847 with BD71837 driver.
>=20
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>  drivers/mfd/rohm-bd718x7.c            |   70 +--
>  drivers/regulator/bd71837-regulator.c | 1055 +++++++++++++++++++++++----=
------
>  include/linux/mfd/rohm-bd718x7.h      |  271 ++++-----
>  3 files changed, 879 insertions(+), 517 deletions(-)

This looks OK to me - Lee, the patch is almost entirely a regulator one,
are you OK with me applying it?

--uc35eWnScqDcQrv5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlulKpcACgkQJNaLcl1U
h9Ds+Af+Lj7+qfn9ha/iNYcNJJyfbCS97JSlbC2n5I0h1L/B3wO2ZTUj153Q2vxC
vrpjpex/2m5i99Xg1a/fIV1y09dM4M8Ets6lLxYmmUeZ/1LRUR80/rsX/UjqS0J6
+TZZ+PO/vUPNHXW38DfyoEyeG/znETXQQdHrktZWFn4fKgDXZVC2BwePGdOYEynC
b5AL3auAx62FvwO4m2oW7vSegj2QIBuQbZx8o1C9/YpjwHI1RYCjdY2NBtsHklH0
/x/uOdmmtUP/8MoAkG7uDZyliJD+rn2QVrUxVOlcpnCvI+8XfAnDO0OjVF/0ijaW
P5pa+noqz28U+7dSALRdMR1/1237tA==
=C2rq
-----END PGP SIGNATURE-----

--uc35eWnScqDcQrv5--
