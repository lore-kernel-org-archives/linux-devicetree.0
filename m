From: Phil Reid <preid@electromag.com.au>
Subject: Re: [PATCH V4 2/2] iio: light: isl29018: add optional vdd/vdda
 regulator operation support
Date: Tue, 11 Dec 2018 11:56:09 +0800
Message-ID: <0b08c0d1-afe2-5ade-9333-2eb7d57d4db6@electromag.com.au>
References: <1544498291-2716-1-git-send-email-Anson.Huang@nxp.com>
 <1544498291-2716-2-git-send-email-Anson.Huang@nxp.com>
 <d07b5970-5825-2ea6-9e27-538386927923@electromag.com.au>
 <DB3PR0402MB39161ED492C863BB48D48E2FF5A60@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB3PR0402MB39161ED492C863BB48D48E2FF5A60@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Content-Language: en-AU
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, "jic23@kernel.org" <jic23@kernel.org>, "knaack.h@gmx.de" <knaack.h@gmx.de>, "lars@metafoo.de" <lars@metafoo.de>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

G'day Anson,

Just pulled up the datasheet for this chip.

The absolute max for Vdda is speced as Vddd +/-0.5
With a note that Vdda should be externally shorted to Vddd.


On 11/12/2018 11:43 am, Anson Huang wrote:
> Hi, Phil
> 
> Best Regards!
> Anson Huang
> 
>> -----Original Message-----
>> From: Phil Reid [mailto:preid@electromag.com.au]
>> Sent: 2018年12月11日 11:36
>> To: Anson Huang <anson.huang@nxp.com>; jic23@kernel.org;
>> knaack.h@gmx.de; lars@metafoo.de; pmeerw@pmeerw.net;
>> robh+dt@kernel.org; mark.rutland@arm.com; linux-iio@vger.kernel.org;
>> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
>> festevam@gmail.com
>> Cc: dl-linux-imx <linux-imx@nxp.com>
>> Subject: Re: [PATCH V4 2/2] iio: light: isl29018: add optional vdd/vdda
>> regulator operation support
>>
>> On 11/12/2018 11:24 am, Anson Huang wrote:
>>> The light sensor's power supply could be controlled by regulator on
>>> some platforms, such as i.MX6Q-SABRESD board, the light sensor
>>> isl29023's power supply is controlled by a GPIO fixed regulator, need
>>> to make sure the regulator is enabled before any operation of sensor,
>>> this patch adds optional vdd/vdda regulator operation support.
>>>
>>> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
>>> ---
>>> ChangeLog since V3:
>>> 	- improve the error handling of devm_regulator_get_optional;
>>> 	- make sure regulators are disabled in error path.
>>> ---
>>>    drivers/iio/light/isl29018.c | 83
>> ++++++++++++++++++++++++++++++++++++++++++--
>>>    1 file changed, 80 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/iio/light/isl29018.c
>>> b/drivers/iio/light/isl29018.c index b45400f..a21652b 100644
>>> --- a/drivers/iio/light/isl29018.c
>>> +++ b/drivers/iio/light/isl29018.c
>>> @@ -23,6 +23,7 @@
>>>    #include <linux/mutex.h>
>>>    #include <linux/delay.h>
>>>    #include <linux/regmap.h>
>>> +#include <linux/regulator/consumer.h>
>>>    #include <linux/slab.h>
>>>    #include <linux/iio/iio.h>
>>>    #include <linux/iio/sysfs.h>
>>> @@ -95,6 +96,8 @@ struct isl29018_chip {
>>>    	struct isl29018_scale	scale;
>>>    	int			prox_scheme;
>>>    	bool			suspended;
>>> +	struct regulator	*vdd_reg;
>>> +	struct regulator	*vdda_reg;
>>>    };
>>>
>>>    static int isl29018_set_integration_time(struct isl29018_chip *chip,
>>> @@ -735,6 +738,34 @@ static int isl29018_probe(struct i2c_client
>>> *client,
>>>
>>>    	mutex_init(&chip->lock);
>>>
>>> +	chip->vdd_reg = devm_regulator_get_optional(&client->dev, "vdd");
>>> +	if (!IS_ERR(chip->vdd_reg)) {
>>> +		err = regulator_enable(chip->vdd_reg);
>>> +		if (err) {
>>> +			dev_err(&client->dev, "failed to enable VDD regulator\n");
>>> +			return err;
>>> +		}
>>> +	} else {
>>> +		err = PTR_ERR(chip->vdd_reg);
>>> +		if (err != -ENODEV)
>>> +			return err;
>>> +	}
>>> +
>>> +	chip->vdda_reg = devm_regulator_get_optional(&client->dev, "vdda");
>>> +	if (!IS_ERR(chip->vdda_reg)) {
>>> +		err = regulator_enable(chip->vdda_reg);
>>> +		if (err) {
>>> +			dev_err(&client->dev, "failed to enable VDDA regulator\n");
>>> +			if (!IS_ERR(chip->vdd_reg))
>>> +				regulator_disable(chip->vdd_reg);
>>> +			return err;
Not sure about this case at the call to enable failed so I think
you only want the first one to be disabled.
You could add another goto statement thou, see below.


>>> +		}
>>> +	} else {
>>> +		err = PTR_ERR(chip->vdda_reg);
>>> +		if (err != -ENODEV)
>>> +			return err;
>> maybe goto disable_regulators; to disable vdd.
> 
> Agree, I will use " goto disable_regulators;" in both here and upper regulator enable fail case.
> Please help review V5, thanks.

Here its safe to call both as vdda_reg will be an error ptr.

> 
> Anson
> 
>>
>>> +	}
>>> +
>>>    	chip->type = dev_id;
>>>    	chip->calibscale = 1;
>>>    	chip->ucalibscale = 0;
>>> @@ -747,12 +778,12 @@ static int isl29018_probe(struct i2c_client *client,
>>>    	if (IS_ERR(chip->regmap)) {
>>>    		err = PTR_ERR(chip->regmap);
>>>    		dev_err(&client->dev, "regmap initialization fails: %d\n", err);
>>> -		return err;
>>> +		goto disable_regulators;
>>>    	}
>>>
>>>    	err = isl29018_chip_init(chip);
>>>    	if (err)
>>> -		return err;
>>> +		goto disable_regulators;
>>>
>>>    	indio_dev->info = isl29018_chip_info_tbl[dev_id].indio_info;
>>>    	indio_dev->channels = isl29018_chip_info_tbl[dev_id].channels;
>>> @@ -761,13 +792,24 @@ static int isl29018_probe(struct i2c_client *client,
>>>    	indio_dev->dev.parent = &client->dev;
>>>    	indio_dev->modes = INDIO_DIRECT_MODE;
>>>
>>> -	return devm_iio_device_register(&client->dev, indio_dev);
>>> +	err = devm_iio_device_register(&client->dev, indio_dev);
>>> +	if (!err)
>>> +		return 0;
>>> +
>>> +disable_regulators:
>>> +	if (!IS_ERR(chip->vdd_reg))
>>> +		regulator_disable(chip->vdd_reg);
>>> +	if (!IS_ERR(chip->vdda_reg))
>>> +		regulator_disable(chip->vdda_reg);
>>> +
eg: extra label here.
Order is changed thou, which may be a problem.
It's in the reverse order to the enable, which is usually what you want but the
datasheet concerns above may be an issue.


disable_regulators:
	if (!IS_ERR(chip->vdda_reg))
		regulator_disable(chip->vdda_reg);
disable_regulator_vdd:
	if (!IS_ERR(chip->vdd_reg))
		regulator_disable(chip->vdd_reg);

>>> +	return err;
>>>    }
>>>
>> [snip]
>>



-- 
Regards
Phil
