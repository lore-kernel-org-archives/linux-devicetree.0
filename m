From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] ASOC: Add ADAU7118 8 Channel
 PDM-to-I2S/TDM Converter driver
Date: Thu, 26 Sep 2019 11:43:18 -0700
Message-ID: <20190926184318.GF2036@sirena.org.uk>
References: <20190926071707.17557-1-nuno.sa@analog.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2580827850041757329=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20190926071707.17557-1-nuno.sa@analog.com>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org


--===============2580827850041757329==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TWLMYU3k2ba4mEMM"
Content-Disposition: inline


--TWLMYU3k2ba4mEMM
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2019 at 09:17:06AM +0200, Nuno S=E1 wrote:

> --- /dev/null
> +++ b/sound/soc/codecs/adau7118-hw.c
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Analog Devices ADAU7118 8 channel PDM-to-I2S/TDM Converter Standalone=
 Hw
> + * driver
> + *
> + * Copyright 2019 Analog Devices Inc.
> + */

Please make the entire comment a C++ style one in the .c files so
things look more intentional.

> +	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> +	case SND_SOC_DAIFMT_I2S:
> +		ret =3D snd_soc_component_update_bits(dai->component,
> +						    ADAU7118_REG_SPT_CTRL1,
> +						    ADAU7118_DATA_FMT_MASK,
> +						    ADAU7118_DATA_FMT(0));
> +		break;
> +	case SND_SOC_DAIFMT_LEFT_J:
> +		ret =3D snd_soc_component_update_bits(dai->component,
> +						    ADAU7118_REG_SPT_CTRL1,
> +						    ADAU7118_DATA_FMT_MASK,
> +						    ADAU7118_DATA_FMT(1));
> +		break;
> +	case SND_SOC_DAIFMT_RIGHT_J:
> +		st->right_j =3D true;
> +		break;

Don't we need to set any register values here?

> +
> +	return ret < 0 ? ret : 0;
> +}

Please don't use the ternery operator like this, it just makes
things harder to read - write normal if conditional statements.

> +	case SND_SOC_BIAS_STANDBY:
> +		if (snd_soc_component_get_bias_level(component) =3D=3D
> +							SND_SOC_BIAS_OFF) {
> +			if (!st->iovdd)
> +				return 0;

This is broken, the device will always require power so it should
always control the regulators.

> +static int adau7118_suspend(struct snd_soc_component *component)
> +{
> +	return snd_soc_component_force_bias_level(component, SND_SOC_BIAS_OFF);
> +}
> +
> +static int adau7118_resume(struct snd_soc_component *component)
> +{
> +	return snd_soc_component_force_bias_level(component,
> +						  SND_SOC_BIAS_STANDBY);
> +}

Let DAPM do this for you, there's no substantial delays on power
on so you're probably best just setting idle_bias_off.

> +static int adau7118_regulator_setup(struct adau7118_data *st)
> +{
> +	int ret =3D 0;
> +
> +	st->iovdd =3D devm_regulator_get_optional(st->dev, "IOVDD");
> +	if (!IS_ERR(st->iovdd)) {

Unless the device can operate with supplies physically absent it
should not be requesting regulators as optional, this breaks your
error handling especially with probe deferral which is a fairly
common case.

--TWLMYU3k2ba4mEMM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2NBsUACgkQJNaLcl1U
h9DTSwf6A3j4WBOC0vVeOzs40lDzb88KcOkWvTA0Pt+vEUZ0DUHQ/AOX1GgN6Zh6
At4k18u+ptataFlScXDHRmrtEcz3Eu8n/gRTXvpifr6z/8EwVhvAMEu5PbL2zHqG
vpV3LE8V0HLflyp+e7V44W8MkLTm21G3xVTqnKEpxFkaUTm/V9nXXZFMHc5249tb
oyHXflE5Ykbp52INzLLjkcIAsg8znpl+RFezGG1GmU8arFGMmnxmMc4Dc+owEC9p
eaXVLp0KTPw+J3h6ajs8jSffq9IxT+124gSvooJoJo009cRjSNP83OHKwdoyLFxc
fbPqwfsORdF+ZnG8k0XqhLjiGYZYWQ==
=3zRw
-----END PGP SIGNATURE-----

--TWLMYU3k2ba4mEMM--

--===============2580827850041757329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============2580827850041757329==--
