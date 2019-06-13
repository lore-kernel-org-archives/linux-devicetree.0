From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/4] regulator: Add labibb driver
Date: Thu, 13 Jun 2019 18:25:18 +0100
Message-ID: <20190613172518.GN5316@sirena.org.uk>
References: <1560337252-27193-1-git-send-email-nishakumari@codeaurora.org>
 <1560337252-27193-4-git-send-email-nishakumari@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tpyx7gKuSYt+mjHM"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1560337252-27193-4-git-send-email-nishakumari@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nisha Kumari <nishakumari@codeaurora.org>
Cc: bjorn.andersson@linaro.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, agross@kernel.org, lgirdwood@gmail.com, mark.rutland@arm.com, david.brown@linaro.org, linux-kernel@vger.kernel.org, kgunda@codeaurora.org, rnayak@codeaurora.org
List-Id: devicetree@vger.kernel.org


--tpyx7gKuSYt+mjHM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2019 at 04:30:51PM +0530, Nisha Kumari wrote:

> +static int qcom_labibb_read(struct qcom_labibb *labibb, u16 address,
> +			    u8 *val, int count)
> +{
> +	int ret;
> +
> +	ret =3D regmap_bulk_read(labibb->regmap, address, val, count);
> +	if (ret < 0)
> +		dev_err(labibb->dev, "spmi read failed ret=3D%d\n", ret);
> +
> +	return ret;
> +}

This (and the write function) are utterly trivial wrappers around the
corresponding regmap functions...

> +static int qcom_labibb_masked_write(struct qcom_labibb *labibb, u16 addr=
ess,
> +				    u8 mask, u8 val)
> +{
> +	int ret;
> +
> +	ret =3D regmap_update_bits(labibb->regmap, address, mask, val);
> +	if (ret < 0)
> +		dev_err(labibb->dev, "spmi write failed: ret=3D%d\n", ret);
> +
> +	return ret;
> +}

=2E..as is this but it changes the name for some reason.

> +static int qcom_enable_ibb(struct qcom_labibb *labibb, bool enable)
> +{
> +	int ret;
> +	u8 val =3D enable ? IBB_CONTROL_ENABLE : 0;

Please write normal conditional statements, it makes things easier to
read.  Though this function is so trivial it seems better to just inline
it into the callers.

> +static int qcom_lab_regulator_enable(struct regulator_dev *rdev)
> +{
> +	int ret;
> +	u8 val;
> +	struct qcom_labibb *labibb  =3D rdev_get_drvdata(rdev);
> +
> +	val =3D LAB_ENABLE_CTL_EN;
> +	ret =3D qcom_labibb_write(labibb,
> +				labibb->lab_base + REG_LAB_ENABLE_CTL,
> +				&val, 1);

Why not just use regmap_write()?  It'd be clearer.

> +	labibb->lab_vreg.vreg_enabled =3D 1;

What function does this serve?  It never seems to be read.

> +	ret =3D qcom_labibb_write(labibb,
> +				labibb->lab_base + REG_LAB_ENABLE_CTL,
> +				&val, 1);
> +	if (ret < 0) {
> +		dev_err(labibb->dev, "Write register failed ret =3D %d\n", ret);
> +		return ret;
> +	}
> +	/* after this delay, lab should get disabled */
> +	usleep_range(POWER_DELAY, POWER_DELAY + 100);
> +
> +	ret =3D qcom_labibb_read(labibb, labibb->lab_base +
> +			       REG_LAB_STATUS1, &val, 1);
> +	if (ret < 0) {
> +		dev_err(labibb->dev, "Read register failed ret =3D %d\n", ret);
> +		return ret;
> +	}

I'm not clear that these status checks are actually a good idea, and if
they are it feels like they should be factored out into the framework -
these are just regular enable or disable followed by the usual dead
reckoning delay for completion and then a get_status() call to confirm
if the operation worked.  That's not at all driver specific so if it's
useful the core should do it for all regulators with status readback and
if you didn't do it you could use the standard regmap helpers for these
operations. =20

> +static int qcom_lab_regulator_is_enabled(struct regulator_dev *rdev)
> +{
> +	int ret;
> +	u8 val;
> +	struct qcom_labibb *labibb  =3D rdev_get_drvdata(rdev);
> +
> +	ret =3D qcom_labibb_read(labibb, labibb->lab_base +
> +			       REG_LAB_STATUS1, &val, 1);
> +	if (ret < 0) {
> +		dev_err(labibb->dev, "Read register failed ret =3D %d\n", ret);
> +		return ret;
> +	}
> +
> +	return val & LAB_STATUS1_VREG_OK_BIT;
> +}

Please use the standard helper for this, and this is a get_status()
operation not an is_enabled() - it checks if the regulator is working,
not what status was requested.

> +	while (retries--) {
> +		/* Wait for a small period before reading IBB_STATUS1 */
> +		usleep_range(POWER_DELAY, POWER_DELAY + 100);
> +
> +		ret =3D qcom_labibb_read(labibb, labibb->ibb_base +
> +				       REG_IBB_STATUS1, &val, 1);
> +		if (ret < 0) {
> +			dev_err(labibb->dev,
> +				"Read register failed ret =3D %d\n", ret);
> +			return ret;
> +		}
> +
> +		if (val & IBB_STATUS1_VREG_OK_BIT) {
> +			labibb->ibb_vreg.vreg_enabled =3D 1;
> +			return 0;
> +		}
> +	}

This is doing more than the other regulator was but it's not clear why -
is it just that the delays are different for the two regulators?

> +static int register_lab_regulator(struct qcom_labibb *labibb,
> +				  struct device_node *of_node)
> +{
> +	int ret =3D 0;
> +	struct regulator_init_data *init_data;
> +	struct regulator_config cfg =3D {};
> +
> +	cfg.dev =3D labibb->dev;
> +	cfg.driver_data =3D labibb;
> +	cfg.of_node =3D of_node;
> +	init_data =3D
> +		of_get_regulator_init_data(labibb->dev,
> +					   of_node, &lab_desc);
> +	if (!init_data) {
> +		dev_err(labibb->dev,
> +			"unable to get init data for LAB\n");
> +		return -ENOMEM;
> +	}

The core will parse the DT for you.

--tpyx7gKuSYt+mjHM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0Chv4ACgkQJNaLcl1U
h9CEqAf/QFvYLRcHvi2D2fwm6tH8HKFCtw/AKOh5X+6AF1YFlXl8kSNv4OrZBGgx
A6p7x+PAr05eyRsfgVT1F324CG7oGi7dQV1P4ogG6Reg7iuxXxbbmrxb7QZ3biBO
N+j7fXdFflwtEEexU8uV3oQ2DMB2CGX+E+VCm1OSrVfbLV1rLN2tOJ3f5cW9e4D5
lCC5kzwTzkmnsjYlFpf1+zFp15Vj+2NTeP90Thuqx2InT1iJxU/ZqDIA8fmHfWK8
YK60LTjRxn/brpHY9BjiLX5g2On658n8XRz1oP9l5JfhYqS3oBnU9dFQAHGcy1I2
sI/GreeI0hc5CW0Vltk94O9Y4ZB/IQ==
=TFUj
-----END PGP SIGNATURE-----

--tpyx7gKuSYt+mjHM--
