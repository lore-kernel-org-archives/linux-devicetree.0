From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 1/3] iio: adc: ad7606: Move oversampling options in chip
 info and rework *_avail attributes
Date: Sun, 7 Apr 2019 11:53:38 +0100
Message-ID: <20190407115338.69b865f9@archlinux>
References: <20190402131841.8430-1-beniamin.bia@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20190402131841.8430-1-beniamin.bia@analog.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Beniamin Bia <beniamin.bia@analog.com>
Cc: devel@driverdev.osuosl.org, mark.rutland@arm.com, lars@metafoo.de, biabeniamin@outlook.com, Stefan Popa <stefan.popa@analog.com>, Michael.Hennerich@analog.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, pmeerw@pmeerw.net, knaack.h@gmx.de
List-Id: devicetree@vger.kernel.org

On Tue, 2 Apr 2019 16:18:39 +0300
Beniamin Bia <beniamin.bia@analog.com> wrote:

> From: Stefan Popa <stefan.popa@analog.com>
> 
> Available oversampling ratios and scales can be shown by calling a
> common ad7606_show_avail function which takes as parameters the array
> which stores the values, together with the size of the array.
> 
> Oversampling options are now defined in chip info
> structure and they are loaded at probe.
> 
> Has_Oversampling attribute was removed because oversampling_num was added
> and it is not needed anymore.
> 
> The purpose of this patch is to deal with the scale_avail and
> oversampling_avail arrays in a generic way. This makes it easier to add
> support for new devices which will work with different scales and
> oversampling ratios. It is also an intermediate step for adding support
> for ad7616 which has different oversampling sampling ratios available.
> 
> Signed-off-by: Stefan Popa <stefan.popa@analog.com>
> Signed-off-by: Beniamin Bia <beniamin.bia@analog.com>
Applied to the togreg branch of iio.git and pushed out as testing for
the autobuilders to play with it.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/ad7606.c | 74 ++++++++++++++++++++++++++++------------
>  drivers/iio/adc/ad7606.h | 16 +++++++--
>  2 files changed, 67 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/iio/adc/ad7606.c b/drivers/iio/adc/ad7606.c
> index ebb8de03bbce..6b87ed410c93 100644
> --- a/drivers/iio/adc/ad7606.c
> +++ b/drivers/iio/adc/ad7606.c
> @@ -31,7 +31,7 @@
>   * Scales are computed as 5000/32768 and 10000/32768 respectively,
>   * so that when applied to the raw values they provide mV values
>   */
> -static const unsigned int scale_avail[2] = {
> +static const unsigned int ad7606_scale_avail[2] = {
>  	152588, 305176
>  };
>  
> @@ -154,7 +154,7 @@ static int ad7606_read_raw(struct iio_dev *indio_dev,
>  		return IIO_VAL_INT;
>  	case IIO_CHAN_INFO_SCALE:
>  		*val = 0;
> -		*val2 = scale_avail[st->range];
> +		*val2 = st->scale_avail[st->range];
>  		return IIO_VAL_INT_PLUS_MICRO;
>  	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
>  		*val = st->oversampling;
> @@ -163,21 +163,31 @@ static int ad7606_read_raw(struct iio_dev *indio_dev,
>  	return -EINVAL;
>  }
>  
> -static ssize_t in_voltage_scale_available_show(struct device *dev,
> -					       struct device_attribute *attr,
> -					       char *buf)
> +static ssize_t ad7606_show_avail(char *buf, const unsigned int *vals,
> +				 unsigned int n, bool micros)
>  {
> -	int i, len = 0;
> -
> -	for (i = 0; i < ARRAY_SIZE(scale_avail); i++)
> -		len += scnprintf(buf + len, PAGE_SIZE - len, "0.%06u ",
> -				 scale_avail[i]);
> +	size_t len = 0;
> +	int i;
>  
> +	for (i = 0; i < n; i++) {
> +		len += scnprintf(buf + len, PAGE_SIZE - len,
> +			micros ? "0.%06u " : "%u ", vals[i]);
> +	}
>  	buf[len - 1] = '\n';
>  
>  	return len;
>  }
>  
> +static ssize_t in_voltage_scale_available_show(struct device *dev,
> +					       struct device_attribute *attr,
> +					       char *buf)
> +{
> +	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
> +	struct ad7606_state *st = iio_priv(indio_dev);
> +
> +	return ad7606_show_avail(buf, st->scale_avail, st->num_scales, true);
> +}
> +
>  static IIO_DEVICE_ATTR_RO(in_voltage_scale_available, 0);
>  
>  static int ad7606_write_raw(struct iio_dev *indio_dev,
> @@ -193,7 +203,7 @@ static int ad7606_write_raw(struct iio_dev *indio_dev,
>  	switch (mask) {
>  	case IIO_CHAN_INFO_SCALE:
>  		mutex_lock(&st->lock);
> -		i = find_closest(val2, scale_avail, ARRAY_SIZE(scale_avail));
> +		i = find_closest(val2, st->scale_avail, st->num_scales);
>  		gpiod_set_value(st->gpio_range, i);
>  		st->range = i;
>  		mutex_unlock(&st->lock);
> @@ -202,15 +212,15 @@ static int ad7606_write_raw(struct iio_dev *indio_dev,
>  	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
>  		if (val2)
>  			return -EINVAL;
> -		i = find_closest(val, ad7606_oversampling_avail,
> -				 ARRAY_SIZE(ad7606_oversampling_avail));
> +		i = find_closest(val, st->oversampling_avail,
> +				 st->num_os_ratios);
>  
>  		values[0] = i;
>  
>  		mutex_lock(&st->lock);
>  		gpiod_set_array_value(ARRAY_SIZE(values), st->gpio_os->desc,
>  				      st->gpio_os->info, values);
> -		st->oversampling = ad7606_oversampling_avail[i];
> +		st->oversampling = st->oversampling_avail[i];
>  		mutex_unlock(&st->lock);
>  
>  		return 0;
> @@ -219,11 +229,23 @@ static int ad7606_write_raw(struct iio_dev *indio_dev,
>  	}
>  }
>  
> -static IIO_CONST_ATTR(oversampling_ratio_available, "1 2 4 8 16 32 64");
> +static ssize_t ad7606_oversampling_ratio_avail(struct device *dev,
> +					       struct device_attribute *attr,
> +					       char *buf)
> +{
> +	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
> +	struct ad7606_state *st = iio_priv(indio_dev);
> +
> +	return ad7606_show_avail(buf, st->oversampling_avail,
> +				 st->num_os_ratios, false);
> +}
> +
> +static IIO_DEVICE_ATTR(oversampling_ratio_available, 0444,
> +		       ad7606_oversampling_ratio_avail, NULL, 0);
>  
>  static struct attribute *ad7606_attributes_os_and_range[] = {
>  	&iio_dev_attr_in_voltage_scale_available.dev_attr.attr,
> -	&iio_const_attr_oversampling_ratio_available.dev_attr.attr,
> +	&iio_dev_attr_oversampling_ratio_available.dev_attr.attr,
>  	NULL,
>  };
>  
> @@ -232,7 +254,7 @@ static const struct attribute_group ad7606_attribute_group_os_and_range = {
>  };
>  
>  static struct attribute *ad7606_attributes_os[] = {
> -	&iio_const_attr_oversampling_ratio_available.dev_attr.attr,
> +	&iio_dev_attr_oversampling_ratio_available.dev_attr.attr,
>  	NULL,
>  };
>  
> @@ -301,17 +323,20 @@ static const struct ad7606_chip_info ad7606_chip_info_tbl[] = {
>  	[ID_AD7606_8] = {
>  		.channels = ad7606_channels,
>  		.num_channels = 9,
> -		.has_oversampling = true,
> +		.oversampling_avail = ad7606_oversampling_avail,
> +		.oversampling_num = ARRAY_SIZE(ad7606_oversampling_avail),
>  	},
>  	[ID_AD7606_6] = {
>  		.channels = ad7606_channels,
>  		.num_channels = 7,
> -		.has_oversampling = true,
> +		.oversampling_avail = ad7606_oversampling_avail,
> +		.oversampling_num = ARRAY_SIZE(ad7606_oversampling_avail),
>  	},
>  	[ID_AD7606_4] = {
>  		.channels = ad7606_channels,
>  		.num_channels = 5,
> -		.has_oversampling = true,
> +		.oversampling_avail = ad7606_oversampling_avail,
> +		.oversampling_num = ARRAY_SIZE(ad7606_oversampling_avail),
>  	},
>  };
>  
> @@ -343,7 +368,7 @@ static int ad7606_request_gpios(struct ad7606_state *st)
>  	if (IS_ERR(st->gpio_frstdata))
>  		return PTR_ERR(st->gpio_frstdata);
>  
> -	if (!st->chip_info->has_oversampling)
> +	if (!st->chip_info->oversampling_num)
>  		return 0;
>  
>  	st->gpio_os = devm_gpiod_get_array_optional(dev,
> @@ -467,6 +492,8 @@ int ad7606_probe(struct device *dev, int irq, void __iomem *base_address,
>  	/* tied to logic low, analog input range is +/- 5V */
>  	st->range = 0;
>  	st->oversampling = 1;
> +	st->scale_avail = ad7606_scale_avail;
> +	st->num_scales = ARRAY_SIZE(ad7606_scale_avail);
>  
>  	st->reg = devm_regulator_get(dev, "avcc");
>  	if (IS_ERR(st->reg))
> @@ -484,6 +511,11 @@ int ad7606_probe(struct device *dev, int irq, void __iomem *base_address,
>  
>  	st->chip_info = &ad7606_chip_info_tbl[id];
>  
> +	if (st->chip_info->oversampling_num) {
> +		st->oversampling_avail = st->chip_info->oversampling_avail;
> +		st->num_os_ratios = st->chip_info->oversampling_num;
> +	}
> +
>  	ret = ad7606_request_gpios(st);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/iio/adc/ad7606.h b/drivers/iio/adc/ad7606.h
> index 5d12410f68e1..8c91bd427c4e 100644
> --- a/drivers/iio/adc/ad7606.h
> +++ b/drivers/iio/adc/ad7606.h
> @@ -12,12 +12,15 @@
>   * struct ad7606_chip_info - chip specific information
>   * @channels:		channel specification
>   * @num_channels:	number of channels
> - * @has_oversampling:   whether the device has oversampling support
> + * @oversampling_avail	pointer to the array which stores the available
> + *			oversampling ratios.
> + * @oversampling_num	number of elements stored in oversampling_avail array
>   */
>  struct ad7606_chip_info {
>  	const struct iio_chan_spec	*channels;
>  	unsigned int			num_channels;
> -	bool				has_oversampling;
> +	const unsigned int		*oversampling_avail;
> +	unsigned int			oversampling_num;
>  };
>  
>  /**
> @@ -29,6 +32,11 @@ struct ad7606_chip_info {
>   * @range		voltage range selection, selects which scale to apply
>   * @oversampling	oversampling selection
>   * @base_address	address from where to read data in parallel operation
> + * @scale_avail		pointer to the array which stores the available scales
> + * @num_scales		number of elements stored in the scale_avail array
> + * @oversampling_avail	pointer to the array which stores the available
> + *			oversampling ratios.
> + * @num_os_ratios	number of elements stored in oversampling_avail array
>   * @lock		protect sensor state from concurrent accesses to GPIOs
>   * @gpio_convst	GPIO descriptor for conversion start signal (CONVST)
>   * @gpio_reset		GPIO descriptor for device hard-reset
> @@ -50,6 +58,10 @@ struct ad7606_state {
>  	unsigned int			range;
>  	unsigned int			oversampling;
>  	void __iomem			*base_address;
> +	const unsigned int		*scale_avail;
> +	unsigned int			num_scales;
> +	const unsigned int		*oversampling_avail;
> +	unsigned int			num_os_ratios;
>  
>  	struct mutex			lock; /* protect sensor state */
>  	struct gpio_desc		*gpio_convst;
