From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 2/2] iio/adc: add support for axp288 adc
Date: Tue, 7 Oct 2014 09:36:26 +0100
Message-ID: <20141007083626.GG25331@lee--X1>
References: <1412655435-31284-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1412655435-31284-3-git-send-email-jacob.jun.pan@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1412655435-31284-3-git-send-email-jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacob Pan <jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: IIO <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DEVICE TREE <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Srinivas Pandruvada <srinivas.pandruvada-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Aaron Lu <aaron.lu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Alan Cox <alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Zubair Lutfullah <zubair.lutfullah-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Johannes Thumshirn <johannes.thumshirn-csrFAY9JiS4@public.gmane.org>, Philippe Reynes <tremyfr-Qt13gs6zZMY@public.gmane.org>, Angelo Compagnucci <angelo.compagnu>
List-Id: devicetree@vger.kernel.org

On Mon, 06 Oct 2014, Jacob Pan wrote:

> Platform driver for X-Powers AXP288 ADC, which is a sub-device of the
> customized AXP288 PMIC for Intel Baytrail-CR platforms. GPADC device
> enumerates as one of the MFD cell devices. It uses IIO infrastructure
> to communicate with userspace and consumer drivers.
>=20
> Usages of ADC channels include battery charging and thermal sensors.
>=20
> Based on initial work by:
> Ramakrishna Pallala <ramakrishna.pallala-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
>=20
> Acked-by: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Jacob Pan <jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> ---
>  drivers/iio/adc/Kconfig      |   8 ++
>  drivers/iio/adc/Makefile     |   1 +
>  drivers/iio/adc/axp288_adc.c | 254 +++++++++++++++++++++++++++++++++=
++++++++++
>  3 files changed, 263 insertions(+)
>  create mode 100644 drivers/iio/adc/axp288_adc.c

Applied, thanks.

> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index 11b048a..db2681b 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -127,6 +127,14 @@ config AT91_ADC
>  	help
>  	  Say yes here to build support for Atmel AT91 ADC.
> =20
> +config AXP288_ADC
> +	tristate "X-Powers AXP288 ADC driver"
> +	depends on MFD_AXP20X
> +	help
> +	  Say yes here to have support for X-Powers power management IC (PM=
IC) ADC
> +	  device. Depending on platform configuration, this general purpose=
 ADC can
