From: Phil Reid <preid@electromag.com.au>
Subject: Re: [PATCH V4 2/2] iio: light: isl29018: add optional vdd/vdda
 regulator operation support
Date: Tue, 11 Dec 2018 11:36:12 +0800
Message-ID: <d07b5970-5825-2ea6-9e27-538386927923@electromag.com.au>
References: <1544498291-2716-1-git-send-email-Anson.Huang@nxp.com>
 <1544498291-2716-2-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544498291-2716-2-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-AU
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, "jic23@kernel.org" <jic23@kernel.org>, "knaack.h@gmx.de" <knaack.h@gmx.de>, "lars@metafoo.de" <lars@metafoo.de>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On 11/12/2018 11:24 am, Anson Huang wrote:
> The light sensor's power supply could be controlled by regulator
> on some platforms, such as i.MX6Q-SABRESD board, the light sensor
> isl29023's power supply is controlled by a GPIO fixed regulator,
> need to make sure the regulator is enabled before any operation of
> sensor, this patch adds optional vdd/vdda regulator operation support.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> ChangeLog since V3:
> 	- improve the error handling of devm_regulator_get_optional;
> 	- make sure regulators are disabled in error path.
> ---
>   drivers/iio/light/isl29018.c | 83 ++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 80 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/light/isl29018.c b/drivers/iio/light/isl29018.c
> index b45400f..a21652b 100644
> --- a/drivers/iio/light/isl29018.c
> +++ b/drivers/iio/light/isl29018.c
> @@ -23,6 +23,7 @@
>   #include <linux/mutex.h>
>   #include <linux/delay.h>
>   #include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
>   #include <linux/slab.h>
>   #include <linux/iio/iio.h>
>   #include <linux/iio/sysfs.h>
> @@ -95,6 +96,8 @@ struct isl29018_chip {
>   	struct isl29018_scale	scale;
>   	int			prox_scheme;
>   	bool			suspended;
> +	struct regulator	*vdd_reg;
> +	struct regulator	*vdda_reg;
>   };
>   
>   static int isl29018_set_integration_time(struct isl29018_chip *chip,
> @@ -735,6 +738,34 @@ static int isl29018_probe(struct i2c_client *client,
>   
>   	mutex_init(&chip->lock);
>   
> +	chip->vdd_reg = devm_regulator_get_optional(&client->dev, "vdd");
> +	if (!IS_ERR(chip->vdd_reg)) {
> +		err = regulator_enable(chip->vdd_reg);
> +		if (err) {
> +			dev_err(&client->dev, "failed to enable VDD regulator\n");
> +			return err;
> +		}
> +	} else {
> +		err = PTR_ERR(chip->vdd_reg);
> +		if (err != -ENODEV)
> +			return err;
> +	}
> +
> +	chip->vdda_reg = devm_regulator_get_optional(&client->dev, "vdda");
> +	if (!IS_ERR(chip->vdda_reg)) {
> +		err = regulator_enable(chip->vdda_reg);
> +		if (err) {
> +			dev_err(&client->dev, "failed to enable VDDA regulator\n");
> +			if (!IS_ERR(chip->vdd_reg))
> +				regulator_disable(chip->vdd_reg);
> +			return err;
> +		}
> +	} else {
> +		err = PTR_ERR(chip->vdda_reg);
> +		if (err != -ENODEV)
> +			return err;
maybe goto disable_regulators; to disable vdd.

> +	}
> +
>   	chip->type = dev_id;
>   	chip->calibscale = 1;
>   	chip->ucalibscale = 0;
> @@ -747,12 +778,12 @@ static int isl29018_probe(struct i2c_client *client,
>   	if (IS_ERR(chip->regmap)) {
>   		err = PTR_ERR(chip->regmap);
>   		dev_err(&client->dev, "regmap initialization fails: %d\n", err);
> -		return err;
> +		goto disable_regulators;
>   	}
>   
>   	err = isl29018_chip_init(chip);
>   	if (err)
> -		return err;
> +		goto disable_regulators;
>   
>   	indio_dev->info = isl29018_chip_info_tbl[dev_id].indio_info;
>   	indio_dev->channels = isl29018_chip_info_tbl[dev_id].channels;
> @@ -761,13 +792,24 @@ static int isl29018_probe(struct i2c_client *client,
>   	indio_dev->dev.parent = &client->dev;
>   	indio_dev->modes = INDIO_DIRECT_MODE;
>   
> -	return devm_iio_device_register(&client->dev, indio_dev);
> +	err = devm_iio_device_register(&client->dev, indio_dev);
> +	if (!err)
> +		return 0;
> +
> +disable_regulators:
> +	if (!IS_ERR(chip->vdd_reg))
> +		regulator_disable(chip->vdd_reg);
> +	if (!IS_ERR(chip->vdda_reg))
> +		regulator_disable(chip->vdda_reg);
> +
> +	return err;
>   }
>   
[snip]

-- 
Regards
Phil
