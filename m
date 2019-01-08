From: Martin Kepplinger <martink@posteo.de>
Subject: Re: [PATCH V6 2/2] iio: accell: mma8452: add vdd/vddio regulator
 operation support
Date: Tue, 8 Jan 2019 07:39:43 +0100
Message-ID: <bbb55d00-df06-8ee7-85b0-88c286656b4f@posteo.de>
References: <1545555462-16121-1-git-send-email-Anson.Huang@nxp.com>
 <1545555462-16121-2-git-send-email-Anson.Huang@nxp.com>
 <20190105172942.2787d236@archlinux>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190105172942.2787d236@archlinux>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, Anson Huang <anson.huang@nxp.com>
Cc: "knaack.h@gmx.de" <knaack.h@gmx.de>, "lars@metafoo.de" <lars@metafoo.de>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Leonard Crestez <leonard.crestez@nxp.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "gustavo@embeddedor.com" <gustavo@embeddedor.com>, "rtresidd@electromag.com.au" <rtresidd@electromag.com.au>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On 05.01.19 18:29, Jonathan Cameron wrote:
> On Sun, 23 Dec 2018 09:02:32 +0000
> Anson Huang <anson.huang@nxp.com> wrote:
> 
>> The accelerometer's power supply could be controllable on some
>> platforms, such as i.MX6Q-SABRESD board, the mma8451's power supplies
>> are controlled by a GPIO fixed regulator, need to make sure the
>> regulators are enabled before any communication with mma8451, this
>> patch adds vdd/vddio regulator operation support.
>>
>> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
>> Acked-by: Martin Kepplinger <martink@posteo.de>
> 
> I'm fine with the general approach now, though I would like separate
> error handling for the two different regulators.
> 
> Also, this has obviously changed a fair bit since Martin originally gave
> that Ack.  Martin, could you confirm you are still happy with the code?

I'd like to have the change you mention below too. I'll build, review
and confirm after that. thanks!

