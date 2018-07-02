From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v8 2/2] regulator: add QCOM RPMh regulator driver
Date: Mon, 2 Jul 2018 11:28:53 +0100
Message-ID: <20180702102853.GI18211@sirena.org.uk>
References: <cover.1529712888.git.collinsd@codeaurora.org>
 <35c4ea70cdf5caba560fb6f40e866ee8bc456d93.1529712888.git.collinsd@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FK65GREB+Evh/hTL"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <35c4ea70cdf5caba560fb6f40e866ee8bc456d93.1529712888.git.collinsd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Collins <collinsd@codeaurora.org>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, rnayak@codeaurora.org, sboyd@kernel.org, dianders@chromium.org, mka@chromium.org
List-Id: devicetree@vger.kernel.org


--FK65GREB+Evh/hTL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 22, 2018 at 05:46:14PM -0700, David Collins wrote:

> --- /dev/null
> +++ b/drivers/regulator/qcom-rpmh-regulator.c
> @@ -0,0 +1,746 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (c) 2018, The Linux Foundation. All rights reserved. */
> +

Please make the entire header block C++ so it looks intentional.

> +	cmd.data =3D bypassed ? PMIC4_BOB_MODE_PASS : pmic_mode;

Please just write normal if statements, the ternery operator isn't
really helping legibility.

> +static const int pmic_mode_map_pmic4_ldo[REGULATOR_MODE_STANDBY + 1] =3D=
 {
> +	[REGULATOR_MODE_INVALID] =3D -EINVAL,
> +	[REGULATOR_MODE_STANDBY] =3D PMIC4_LDO_MODE_RETENTION,
> +	[REGULATOR_MODE_IDLE]    =3D PMIC4_LDO_MODE_LPM,
> +	[REGULATOR_MODE_NORMAL]  =3D -EINVAL,
> +	[REGULATOR_MODE_FAST]    =3D PMIC4_LDO_MODE_HPM,
> +};

This mapping is really weird, I'd expect one of the modes to correspond
to the normal operating mode of the regulator. =20

> +static unsigned int rpmh_regulator_pmic4_ldo_of_map_mode(unsigned int mo=
de)
> +{
> +	static const unsigned int of_mode_map[RPMH_REGULATOR_MODE_COUNT] =3D {
> +		[RPMH_REGULATOR_MODE_RET]  =3D REGULATOR_MODE_STANDBY,
> +		[RPMH_REGULATOR_MODE_LPM]  =3D REGULATOR_MODE_IDLE,
> +		[RPMH_REGULATOR_MODE_AUTO] =3D REGULATOR_MODE_INVALID,
> +		[RPMH_REGULATOR_MODE_HPM]  =3D REGULATOR_MODE_FAST,
> +	};

Same here, based on that it looks like auto mode is a good map for
normal.

> +	if (mode >=3D RPMH_REGULATOR_MODE_COUNT)
> +		return -EINVAL;

Why not use ARRAY_SIZE?

--FK65GREB+Evh/hTL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAls5/mQACgkQJNaLcl1U
h9AsNgf/WigCKmujnVVYbm5ON5iapR9oanwpQCSh0Iq+B/SFfWkiPB/V6a5icJs8
REO1PpgyY08Of0V6BrYSnweEhQCiPYzje6XIPomR6rSEddf6c/ga8+78LNQJxHoq
K9yqW8a7pM6KG7gf/C8qUZ4d7JERXX8xlZUmniLpd9wg9Y6izxq9VNda0AvIr5Fl
9qT4hlcbXODcJEnCrWm8Sq09BsZmwK3yF2Gl8zzkSEP10XSiE1V5tzCLZqS0X07R
YjwpFaPhg72qqGyXEPqFiywuzOs3vhf6ZAxg5nn9J5n4pKUW792FCRcb+mDdaaCB
HTwARsp/0mY3ptkKJcDpxxwDua8YNw==
=Bx5z
-----END PGP SIGNATURE-----

--FK65GREB+Evh/hTL--
