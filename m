From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH V3 2/2] iio: light: isl29018: add optional vdd/vdda
 regulator operation support
Date: Mon, 10 Dec 2018 20:48:24 +0000
Message-ID: <20181210204824.7234d253@archlinux>
References: <1544425521-775-1-git-send-email-Anson.Huang@nxp.com>
        <1544425521-775-2-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544425521-775-2-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "knaack.h@gmx.de" <knaack.h@gmx.de>, "lars@metafoo.de" <lars@metafoo.de>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Mon, 10 Dec 2018 07:11:23 +0000
Anson Huang <anson.huang@nxp.com> wrote:

> The light sensor's power supply could be controlled by regulator
> on some platforms, such as i.MX6Q-SABRESD board, the light sensor
> isl29023's power supply is controlled by a GPIO fixed regulator,
> need to make sure the regulator is enabled before any operation of
> sensor, this patch adds optional vdd/vdda regulator operation support.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
Comments on the other patches apply on error handling and
cleaner pattern for the error handling so I won't review this one.

Thanks,

Jonathan


> ---
> ChangeLog since V2:
>     - Add defer_probe check if the return value from devm_regulator_get_optional is ERR_PTR(-EPROBE_DEFER);
>     - Replace the "vcc" with "vdd" according to datasheet, and add optional "vdda" supply as well since
>       isl29018 also has a vdda supply.
> ---
>  drivers/iio/light/isl29018.c | 59 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/drivers/iio/light/isl29018.c b/drivers/iio/light/isl29018.c
> index b45400f..477eb95 100644
> --- a/drivers/iio/light/isl29018.c
> +++ b/drivers/iio/light/isl29018.c
> @@ -23,6 +23,7 @@
>  #include <linux/mutex.h>
>  #include <linux/delay.h>
>  #include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
>  #include <linux/iio/iio.h>
>  #include <linux/iio/sysfs.h>
> @@ -95,6 +96,8 @@ struct isl29018_chip {
>  	struct isl29018_scale	scale;
>  	int			prox_scheme;
>  	bool			suspended;
> +	struct regulator	*vdd_reg;
> +	struct regulator	*vdda_reg;
>  };
>  
>  static int isl29018_set_integration_time(struct isl29018_chip *chip,
> @@ -735,6 +738,28 @@ static int isl29018_probe(struct i2c_client *client,
>  
>  	mutex_init(&chip->lock);
>  
> +	chip->vdd_reg = devm_regulator_get_optional(&client->dev, "vdd");
> +	if (!IS_ERR(chip->vdd_reg)) {
> +		err = regulator_enable(chip->vdd_reg);
> +		if (err) {
> +			dev_err(&client->dev, "failed to enable VDD regulator\n");
> +			return err;
> +		}
> +	} else if (chip->vdd_reg == ERR_PTR(-EPROBE_DEFER)) {
> +		return -EPROBE_DEFER;
> +	}
> +
> +	chip->vdda_reg = devm_regulator_get_optional(&client->dev, "vdda");
> +	if (!IS_ERR(chip->vdda_reg)) {
> +		err = regulator_enable(chip->vdda_reg);
> +		if (err) {
> +			dev_err(&client->dev, "failed to enable VDDA regulator\n");
> +			return err;
> +		}
> +	} else if (chip->vdda_reg == ERR_PTR(-EPROBE_DEFER)) {
> +		return -EPROBE_DEFER;
> +	}
> +
>  	chip->type = dev_id;
>  	chip->calibscale = 1;
>  	chip->ucalibscale = 0;
> @@ -768,6 +793,7 @@ static int isl29018_probe(struct i2c_client *client,
>  static int isl29018_suspend(struct device *dev)
>  {
>  	struct isl29018_chip *chip = iio_priv(dev_get_drvdata(dev));
> +	int ret;
>  
>  	mutex_lock(&chip->lock);
>  
> @@ -777,6 +803,22 @@ static int isl29018_suspend(struct device *dev)
>  	 * So we do not have much to do here.
>  	 */
>  	chip->suspended = true;
> +	if (!IS_ERR(chip->vdd_reg)) {
> +		ret = regulator_disable(chip->vdd_reg);
> +		if (ret) {
> +			dev_err(dev, "failed to disable VDD regulator\n");
> +			mutex_unlock(&chip->lock);
> +			return ret;
> +		}
> +	}
> +	if (!IS_ERR(chip->vdda_reg)) {
> +		ret = regulator_disable(chip->vdda_reg);
> +		if (ret) {
> +			dev_err(dev, "failed to disable VDDA regulator\n");
> +			mutex_unlock(&chip->lock);
> +			return ret;
> +		}
> +	}
>  
>  	mutex_unlock(&chip->lock);
>  
> @@ -790,6 +832,23 @@ static int isl29018_resume(struct device *dev)
>  
>  	mutex_lock(&chip->lock);
>  
> +	if (!IS_ERR(chip->vdd_reg)) {
> +		err = regulator_enable(chip->vdd_reg);
> +		if (err) {
> +			dev_err(dev, "failed to enable VDD regulator\n");
> +			mutex_unlock(&chip->lock);
> +			return err;
> +		}
> +	}
> +	if (!IS_ERR(chip->vdda_reg)) {
> +		err = regulator_enable(chip->vdda_reg);
> +		if (err) {
> +			dev_err(dev, "failed to enable VDDA regulator\n");
> +			mutex_unlock(&chip->lock);
> +			return err;
> +		}
> +	}
> +
>  	err = isl29018_chip_init(chip);
>  	if (!err)
>  		chip->suspended = false;
