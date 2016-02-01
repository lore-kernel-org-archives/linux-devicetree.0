From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH v2 2/2] gpio: Add driver for SPI serializers
Date: Mon, 1 Feb 2016 08:52:02 -0600
Message-ID: <56AF7112.5020309@ti.com>
References: <1453739851-31839-1-git-send-email-afd@ti.com>
 <1453739851-31839-3-git-send-email-afd@ti.com> <56AB0749.8050806@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56AB0749.8050806@prevas.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Sean_Nyekj=c3=a6r?= <sean.nyekjaer@prevas.dk>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01/29/2016 12:31 AM, Sean Nyekj=E6r wrote:
>
>
> On 2016-01-25 17:37, Andrew F. Davis wrote:
>> Add generic parallel-in/serial-out shift register GPIO driver.
>>
>> This includes SPI compatible devices like SN74165 serial-out shift
>> registers and the SN65HVS88x series of industrial serializers that c=
an
>> be read over the SPI bus and used for GPI (General Purpose Input).
>>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> ---
>>   drivers/gpio/Kconfig       |   6 ++
>>   drivers/gpio/Makefile      |   1 +
>>   drivers/gpio/gpio-pisosr.c | 188 +++++++++++++++++++++++++++++++++=
++++++++++++
>>   3 files changed, 195 insertions(+)
>>   create mode 100644 drivers/gpio/gpio-pisosr.c
>>
>> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
>> index c88dd24..bec3489 100644
>> --- a/drivers/gpio/Kconfig
>> +++ b/drivers/gpio/Kconfig
>> @@ -1011,6 +1011,12 @@ config GPIO_MC33880
>>         SPI driver for Freescale MC33880 high-side/low-side switch.
>>         This provides GPIO interface supporting inputs and outputs.
>> +config GPIO_PISOSR
>> +    tristate "Generic parallel-in/serial-out shift register"
>> +    help
>> +      GPIO driver for SPI compatible parallel-in/serial-out shift
>> +      registers. These are input only devices.
>> +
>>   endmenu
>>   menu "SPI or I2C GPIO expanders"
>> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
>> index ece7d7c..8e4f09f 100644
>> --- a/drivers/gpio/Makefile
>> +++ b/drivers/gpio/Makefile
>> @@ -75,6 +75,7 @@ obj-$(CONFIG_GPIO_OMAP)        +=3D gpio-omap.o
>>   obj-$(CONFIG_GPIO_PCA953X)    +=3D gpio-pca953x.o
>>   obj-$(CONFIG_GPIO_PCF857X)    +=3D gpio-pcf857x.o
>>   obj-$(CONFIG_GPIO_PCH)        +=3D gpio-pch.o
>> +obj-$(CONFIG_GPIO_PISOSR)    +=3D gpio-pisosr.o
>>   obj-$(CONFIG_GPIO_PL061)    +=3D gpio-pl061.o
>>   obj-$(CONFIG_GPIO_PXA)        +=3D gpio-pxa.o
>>   obj-$(CONFIG_GPIO_RC5T583)    +=3D gpio-rc5t583.o
>> diff --git a/drivers/gpio/gpio-pisosr.c b/drivers/gpio/gpio-pisosr.c
>> new file mode 100644
>> index 0000000..58ea08d
>> --- /dev/null
>> +++ b/drivers/gpio/gpio-pisosr.c
>> @@ -0,0 +1,188 @@
>> +/*
>> + * Copyright (C) 2015 Texas Instruments Incorporated - http://www.t=
i.com/
>> + *    Andrew F. Davis <afd@ti.com>
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License vers=
ion 2 as
>> + * published by the Free Software Foundation.
>> + *
>> + * This program is distributed "as is" WITHOUT ANY WARRANTY of any
>> + * kind, whether expressed or implied; without even the implied war=
ranty
>> + * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License version 2 for more details.
>> + */
>> +
>> +#include <linux/delay.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/gpio/driver.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/spi/spi.h>
>> +
>> +#define DEFAULT_NGPIO 8
>> +
>> +/**
>> + * struct pisosr_gpio - GPIO driver data
>> + * @chip: GPIO controller chip
>> + * @spi: SPI device pointer
>> + * @buffer: Buffer for device reads
>> + * @buffer_size: Size of buffer
>> + * @load_gpio: GPIO pin used to load input into device
>> + * @lock: Protects read sequences
>> + */
>> +struct pisosr_gpio {
>> +    struct gpio_chip chip;
>> +    struct spi_device *spi;
>> +    u8 *buffer;
>> +    size_t buffer_size;
>> +    struct gpio_desc *load_gpio;
>> +    struct mutex lock;
>> +};
>> +
>> +static int pisosr_gpio_refresh(struct pisosr_gpio *gpio)
>> +{
>> +    int ret;
>> +
>> +    mutex_lock(&gpio->lock);
>> +
>> +    if (gpio->load_gpio) {
>> +        gpiod_set_value(gpio->load_gpio, 1);
>> +        udelay(1); /* registers load time (~10ns) */
>> +        gpiod_set_value(gpio->load_gpio, 0);
>> +        udelay(1); /* registers recovery time (~5ns) */
>> +    }
>> +
>> +    ret =3D spi_read(gpio->spi, gpio->buffer, gpio->buffer_size);
>> +    if (ret)
>> +        return ret;
>> +
>> +    mutex_unlock(&gpio->lock);
>> +
>> +    return 0;
>> +}
>> +
>> +static int pisosr_gpio_get_direction(struct gpio_chip *chip,
>> +                     unsigned offset)
>> +{
>> +    /* This device always input */
>> +    return 1;
>> +}
>> +
>> +static int pisosr_gpio_direction_input(struct gpio_chip *chip,
>> +                       unsigned offset)
>> +{
>> +    /* This device always input */
>> +    return 0;
>> +}
>> +
>> +static int pisosr_gpio_direction_output(struct gpio_chip *chip,
>> +                    unsigned offset, int value)
>> +{
>> +    /* This device is input only */
>> +    return -EINVAL;
>> +}
>> +
>> +static int pisosr_gpio_get(struct gpio_chip *chip, unsigned offset)
>> +{
>> +    struct pisosr_gpio *gpio =3D gpiochip_get_data(chip);
>> +
>> +    /* Refresh may not always be needed */
>> +    pisosr_gpio_refresh(gpio);
>> +
>> +    return (gpio->buffer[offset / 8] >> (offset % 8)) & 0x1;
>> +}
>> +
>> +static struct gpio_chip template_chip =3D {
>> +    .label            =3D "pisosr-gpio",
>> +    .owner            =3D THIS_MODULE,
>> +    .get_direction        =3D pisosr_gpio_get_direction,
>> +    .direction_input    =3D pisosr_gpio_direction_input,
>> +    .direction_output    =3D pisosr_gpio_direction_output,
>> +    .get            =3D pisosr_gpio_get,
>> +    .base            =3D -1,
>> +    .ngpio            =3D DEFAULT_NGPIO,
>> +    .can_sleep        =3D true,
>> +};
>> +
>> +static int pisosr_gpio_probe(struct spi_device *spi)
>> +{
>> +    struct device *dev =3D &spi->dev;
>> +    struct pisosr_gpio *gpio;
>> +    int ret;
>> +
>> +    gpio =3D devm_kzalloc(dev, sizeof(*gpio), GFP_KERNEL);
>> +    if (!gpio)
>> +        return -ENOMEM;
>> +
>> +    spi_set_drvdata(spi, gpio);
>> +
>> +    gpio->chip =3D template_chip;
>> +    gpio->chip.parent =3D dev;
>> +    of_property_read_u16(dev->of_node, "ngpios", &gpio->chip.ngpio)=
;
>> +
>> +    gpio->spi =3D spi;
>> +
>> +    gpio->buffer_size =3D DIV_ROUND_UP(gpio->chip.ngpio, 8);
>> +    gpio->buffer =3D devm_kzalloc(dev, gpio->buffer_size, GFP_KERNE=
L);
>> +    if (!gpio->buffer)
>> +        return -ENOMEM;
>> +
>> +    gpio->load_gpio =3D devm_gpiod_get(dev, "load", GPIOD_OUT_LOW);
>> +    if (IS_ERR(gpio->load_gpio)) {
>> +        ret =3D PTR_ERR(gpio->load_gpio);
>> +        if (ret !=3D -ENOENT && ret !=3D -ENOSYS) {
>> +            if (ret !=3D -EPROBE_DEFER)
>> +                dev_err(dev, "Unable to allocate load GPIO\n");
>> +            return ret;
>> +        }
>> +        gpio->load_gpio =3D NULL;
>> +    }
>> +
>> +    mutex_init(&gpio->lock);
>> +
>> +    ret =3D gpiochip_add_data(&gpio->chip, gpio);
>> +    if (ret < 0) {
>> +        dev_err(dev, "Unable to register gpiochip\n");
>> +        return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int pisosr_gpio_remove(struct spi_device *spi)
>> +{
>> +    struct pisosr_gpio *gpio =3D spi_get_drvdata(spi);
>> +
>> +    gpiochip_remove(&gpio->chip);
>> +
>> +    mutex_destroy(&gpio->lock);
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct spi_device_id pisosr_gpio_id_table[] =3D {
>> +    { "pisosr-gpio", },
>> +    { /* sentinel */ }
> Please add this :-)
> {"ti,sn65hvs885", 0},

See below.

>> +};
>> +MODULE_DEVICE_TABLE(spi, pisosr_gpio_id_table);
>> +
>> +static const struct of_device_id pisosr_gpio_of_match_table[] =3D {
>> +    { .compatible =3D "pisosr-gpio", },
>> +    { /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, pisosr_gpio_of_match_table);
>> +
>> +static struct spi_driver pisosr_gpio_driver =3D {
>> +    .driver =3D {
>> +        .name =3D "pisosr-gpio",
>> +        .of_match_table =3D pisosr_gpio_of_match_table,
>> +    },
>> +    .probe =3D pisosr_gpio_probe,
>> +    .remove =3D pisosr_gpio_remove,
>> +    .id_table =3D pisosr_gpio_id_table,
>> +};
>> +module_spi_driver(pisosr_gpio_driver);
>> +
>> +MODULE_AUTHOR("Andrew F. Davis <afd@ti.com>");
>> +MODULE_DESCRIPTION("SPI Compatible PISO Shift Register GPIO Driver"=
);
>> +MODULE_LICENSE("GPL v2");
> Hi Andrew
>
> I have created an driver for the sn65hvs885 at the same time as you, =
and the output is nearly identical :-)
> We are both missing the support for cacading devices, but i guess tha=
t can come later on.
>
> /Sean

Hi Sean,

This started as a driver for the sn65hvs88*2*, after seeing other drive=
rs
for similar parts I found that these input shift-register devices inter=
face
mostly the same way, so a more generic catch-all driver might be more
useful.

I would like to avoid explicitly putting the individual part names that=
 may be
compatible in this driver for reasons described well by Rob's comment[0=
]. If
you disagree I don't have any real serious qualms with adding some part=
 names.

Also by allowing a variable number of bits to be defined in DT I think
cascaded devices should work with this driver already.

[0] https://lkml.org/lkml/2016/1/28/581

Andrew
