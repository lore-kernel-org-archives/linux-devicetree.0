From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 1/1] Added Capella CM3218 Ambient Light Sensor IIO Driver.
Date: Thu, 04 Jul 2013 10:59:52 +0200
Message-ID: <51D53988.7040808@metafoo.de>
References: <1372894271-2592-1-git-send-email-ktsai@capellamicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372894271-2592-1-git-send-email-ktsai-GubuWUlQtMwciDkP5Hr2oA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Tsai <ktsai-GubuWUlQtMwciDkP5Hr2oA@public.gmane.org>
Cc: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/04/2013 01:31 AM, Kevin Tsai wrote:

Maybe write at least a short commit message which states the features of the
chip.

> Signed-off-by: Kevin Tsai <ktsai-GubuWUlQtMwciDkP5Hr2oA@public.gmane.org>
> ---
>  drivers/staging/iio/light/Kconfig  |   10 +
>  drivers/staging/iio/light/Makefile |    1 +
>  drivers/staging/iio/light/cm3218.c |  581 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 592 insertions(+)
>  create mode 100644 drivers/staging/iio/light/cm3218.c
> 
> diff --git a/drivers/staging/iio/light/Kconfig b/drivers/staging/iio/light/Kconfig
> index ca8d6e6..647af0c 100644
> --- a/drivers/staging/iio/light/Kconfig
> +++ b/drivers/staging/iio/light/Kconfig
> @@ -40,4 +40,14 @@ config TSL2x7x
>  	 tmd2672, tsl2772, tmd2772 devices.
>  	 Provides iio_events and direct access via sysfs.
>  
> +config SENSORS_CM3218
> +        tristate "CM3218 Ambient Light Sensor"
> +        depends on I2C
> +        help
> +         Say Y here if you have a Capella Micro CM3218 Ambient Light Sensor.
> +
> +         To compile this driver as a module, choose M here.  This module
> +         will be called to 'cm3218'.  It will access ALS data via iio sysfs.
> +         This is recommended.
> +

Keep the entries in alphabetical order.

>  endmenu
> diff --git a/drivers/staging/iio/light/Makefile b/drivers/staging/iio/light/Makefile
> index 9960fdf..63020ab 100644
> --- a/drivers/staging/iio/light/Makefile
> +++ b/drivers/staging/iio/light/Makefile
> @@ -6,3 +6,4 @@ obj-$(CONFIG_SENSORS_ISL29018)	+= isl29018.o
>  obj-$(CONFIG_SENSORS_ISL29028)	+= isl29028.o
>  obj-$(CONFIG_TSL2583)	+= tsl2583.o
>  obj-$(CONFIG_TSL2x7x)	+= tsl2x7x_core.o
> +obj-$(CONFIG_SENSORS_CM3218)    += cm3218.o

Same here

> diff --git a/drivers/staging/iio/light/cm3218.c b/drivers/staging/iio/light/cm3218.c
> new file mode 100644
> index 0000000..9c2584d
> --- /dev/null
> +++ b/drivers/staging/iio/light/cm3218.c
> @@ -0,0 +1,581 @@
[...]
> +#include <linux/module.h>
> +#include <linux/i2c.h>
> +#include <linux/err.h>
> +#include <linux/mutex.h>
> +#include <linux/delay.h>

delay.h seems to be unused

> +#include <linux/slab.h>
> +#include <linux/iio/iio.h>
> +#include <linux/iio/sysfs.h>
[...]
> +
> +static int cm3218_write(struct i2c_client *client, u8 reg, u16 value)
> +{
> +	u16 regval;
> +	int ret;
> +	struct cm3218_chip *chip = iio_priv(i2c_get_clientdata(client));
> +
> +#ifdef	CM3218_DEBUG
> +	dev_err(&client->dev,
> +		"Write to device register 0x%02X with 0x%04X\n", reg, value);
> +#endif	/* CM3218_DEBUG */
> +	regval = cpu_to_le16(value);
> +	ret = i2c_smbus_write_word_data(client, reg, regval);

This looks wrong, with this code the on-wire byteorder will differ between
big endian and little endian systems. Maybe you want
i2c_smbus_write_word_swapped?

But as Peter said, just use regmap for all IO.

> +	if (ret) {
> +		dev_err(&client->dev, "Write to device fails: 0x%x\n", ret);
> +	} else {
> +		/* Update cache */
> +		if (reg < CM3218_MAX_CACHE_REGS)
> +			chip->reg_cache[reg] = value;
> +	}
> +
> +	return ret;
[...]
> +
> +static int cm3218_detect(struct i2c_client *client,
> +				   struct i2c_board_info *info)
> +{
> +	struct i2c_adapter *adapter = client->adapter;
> +	const char *name = NULL;
> +
> +	cm3218_read_ara(client);
> +
> +	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA))
> +		return -ENODEV;
> +
> +	name = "cm3218";
> +	strlcpy(info->type, name, I2C_NAME_SIZE);
> +

Always returning zero means the chip will bind to any I2C devices which
happen to use the same address. I don't think you actually need detection,
so just remove it.

> +	return 0;
> +}
> +
> +static const struct i2c_device_id cm3218_id[] = {
> +	{"cm3218", 0},
> +	{}
> +};
> +

Nitpick: no need for the newline

> +MODULE_DEVICE_TABLE(i2c, cm3218_id);
> +
> +static const struct of_device_id cm3218_of_match[] = {
> +	{ .compatible = "invn,cm3218", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, cm3218_of_match);
> +
> +static struct i2c_driver cm3218_driver = {
> +	.class	= I2C_CLASS_HWMON,
> +	.driver	 = {
> +			.name = "cm3218",
> +			.pm = CM3218_PM_OPS,
> +			.owner = THIS_MODULE,
> +			.of_match_table = cm3218_of_match,
> +		    },

Indention looks a bit strange here. Please use one tab per level.

> +	.probe		= cm3218_probe,
> +	.remove		= cm3218_remove,
> +	.id_table       = cm3218_id,
> +	.detect	 = cm3218_detect,
> +	.address_list   = normal_i2c,
> +};
> +module_i2c_driver(cm3218_driver);