> +	  be used for sampling sensors such as thermal resistors.
> +
>  config EXYNOS_ADC
>  	tristate "Exynos ADC driver support"
>  	depends on ARCH_EXYNOS || (OF && COMPILE_TEST)
> diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
> index ad81b51..19640f9 100644
> --- a/drivers/iio/adc/Makefile
> +++ b/drivers/iio/adc/Makefile
> @@ -14,6 +14,7 @@ obj-$(CONFIG_AD7793) +=3D ad7793.o
>  obj-$(CONFIG_AD7887) +=3D ad7887.o
>  obj-$(CONFIG_AD799X) +=3D ad799x.o
>  obj-$(CONFIG_AT91_ADC) +=3D at91_adc.o
> +obj-$(CONFIG_AXP288_ADC) +=3D axp288_adc.o
>  obj-$(CONFIG_EXYNOS_ADC) +=3D exynos_adc.o
>  obj-$(CONFIG_LP8788_ADC) +=3D lp8788_adc.o
>  obj-$(CONFIG_MAX1027) +=3D max1027.o
> diff --git a/drivers/iio/adc/axp288_adc.c b/drivers/iio/adc/axp288_ad=
c.c
> new file mode 100644
> index 0000000..4800286
> --- /dev/null
> +++ b/drivers/iio/adc/axp288_adc.c
> @@ -0,0 +1,254 @@
> +/*
> + * axp288_adc.c - X-Powers AXP288 PMIC ADC Driver
> + *
> + * Copyright (C) 2014 Intel Corporation
> + *
> + * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; version 2 of the License.
> + *
> + * This program is distributed in the hope that it will be useful, b=
ut
> + * WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	See the GNU
> + * General Public License for more details.
> + *
> + */
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/device.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/axp20x.h>
> +#include <linux/platform_device.h>
> +
> +#include <linux/iio/iio.h>
> +#include <linux/iio/machine.h>
> +#include <linux/iio/driver.h>
> +
> +#define AXP288_ADC_EN_MASK		0xF1
> +#define AXP288_ADC_TS_PIN_GPADC		0xF2
> +#define AXP288_ADC_TS_PIN_ON		0xF3
> +
> +enum axp288_adc_id {
> +	AXP288_ADC_TS,
> +	AXP288_ADC_PMIC,
> +	AXP288_ADC_GP,
> +	AXP288_ADC_BATT_CHRG_I,
> +	AXP288_ADC_BATT_DISCHRG_I,
> +	AXP288_ADC_BATT_V,
> +	AXP288_ADC_NR_CHAN,
> +};
> +
> +struct axp288_adc_info {
> +	int irq;
> +	struct regmap *regmap;
> +};
> +
> +static const struct iio_chan_spec const axp288_adc_channels[] =3D {
> +	{
> +		.indexed =3D 1,
> +		.type =3D IIO_TEMP,
> +		.channel =3D 0,
> +		.address =3D AXP288_TS_ADC_H,
> +		.datasheet_name =3D "TS_PIN",
> +	}, {
> +		.indexed =3D 1,
> +		.type =3D IIO_TEMP,
> +		.channel =3D 1,
> +		.address =3D AXP288_PMIC_ADC_H,
> +		.datasheet_name =3D "PMIC_TEMP",
> +	}, {
> +		.indexed =3D 1,
> +		.type =3D IIO_TEMP,
> +		.channel =3D 2,
> +		.address =3D AXP288_GP_ADC_H,
> +		.datasheet_name =3D "GPADC",
> +	}, {
> +		.indexed =3D 1,
> +		.type =3D IIO_CURRENT,
> +		.channel =3D 3,
> +		.address =3D AXP20X_BATT_CHRG_I_H,
> +		.datasheet_name =3D "BATT_CHG_I",
> +		.info_mask_separate =3D BIT(IIO_CHAN_INFO_PROCESSED),
> +	}, {
> +		.indexed =3D 1,
> +		.type =3D IIO_CURRENT,
> +		.channel =3D 4,
> +		.address =3D AXP20X_BATT_DISCHRG_I_H,
> +		.datasheet_name =3D "BATT_DISCHRG_I",
> +		.info_mask_separate =3D BIT(IIO_CHAN_INFO_PROCESSED),
> +	}, {
> +		.indexed =3D 1,
> +		.type =3D IIO_VOLTAGE,
> +		.channel =3D 5,
> +		.address =3D AXP20X_BATT_V_H,
> +		.datasheet_name =3D "BATT_V",
> +		.info_mask_separate =3D BIT(IIO_CHAN_INFO_PROCESSED),
> +	},
> +};
> +
> +#define AXP288_ADC_MAP(_adc_channel_label, _consumer_dev_name,	\
> +		_consumer_channel)				\
> +	{							\
> +		.adc_channel_label =3D _adc_channel_label,	\
> +		.consumer_dev_name =3D _consumer_dev_name,	\
> +		.consumer_channel =3D _consumer_channel,		\
> +	}
> +
> +/* for consumer drivers */
> +static struct iio_map axp288_adc_default_maps[] =3D {
> +	AXP288_ADC_MAP("TS_PIN", "axp288-batt", "axp288-batt-temp"),
> +	AXP288_ADC_MAP("PMIC_TEMP", "axp288-pmic", "axp288-pmic-temp"),
> +	AXP288_ADC_MAP("GPADC", "axp288-gpadc", "axp288-system-temp"),
> +	AXP288_ADC_MAP("BATT_CHG_I", "axp288-chrg", "axp288-chrg-curr"),
> +	AXP288_ADC_MAP("BATT_DISCHRG_I", "axp288-chrg", "axp288-chrg-d-curr=
"),
> +	AXP288_ADC_MAP("BATT_V", "axp288-batt", "axp288-batt-volt"),
> +	{},
> +};
> +
> +static int axp288_adc_read_channel(int *val, unsigned long address,
> +				struct regmap *regmap)
> +{
> +	u8 buf[2];
> +
> +	if (regmap_bulk_read(regmap, address, buf, 2))
> +		return -EIO;
> +	*val =3D (buf[0] << 4) + ((buf[1] >> 4) & 0x0F);
> +
> +	return IIO_VAL_INT;
> +}
> +
> +static int axp288_adc_set_ts(struct regmap *regmap, unsigned int mod=
e,
> +				unsigned long address)
> +{
> +	/* channels other than GPADC do not need to switch TS pin */
> +	if (address !=3D AXP288_GP_ADC_H)
> +		return 0;
> +
> +	return regmap_write(regmap, AXP288_ADC_TS_PIN_CTRL, mode);
> +}
> +
> +static int axp288_adc_read_raw(struct iio_dev *indio_dev,
> +			struct iio_chan_spec const *chan,
> +			int *val, int *val2, long mask)
> +{
> +	int ret;
> +	struct axp288_adc_info *info =3D iio_priv(indio_dev);
> +
> +	mutex_lock(&indio_dev->mlock);
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		if (axp288_adc_set_ts(info->regmap, AXP288_ADC_TS_PIN_GPADC,
> +					chan->address)) {
> +			dev_err(&indio_dev->dev, "GPADC mode\n");
> +			ret =3D -EINVAL;
> +			break;
> +		}
> +		ret =3D axp288_adc_read_channel(val, chan->address, info->regmap);
> +		if (axp288_adc_set_ts(info->regmap, AXP288_ADC_TS_PIN_ON,
> +						chan->address))
> +			dev_err(&indio_dev->dev, "TS pin restore\n");
> +		break;
> +	case IIO_CHAN_INFO_PROCESSED:
> +		ret =3D axp288_adc_read_channel(val, chan->address, info->regmap);
> +		break;
> +	default:
> +		ret =3D -EINVAL;
> +	}
> +	mutex_unlock(&indio_dev->mlock);
> +
> +	return ret;
> +}
> +
> +static int axp288_adc_set_state(struct regmap *regmap)
> +{
> +	/* ADC should be always enabled for internal FG to function */
> +	if (regmap_write(regmap, AXP288_ADC_TS_PIN_CTRL, AXP288_ADC_TS_PIN_=
ON))
> +		return -EIO;
> +
> +	return regmap_write(regmap, AXP20X_ADC_EN1, AXP288_ADC_EN_MASK);
> +}
> +
> +static const struct iio_info axp288_adc_iio_info =3D {
> +	.read_raw =3D &axp288_adc_read_raw,
> +	.driver_module =3D THIS_MODULE,
> +};
> +
> +static int axp288_adc_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +	struct axp288_adc_info *info;
> +	struct iio_dev *indio_dev;
> +	struct axp20x_dev *axp20x =3D dev_get_drvdata(pdev->dev.parent);
> +
> +	indio_dev =3D devm_iio_device_alloc(&pdev->dev, sizeof(*info));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	info =3D iio_priv(indio_dev);
> +	info->irq =3D platform_get_irq(pdev, 0);
> +	if (info->irq < 0) {
> +		dev_err(&pdev->dev, "no irq resource?\n");
> +		return info->irq;
> +	}
> +	platform_set_drvdata(pdev, indio_dev);
> +	info->regmap =3D axp20x->regmap;
> +	/*
> +	 * Set ADC to enabled state at all time, including system suspend.
> +	 * otherwise internal fuel gauge functionality may be affected.
> +	 */
> +	ret =3D axp288_adc_set_state(axp20x->regmap);
> +	if (ret) {
> +		dev_err(&pdev->dev, "unable to enable ADC device\n");
> +		return ret;
> +	}
> +
> +	indio_dev->dev.parent =3D &pdev->dev;
> +	indio_dev->name =3D pdev->name;
> +	indio_dev->channels =3D axp288_adc_channels;
> +	indio_dev->num_channels =3D ARRAY_SIZE(axp288_adc_channels);
> +	indio_dev->info =3D &axp288_adc_iio_info;
> +	indio_dev->modes =3D INDIO_DIRECT_MODE;
> +	ret =3D iio_map_array_register(indio_dev, axp288_adc_default_maps);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D iio_device_register(indio_dev);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "unable to register iio device\n");
> +		goto err_array_unregister;
> +	}
> +	return 0;
> +
> +err_array_unregister:
> +	iio_map_array_unregister(indio_dev);
> +
> +	return ret;
> +}
> +
> +static int axp288_adc_remove(struct platform_device *pdev)
> +{
> +	struct iio_dev *indio_dev =3D platform_get_drvdata(pdev);
> +
> +	iio_device_unregister(indio_dev);
> +	iio_map_array_unregister(indio_dev);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver axp288_adc_driver =3D {
> +	.probe =3D axp288_adc_probe,
> +	.remove =3D axp288_adc_remove,
> +	.driver =3D {
> +		.name =3D "axp288_adc",
> +		.owner =3D THIS_MODULE,
> +	},
> +};
> +
> +module_platform_driver(axp288_adc_driver);
> +
> +MODULE_AUTHOR("Jacob Pan <jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>");
> +MODULE_DESCRIPTION("X-Powers AXP288 ADC Driver");
> +MODULE_LICENSE("GPL");

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
