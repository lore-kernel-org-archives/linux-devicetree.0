From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/1] regulator: Add new driver for ST's PWM controlled
 voltage regulators
Date: Thu, 20 Mar 2014 15:48:27 +0000
Message-ID: <20140320154827.GE8207@lee--X1>
References: <1395324654-8235-1-git-send-email-lee.jones@linaro.org>
 <20140320152837.GW18529@joshc.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140320152837.GW18529@joshc.qualcomm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Josh Cartwright <joshc@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, broonie@kernel.org, kernel@stlinux.com
List-Id: devicetree@vger.kernel.org

> > On some STMicroelectronics hardware reside regulators consisting
> > partly of a PWM input connected to the feedback loop. As the PWM
> > duty-cycle is varied the output voltage adapts. This driver
> > allows us to vary the output voltage by adapting the PWM input
> > duty-cycle.
> >=20
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > --- /dev/null
> > +++ b/drivers/regulator/st-pwm.c
> > +static int st_pwm_regulator_set_voltage(struct regulator_dev *dev,
> > +					int min_uV, int max_uV,
> > +					unsigned *selector)
> > +{
> > +	struct st_pwm_regulator_data *drvdata =3D rdev_get_drvdata(dev);
> > +	int dutycycle, best_val =3D INT_MAX;
> > +	int sel, ret;
> > +
> > +	for (sel =3D 0; sel < dev->desc->n_voltages; sel++) {
> > +		if (drvdata->duty_cycle_table[sel].uV < best_val &&
> > +		    drvdata->duty_cycle_table[sel].uV >=3D min_uV &&
> > +		    drvdata->duty_cycle_table[sel].uV <=3D max_uV) {
> > +			best_val =3D drvdata->duty_cycle_table[sel].uV;
> > +			if (selector)
> > +				*selector =3D sel;
> > +		}
> > +	}
>=20
> If you implement .set_voltage_sel() instead and set map_voltage to
> regulator_map_voltage_iterate, the core can take care of this.

I'll do that, thanks.

> > +
> > +	if (best_val =3D=3D INT_MAX)
> > +		return -EINVAL;
> > +
> > +	dutycycle =3D (ST_PWM_REG_PERIOD / 100) *
> > +		drvdata->duty_cycle_table[sel].dutycycle;
>=20
> Considering (ST_PWM_REG_PERIOD / 100) is constant, could you get away
> with dropping this calculation by just putting the already-adjusted
> values into your duty cycle table?

I thought about this, but I settled on this way for clarity. Also,
this is only a constant if no one decides to change the period, so the
calculation needs to be done somewhere. Did you have something better
in mind?

[...]=20

> > +static struct st_pwm_voltages b2105_duty_cycle_table[] =3D {
> > +	{ .uV =3D 1114000, .dutycycle =3D 0,  },
> > +	{ .uV =3D 1095000, .dutycycle =3D 10, },
> > +	{ .uV =3D 1076000, .dutycycle =3D 20, },
> > +	{ .uV =3D 1056000, .dutycycle =3D 30, },
> > +	{ .uV =3D 1036000, .dutycycle =3D 40, },
> > +	{ .uV =3D  996000, .dutycycle =3D 50, },
> > +	/* WARNING: Values above 50% duty-cycle cause boot failures. */
> > +};
> > +
> > +static struct regulator_desc b2105_desc =3D {
> > +	.name		=3D "b2105-pwm-regulator",
> > +	.ops		=3D &st_pwm_regulator_voltage_ops,
> > +	.type		=3D REGULATOR_VOLTAGE,
> > +	.owner		=3D THIS_MODULE,
> > +	.n_voltages	=3D ARRAY_SIZE(b2105_duty_cycle_table),
> > +	.supply_name    =3D "pwm",
> > +};
> > +
> > +static struct st_pwm_regulator_data b2105_info =3D {
> > +	.desc		  =3D &b2105_desc,
> > +	.duty_cycle_table =3D b2105_duty_cycle_table,
> > +};
> > +
> > +static struct of_device_id st_pwm_of_match[] =3D {
>=20
> const.  At least the regulator_desc and duty cycle table should be co=
nst
> as well. (see my comments below about b2105_info).
>=20
> > +	{ .compatible =3D "st,b2105-pwm-regulator", .data =3D &b2105_info=
, },
> > +	{ },
> > +};
>=20
> You may want a MODULE_DEVICE_TABLE(of, ...); here if you want to be a=
ble
> to be autoloaded.

Right, good catch.

> > +static int st_pwm_regulator_probe(struct platform_device *pdev)
> > +{
> > +	struct device_node *np =3D pdev->dev.of_node;
> > +	struct st_pwm_regulator_data *drvdata;
> > +	const struct of_device_id *of_match;
> > +	struct regulator_dev *regulator;
> > +	struct regulator_config config =3D { };
> > +
> > +	if (!np) {
> > +		dev_err(&pdev->dev, "Device Tree node missing\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	of_match =3D of_match_device(st_pwm_of_match, &pdev->dev);
> > +	if (!of_match) {
> > +		dev_err(&pdev->dev, "failed to match of device\n");
> > +		return -ENODEV;
> > +	}
> > +	drvdata =3D  (struct st_pwm_regulator_data *) of_match->data;
>=20
> Hrm, I typed "cast not necessary here", but then I realized it is
> necessary since you using it to cast away constness.

This is remnant from when I was doing something unessersariy
complcated in a previous (unpublished/personal) revision. I'll take a
look at this too, thanks.

> Are you safe assuming that there will only be one of these devices in=
 a
> system?  It doesn't seem like much a burden to just allocate a new
> object and use it instead of a statically allocated one.

I have written this driver to be expandable. We have new systems
coming out which contain more than one of these regulators. Unless I'm
missing your meaning?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
