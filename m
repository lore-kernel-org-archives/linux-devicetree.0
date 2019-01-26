Return-Path: <jic23@kernel.org>
Date: Sat, 26 Jan 2019 20:22:31 +0000
From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 6/6] iio:bmi160: use if (ret) instead of if (ret < 0)
Message-ID: <20190126202231.2d7b8553@archlinux>
In-Reply-To: <20190122020431.5338-6-martin@martingkelly.com>
References: <20190122020431.5338-1-martin@martingkelly.com>
	<20190122020431.5338-6-martin@martingkelly.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Martin Kelly <martin@martingkelly.com>
Cc: linux-iio@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Daniel Baluta <daniel.baluta@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, 21 Jan 2019 18:04:31 -0800
Martin Kelly <martin@martingkelly.com> wrote:

> From: Martin Kelly <martin@martingkelly.com>
> 
> We are using "if (ret < 0)" in many places in which the function returns 0
> on success. Use "if (ret)" instead for better clarity and correctness.
> 
> Signed-off-by: Martin Kelly <martin@martingkelly.com>
The rest of the series that I haven't commented on looks fine to me.
I think there is one of these changes in an earlier patch but otherwise
this looks good for v3.

One small tidy up inline though.

> ---
>  drivers/iio/imu/bmi160/bmi160_core.c | 34 +++++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/iio/imu/bmi160/bmi160_core.c b/drivers/iio/imu/bmi160/bmi160_core.c
> index dca53be066e1..0ec9ded975e2 100644
> --- a/drivers/iio/imu/bmi160/bmi160_core.c
> +++ b/drivers/iio/imu/bmi160/bmi160_core.c
> @@ -299,7 +299,7 @@ int bmi160_set_mode(struct bmi160_data *data, enum bmi160_sensor_type t,
>  		cmd = bmi160_regs[t].pmu_cmd_suspend;
>  
>  	ret = regmap_write(data->regmap, BMI160_REG_CMD, cmd);
> -	if (ret < 0)
> +	if (ret)
>  		return ret;
>  
>  	usleep_range(bmi160_pmu_time[t], bmi160_pmu_time[t] + 1000);
> @@ -331,7 +331,7 @@ int bmi160_get_scale(struct bmi160_data *data, enum bmi160_sensor_type t,
>  	int i, ret, val;
>  
>  	ret = regmap_read(data->regmap, bmi160_regs[t].range, &val);
> -	if (ret < 0)
> +	if (ret)
>  		return ret;
>  
>  	for (i = 0; i < bmi160_scale_table[t].num; i++)
> @@ -354,7 +354,7 @@ static int bmi160_get_data(struct bmi160_data *data, int chan_type,
>  	reg = bmi160_regs[t].data + (axis - IIO_MOD_X) * sizeof(sample);
>  
>  	ret = regmap_bulk_read(data->regmap, reg, &sample, sizeof(sample));
> -	if (ret < 0)
> +	if (ret)
>  		return ret;
>  
>  	*val = sign_extend32(le16_to_cpu(sample), 15);
> @@ -388,7 +388,7 @@ static int bmi160_get_odr(struct bmi160_data *data, enum bmi160_sensor_type t,
>  	int i, val, ret;
>  
>  	ret = regmap_read(data->regmap, bmi160_regs[t].config, &val);
> -	if (ret < 0)
> +	if (ret)
>  		return ret;
>  
>  	val &= bmi160_regs[t].config_odr_mask;
> @@ -420,7 +420,7 @@ static irqreturn_t bmi160_trigger_handler(int irq, void *p)
>  			 indio_dev->masklength) {
>  		ret = regmap_bulk_read(data->regmap, base + i * sizeof(sample),
>  				       &sample, sizeof(sample));
> -		if (ret < 0)
> +		if (ret)
>  			goto done;
>  		buf[j++] = sample;
>  	}
> @@ -441,18 +441,18 @@ static int bmi160_read_raw(struct iio_dev *indio_dev,
>  	switch (mask) {
>  	case IIO_CHAN_INFO_RAW:
>  		ret = bmi160_get_data(data, chan->type, chan->channel2, val);
> -		if (ret < 0)
> +		if (ret)
>  			return ret;
>  		return IIO_VAL_INT;
>  	case IIO_CHAN_INFO_SCALE:
>  		*val = 0;
>  		ret = bmi160_get_scale(data,
>  				       bmi160_to_sensor(chan->type), val2);
> -		return ret < 0 ? ret : IIO_VAL_INT_PLUS_MICRO;
> +		return ret ? ret : IIO_VAL_INT_PLUS_MICRO;
>  	case IIO_CHAN_INFO_SAMP_FREQ:
>  		ret = bmi160_get_odr(data, bmi160_to_sensor(chan->type),
>  				     val, val2);
> -		return ret < 0 ? ret : IIO_VAL_INT_PLUS_MICRO;
> +		return ret ? ret : IIO_VAL_INT_PLUS_MICRO;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -732,7 +732,7 @@ static int bmi160_chip_init(struct bmi160_data *data, bool use_spi, int irq)
>  	struct device *dev = regmap_get_device(data->regmap);
>  
>  	ret = regmap_write(data->regmap, BMI160_REG_CMD, BMI160_CMD_SOFTRESET);
> -	if (ret < 0)
> +	if (ret)
>  		return ret;
>  
>  	usleep_range(BMI160_SOFTRESET_USLEEP, BMI160_SOFTRESET_USLEEP + 1);
> @@ -743,7 +743,7 @@ static int bmi160_chip_init(struct bmi160_data *data, bool use_spi, int irq)
>  	 */
>  	if (use_spi) {
>  		ret = regmap_read(data->regmap, BMI160_REG_DUMMY, &val);
> -		if (ret < 0)
> +		if (ret)
>  			return ret;
>  	}
>  
> @@ -759,11 +759,11 @@ static int bmi160_chip_init(struct bmi160_data *data, bool use_spi, int irq)
>  	}
>  
>  	ret = bmi160_set_mode(data, BMI160_ACCEL, true);
> -	if (ret < 0)
> +	if (ret)
>  		return ret;
>  
>  	ret = bmi160_set_mode(data, BMI160_GYRO, true);
> -	if (ret < 0)
> +	if (ret)
>  		return ret;
>  
>  	return 0;
> @@ -796,7 +796,7 @@ int bmi160_probe_trigger(struct iio_dev *indio_dev, int irq, u32 irq_type)
>  	ret = devm_request_irq(&indio_dev->dev, irq,
>  			       &iio_trigger_generic_data_rdy_poll,
>  			       irq_type, "bmi160", data->trig);
> -	if (ret < 0)
> +	if (ret)
>  		return ret;
>  
>  	data->trig->dev.parent = regmap_get_device(data->regmap);
> @@ -836,11 +836,11 @@ int bmi160_core_probe(struct device *dev, struct regmap *regmap,
>  	data->regmap = regmap;
>  
>  	ret = bmi160_chip_init(data, use_spi, irq);
> -	if (ret < 0)
> +	if (ret)
>  		return ret;
>  
>  	ret = devm_add_action_or_reset(dev, bmi160_chip_uninit, data);
> -	if (ret < 0)
> +	if (ret)
>  		return ret;
>  
>  	if (!name && ACPI_HANDLE(dev))
> @@ -856,7 +856,7 @@ int bmi160_core_probe(struct device *dev, struct regmap *regmap,
>  	ret = devm_iio_triggered_buffer_setup(dev, indio_dev,
>  					      iio_pollfunc_store_time,
>  					      bmi160_trigger_handler, NULL);
> -	if (ret < 0)
> +	if (ret)
>  		return ret;
>  
>  	if (irq) {
> @@ -866,7 +866,7 @@ int bmi160_core_probe(struct device *dev, struct regmap *regmap,
>  	}
>  
>  	ret = devm_iio_device_register(dev, indio_dev);
> -	if (ret < 0)
> +	if (ret)
>  		return ret;
return devm_iio_device_register.

>  
>  	return 0;
