From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/9] regulator: mt6380: Add support for MT6380
Date: Tue, 6 Jun 2017 19:22:24 +0100
Message-ID: <20170606182224.sifkfod7hehadjvm@sirena.org.uk>
References: <cover.1496425268.git.sean.wang@mediatek.com>
 <4276ab23ae0bbb6a54b1add98c4dc668f1a69c50.1496425268.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kgimolk4zcuu6q7w"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4276ab23ae0bbb6a54b1add98c4dc668f1a69c50.1496425268.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@mediatek.com
Cc: robh+dt@kernel.org, matthias.bgg@gmail.com, mark.rutland@arm.com, lgirdwood@gmail.com, jamesjj.liao@mediatek.com, henryc.chen@mediatek.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, chen.zhong@mediatek.com, chenglin.xu@mediatek.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--kgimolk4zcuu6q7w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 03, 2017 at 01:55:44AM +0800, sean.wang@mediatek.com wrote:

> +static int mt6380_get_status(struct regulator_dev *rdev)
> +{
> +	int ret;
> +	u32 regval;
> +	struct mt6380_regulator_info *info = rdev_get_drvdata(rdev);
> +
> +	ret = regmap_read(rdev->regmap, info->desc.enable_reg, &regval);
> +	if (ret != 0) {
> +		dev_err(&rdev->dev, "Failed to get enable reg: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return (regval & info->desc.enable_mask) ?
> +		REGULATOR_STATUS_ON : REGULATOR_STATUS_OFF;

This isn't really a get_status() operation - it's just showing the
status of the enable we set.  The get_status() operation is for hardware
that has a mechanism for reading back the current physical status of the
regulator, usually including things like if it's in regulation or not.

Also please write normal conditional statements, it helps people read
the code.

> +	ret = regmap_update_bits(rdev->regmap, info->modeset_reg,
> +				 info->modeset_mask, val);
> +
> +	if (regmap_read(rdev->regmap, info->modeset_reg, &reg_value) < 0) {
> +		dev_err(&rdev->dev, "Failed to read register value\n");
> +		return -EIO;
> +	}

Is I/O to the device unreliable for some reason?  If so this isn't great
handling for it...  also if there is an error from regmap_read() you
should return the error code.

> +	unsigned int mode;
> +	int ret;
> +	struct mt6380_regulator_info *info = rdev_get_drvdata(rdev);
> +
> +	if (!info->modeset_mask) {
> +		dev_err(&rdev->dev, "regulator %s doesn't support get_mode\n",
> +			info->desc.name);
> +		return -EINVAL;
> +	}
> +
> +	ret = regmap_read(rdev->regmap, info->modeset_reg, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	val &= info->modeset_mask;
> +	val >>= ffs(info->modeset_mask) - 1;
> +
> +	if (val & 0x1)
> +		mode = REGULATOR_MODE_STANDBY;
> +	else
> +		mode = REGULATOR_MODE_NORMAL;
> +
> +	return mode;
> +}

This won't initialize mode if the regulator is in force PWM mode.  It'd
be clearer and safer to just write a switch statement.

> +		/* Constrain board-specific capabilities according to what
> +		 * this driver and the chip itself can actually do.
> +		 */
> +		c = rdev->constraints;
> +		c->valid_modes_mask |= REGULATOR_MODE_NORMAL |
> +			REGULATOR_MODE_STANDBY | REGULATOR_MODE_FAST;

No, this is completely broken.  A regulator driver should *never* modify
constraints, if the constraints are broken the constraints are broken,
and the constraints will already have been applied when we return from
registering the regulator.

> +		c->valid_ops_mask |= REGULATOR_CHANGE_MODE;

> +static const struct of_device_id mt6380_of_match[] = {
> +	{ .compatible = "mediatek,mt6380-regulator", },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, mt6380_of_match);

Given that this driver is entirely specific to the parent PMIC there
should be no need for a separate compatible string, it's redundant.

--kgimolk4zcuu6q7w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlk28t8ACgkQJNaLcl1U
h9DcYwf/UMXCiDBTH7I9UddJxtUJWVLq+6++p5p+B/Ao/8lrBHC5gxly1YdkuXjK
V+uxSoeyEhprjN1XfB7BV2jLPZjYP/5pPzAT8omLpHwjbd6VbCm2roT4NolYkUye
lZKCovTVzZhn+7VHavGvTzX3FKO4N85AonZyrCIJP4W4ayYfdlHlr8Uk2OH3aUBN
P370hkHDvzeO7wHp5iGekZV7UUv5xGOOOfxlGfS9qTIQZ2KgHVOHnsvRGyZl+sOm
rkjscas2+no48Qu4T6ZlDcelrWptfSGYHah/rRtZekt3IWdUXJcRKrZkyYdgcvBv
iGEypO3mE/2z0/p1hTFQyXmnwgjBIA==
=3cpX
-----END PGP SIGNATURE-----

--kgimolk4zcuu6q7w--
