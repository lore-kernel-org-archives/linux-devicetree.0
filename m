From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 1/7] drivers: regulator: qcom_spmi: enable linear
 range info
Date: Thu, 13 Jun 2019 19:51:36 +0100
Message-ID: <20190613185136.GW5316@sirena.org.uk>
References: <20190606184842.39484-1-jeffrey.l.hugo@gmail.com>
 <20190606184923.39537-1-jeffrey.l.hugo@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ahZICQ7iXVM/oLYH"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190606184923.39537-1-jeffrey.l.hugo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: lgirdwood@gmail.com, agross@kernel.org, david.brown@linaro.org, bjorn.andersson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, jorge.ramirez-ortiz@linaro.org, niklas.cassel@linaro.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--ahZICQ7iXVM/oLYH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 06, 2019 at 11:49:23AM -0700, Jeffrey Hugo wrote:

> +		if (vreg->logical_type =3D=3D SPMI_REGULATOR_LOGICAL_TYPE_HFS430) {
> +			/* since there is only one range */
> +			range =3D spmi_regulator_find_range(vreg);
> +			vreg->desc.uV_step =3D range->step_uV;
> +		}

This doesn't build for me:

drivers/regulator/qcom_spmi-regulator.c: In function =E2=80=98qcom_spmi_reg=
ulator_probe=E2=80=99:
drivers/regulator/qcom_spmi-regulator.c:1837:29: error: =E2=80=98SPMI_REGUL=
ATOR_LOGICAL_TYPE_HFS430=E2=80=99 undeclared (first use in this function); =
did you mean =E2=80=98SPMI_REGULATOR_LOGICAL_TYPE_FTSMPS=E2=80=99?
   if (vreg->logical_type =3D=3D SPMI_REGULATOR_LOGICAL_TYPE_HFS430) {
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                             SPMI_REGULATOR_LOGICAL_TYPE_FTSMPS
drivers/regulator/qcom_spmi-regulator.c:1837:29: note: each undeclared iden=
tifier is reported only once for each function it appears in

--ahZICQ7iXVM/oLYH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0CmzcACgkQJNaLcl1U
h9BLcAf+LbREmfxXdirC6a4pyidOidMHVXvJ5RSlum+DW3aj56vF/aXiYyZm9d2C
4I+6WFnpU6GIbsNXcYPRkng30IZO5++Da8NPRPyYhcmBs+pJhpQjlPiPg6UK2/iB
AmsQStemH0Zi1crGMEeLU/nYREfZpTnS9GXH4r5SMvja5EigTEKfSqlhoWl5hoJd
INPx2zNjnBP21hVt0aUs+uEj2xiAuwMrN8VtHT152T51jVofsIxXZYBXtmSFKdLJ
9nkFy36LT6YA2gso7Caw+ku3SYPfXgkPu7YdOjnlFOp5sDC2dX7nlKeAZwiphDcU
IgFxUVv32eyNOS7wxahaxSq/ypFIPg==
=u3Lf
-----END PGP SIGNATURE-----

--ahZICQ7iXVM/oLYH--
