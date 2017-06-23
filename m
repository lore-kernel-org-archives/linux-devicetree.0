From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 3/9] regulator: mt6380: Add support for MT6380
Date: Fri, 23 Jun 2017 23:56:05 +0800
Message-ID: <1498233365.20651.25.camel@mtkswgap22>
References: <cover.1496425268.git.sean.wang@mediatek.com>
         <4276ab23ae0bbb6a54b1add98c4dc668f1a69c50.1496425268.git.sean.wang@mediatek.com>
         <20170606182224.sifkfod7hehadjvm@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170606182224.sifkfod7hehadjvm-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, chen.zhong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, chenglin.xu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Mark,

appreciate your effort on reviewing those patches 

we'll make next version following your suggestion, here also adding some
comments as inline to explain what thoughts in mind

On Tue, 2017-06-06 at 19:22 +0100, Mark Brown wrote:
> On Sat, Jun 03, 2017 at 01:55:44AM +0800, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> 
> > +static int mt6380_get_status(struct regulator_dev *rdev)
> > +{
> > +	int ret;
> > +	u32 regval;
> > +	struct mt6380_regulator_info *info = rdev_get_drvdata(rdev);
> > +
> > +	ret = regmap_read(rdev->regmap, info->desc.enable_reg, &regval);
> > +	if (ret != 0) {
> > +		dev_err(&rdev->dev, "Failed to get enable reg: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	return (regval & info->desc.enable_mask) ?
> > +		REGULATOR_STATUS_ON : REGULATOR_STATUS_OFF;
> 
> This isn't really a get_status() operation - it's just showing the
> status of the enable we set.  The get_status() operation is for hardware
> that has a mechanism for reading back the current physical status of the
> regulator, usually including things like if it's in regulation or not.
> 
> Also please write normal conditional statements, it helps people read
> the code.

for the hardware, the way for reflect the current physical physical 
has to depend on the bit reading as the bit we enable. It indeed tends
to confuse other users and developers, we maybe can add some comments
for this to avoid.


> > +	ret = regmap_update_bits(rdev->regmap, info->modeset_reg,
> > +				 info->modeset_mask, val);
> > +
> > +	if (regmap_read(rdev->regmap, info->modeset_reg, &reg_value) < 0) {
> > +		dev_err(&rdev->dev, "Failed to read register value\n");
> > +		return -EIO;
> > +	}
> 
> Is I/O to the device unreliable for some reason?  If so this isn't great
> handling for it...  also if there is an error from regmap_read() you
> should return the error code.
> 

O.K. we'll remove it. that just is debug purpose code which confirms the
value we set is correct.


> > +	unsigned int mode;
> > +	int ret;
> > +	struct mt6380_regulator_info *info = rdev_get_drvdata(rdev);
> > +
> > +	if (!info->modeset_mask) {
> > +		dev_err(&rdev->dev, "regulator %s doesn't support get_mode\n",
> > +			info->desc.name);
> > +		return -EINVAL;
> > +	}
> > +
> > +	ret = regmap_read(rdev->regmap, info->modeset_reg, &val);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	val &= info->modeset_mask;
> > +	val >>= ffs(info->modeset_mask) - 1;
> > +
> > +	if (val & 0x1)
> > +		mode = REGULATOR_MODE_STANDBY;
> > +	else
> > +		mode = REGULATOR_MODE_NORMAL;
> > +
> > +	return mode;
> > +}
> 
> This won't initialize mode if the regulator is in force PWM mode.  It'd
> be clearer and safer to just write a switch statement.
> 

we'll fix up the bug with switch statement.

> > +		/* Constrain board-specific capabilities according to what
> > +		 * this driver and the chip itself can actually do.
> > +		 */
> > +		c = rdev->constraints;
> > +		c->valid_modes_mask |= REGULATOR_MODE_NORMAL |
> > +			REGULATOR_MODE_STANDBY | REGULATOR_MODE_FAST;
> 
> No, this is completely broken.  A regulator driver should *never* modify
> constraints, if the constraints are broken the constraints are broken,
> and the constraints will already have been applied when we return from
> registering the regulator.
> 

agreed. we shouldn't break any constraint and the violation would be
removed.

> > +		c->valid_ops_mask |= REGULATOR_CHANGE_MODE;
> 
> > +static const struct of_device_id mt6380_of_match[] = {
> > +	{ .compatible = "mediatek,mt6380-regulator", },
> > +	{ /* sentinel */ },
> > +};
> > +MODULE_DEVICE_TABLE(of, mt6380_of_match);
> 
> Given that this driver is entirely specific to the parent PMIC there
> should be no need for a separate compatible string, it's redundant.


the parent of pmic is MediaTek pwrap which is possibly being used with
various pmics such as MT6323, MT6797, MT6380 and so on. So extra
matching we thought is required to identify which pmic is actually being
connected. 

For those opinions, maybe we didn't get your exact point. If something
is wrong, please kindly guide us to the right place.

	Sean

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
