From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 2/2] iio: (bma400) add driver for the BMA400
Date: Fri, 11 Oct 2019 23:11:31 -0700
Message-ID: <d6f44aea-81b9-eb5f-71e2-637246c89491@infradead.org>
References: <20191012035420.13904-1-dan@dlrobertson.com>
 <20191012035420.13904-3-dan@dlrobertson.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191012035420.13904-3-dan@dlrobertson.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Robertson <dan@dlrobertson.com>, Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Cc: devicetree@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/11/19 8:54 PM, Dan Robertson wrote:
> Add a IIO driver for the Bosch BMA400 3-axes ultra-low power accelerometer.
> The driver supports reading from the acceleration and temperature
> registers. The driver also supports reading and configuring the output data
> rate, oversampling ratio, and scale.
> 
> Signed-off-by: Dan Robertson <dan@dlrobertson.com>
> ---
>  drivers/iio/accel/Kconfig       |  19 +
>  drivers/iio/accel/Makefile      |   2 +
>  drivers/iio/accel/bma400.h      |  86 ++++
>  drivers/iio/accel/bma400_core.c | 839 ++++++++++++++++++++++++++++++++
>  drivers/iio/accel/bma400_i2c.c  |  58 +++
>  5 files changed, 1004 insertions(+)
>  create mode 100644 drivers/iio/accel/bma400.h
>  create mode 100644 drivers/iio/accel/bma400_core.c
>  create mode 100644 drivers/iio/accel/bma400_i2c.c
> 
> diff --git a/drivers/iio/accel/Kconfig b/drivers/iio/accel/Kconfig
> index 9b9656ce37e6..cca6727e037e 100644
> --- a/drivers/iio/accel/Kconfig
> +++ b/drivers/iio/accel/Kconfig
> @@ -112,6 +112,25 @@ config BMA220
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called bma220_spi.
>  
> +config BMA400
> +	tristate "Bosch BMA400 3-Axis Accelerometer Driver"
> +	depends on I2C
> +	select REGMAP
> +	select BMA400_I2C if (I2C)

Since this already has "depends on I2C", the "if (I2C)" above is not needed.
Or maybe BMA400 alone does not depend on I2C?

> +	help
> +	  Say Y here if you want to build a driver for the Bosch BMA400
> +	  triaxial acceleration sensor.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called bma400_core and you will also get
> +	  bma400_i2c for I2C

	Add ending '.'.

> +
> +config BMA400_I2C
> +	tristate
> +	depends on BMA400
> +	depends on I2C
> +	select REGMAP_I2C
> +

The bma400_i2c driver seems to use some OF interfaces.
Should it also depend on OF?

>  config BMC150_ACCEL
>  	tristate "Bosch BMC150 Accelerometer Driver"
>  	select IIO_BUFFER
> diff --git a/drivers/iio/accel/Makefile b/drivers/iio/accel/Makefile
> index 56bd0215e0d4..3a051cf37f40 100644
> --- a/drivers/iio/accel/Makefile
> +++ b/drivers/iio/accel/Makefile
> @@ -14,6 +14,8 @@ obj-$(CONFIG_ADXL372_I2C) += adxl372_i2c.o
>  obj-$(CONFIG_ADXL372_SPI) += adxl372_spi.o
>  obj-$(CONFIG_BMA180) += bma180.o
>  obj-$(CONFIG_BMA220) += bma220_spi.o
> +obj-$(CONFIG_BMA400) += bma400_core.o
> +obj-$(CONFIG_BMA400_I2C) += bma400_i2c.o
>  obj-$(CONFIG_BMC150_ACCEL) += bmc150-accel-core.o
>  obj-$(CONFIG_BMC150_ACCEL_I2C) += bmc150-accel-i2c.o
>  obj-$(CONFIG_BMC150_ACCEL_SPI) += bmc150-accel-spi.o


> diff --git a/drivers/iio/accel/bma400_core.c b/drivers/iio/accel/bma400_core.c
> new file mode 100644
> index 000000000000..5b3cb8919c47
> --- /dev/null
> +++ b/drivers/iio/accel/bma400_core.c
> @@ -0,0 +1,839 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * bma400_core.c - Core IIO driver for Bosch BMA400 triaxial acceleration
> + *                 sensor. Used by bma400-i2c.
> + *
> + * Copyright 2019 Dan Robertson <dan@dlrobertson.com>
> + *
> + * TODO:
> + *  - Support for power management
> + *  - Support events and interrupts
> + *  - Create channel the step count
> + *  - Create channel for sensor time
> + */
> +
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <linux/bitops.h>
> +#include <linux/iio/iio.h>
> +#include <linux/iio/sysfs.h>
> +
> +#include "bma400.h"
> +

