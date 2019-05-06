Return-Path: <SRS0=154z=TG=ti.com=dmurphy@kernel.org>
Subject: Re: [PATCH v3 2/2] leds: spi-byte: add single byte SPI LED driver
References: <20190505200022.32209-1-oss@c-mauderer.de>
 <20190505200022.32209-2-oss@c-mauderer.de>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <8c150278-4bf6-4202-998e-4d82a2a3cd3c@ti.com>
Date: Mon, 6 May 2019 07:05:37 -0500
MIME-Version: 1.0
In-Reply-To: <20190505200022.32209-2-oss@c-mauderer.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: oss@c-mauderer.de, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Christian

On 5/5/19 3:00 PM, oss@c-mauderer.de wrote:
> From: Christian Mauderer <oss@c-mauderer.de>
> 
> This driver adds support for simple SPI based LED controller which use
> only one byte for setting the brightness.
> 
> Signed-off-by: Christian Mauderer <oss@c-mauderer.de>
> ---
> 
> Changes compared to v2:
> - use "if (ret)" instead of "if (ret != 0)"
> - don't initialize ldev-fields with zero
> - use devm_led_classdev_register instead of led_classdev_register
> - check for error instead of good case with the last if in spi_byte_probe
> 
> Changes compared to v1:
> - rename ubnt-spi to leds-spi-byte
> - rework probe to get all parameters before allocating anything -> error checks
>   all collected together and initializing all fields of the device structure is
>   more obvious
> - fix some unsteady indentations during variable declaration
> - rework comment with protocol explanation
> - handle case of off_bright > max_bright
> - fix spelling in commit message
> - mutex_destroy in remove
> - change label to use either use the given one without a prefix or a default one
> 
> 
>  drivers/leds/Kconfig         |  12 ++++
>  drivers/leds/Makefile        |   1 +
>  drivers/leds/leds-spi-byte.c | 134 +++++++++++++++++++++++++++++++++++
>  3 files changed, 147 insertions(+)
>  create mode 100644 drivers/leds/leds-spi-byte.c
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index a72f97fca57b..0866c55e8004 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -766,6 +766,18 @@ config LEDS_NIC78BX
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called leds-nic78bx.
>  
> +config LEDS_SPI_BYTE
> +	tristate "LED support for SPI LED controller with a single byte"
> +	depends on LEDS_CLASS
> +	depends on SPI
> +	depends on OF
> +	help
> +	  This option enables support for LED controller which use a single byte
> +	  for controlling the brightness. The minimum and maximum value of the
> +	  byte can be configured via a device tree. The driver can be used for
> +	  example for the microcontroller based LED controller in the Ubiquiti
> +	  airCube ISP devices.
> +
>  comment "LED Triggers"
>  source "drivers/leds/trigger/Kconfig"
>  
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 4c1b0054f379..1786d7e2c236 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -75,6 +75,7 @@ obj-$(CONFIG_LEDS_PM8058)		+= leds-pm8058.o
>  obj-$(CONFIG_LEDS_MLXCPLD)		+= leds-mlxcpld.o
>  obj-$(CONFIG_LEDS_MLXREG)		+= leds-mlxreg.o
>  obj-$(CONFIG_LEDS_NIC78BX)		+= leds-nic78bx.o
> +obj-$(CONFIG_LEDS_SPI_BYTE)		+= leds-spi-byte.o
>  obj-$(CONFIG_LEDS_MT6323)		+= leds-mt6323.o
>  obj-$(CONFIG_LEDS_LM3692X)		+= leds-lm3692x.o
>  obj-$(CONFIG_LEDS_SC27XX_BLTC)		+= leds-sc27xx-bltc.o
> diff --git a/drivers/leds/leds-spi-byte.c b/drivers/leds/leds-spi-byte.c
> new file mode 100644
> index 000000000000..8170b2da497a
> --- /dev/null
> +++ b/drivers/leds/leds-spi-byte.c
> @@ -0,0 +1,134 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2019 Christian Mauderer <oss@c-mauderer.de>
> +
> +/*
> + * The driver can be used for controllers with a very simple SPI protocol: Only
> + * one byte between an off and a max value (defined by devicetree) will be sent.
> + */
> +
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/spi/spi.h>
> +#include <linux/mutex.h>
> +#include <uapi/linux/uleds.h>
> +
> +struct spi_byte_led {
> +	struct led_classdev	ldev;
> +	struct spi_device	*spi;
> +	char			name[LED_MAX_NAME_SIZE];
> +	struct mutex		mutex;
> +	u8			off_value;
> +	u8			max_value;
> +};
> +
> +static int spi_byte_brightness_set_blocking(struct led_classdev *dev,
> +					    enum led_brightness brightness)
> +{
> +	struct spi_byte_led *led = container_of(dev, struct spi_byte_led, ldev);
> +	u8 value;
> +	int ret;
> +
> +	value = (u8) brightness + led->off_value;
> +

Sorry if this has been addressed but the versions moved fast.

What is the purpose of adding the off_value?

If max is 63 and say off value is 1 then this will set brightness to 64 but that is not what the LED framework will send.
if you read the brightness.

Is it safe to assume that off_value would always be 0?


> +	mutex_lock(&led->mutex);
> +	ret = spi_write(led->spi, &value, sizeof(value));
> +	mutex_unlock(&led->mutex);
> +
> +	return ret;
> +}
> +
> +static int spi_byte_probe(struct spi_device *spi)
> +{
> +	struct device *dev = &spi->dev;
> +	struct device_node *child;
> +	struct spi_byte_led *led;
> +	int ret;
> +	const char *default_name = "leds-spi-byte::";
> +	const char *name;
> +	u8 off_value;
> +	u8 max_value;
> +
> +	if (!dev->of_node)
> +		return -ENODEV;
> +
> +	if (of_get_child_count(dev->of_node) != 1) {
> +		dev_err(dev, "Device must have exactly one LED sub-node.");
> +		return -EINVAL;
> +	}
> +	child = of_get_next_child(dev->of_node, NULL);
> +
> +	ret = of_property_read_string(child, "label", &name);
> +	if (ret)
> +		name = default_name;
> +
> +	ret = of_property_read_u8(child, "leds-spi-byte,off-value", &off_value);
> +	if (ret) {
> +		dev_err(dev, "LED node needs a leds-spi-byte,off-value.");
> +		return -EINVAL;
> +	}
> +
> +	ret = of_property_read_u8(child, "leds-spi-byte,max-value", &max_value);
> +	if (ret) {
> +		dev_err(dev, "LED node needs a leds-spi-byte,max-value.");
> +		return -EINVAL;
> +	}
> +

You could probably allocate the led struct memory first and then pass in the address of those
variables as opposed to creating the stack variables.

	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
	if (!led)
		return -ENOMEM;

	ret = of_property_read_string(child, "label", &led->ldev.name);
	if (ret)
		led->ldev.name = default_name;

	ret = of_property_read_u8(child, "leds-spi-byte,off-value", &led->off_value);
	if (ret) {
		dev_err(dev, "LED node needs a leds-spi-byte,off-value.");
		return -EINVAL;
	}
	.
	.
	.


> +	if (off_value >= max_value) {
> +		dev_err(dev, "off-value has to be smaller than max-value.");
> +		return -EINVAL;
> +	}
> +
> +	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
> +	if (!led)
> +		return -ENOMEM;
> +
> +	led->spi = spi;
> +	strlcpy(led->name, name, sizeof(led->name));
> +	mutex_init(&led->mutex);
> +	led->off_value = off_value;
> +	led->max_value = max_value;
> +	led->ldev.name = led->name;
> +	led->ldev.max_brightness = led->max_value - led->off_value;

Again not sure why this is needed.  This is changing the behavior of what max brightness value is defined in the DT.
And this is not documented in the DT doc.

max_value = 255 off_value = 254 meets all the criteria but then LED framework has max brightness is 1
But that is not what is described in the DT.

> +	led->ldev.brightness_set_blocking = spi_byte_brightness_set_blocking;
> +	ret = devm_led_classdev_register(&spi->dev, &led->ldev);
> +	if (ret)
> +		return ret;
> +
> +	spi_set_drvdata(spi, led);

If you move this above the registration this can just become

return = devm_led_classdev_register(&spi->dev, &led->ldev);

> +
> +	return 0;
> +}
> +
> +static int spi_byte_remove(struct spi_device *spi)
> +{
> +	struct spi_byte_led	*led = spi_get_drvdata(spi);
> +
> +	led_classdev_unregister(&led->ldev);

Don't need this with devm call

Dan

<snip>
