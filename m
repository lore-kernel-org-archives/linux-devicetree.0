Return-Path: <SRS0=+6Cn=RR=gmail.com=tduszyns@kernel.org>
Date: Thu, 14 Mar 2019 20:38:06 +0100
From: Tomasz Duszynski <tduszyns@gmail.com>
Subject: Re: [PATCH v3 3/6] iio: gyro: fxas21002c: add i2c driver
Message-ID: <20190314193805.GD23693@arch>
References: <20190313184002.2501-1-rui.silva@linaro.org>
 <20190313184002.2501-4-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190313184002.2501-4-rui.silva@linaro.org>
To: Rui Miguel Silva <rui.silva@linaro.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Mar 13, 2019 at 06:39:59PM +0000, Rui Miguel Silva wrote:
> Add the real driver to talk over i2c and use the fxas21002c core
> for the main tasks.
>
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> ---
>  drivers/iio/gyro/Kconfig          |  6 +++
>  drivers/iio/gyro/Makefile         |  1 +
>  drivers/iio/gyro/fxas21002c_i2c.c | 73 +++++++++++++++++++++++++++++++
>  3 files changed, 80 insertions(+)
>  create mode 100644 drivers/iio/gyro/fxas21002c_i2c.c
>
> diff --git a/drivers/iio/gyro/Kconfig b/drivers/iio/gyro/Kconfig
> index cfd2cf44bac8..71b6552ee06b 100644
> --- a/drivers/iio/gyro/Kconfig
> +++ b/drivers/iio/gyro/Kconfig
> @@ -77,6 +77,8 @@ config FXAS21002C
>         tristate "NXP FXAS21002C Gyro Sensor"
>         select IIO_BUFFER
>         select IIO_TRIGGERED_BUFFER
> +       select FXAS21002C_I2C if (I2C)
> +       depends on I2C
>         help
>           Say yes here to build support for NXP FXAS21002C Tri-axis Gyro
>           Sensor driver connected via I2C or SPI.
> @@ -84,6 +86,10 @@ config FXAS21002C
>           This driver can also be built as a module.  If so, the module
>           will be called fxas21002c_i2c or fxas21002c_spi.
>
> +config FXAS21002C_I2C
> +       tristate
> +       select REGMAP_I2C
> +
>  config HID_SENSOR_GYRO_3D
>  	depends on HID_SENSOR_HUB
>  	select IIO_BUFFER
> diff --git a/drivers/iio/gyro/Makefile b/drivers/iio/gyro/Makefile
> index 247dc600a602..adc18a5eb283 100644
> --- a/drivers/iio/gyro/Makefile
> +++ b/drivers/iio/gyro/Makefile
> @@ -13,6 +13,7 @@ obj-$(CONFIG_BMG160) += bmg160_core.o
>  obj-$(CONFIG_BMG160_I2C) += bmg160_i2c.o
>  obj-$(CONFIG_BMG160_SPI) += bmg160_spi.o
>  obj-$(CONFIG_FXAS21002C) += fxas21002c_core.o
> +obj-$(CONFIG_FXAS21002C_I2C) += fxas21002c_i2c.o
>
>  obj-$(CONFIG_HID_SENSOR_GYRO_3D) += hid-sensor-gyro-3d.o
>
> diff --git a/drivers/iio/gyro/fxas21002c_i2c.c b/drivers/iio/gyro/fxas21002c_i2c.c
> new file mode 100644
> index 000000000000..c248ac5251df
> --- /dev/null
> +++ b/drivers/iio/gyro/fxas21002c_i2c.c
> @@ -0,0 +1,73 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Driver for NXP FXAS21002C Gyroscope - I2C
> + *
> + * Copyright (C) 2018 Linaro Ltd.
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +

Some headers are missing. Generally not a big deal but better to have
everything in place.

> +#include "fxas21002c.h"
> +
> +static const struct regmap_config fxas21002c_regmap_i2c_conf = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = FXAS21002C_REG_CTRL3,
> +};
> +
> +static int fxas21002c_i2c_probe(struct i2c_client *i2c,
> +				const struct i2c_device_id *id)
> +{
> +	struct regmap *regmap;
> +	const char *name = NULL;
> +
> +	regmap = devm_regmap_init_i2c(i2c, &fxas21002c_regmap_i2c_conf);
> +	if (IS_ERR(regmap)) {
> +		dev_err(&i2c->dev, "Failed to register i2c regmap: %ld\n",
> +			PTR_ERR(regmap));
> +		return PTR_ERR(regmap);
> +	}
> +
> +	if (id)
> +		name = id->name;
> +
> +	return fxas21002c_core_probe(&i2c->dev, regmap, i2c->irq, name);
> +}
> +
> +static int fxas21002c_i2c_remove(struct i2c_client *i2c)
> +{
> +	fxas21002c_core_remove(&i2c->dev);
> +
> +	return 0;
> +}
> +
> +static const struct i2c_device_id fxas21002c_i2c_id[] = {
> +	{ "fxas21002c", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, fxas21002c_i2c_id);
> +
> +static const struct of_device_id fxas21002c_i2c_of_match[] = {
> +	{ .compatible = "nxp,fxas21002c", },
> +	{ },

Comma not really needed?

> +};
> +MODULE_DEVICE_TABLE(of, fxas21002c_i2c_of_match);
> +
> +static struct i2c_driver fxas21002c_i2c_driver = {
> +	.driver = {
> +		.name = "fxas21002c_i2c",
> +		.pm = &fxas21002c_pm_ops,
> +		.of_match_table = of_match_ptr(fxas21002c_i2c_of_match),

of_match_ptr can be dropped I guess due to the fact that it breaks
ACPI probing.

> +	},
> +	.probe		= fxas21002c_i2c_probe,

New drivers should rather use probe_new.

> +	.remove		= fxas21002c_i2c_remove,
> +	.id_table	= fxas21002c_i2c_id,
> +};
> +module_i2c_driver(fxas21002c_i2c_driver);
> +
> +MODULE_AUTHOR("Rui Miguel Silva <rui.silva@linaro.org>");
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("FXAS21002C I2C Gyro driver");
> --
> 2.20.1
>
