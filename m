From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/3] drivers: regulator: qcom: add PMS405 SPMI regulator
Date: Mon, 4 Feb 2019 10:03:01 +0100
Message-ID: <20190204090301.GC23441@sirena.org.uk>
References: <1548675904-18324-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1548675904-18324-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5QAgd0e35j3NYeGe"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548675904-18324-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, bjorn.andersson@linaro.org, vinod.koul@linaro.org, niklas.cassel@linaro.org, khasim.mohammed@linaro.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--5QAgd0e35j3NYeGe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 28, 2019 at 12:45:03PM +0100, Jorge Ramirez-Ortiz wrote:

> @@ -653,6 +708,10 @@ spmi_regulator_find_range(struct spmi_regulator *vre=
g)
>  	range =3D vreg->set_points->range;
>  	end =3D range + vreg->set_points->count;
> =20
> +	/* we know we only have one range for this type */
> +	if (vreg->logical_type =3D=3D SPMI_REGULATOR_LOGICAL_TYPE_HFS430)
> +		return range;
> +
>  	spmi_vreg_read(vreg, SPMI_COMMON_REG_VOLTAGE_RANGE, &range_sel, 1);
> =20
>  	for (; range < end; range++)

Rather than have special casing for the logical type in here it seems
better to just provide a specific op for this logical type, you could
always make _find_range() call into that one if you really want code
reuse here.  You already have separate ops for this regulator type
anyway.

> +static unsigned int spmi_regulator_hfs430_get_mode(struct regulator_dev =
*rdev)
> +{
> +	struct spmi_regulator *vreg =3D rdev_get_drvdata(rdev);
> +	u8 reg;
> +	int ret;
> +
> +	ret =3D spmi_vreg_read(vreg, SPMI_HFS430_REG_MODE, &reg, 1);
> +	if (ret) {
> +		dev_err(&rdev->dev, "failed to get mode");
> +		return ret;
> +	}
> +
> +	if (reg =3D=3D SPMI_HFS430_MODE_PWM)
> +		return REGULATOR_MODE_NORMAL;
> +
> +	return REGULATOR_MODE_IDLE;
> +}

I'd have expected a switch statement here, ideally flagging a warning or
error if we get a surprising value in there.

> +static int spmi_regulator_hfs430_set_mode(struct regulator_dev *rdev,
> +					  unsigned int mode)
> +{
> +	struct spmi_regulator *vreg =3D rdev_get_drvdata(rdev);
> +	u8 reg =3D mode =3D=3D REGULATOR_MODE_NORMAL ? SPMI_HFS430_MODE_PWM :
> +						 SPMI_HFS430_MODE_AUTO;

Please write a normal if statement (or switch statement) to help
legibility.

--5QAgd0e35j3NYeGe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlxX/8IACgkQJNaLcl1U
h9AT0wf9E3UlafXm3pZLIqrY5EIoO+llv9YGhMENRbXSjvSt68YbsVh4naMSDVPF
Esp/LfvSl6S+jEKNRYuofIdqidqnYUQzaPjDAUEV7lVv1PIjZDLeG9HrEJer82rv
c7zmbRz3oEcPD6Ja02FpOdxuCS7AqVdbTOIHUaw5DSlzIQTHEMC+aoCQ0btTerLJ
j/aO8IGVw/Bazyvya3PUnRPIj8foH7msmKQgXpf8+Gl/wPp3X9VfeaHfBdCssxQb
anflPszsQ83skkXShVttyUr4j+N+UgtkhpedP1tuydfI5BlFhquKZD5aMG1K7ebD
0MsgwXc2R1L4P/vf/5OINRuONkd/3A==
=IuR9
-----END PGP SIGNATURE-----

--5QAgd0e35j3NYeGe--
