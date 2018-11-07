From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] regulator: act8945: Implement PM functionalities
Date: Wed, 7 Nov 2018 14:53:49 +0000
Message-ID: <20181107145349.GA6809@sirena.org.uk>
References: <1540570753-16370-1-git-send-email-claudiu.beznea@microchip.com>
 <1540570753-16370-2-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1540570753-16370-2-git-send-email-claudiu.beznea@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Claudiu.Beznea@microchip.com
Cc: lgirdwood@gmail.com, Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, boris.brezillon@bootlin.com
List-Id: devicetree@vger.kernel.org


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 26, 2018 at 04:19:48PM +0000, Claudiu.Beznea@microchip.com wrot=
e:

> +static unsigned int act8945a_of_map_mode(unsigned int mode)
> +{
> +	if (mode =3D=3D ACT8945A_DCDC_MODE_POWER_SAVING)
> +		return REGULATOR_MODE_STANDBY;
> +
> +	return REGULATOR_MODE_NORMAL;
> +}

This should error out if it gets an unknown value rather than silently
mapping it to normal - we don't know what the user intended to set here.
There should also be some binding documentation updates saying what the
values that can be set are.

> +static void act8945a_pmic_shutdown(struct platform_device *pdev)
> +{
> +	struct act8945a_pmic *act8945a =3D platform_get_drvdata(pdev);
> +	struct regmap *regmap =3D act8945a->regmap;
> +
> +	/*
> +	 * Ask the PMIC to shutdown everything on the next PWRHLD transition.
> +	 */
> +	regmap_write(regmap, ACT8945A_SYS_CTRL, 0x0);
>  }
> =20

This shutdown function appears to be independant of the mode setting and
would be better split out as a separate patch (you could have one patch
adding the regmap stuff, one for this and one for the mode setting).
It makes review a lot simpler if each patch does a minimal set of
changes.

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlvi/HwACgkQJNaLcl1U
h9AjUAf/X+WZCSFnCaLptlSyx3bSbfDqjwhXcTHPCFdi8kpE9K91VD6YjpHdWeU6
BjGcASumUktHi1Hd0wFAxlvzoA683OTmS9tEWmKdI/FtsqpzjqZqmJG9OYfQ2HtP
juwAYFduRaswN6CP9RS7G4DniYJSO1VnC6UfPfKWbicqDaByyDYvQ7v1IT2qOGjC
N8YCI7v0fnZ270y78XWFsW8iDDfIIw8nGaZAuUN5bgOcOcLlHAF0jiHLAByebYO4
P344faEDGfWchNWjmIqdhGR2Gtsk6J3QGcQJFM5mb0BXMxMSLq8LBXCUruYzj63N
O+9S5CbneOG3tdWhfICkGBcoY3gOQA==
=OI5M
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
