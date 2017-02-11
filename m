From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v1] regulator: Add driver for voltage controlled
 regulators
Date: Fri, 10 Feb 2017 16:32:45 -0800
Message-ID: <20170211003245.GA56005@google.com>
References: <20170210204348.107871-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170210204348.107871-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Brian Norris <briannorris@chromium.org>, Guenter Roeck <groeck@chromium.org>, Dmitry Torokhov <dtor@chromium.org>
List-Id: devicetree@vger.kernel.org

El Fri, Feb 10, 2017 at 12:43:48PM -0800 Matthias Kaehlcke ha dit:

> The output voltage of a voltage controlled regulator can be controlled
> through the voltage of another regulator. The current version of this
> driver assumes that the output voltage is a linear function of the control
> voltage.
> 
> ...
>
> +static int vctrl_probe(struct platform_device *pdev)
> +{
> ...
> +	/* determine if the voltage range of the control supply is continuous */
> +	if ((regulator_count_voltages(vctrl->ctrl_supply) == 1) &&
> +	    regulator_is_supported_voltage(vctrl->ctrl_supply,
> +					   vrange_ctrl->min_uV,
> +					   vrange_ctrl->min_uV) &&
> +	    regulator_is_supported_voltage(vctrl->ctrl_supply,
> +					   vrange_ctrl->max_uV,
> +					   vrange_ctrl->max_uV)) {
> +		rdesc->continuous_voltage_range = true;
> +		rdesc->ops = &vctrl_ops_cont;
> +	} else {
> +		rdesc->ops = &vctrl_ops_non_cont;
> +	}

This creature of indisputable beauty seemed to do the job on my
test systen, however I just realized that the condition is BS. It
turns out that on my system the voltage count of 1 stems from the
parent, since the voltage count of the control supply itself is zero.

int regulator_count_voltages(struct regulator *regulator)
{
	struct regulator_dev    *rdev = regulator->rdev;

	if (rdev->desc->n_voltages)
		return rdev->desc->n_voltages;

	if (!rdev->supply)
		return -EINVAL;

	return regulator_count_voltages(rdev->supply);
}

This certainly doesn't help to determine if the regulator has a
continous voltage range. It seems we need a function that evaluates
rdesc->continuous_voltage_range

--

Matthias
