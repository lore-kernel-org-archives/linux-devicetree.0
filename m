From: Wadim Egorov <w.egorov@phytec.de>
Subject: Re: [PATCH v2 3/7] regulator: rk808: Migrate to regulator core's
 simplified DT parsing code
Date: Fri, 22 Apr 2016 11:03:09 +0200
Message-ID: <5719E8CD.1070304@phytec.de>
References: <1461244361-45686-1-git-send-email-w.egorov@phytec.de>
 <1461244361-45686-4-git-send-email-w.egorov@phytec.de>
 <20160421160120.GT3217@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160421160120.GT3217@sirena.org.uk>
Sender: linux-clk-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, rtc-linux@googlegroups.com, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mturquette@baylibre.com, sboyd@codeaurora.org, lee.jones@linaro.org, lgirdwood@gmail.com, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, dianders@chromium.org, zyw@rock-chips.com
List-Id: devicetree@vger.kernel.org



On 21.04.2016 18:01, Mark Brown wrote:
> On Thu, Apr 21, 2016 at 03:12:37PM +0200, Wadim Egorov wrote:
>
>> +static int rk808_set_suspend_voltage(struct regulator_dev *rdev, int uv)
>> +{
>> +	unsigned int reg;
>> +	int sel = regulator_map_voltage_linear(rdev, uv, uv);
>> +
>> +	if (sel < 0)
>> +		return -EINVAL;
>> +
>> +	reg = rdev->desc->vsel_reg + RK808_SLP_REG_OFFSET;
>> +
>> +	return regmap_update_bits(rdev->regmap, reg,
>> +				  rdev->desc->vsel_mask,
>> +				  sel);
>> +}
> This is fine but is adding a new feature and not part of the refactoring
> that the changelog talked about so should be in a separate commit.

This is not really a new feature.
rk808_set_suspend_voltage() was using regulator_map_voltage_linear_range().
I have just renamed the function to rk808_set_suspend_voltage_range()
and added an ops struct for ranges.
Yes, I have also added rk808_set_suspend_voltage(), but this is just a split
for the two types of ops that the driver needs now.
This was needed, because the driver used only linear ranges.
IMO it should be a part of the refactoring.