[snip]

> +
> +struct bma400_data {
> +	struct device *dev;
> +	struct mutex mutex; /* data register lock */

#include <linux/mutex.h>

> +	struct iio_mount_matrix orientation;
> +	struct regmap *regmap;
> +	enum bma400_power_mode power_mode;
> +	const int *sample_freq;
> +	int oversampling_ratio;
> +	int scale;
> +};

[snip]

> +
> +static int bma400_get_accel_oversampling_ratio(struct bma400_data *data)
> +{
> +	unsigned int val;
> +	unsigned int osr;
> +	int ret;
> +
> +	/*
> +	 * The oversampling ratio is stored in a different register
> +	 * based on the power-mode. In normal mode the OSR is stored
> +	 * in ACC_CONFIG1. In low-power mode it is stored in
> +	 * ACC_CONFIG0.
> +	 */
> +	switch (data->power_mode) {
> +	case POWER_MODE_LOW:
> +		ret = regmap_read(data->regmap, BMA400_ACC_CONFIG0_REG, &val);
> +		if (ret < 0) {
> +			data->oversampling_ratio = -1;
> +			return ret;
> +		}
> +
> +		osr = (val & BMA400_LP_OSR_MASK) >> BMA400_LP_OSR_SHIFT;
> +
> +		data->oversampling_ratio = osr;
> +		return 0;
> +	case POWER_MODE_NORMAL:
> +		ret = regmap_read(data->regmap, BMA400_ACC_CONFIG1_REG, &val);
> +		if (ret < 0) {
> +			data->oversampling_ratio = -1;
> +			return ret;
> +		}
> +
> +		osr = (val & BMA400_NP_OSR_MASK) >> BMA400_NP_OSR_SHIFT;
> +
> +		data->oversampling_ratio = osr;
> +		return 0;
> +	default:
> +		data->oversampling_ratio = -1;
> +		return 0;
> +	}
> +}
> +
> +static int bma400_set_accel_oversampling_ratio(struct bma400_data *data,
> +					       int val)
> +{
> +	int ret;
> +	unsigned int acc_config;
> +
> +	if (val & ~BMA400_TWO_BITS_MASK)
> +		return -EINVAL;
> +
> +	/*
> +	 * The oversampling ratio is stored in a different register
> +	 * based on the power-mode.
> +	 */
> +	switch (data->power_mode) {
> +	case POWER_MODE_LOW:
> +		ret = regmap_read(data->regmap, BMA400_ACC_CONFIG0_REG,
> +				  &acc_config);
> +		if (acc_config < 0)
> +			return acc_config;
> +
> +		ret = regmap_write(data->regmap, BMA400_ACC_CONFIG0_REG,
> +				   (acc_config & ~BMA400_LP_OSR_MASK) |
> +				   (val << BMA400_LP_OSR_SHIFT));
> +		if (ret < 0) {
> +			dev_err(data->dev, "Failed to write out OSR");
> +			return ret;
> +		}
> +
> +		data->oversampling_ratio = val;
> +		return 0;
> +	case POWER_MODE_NORMAL:
> +		ret = regmap_read(data->regmap, BMA400_ACC_CONFIG1_REG,
> +				  &acc_config);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = regmap_write(data->regmap, BMA400_ACC_CONFIG1_REG,
> +				   (acc_config & ~BMA400_NP_OSR_MASK) |
> +				   (val << BMA400_NP_OSR_SHIFT));
> +		if (ret < 0) {
> +			dev_err(data->dev, "Failed to write out OSR");
> +			return ret;
> +		}
> +
> +		data->oversampling_ratio = val;
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +	return ret;
> +}
> +
> +static int bma400_get_accel_scale(struct bma400_data *data)
> +{
> +	int idx;
> +	int ret;
> +	unsigned int val;
> +
> +	ret = regmap_read(data->regmap, BMA400_ACC_CONFIG1_REG, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	idx = (((val & BMA400_ACC_SCALE_MASK) >> BMA400_SCALE_SHIFT) * 2) + 1;
> +	if (idx >= ARRAY_SIZE(bma400_scale_table))
> +		return -EINVAL;
> +
> +	data->scale = bma400_scale_table[idx];
> +
> +	return 0;
> +}
> +
> +static int bma400_get_accel_scale_idx(struct bma400_data *data, int val)
> +{
> +	int i;
> +
> +	for (i = 1; i < ARRAY_SIZE(bma400_scale_table); i += 2) {

#include <linux/kernel.h>

> +		if (bma400_scale_table[i] == val)
> +			return i - 1;
> +	}
> +	return -EINVAL;
> +}


[snip]


-- 
~Randy
