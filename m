From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH] iio: adc128s052: add support for adc122s021
Date: Sat, 23 May 2015 12:43:05 +0100
Message-ID: <556067C9.3070209@kernel.org>
References: <1431955364-25059-1-git-send-email-urs.fassler@bytesatwork.ch> <1431955364-25059-2-git-send-email-urs.fassler@bytesatwork.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431955364-25059-2-git-send-email-urs.fassler@bytesatwork.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?VXJzIEbDpHNzbGVy?= <urs.fassler@bytesatwork.ch>, angelo.compagnucci@gmail.com
Cc: iivanov@mm-sol.com, ezequiel.garcia@imgtec.com, jacob.jun.pan@linux.intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 18/05/15 14:22, Urs F=C3=A4ssler wrote:
> Signed-off-by: Urs F=C3=A4ssler <urs.fassler@bytesatwork.ch>
looks good.=20

Applied to the togreg branch of iio.git with the chip->chips change.

Thanks,

Jonathan
> ---
>  .../devicetree/bindings/iio/adc/ti-adc128s052.txt  |  4 +--
>  drivers/iio/adc/Kconfig                            |  4 +--
>  drivers/iio/adc/ti-adc128s052.c                    | 30 ++++++++++++=
+++++-----
>  3 files changed, 28 insertions(+), 10 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/iio/adc/ti-adc128s052.=
txt b/Documentation/devicetree/bindings/iio/adc/ti-adc128s052.txt
> index 42ca7de..15ca6b4 100644
> --- a/Documentation/devicetree/bindings/iio/adc/ti-adc128s052.txt
> +++ b/Documentation/devicetree/bindings/iio/adc/ti-adc128s052.txt
> @@ -1,7 +1,7 @@
> -* Texas Instruments' ADC128S052 ADC chip
> +* Texas Instruments' ADC128S052 and ADC122S021 ADC chip
> =20
>  Required properties:
> - - compatible: Should be "ti,adc128s052"
> + - compatible: Should be "ti,adc128s052" or "ti,adc122s021"
>   - reg: spi chip select number for the device
>   - vref-supply: The regulator supply for ADC reference voltage
> =20
> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index e36a73e..92c319c 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -285,11 +285,11 @@ config TI_ADC081C
>  	  called ti-adc081c.
> =20
>  config TI_ADC128S052
> -	tristate "Texas Instruments ADC128S052"
> +	tristate "Texas Instruments ADC128S052/ADC122S021"
>  	depends on SPI
>  	help
>  	  If you say yes here you get support for Texas Instruments ADC128S=
052
> -	  chip.
> +	  and ADC122S021 chip.
chips ;)
> =20
>  	  This driver can also be built as a module. If so, the module will=
 be
>  	  called ti-adc128s052.
> diff --git a/drivers/iio/adc/ti-adc128s052.c b/drivers/iio/adc/ti-adc=
128s052.c
> index 655cb56..915be6b 100644
> --- a/drivers/iio/adc/ti-adc128s052.c
> +++ b/drivers/iio/adc/ti-adc128s052.c
> @@ -1,9 +1,10 @@
>  /*
>   * Copyright (C) 2014 Angelo Compagnucci <angelo.compagnucci@gmail.c=
om>
>   *
> - * Driver for Texas Instruments' ADC128S052 ADC chip.
> - * Datasheet can be found here:
> + * Driver for Texas Instruments' ADC128S052 and ADC122S021 ADC chip.
> + * Datasheets can be found here:
>   * http://www.ti.com/lit/ds/symlink/adc128s052.pdf
> + * http://www.ti.com/lit/ds/symlink/adc122s021.pdf
>   *
>   * This program is free software; you can redistribute it and/or mod=
ify
>   * it under the terms of the GNU General Public License version 2 as
> @@ -16,6 +17,11 @@
>  #include <linux/iio/iio.h>
>  #include <linux/regulator/consumer.h>
> =20
> +struct adc128_configuration {
> +	const struct iio_chan_spec	*channels;
> +	u8				num_channels;
> +};
> +
>  struct adc128 {
>  	struct spi_device *spi;
> =20
> @@ -92,7 +98,7 @@ static int adc128_read_raw(struct iio_dev *indio_de=
v,
>  		.info_mask_shared_by_type =3D BIT(IIO_CHAN_INFO_SCALE) \
>  	}
> =20
> -static const struct iio_chan_spec adc128_channels[] =3D {
> +static const struct iio_chan_spec adc128s052_channels[] =3D {
>  	ADC128_VOLTAGE_CHANNEL(0),
>  	ADC128_VOLTAGE_CHANNEL(1),
>  	ADC128_VOLTAGE_CHANNEL(2),
> @@ -103,6 +109,16 @@ static const struct iio_chan_spec adc128_channel=
s[] =3D {
>  	ADC128_VOLTAGE_CHANNEL(7),
>  };
> =20
> +static const struct iio_chan_spec adc122s021_channels[] =3D {
> +	ADC128_VOLTAGE_CHANNEL(0),
> +	ADC128_VOLTAGE_CHANNEL(1),
> +};
> +
> +static const struct adc128_configuration adc128_config[] =3D {
> +	{ adc128s052_channels, ARRAY_SIZE(adc128s052_channels) },
> +	{ adc122s021_channels, ARRAY_SIZE(adc122s021_channels) },
> +};
This is a good flexible solution as opposed to doing it via a switch
in the probe function which would have been shorter, but not allowed
for as easy an extension to moer parts in future.   Looks like there
are lots of fairly similar parts!
> +
>  static const struct iio_info adc128_info =3D {
>  	.read_raw =3D adc128_read_raw,
>  	.driver_module =3D THIS_MODULE,
> @@ -112,6 +128,7 @@ static int adc128_probe(struct spi_device *spi)
>  {
>  	struct iio_dev *indio_dev;
>  	struct adc128 *adc;
> +	int config =3D spi_get_device_id(spi)->driver_data;
>  	int ret;
> =20
>  	indio_dev =3D devm_iio_device_alloc(&spi->dev, sizeof(*adc));
> @@ -128,8 +145,8 @@ static int adc128_probe(struct spi_device *spi)
>  	indio_dev->modes =3D INDIO_DIRECT_MODE;
>  	indio_dev->info =3D &adc128_info;
> =20
> -	indio_dev->channels =3D adc128_channels;
> -	indio_dev->num_channels =3D ARRAY_SIZE(adc128_channels);
> +	indio_dev->channels =3D adc128_config[config].channels;
> +	indio_dev->num_channels =3D adc128_config[config].num_channels;
> =20
>  	adc->reg =3D devm_regulator_get(&spi->dev, "vref");
>  	if (IS_ERR(adc->reg))
> @@ -158,7 +175,8 @@ static int adc128_remove(struct spi_device *spi)
>  }
> =20
>  static const struct spi_device_id adc128_id[] =3D {
> -	{ "adc128s052", 0},
> +	{ "adc128s052", 0},	/* index into adc128_config */
> +	{ "adc122s021",	1},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(spi, adc128_id);
>=20
