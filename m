From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 6/9] regulator: mt6358: Add support for MT6358 regulator
Date: Wed, 13 Mar 2019 15:01:32 +0000
Message-ID: <20190313150132.GA5951@sirena.org.uk>
References: <1552275991-34648-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1552275991-34648-7-git-send-email-hsin-hsiung.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0366961588999294646=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1552275991-34648-7-git-send-email-hsin-hsiung.wang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, srv_heupstream@mediatek.com, Alessandro Zummo <a.zummo@towertech.it>, Marc Zyngier <marc.zyngier@arm.com>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Eddie Huang <eddie.huang@mediatek.com>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0366961588999294646==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Content-Disposition: inline


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 11, 2019 at 11:46:28AM +0800, Hsin-Hsiung Wang wrote:

> +static const u32 vefuse_voltages[] = {
> +	1700000, 1800000, 1900000,
> +};

This and a bunch of the other regulators look like they're just linear
ranges and could use the linear range helpers.

> +static const u32 vcn33_bt_voltages[] = {
> +	3300000, 3400000, 3500000,
> +};
> +
> +static const u32 vcn33_wifi_voltages[] = {
> +	3300000, 3400000, 3500000,
> +};

These also have the same range so no matter which helpers are used I'd
expect the data to be shared, I think some of the other regulators might
have shared tables but didn't confirm.

> +static inline unsigned int mt6358_map_mode(unsigned int mode)
> +{
> +	return mode == MT6358_BUCK_MODE_FORCE_PWM ?
> +		REGULATOR_MODE_FAST : REGULATOR_MODE_NORMAL;
> +}

Please write normal if statements, it makes the code more readable.

> +static int mt6358_set_voltage_sel(struct regulator_dev *rdev,
> +				  unsigned int selector)
> +{
> +	int idx, ret;
> +	const u32 *pvol;
> +	struct mt6358_regulator_info *info = rdev_get_drvdata(rdev);
> +
> +	pvol = (const u32 *)info->index_table;
> +
> +	idx = pvol[selector];
> +	ret = regmap_update_bits(rdev->regmap, info->desc.vsel_reg,
> +				 info->desc.vsel_mask,
> +				 idx << info->vsel_shift);
> +
> +	return ret;
> +}

This looks like something other devices might do - rather than implement
it in the driver it would be a bit better to add it to helpers.c as a
reusable function.

> +static int mt6358_get_buck_voltage_sel(struct regulator_dev *rdev)
> +{
> +	int ret, regval;
> +	struct mt6358_regulator_info *info = rdev_get_drvdata(rdev);
> +
> +	ret = regmap_read(rdev->regmap, info->da_vsel_reg, &regval);
> +	if (ret != 0) {
> +		dev_info(&rdev->dev,
> +			 "Failed to get mt6358 Buck %s vsel reg: %d\n",
> +			 info->desc.name, ret);
> +		return ret;
> +	}
> +
> +	ret = (regval >> info->da_vsel_shift) & info->da_vsel_mask;
> +
> +	return ret;
> +}

This is just the generic get_voltage_sel() as far as I can see?

> +	/* Read PMIC chip revision to update constraints and voltage table */
> +	if (regmap_read(mt6397->regmap, MT6358_SWCID, &reg_value) < 0) {
> +		dev_err(&pdev->dev, "Failed to read Chip ID\n");
> +		return -EIO;
> +	}

We never use the value we read here?


--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlyJG0kACgkQJNaLcl1U
h9Bqcwf/cBs7hTJMGSxxGTMQXuOiF7spWZKUwkRLK+rWiYzZv7xUeHEoUoSLZzm/
d1xUkLNQ48R3p7Ey4aVzFf3HltiH9RGj+3g8OszIJS6SdTybiZYhJqMsAMnqfX/x
tIbiu6NhlLrtm6qfKEEjHHnYSu1dIhMm6Y6JJ4D/yjpxWBed6xR0LlGTk7s3b3Gs
xf1hGjBU2Hl0CE4TiamypPcVTzEIx4mzw1VpB2qBXwCoDLG1wnJKwjAmFVFNyWLo
jpEeWmmqBboKOiRw+LfVXPW7CF35a3smalwrzBhIYToBop3b95kY5Pza/r7Vmr84
203AJzm4IdIG7xe56xcuLu3AOOQqaA==
=Aw1h
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--


--===============0366961588999294646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0366961588999294646==--
