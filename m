Return-Path: <jic23@kernel.org>
Date: Sun, 14 Apr 2019 14:39:37 +0100
From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v6 4/6] iio: gyro: fxas21002c: add spi driver
Message-ID: <20190414143937.144df168@archlinux>
In-Reply-To: <20190412164901.2321-5-rui.silva@linaro.org>
References: <20190412164901.2321-1-rui.silva@linaro.org>
	<20190412164901.2321-5-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Rui Miguel Silva <rui.silva@linaro.org>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, 12 Apr 2019 17:48:59 +0100
Rui Miguel Silva <rui.silva@linaro.org> wrote:

> Add driver to talk over spi to a fxas21002c gyroscope device and use
> the core as main controller.
> 
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to play with it.

Thanks,

Jonathan

> ---
>  drivers/iio/gyro/Kconfig          |  7 +++-
>  drivers/iio/gyro/Makefile         |  1 +
>  drivers/iio/gyro/fxas21002c_spi.c | 70 +++++++++++++++++++++++++++++++
>  3 files changed, 77 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/iio/gyro/fxas21002c_spi.c
> 
> diff --git a/drivers/iio/gyro/Kconfig b/drivers/iio/gyro/Kconfig
> index 71b6552ee06b..61c00cee037d 100644
> --- a/drivers/iio/gyro/Kconfig
> +++ b/drivers/iio/gyro/Kconfig
> @@ -78,7 +78,8 @@ config FXAS21002C
>         select IIO_BUFFER
>         select IIO_TRIGGERED_BUFFER
>         select FXAS21002C_I2C if (I2C)
> -       depends on I2C
> +       select FXAS21002C_SPI if (SPI)
> +       depends on (I2C || SPI_MASTER)
>         help
>           Say yes here to build support for NXP FXAS21002C Tri-axis Gyro
>           Sensor driver connected via I2C or SPI.
> @@ -90,6 +91,10 @@ config FXAS21002C_I2C
>         tristate
>         select REGMAP_I2C
>  
> +config FXAS21002C_SPI
> +       tristate
> +       select REGMAP_SPI
> +
>  config HID_SENSOR_GYRO_3D
>  	depends on HID_SENSOR_HUB
>  	select IIO_BUFFER
> diff --git a/drivers/iio/gyro/Makefile b/drivers/iio/gyro/Makefile
> index adc18a5eb283..45cbd5dc644e 100644
> --- a/drivers/iio/gyro/Makefile
> +++ b/drivers/iio/gyro/Makefile
> @@ -14,6 +14,7 @@ obj-$(CONFIG_BMG160_I2C) += bmg160_i2c.o
>  obj-$(CONFIG_BMG160_SPI) += bmg160_spi.o
>  obj-$(CONFIG_FXAS21002C) += fxas21002c_core.o
>  obj-$(CONFIG_FXAS21002C_I2C) += fxas21002c_i2c.o
> +obj-$(CONFIG_FXAS21002C_SPI) += fxas21002c_spi.o
>  
>  obj-$(CONFIG_HID_SENSOR_GYRO_3D) += hid-sensor-gyro-3d.o
>  
> diff --git a/drivers/iio/gyro/fxas21002c_spi.c b/drivers/iio/gyro/fxas21002c_spi.c
> new file mode 100644
> index 000000000000..77ceebef4e34
> --- /dev/null
> +++ b/drivers/iio/gyro/fxas21002c_spi.c
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Driver for NXP Fxas21002c Gyroscope - SPI
> + *
> + * Copyright (C) 2019 Linaro Ltd.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <linux/spi/spi.h>
> +
> +#include "fxas21002c.h"
> +
> +static const struct regmap_config fxas21002c_regmap_spi_conf = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = FXAS21002C_REG_CTRL3,
> +};
> +
> +static int fxas21002c_spi_probe(struct spi_device *spi)
> +{
> +	const struct spi_device_id *id = spi_get_device_id(spi);
> +	struct regmap *regmap;
> +
> +	regmap = devm_regmap_init_spi(spi, &fxas21002c_regmap_spi_conf);
> +	if (IS_ERR(regmap)) {
> +		dev_err(&spi->dev, "Failed to register spi regmap: %ld\n",
> +			PTR_ERR(regmap));
> +		return PTR_ERR(regmap);
> +	}
> +
> +	return fxas21002c_core_probe(&spi->dev, regmap, spi->irq, id->name);
> +}
> +
> +static int fxas21002c_spi_remove(struct spi_device *spi)
> +{
> +	fxas21002c_core_remove(&spi->dev);
> +
> +	return 0;
> +}
> +
> +static const struct spi_device_id fxas21002c_spi_id[] = {
> +	{ "fxas21002c", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(spi, fxas21002c_spi_id);
> +
> +static const struct of_device_id fxas21002c_spi_of_match[] = {
> +	{ .compatible = "nxp,fxas21002c", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, fxas21002c_spi_of_match);
> +
> +static struct spi_driver fxas21002c_spi_driver = {
> +	.driver = {
> +		.name = "fxas21002c_spi",
> +		.pm = &fxas21002c_pm_ops,
> +		.of_match_table = fxas21002c_spi_of_match,
> +	},
> +	.probe		= fxas21002c_spi_probe,
> +	.remove		= fxas21002c_spi_remove,
> +	.id_table	= fxas21002c_spi_id,
> +};
> +module_spi_driver(fxas21002c_spi_driver);
> +
> +MODULE_AUTHOR("Rui Miguel Silva <rui.silva@linaro.org>");
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("FXAS21002C SPI Gyro driver");
