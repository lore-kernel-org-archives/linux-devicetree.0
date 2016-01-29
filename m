From: =?UTF-8?Q?Sean_Nyekj=c3=a6r?= <sean.nyekjaer@prevas.dk>
Subject: Re: [PATCH v2 2/2] gpio: Add driver for SPI serializers
Date: Fri, 29 Jan 2016 07:31:37 +0100
Message-ID: <56AB0749.8050806@prevas.dk>
References: <1453739851-31839-1-git-send-email-afd@ti.com>
 <1453739851-31839-3-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1453739851-31839-3-git-send-email-afd@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 2016-01-25 17:37, Andrew F. Davis wrote:
> Add generic parallel-in/serial-out shift register GPIO driver.
>
> This includes SPI compatible devices like SN74165 serial-out shift
> registers and the SN65HVS88x series of industrial serializers that can
> be read over the SPI bus and used for GPI (General Purpose Input).
>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> ---
>   drivers/gpio/Kconfig       |   6 ++
>   drivers/gpio/Makefile      |   1 +
>   drivers/gpio/gpio-pisosr.c | 188 +++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 195 insertions(+)
>   create mode 100644 drivers/gpio/gpio-pisosr.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index c88dd24..bec3489 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1011,6 +1011,12 @@ config GPIO_MC33880
>   	  SPI driver for Freescale MC33880 high-side/low-side switch.
>   	  This provides GPIO interface supporting inputs and outputs.
>   
> +config GPIO_PISOSR
> +	tristate "Generic parallel-in/serial-out shift register"
> +	help
> +	  GPIO driver for SPI compatible parallel-in/serial-out shift
> +	  registers. These are input only devices.
> +
>   endmenu
>   
>   menu "SPI or I2C GPIO expanders"
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index ece7d7c..8e4f09f 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -75,6 +75,7 @@ obj-$(CONFIG_GPIO_OMAP)		+= gpio-omap.o
>   obj-$(CONFIG_GPIO_PCA953X)	+= gpio-pca953x.o
>   obj-$(CONFIG_GPIO_PCF857X)	+= gpio-pcf857x.o
>   obj-$(CONFIG_GPIO_PCH)		+= gpio-pch.o
> +obj-$(CONFIG_GPIO_PISOSR)	+= gpio-pisosr.o
>   obj-$(CONFIG_GPIO_PL061)	+= gpio-pl061.o
>   obj-$(CONFIG_GPIO_PXA)		+= gpio-pxa.o
>   obj-$(CONFIG_GPIO_RC5T583)	+= gpio-rc5t583.o
> diff --git a/drivers/gpio/gpio-pisosr.c b/drivers/gpio/gpio-pisosr.c
> new file mode 100644
> index 0000000..58ea08d
> --- /dev/null
> +++ b/drivers/gpio/gpio-pisosr.c
> @@ -0,0 +1,188 @@
> +/*
> + * Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
> + *	Andrew F. Davis <afd@ti.com>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed "as is" WITHOUT ANY WARRANTY of any
> + * kind, whether expressed or implied; without even the implied warranty
> + * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License version 2 for more details.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/spi/spi.h>
> +
> +#define DEFAULT_NGPIO 8
> +
> +/**
> + * struct pisosr_gpio - GPIO driver data
> + * @chip: GPIO controller chip
> + * @spi: SPI device pointer
> + * @buffer: Buffer for device reads
> + * @buffer_size: Size of buffer
> + * @load_gpio: GPIO pin used to load input into device
> + * @lock: Protects read sequences
> + */
> +struct pisosr_gpio {
> +	struct gpio_chip chip;
> +	struct spi_device *spi;
> +	u8 *buffer;
> +	size_t buffer_size;
> +	struct gpio_desc *load_gpio;
> +	struct mutex lock;
> +};
> +
> +static int pisosr_gpio_refresh(struct pisosr_gpio *gpio)
> +{
> +	int ret;
> +
> +	mutex_lock(&gpio->lock);
> +
> +	if (gpio->load_gpio) {
> +		gpiod_set_value(gpio->load_gpio, 1);
> +		udelay(1); /* registers load time (~10ns) */
> +		gpiod_set_value(gpio->load_gpio, 0);
> +		udelay(1); /* registers recovery time (~5ns) */
> +	}
> +
> +	ret = spi_read(gpio->spi, gpio->buffer, gpio->buffer_size);
> +	if (ret)
> +		return ret;
> +
> +	mutex_unlock(&gpio->lock);
> +
> +	return 0;
> +}
> +
> +static int pisosr_gpio_get_direction(struct gpio_chip *chip,
> +				     unsigned offset)
> +{
> +	/* This device always input */
> +	return 1;
> +}
> +
> +static int pisosr_gpio_direction_input(struct gpio_chip *chip,
> +				       unsigned offset)
> +{
> +	/* This device always input */
> +	return 0;
> +}
> +
> +static int pisosr_gpio_direction_output(struct gpio_chip *chip,
> +					unsigned offset, int value)
> +{
> +	/* This device is input only */
> +	return -EINVAL;
> +}
> +
> +static int pisosr_gpio_get(struct gpio_chip *chip, unsigned offset)
> +{
> +	struct pisosr_gpio *gpio = gpiochip_get_data(chip);
> +
> +	/* Refresh may not always be needed */
> +	pisosr_gpio_refresh(gpio);
> +
> +	return (gpio->buffer[offset / 8] >> (offset % 8)) & 0x1;
> +}
> +
> +static struct gpio_chip template_chip = {
> +	.label			= "pisosr-gpio",
> +	.owner			= THIS_MODULE,
> +	.get_direction		= pisosr_gpio_get_direction,
> +	.direction_input	= pisosr_gpio_direction_input,
> +	.direction_output	= pisosr_gpio_direction_output,
> +	.get			= pisosr_gpio_get,
> +	.base			= -1,
> +	.ngpio			= DEFAULT_NGPIO,
> +	.can_sleep		= true,
> +};
> +
> +static int pisosr_gpio_probe(struct spi_device *spi)
> +{
> +	struct device *dev = &spi->dev;
> +	struct pisosr_gpio *gpio;
> +	int ret;
> +
> +	gpio = devm_kzalloc(dev, sizeof(*gpio), GFP_KERNEL);
> +	if (!gpio)
> +		return -ENOMEM;
> +
> +	spi_set_drvdata(spi, gpio);
> +
> +	gpio->chip = template_chip;
> +	gpio->chip.parent = dev;
> +	of_property_read_u16(dev->of_node, "ngpios", &gpio->chip.ngpio);
> +
> +	gpio->spi = spi;
> +
> +	gpio->buffer_size = DIV_ROUND_UP(gpio->chip.ngpio, 8);
> +	gpio->buffer = devm_kzalloc(dev, gpio->buffer_size, GFP_KERNEL);
> +	if (!gpio->buffer)
> +		return -ENOMEM;
> +
> +	gpio->load_gpio = devm_gpiod_get(dev, "load", GPIOD_OUT_LOW);
> +	if (IS_ERR(gpio->load_gpio)) {
> +		ret = PTR_ERR(gpio->load_gpio);
> +		if (ret != -ENOENT && ret != -ENOSYS) {
> +			if (ret != -EPROBE_DEFER)
> +				dev_err(dev, "Unable to allocate load GPIO\n");
> +			return ret;
> +		}
> +		gpio->load_gpio = NULL;
> +	}
> +
> +	mutex_init(&gpio->lock);
> +
> +	ret = gpiochip_add_data(&gpio->chip, gpio);
> +	if (ret < 0) {
> +		dev_err(dev, "Unable to register gpiochip\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pisosr_gpio_remove(struct spi_device *spi)
> +{
> +	struct pisosr_gpio *gpio = spi_get_drvdata(spi);
> +
> +	gpiochip_remove(&gpio->chip);
> +
> +	mutex_destroy(&gpio->lock);
> +
> +	return 0;
> +}
> +
> +static const struct spi_device_id pisosr_gpio_id_table[] = {
> +	{ "pisosr-gpio", },
> +	{ /* sentinel */ }
Please add this :-)
{"ti,sn65hvs885", 0},
> +};
> +MODULE_DEVICE_TABLE(spi, pisosr_gpio_id_table);
> +
> +static const struct of_device_id pisosr_gpio_of_match_table[] = {
> +	{ .compatible = "pisosr-gpio", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, pisosr_gpio_of_match_table);
> +
> +static struct spi_driver pisosr_gpio_driver = {
> +	.driver = {
> +		.name = "pisosr-gpio",
> +		.of_match_table = pisosr_gpio_of_match_table,
> +	},
> +	.probe = pisosr_gpio_probe,
> +	.remove = pisosr_gpio_remove,
> +	.id_table = pisosr_gpio_id_table,
> +};
> +module_spi_driver(pisosr_gpio_driver);
> +
> +MODULE_AUTHOR("Andrew F. Davis <afd@ti.com>");
> +MODULE_DESCRIPTION("SPI Compatible PISO Shift Register GPIO Driver");
> +MODULE_LICENSE("GPL v2");
Hi Andrew

I have created an driver for the sn65hvs885 at the same time as you, and 
the output is nearly identical :-)
We are both missing the support for cacading devices, but i guess that 
can come later on.

/Sean
