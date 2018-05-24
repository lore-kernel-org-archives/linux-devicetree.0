From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 9/9] regulator: bd71837: Build BD71837 regulator driver
Date: Thu, 24 May 2018 15:01:59 +0100
Message-ID: <20180524140159.GT4828@sirena.org.uk>
References: <20180524060114.GJ4249@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8+OS07CeIgZ706fH"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180524060114.GJ4249@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org, lgirdwood@gmail.com, mazziesaccount@gmail.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mikko.mutanen@fi.rohmeurope.com, heikki.haikola@fi.rohmeurope.com
List-Id: devicetree@vger.kernel.org


--8+OS07CeIgZ706fH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 24, 2018 at 09:01:14AM +0300, Matti Vaittinen wrote:
> Configurations and Makefile for BD71837 regulator driver
>=20
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>  drivers/regulator/Kconfig  | 11 +++++++++++
>  drivers/regulator/Makefile |  1 +
>  2 files changed, 12 insertions(+)

Just squash this into the single patch adding the driver, it makes life
easier.

--8+OS07CeIgZ706fH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlsGxdYACgkQJNaLcl1U
h9ABiwf9HN+x1x1xOqtjg6KETg+ssfmw3CVV6U+YrkiO4jhM1ruOeXzUDgvDoF4n
qqIhNFc+NSIYlcq+X47gr9XaTg+GeJBgFHxW44eGkfr8h+JFuc/KEYuLRPMKWUss
xMqJzd8wYhBcrwM+k0/4qeLWlfNh3+2CcesD1nPNqEcs00buB66MYq9X4aH5ASyZ
Hy7XIeYdzl4QWVUBw6X8Gwk1JJy/RvY9+lbTElQhbRPNDo8a1CFRGG+F0zd8YkME
CA4OB0iBXgnrKH9arf+p+AZVRWqKbo32vRYp+BELwxuf9R84fRnHtX4/JoTJolrE
/xDQmqYEeo3hbR2UveF9TeHcBCCadw==
=bi1a
-----END PGP SIGNATURE-----

--8+OS07CeIgZ706fH--
