Return-Path: <SRS0=opvc=TF=gmail.com=jacek.anaszewski@kernel.org>
Subject: Re: [PATCH v3 2/2] leds: spi-byte: add single byte SPI LED driver
References: <20190505200022.32209-1-oss@c-mauderer.de>
 <20190505200022.32209-2-oss@c-mauderer.de>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <a473e4ec-10f7-6261-1fc3-8164677ac36b@gmail.com>
Date: Sun, 5 May 2019 22:09:01 +0200
MIME-Version: 1.0
In-Reply-To: <20190505200022.32209-2-oss@c-mauderer.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: oss@c-mauderer.de, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Christian,

Thank you for the update. One thing left after switching
to devm API. Please refer below to the remove op.

On 5/5/19 10:00 PM, oss@c-mauderer.de wrote:
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
>    all collected together and initializing all fields of the device structure is
>    more obvious
> - fix some unsteady indentations during variable declaration
> - rework comment with protocol explanation
> - handle case of off_bright > max_bright
> - fix spelling in commit message
> - mutex_destroy in remove
> - change label to use either use the given one without a prefix or a default one
> 
> 
>   drivers/leds/Kconfig         |  12 ++++
>   drivers/leds/Makefile        |   1 +
>   drivers/leds/leds-spi-byte.c | 134 +++++++++++++++++++++++++++++++++++
>   3 files changed, 147 insertions(+)
>   create mode 100644 drivers/leds/leds-spi-byte.c

[...]
> +
> +static int spi_byte_remove(struct spi_device *spi)
> +{
> +	struct spi_byte_led	*led = spi_get_drvdata(spi);
> +
> +	led_classdev_unregister(&led->ldev);

This is now not needed - devm, means "device managed", i.e.
all resources claimed with it will be automatically reclaimed
on device destruction.

> +	mutex_destroy(&led->mutex);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id spi_byte_dt_ids[] = {
> +	{ .compatible = "leds-spi-byte", },
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(of, spi_byte_dt_ids);
> +
> +static struct spi_driver spi_byte_driver = {
> +	.probe		= spi_byte_probe,
> +	.remove		= spi_byte_remove,
> +	.driver = {
> +		.name		= KBUILD_MODNAME,
> +		.of_match_table	= spi_byte_dt_ids,
> +	},
> +};
> +
> +module_spi_driver(spi_byte_driver);
> +
> +MODULE_AUTHOR("Christian Mauderer <oss@c-mauderer.de>");
> +MODULE_DESCRIPTION("single byte SPI LED driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("spi:leds-spi-byte");
> 

-- 
Best regards,
Jacek Anaszewski