> 
> Thanks,
> 
> Jonathan
> 
> 
>> ---
>> ChangeLog since V5:
>>     - ONLY enable vdd/vddio regulators after both of them are aquired;
>>     - Since the suspend/resume operations are same as runtime suspend/resume, so just use the
>>       pm_runtime_force_suspend/resume for suspend/resuem callback to simply the code.
>> ---
>>  drivers/iio/accel/mma8452.c | 99 +++++++++++++++++++++++++++++++++++----------
>>  1 file changed, 77 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
>> index 421a0a8..7519ed5 100644
>> --- a/drivers/iio/accel/mma8452.c
>> +++ b/drivers/iio/accel/mma8452.c
>> @@ -31,6 +31,7 @@
>>  #include <linux/of_device.h>
>>  #include <linux/of_irq.h>
>>  #include <linux/pm_runtime.h>
>> +#include <linux/regulator/consumer.h>
>>  
>>  #define MMA8452_STATUS				0x00
>>  #define  MMA8452_STATUS_DRDY			(BIT(2) | BIT(1) | BIT(0))
>> @@ -107,6 +108,8 @@ struct mma8452_data {
>>  	u8 data_cfg;
>>  	const struct mma_chip_info *chip_info;
>>  	int sleep_val;
>> +	struct regulator *vdd_reg;
>> +	struct regulator *vddio_reg;
>>  };
>>  
>>   /**
>> @@ -1534,9 +1537,33 @@ static int mma8452_probe(struct i2c_client *client,
>>  	mutex_init(&data->lock);
>>  	data->chip_info = match->data;
>>  
>> +	data->vdd_reg = devm_regulator_get(&client->dev, "vdd");
>> +	data->vddio_reg = devm_regulator_get(&client->dev, "vddio");
>> +	if (IS_ERR(data->vdd_reg) || IS_ERR(data->vddio_reg)) {
>> +		if (PTR_ERR(data->vdd_reg) == -EPROBE_DEFER ||
>> +			PTR_ERR(data->vddio_reg) == -EPROBE_DEFER)
>> +			return -EPROBE_DEFER;
>> +
>> +		dev_err(&client->dev, "failed to get VDD/VDDIO regulator!\n");
>> +		return IS_ERR(data->vdd_reg) ?
>> +		       PTR_ERR(data->vdd_reg) : PTR_ERR(data->vddio_reg);
> 
> This is overly complex.  It'll be more lines of code, but I'd prefer
> you handle the two separately as the result will be more readable / less
> fragile.
> 
>> +	}
>> +
>> +	ret = regulator_enable(data->vdd_reg);
>> +	if (ret) {
>> +		dev_err(&client->dev, "failed to enable VDD regulator!\n");
>> +		return ret;
>> +	}
>> +
>> +	ret = regulator_enable(data->vddio_reg);
>> +	if (ret) {
>> +		dev_err(&client->dev, "failed to enable VDDIO regulator!\n");
>> +		goto disable_regulator_vdd;
>> +	}
>> +
>>  	ret = i2c_smbus_read_byte_data(client, MMA8452_WHO_AM_I);
>>  	if (ret < 0)
>> -		return ret;
>> +		goto disable_regulators;
>>  
>>  	switch (ret) {
>>  	case MMA8451_DEVICE_ID:
>> @@ -1549,7 +1576,8 @@ static int mma8452_probe(struct i2c_client *client,
>>  			break;
>>  		/* else: fall through */
>>  	default:
>> -		return -ENODEV;
>> +		ret = -ENODEV;
>> +		goto disable_regulators;
>>  	}
>>  
>>  	dev_info(&client->dev, "registering %s accelerometer; ID 0x%x\n",
>> @@ -1566,13 +1594,13 @@ static int mma8452_probe(struct i2c_client *client,
>>  
>>  	ret = mma8452_reset(client);
>>  	if (ret < 0)
>> -		return ret;
>> +		goto disable_regulators;
>>  
>>  	data->data_cfg = MMA8452_DATA_CFG_FS_2G;
>>  	ret = i2c_smbus_write_byte_data(client, MMA8452_DATA_CFG,
>>  					data->data_cfg);
>>  	if (ret < 0)
>> -		return ret;
>> +		goto disable_regulators;
>>  
>>  	/*
>>  	 * By default set transient threshold to max to avoid events if
>> @@ -1581,7 +1609,7 @@ static int mma8452_probe(struct i2c_client *client,
>>  	ret = i2c_smbus_write_byte_data(client, MMA8452_TRANSIENT_THS,
>>  					MMA8452_TRANSIENT_THS_MASK);
>>  	if (ret < 0)
>> -		return ret;
>> +		goto disable_regulators;
>>  
>>  	if (client->irq) {
>>  		int irq2;
>> @@ -1595,7 +1623,7 @@ static int mma8452_probe(struct i2c_client *client,
>>  						MMA8452_CTRL_REG5,
>>  						data->chip_info->all_events);
>>  			if (ret < 0)
>> -				return ret;
>> +				goto disable_regulators;
>>  
>>  			dev_dbg(&client->dev, "using interrupt line INT1\n");
>>  		}
>> @@ -1604,11 +1632,11 @@ static int mma8452_probe(struct i2c_client *client,
>>  					MMA8452_CTRL_REG4,
>>  					data->chip_info->enabled_events);
>>  		if (ret < 0)
>> -			return ret;
>> +			goto disable_regulators;
>>  
>>  		ret = mma8452_trigger_setup(indio_dev);
>>  		if (ret < 0)
>> -			return ret;
>> +			goto disable_regulators;
>>  	}
>>  
>>  	data->ctrl_reg1 = MMA8452_CTRL_ACTIVE |
>> @@ -1661,12 +1689,19 @@ static int mma8452_probe(struct i2c_client *client,
>>  trigger_cleanup:
>>  	mma8452_trigger_cleanup(indio_dev);
>>  
>> +disable_regulators:
>> +	regulator_disable(data->vddio_reg);
>> +
>> +disable_regulator_vdd:
>> +	regulator_disable(data->vdd_reg);
>> +
>>  	return ret;
>>  }
>>  
>>  static int mma8452_remove(struct i2c_client *client)
>>  {
>>  	struct iio_dev *indio_dev = i2c_get_clientdata(client);
>> +	struct mma8452_data *data = iio_priv(indio_dev);
>>  
>>  	iio_device_unregister(indio_dev);
>>  
>> @@ -1678,6 +1713,9 @@ static int mma8452_remove(struct i2c_client *client)
>>  	mma8452_trigger_cleanup(indio_dev);
>>  	mma8452_standby(iio_priv(indio_dev));
>>  
>> +	regulator_disable(data->vddio_reg);
>> +	regulator_disable(data->vdd_reg);
>> +
>>  	return 0;
>>  }
>>  
>> @@ -1696,6 +1734,18 @@ static int mma8452_runtime_suspend(struct device *dev)
>>  		return -EAGAIN;
>>  	}
>>  
>> +	ret = regulator_disable(data->vddio_reg);
>> +	if (ret) {
>> +		dev_err(dev, "failed to disable VDDIO regulator\n");
>> +		return ret;
>> +	}
>> +
>> +	ret = regulator_disable(data->vdd_reg);
>> +	if (ret) {
>> +		dev_err(dev, "failed to disable VDD regulator\n");
>> +		return ret;
>> +	}
>> +
>>  	return 0;
>>  }
>>  
>> @@ -1705,9 +1755,22 @@ static int mma8452_runtime_resume(struct device *dev)
>>  	struct mma8452_data *data = iio_priv(indio_dev);
>>  	int ret, sleep_val;
>>  
>> +	ret = regulator_enable(data->vdd_reg);
>> +	if (ret) {
>> +		dev_err(dev, "failed to enable VDD regulator\n");
>> +		return ret;
>> +	}
>> +
>> +	ret = regulator_enable(data->vddio_reg);
>> +	if (ret) {
>> +		dev_err(dev, "failed to enable VDDIO regulator\n");
>> +		regulator_disable(data->vdd_reg);
>> +		return ret;
>> +	}
>> +
>>  	ret = mma8452_active(data);
>>  	if (ret < 0)
>> -		return ret;
>> +		goto runtime_resume_failed;
>>  
>>  	ret = mma8452_get_odr_index(data);
>>  	sleep_val = 1000 / mma8452_samp_freq[ret][0];
>> @@ -1717,25 +1780,17 @@ static int mma8452_runtime_resume(struct device *dev)
>>  		msleep_interruptible(sleep_val);
>>  
>>  	return 0;
>> -}
>> -#endif
>>  
>> -#ifdef CONFIG_PM_SLEEP
>> -static int mma8452_suspend(struct device *dev)
>> -{
>> -	return mma8452_standby(iio_priv(i2c_get_clientdata(
>> -		to_i2c_client(dev))));
>> -}
>> +runtime_resume_failed:
>> +	regulator_disable(data->vddio_reg);
>> +	regulator_disable(data->vdd_reg);
>>  
>> -static int mma8452_resume(struct device *dev)
>> -{
>> -	return mma8452_active(iio_priv(i2c_get_clientdata(
>> -		to_i2c_client(dev))));
>> +	return ret;
>>  }
>>  #endif
>>  
>>  static const struct dev_pm_ops mma8452_pm_ops = {
>> -	SET_SYSTEM_SLEEP_PM_OPS(mma8452_suspend, mma8452_resume)
>> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
>>  	SET_RUNTIME_PM_OPS(mma8452_runtime_suspend,
>>  			   mma8452_runtime_resume, NULL)
>>  };
> 
