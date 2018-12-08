From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 2/2] iio: accell: mma8452: add optional vcc regulator
 operation support
Date: Sat, 8 Dec 2018 12:10:30 +0000
Message-ID: <20181208121030.57e081dc@archlinux>
References: <1544077059-4471-1-git-send-email-Anson.Huang@nxp.com>
        <1544077059-4471-2-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544077059-4471-2-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "knaack.h@gmx.de" <knaack.h@gmx.de>, "lars@metafoo.de" <lars@metafoo.de>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "harinath922@gmail.com" <harinath922@gmail.com>, Leonard Crestez <leonard.crestez@nxp.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "martink@posteo.de" <martink@posteo.de>, "rtresidd@electromag.com.au" <rtresidd@electromag.com.au>, "gustavo@embeddedor.com" <gustavo@embeddedor.com>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Thu, 6 Dec 2018 06:23:33 +0000
Anson Huang <anson.huang@nxp.com> wrote:

> The accelerometer's power supply could be controlled by regulator
> on some platforms, such as i.MX6Q-SABRESD board, the mma8451's
> power supply is controlled by a GPIO fixed regulator, need to make
> sure the regulator is enabled before any communication with mma8451,
> this patch adds optional vcc regulator operation support.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  drivers/iio/accel/mma8452.c | 88 +++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 86 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index 421a0a8..8f6123f 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
> @@ -31,6 +31,7 @@
>  #include <linux/of_device.h>
>  #include <linux/of_irq.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
>  
>  #define MMA8452_STATUS				0x00
>  #define  MMA8452_STATUS_DRDY			(BIT(2) | BIT(1) | BIT(0))
> @@ -107,6 +108,7 @@ struct mma8452_data {
>  	u8 data_cfg;
>  	const struct mma_chip_info *chip_info;
>  	int sleep_val;
> +	struct regulator *vcc_reg;
>  };
>  
>   /**
> @@ -1533,6 +1535,14 @@ static int mma8452_probe(struct i2c_client *client,
>  	data->client = client;
>  	mutex_init(&data->lock);
>  	data->chip_info = match->data;
> +	data->vcc_reg = devm_regulator_get_optional(&client->dev, "vcc");
> +	if (!IS_ERR(data->vcc_reg)) {

Make sure it's the 'right' error to indicate there isn't a regulator
rather than a deferred response for example.


> +		ret = regulator_enable(data->vcc_reg);
> +		if (ret) {
> +			dev_err(&client->dev, "failed to enable VCC regulator\n");
> +			return ret;
> +		}
> +	}
>  
>  	ret = i2c_smbus_read_byte_data(client, MMA8452_WHO_AM_I);
>  	if (ret < 0)
> @@ -1667,6 +1677,8 @@ static int mma8452_probe(struct i2c_client *client,
>  static int mma8452_remove(struct i2c_client *client)
>  {
>  	struct iio_dev *indio_dev = i2c_get_clientdata(client);
> +	struct mma8452_data *data = iio_priv(indio_dev);
> +	int ret;
>  
>  	iio_device_unregister(indio_dev);
>  
> @@ -1678,6 +1690,14 @@ static int mma8452_remove(struct i2c_client *client)
>  	mma8452_trigger_cleanup(indio_dev);
>  	mma8452_standby(iio_priv(indio_dev));
>  
> +	if (!IS_ERR(data->vcc_reg)) {
> +		ret = regulator_disable(data->vcc_reg);
> +		if (ret) {
> +			dev_err(&client->dev, "failed to disable VCC regulator\n");
> +			return ret;
> +		}
> +	}
> +
>  	return 0;
>  }
>  
> @@ -1696,6 +1716,14 @@ static int mma8452_runtime_suspend(struct device *dev)
>  		return -EAGAIN;
>  	}
>  
> +	if (!IS_ERR(data->vcc_reg)) {
> +		ret = regulator_disable(data->vcc_reg);
> +		if (ret) {
> +			dev_err(dev, "failed to disable VCC regulator\n");
> +			return ret;
> +		}
> +	}
> +
>  	return 0;
>  }
>  
> @@ -1705,6 +1733,14 @@ static int mma8452_runtime_resume(struct device *dev)
>  	struct mma8452_data *data = iio_priv(indio_dev);
>  	int ret, sleep_val;
>  
> +	if (!IS_ERR(data->vcc_reg)) {
> +		ret = regulator_enable(data->vcc_reg);
> +		if (ret) {
> +			dev_err(dev, "failed to enable VCC regulator\n");
> +			return ret;
> +		}
> +	}
> +
>  	ret = mma8452_active(data);
>  	if (ret < 0)
>  		return ret;
> @@ -1723,14 +1759,62 @@ static int mma8452_runtime_resume(struct device *dev)
>  #ifdef CONFIG_PM_SLEEP
>  static int mma8452_suspend(struct device *dev)
>  {
> -	return mma8452_standby(iio_priv(i2c_get_clientdata(
> +	struct iio_dev *indio_dev = i2c_get_clientdata(to_i2c_client(dev));
> +	struct mma8452_data *data = iio_priv(indio_dev);
> +	int ret;
> +
> +	if (!IS_ERR(data->vcc_reg)) {
> +		ret = regulator_enable(data->vcc_reg);
> +		if (ret) {
> +			dev_err(dev, "failed to enable VCC regulator\n");
> +			return ret;
> +		}
> +	}
> +
> +	ret = mma8452_standby(iio_priv(i2c_get_clientdata(
>  		to_i2c_client(dev))));
> +	if (ret)
> +		return ret;
> +
> +	if (!IS_ERR(data->vcc_reg)) {
> +		ret = regulator_disable(data->vcc_reg);
> +		if (ret) {
> +			dev_err(dev, "failed to disable VCC regulator\n");
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
>  }
>  
>  static int mma8452_resume(struct device *dev)
>  {
> -	return mma8452_active(iio_priv(i2c_get_clientdata(
> +	struct iio_dev *indio_dev = i2c_get_clientdata(to_i2c_client(dev));
> +	struct mma8452_data *data = iio_priv(indio_dev);
> +	int ret;
> +
> +	if (!IS_ERR(data->vcc_reg)) {
> +		ret = regulator_enable(data->vcc_reg);
> +		if (ret) {
> +			dev_err(dev, "failed to enable VCC regulator\n");
> +			return ret;
> +		}
> +	}
> +
> +	ret = mma8452_active(iio_priv(i2c_get_clientdata(
>  		to_i2c_client(dev))));
> +	if (ret)
> +		return ret;
> +
> +	if (!IS_ERR(data->vcc_reg)) {
> +		ret = regulator_disable(data->vcc_reg);
> +		if (ret) {
> +			dev_err(dev, "failed to disable VCC regulator\n");
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
>  }
>  #endif
>  
