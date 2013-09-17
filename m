From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 3/4] regulator: as3722: add regulator driver for AMS AS3722
Date: Tue, 17 Sep 2013 17:45:28 +0530
Message-ID: <523847E0.2020400@nvidia.com>
References: <1379400338-20704-1-git-send-email-ldewangan@nvidia.com> <1379400338-20704-4-git-send-email-ldewangan@nvidia.com> <20130917114133.GV21013@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20130917114133.GV21013@sirena.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: "lee.jones@linaro.org" <lee.jones@linaro.org>, "sameo@linux.intel.com" <sameo@linux.intel.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "rtc-linux@googlegroups.com" <rtc-linux@googlegroups.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "rob@landley.net" <rob@landley.net>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "grant.likely@linaro.org" <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org


>> +static int as3722_ldo_get_voltage_sel(struct regulator_dev *rdev)
>> +{
>> +	int ret;
>> +
>> +	ret = regulator_get_voltage_sel_regmap(rdev);
>> +	if (ret >= 0x40)
>> +		ret -= 0x1B;
>> +	return ret;
>> +}
> This looks very strange.  What's going on here?  A gap in the selectors?
> If that's the case you probably want to be using linear ranges.

Yes device does not want to be configure the vsel to 0x25 to 0x3F

   01h-24h : V_LDO1=0.8V+ldo1_vsel*25mV
   25h-3Fh : do not use
   40h-7Fh : V_LDO1=1.725V+(ldo1_vsel-40h)*25mV

Let me use linear range.

>> +		if (reg_config->ext_control) {
>> +			ret = regulator_enable_regmap(rdev);
>> +			if (ret < 0) {
>> +				dev_err(&pdev->dev,
>> +					"Regulator %d enable failed: %d\n",
>> +					id, ret);
>> +				goto scrub;
>> +			}
> This looks wrong...  why is the regualtor being enabled by something
> other than the core?

When the rail is configured externally controlled then we are not 
providing the enable/disable callback to enable through register access. 
So core will not be able to enable it.
Here, we are making sure that it is enabled through register write.
After that enable/disable can be done by device-input pin toggeling.

