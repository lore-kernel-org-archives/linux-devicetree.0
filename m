From: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH v4 2/3] iio/adc: add support for axp288 adc
Date: Thu, 18 Sep 2014 00:20:00 +0200
Message-ID: <541A0910.90806@gmx.de>
References: <1410912715-25903-1-git-send-email-jacob.jun.pan@linux.intel.com> <1410912715-25903-3-git-send-email-jacob.jun.pan@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410912715-25903-3-git-send-email-jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacob Pan <jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, IIO <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DEVICE TREE <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Srinivas Pandruvada <srinivas.pandruvada-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Aaron Lu <aaron.lu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Alan Cox <alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Zubair Lutfullah <zubair.lutfullah-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Johannes Thumshirn <johannes.thumshirn-csrFAY9JiS4@public.gmane.org>, Philippe Reynes <tremyfr-Qt13gs6zZMY@public.gmane.org>, Angelo Compagnucci <angelo.compagnucci-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Ramakrishna Pallala <ramakrishna.pallala-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Maxime Ripard <maxime.ripard@free-elec>
List-Id: devicetree@vger.kernel.org

Jacob Pan schrieb, Am 17.09.2014 02:11:
> Platform driver for X-Powers AXP288 ADC, which is a sub-device of the
> customized AXP288 PMIC for Intel Baytrail-CR platforms. GPADC device
> enumerates as one of the MFD cell devices. It uses IIO infrastructure
> to communicate with userspace and consumer drivers.
> 
> Usages of ADC channels include battery charging and thermal sensors.
> 
You are progressing, but still a few issues left. One thing is indentation in some places (I feel like being pretty annoying about this), others are commented in line.
> Based on initial work by:
> Ramakrishna Pallala <ramakrishna.pallala-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> 
> Signed-off-by: Jacob Pan <jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> ---
>  drivers/iio/adc/Kconfig      |   8 ++
>  drivers/iio/adc/Makefile     |   1 +
>  drivers/iio/adc/axp288_adc.c | 254 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 263 insertions(+)
>  create mode 100644 drivers/iio/adc/axp288_adc.c
> 
> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index 11b048a..db2681b 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -127,6 +127,14 @@ config AT91_ADC
>  	help
>  	  Say yes here to build support for Atmel AT91 ADC.
>  
> +config AXP288_ADC
> +	tristate "X-Powers AXP288 ADC driver"
> +	depends on MFD_AXP20X
> +	help
> +	  Say yes here to have support for X-Powers power management IC (PMIC) ADC
> +	  device. Depending on platform configuration, this general purpose ADC can
> +	  be used for sampling sensors such as thermal resistors.
> +
>  config EXYNOS_ADC
>  	tristate "Exynos ADC driver support"
>  	depends on ARCH_EXYNOS || (OF && COMPILE_TEST)
> diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
> index ad81b51..19640f9 100644
> --- a/drivers/iio/adc/Makefile
> +++ b/drivers/iio/adc/Makefile
> @@ -14,6 +14,7 @@ obj-$(CONFIG_AD7793) += ad7793.o
>  obj-$(CONFIG_AD7887) += ad7887.o
>  obj-$(CONFIG_AD799X) += ad799x.o
>  obj-$(CONFIG_AT91_ADC) += at91_adc.o
> +obj-$(CONFIG_AXP288_ADC) += axp288_adc.o
>  obj-$(CONFIG_EXYNOS_ADC) += exynos_adc.o
>  obj-$(CONFIG_LP8788_ADC) += lp8788_adc.o
>  obj-$(CONFIG_MAX1027) += max1027.o
> diff --git a/drivers/iio/adc/axp288_adc.c b/drivers/iio/adc/axp288_adc.c
> new file mode 100644
> index 0000000..333c624
> --- /dev/null
> +++ b/drivers/iio/adc/axp288_adc.c
> @@ -0,0 +1,254 @@
> +/*
> + * axp288_adc.c - X-Powers AXP288 PMIC ADC Driver
> + *
> + * Copyright (C) 2014 Intel Corporation
> + *
> + * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; version 2 of the License.
> + *
> + * This program is distributed in the hope that it will be useful, but
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
> +	struct device *dev;
> +	struct regmap *regmap;
> +};
> +
> +static const struct iio_chan_spec const axp288_adc_channels[] = {
> +	{
> +		.indexed = 1,
> +		.type = IIO_TEMP,
> +		.channel = 0,
> +		.address = AXP288_TS_ADC_H,
> +		.datasheet_name = "CH0",
> +	}, {
> +		.indexed = 1,
> +		.type = IIO_TEMP,
> +		.channel = 1,
> +		.address = AXP288_PMIC_ADC_H,
> +		.datasheet_name = "CH1",
> +	}, {
> +		.indexed = 1,
> +		.type = IIO_TEMP,
> +		.channel = 2,
> +		.address = AXP288_GP_ADC_H,
> +		.datasheet_name = "CH2",
> +	}, {
> +		.indexed = 1,
> +		.type = IIO_CURRENT,
> +		.channel = 3,
> +		.address = AXP20X_BATT_CHRG_I_H,
> +		.datasheet_name = "CH3",
> +		.info_mask_separate = BIT(IIO_CHAN_INFO_PROCESSED),
> +	}, {
> +		.indexed = 1,
> +		.type = IIO_CURRENT,
> +		.channel = 4,
> +		.address = AXP20X_BATT_DISCHRG_I_H,
> +		.datasheet_name = "CH4",
> +		.info_mask_separate = BIT(IIO_CHAN_INFO_PROCESSED),
> +	}, {
> +		.indexed = 1,
> +		.type = IIO_VOLTAGE,
> +		.channel = 5,
> +		.address = AXP20X_BATT_V_H,
> +		.datasheet_name = "CH5",
> +		.info_mask_separate = BIT(IIO_CHAN_INFO_PROCESSED),
> +	},
> +};
> +
> +#define AXP288_ADC_MAP(_adc_channel_label, _consumer_dev_name,	\
> +		_consumer_channel)				\
> +	{							\
> +		.adc_channel_label = _adc_channel_label,	\
> +		.consumer_dev_name = _consumer_dev_name,	\
> +		.consumer_channel = _consumer_channel,		\
> +	}
> +
> +/* for consumer drivers */
> +static struct iio_map axp288_adc_default_maps[] = {
> +	AXP288_ADC_MAP("TS_PIN", "axp288-batt", "axp288-batt-temp"),
> +	AXP288_ADC_MAP("PMIC_TEMP", "axp288-pmic", "axp288-pmic-temp"),
> +	AXP288_ADC_MAP("GPADC", "axp288-gpadc", "axp288-system-temp"),
> +	AXP288_ADC_MAP("BATT_CHG_I", "axp288-chrg", "axp288-chrg-curr"),
> +	AXP288_ADC_MAP("BATT_DISCHRG_I", "axp288-chrg", "axp288-chrg-d-curr"),
> +	AXP288_ADC_MAP("BATT_V", "axp288-batt", "axp288-batt-volt"),
> +	{},
> +};
> +
> +static int axp288_adc_read_raw(struct iio_dev *indio_dev,
> +			struct iio_chan_spec const *chan,
> +			int *val, int *val2, long mask)
> +{
> +	int ret;
> +	struct axp288_adc_info *info = iio_priv(indio_dev);
> +	u8 buf[2];
You could use __be16 instead. Then you just need to use be16_to_cpu(), shift 4 bits to the right and mask the result with 0xFF.
> +
> +	mutex_lock(&indio_dev->mlock);
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		/* special case for GPADC sample */
> +		if (chan->address == AXP288_GP_ADC_H) {
> +			ret = regmap_write(info->regmap, AXP288_ADC_TS_PIN_CTRL,
> +					AXP288_ADC_TS_PIN_GPADC);
> +			if (ret) {
> +				dev_err(&indio_dev->dev, "GPADC mode\n");
> +				mutex_unlock(&indio_dev->mlock);
> +				return ret;
You may even just goto the mutex_unlock at the end of the function. Would safe a few bytes here in the source - up to you. More interesting is, if the error message is required, as you don't have one below, when switching to TS_PIN_ON.
> +			}
> +		}
> +	case IIO_CHAN_INFO_PROCESSED:
> +		ret = regmap_bulk_read(info->regmap, chan->address, buf, 2);
> +		if (ret) {
> +			dev_err(&indio_dev->dev, "sample raw data failed\n");
> +			break;
> +		}
> +		*val = (buf[0] << 4) + ((buf[1] >> 4) & 0x0F);
> +		ret = IIO_VAL_INT;
> +		break;
> +	default:
> +		ret = -EINVAL;
> +	}
> +
> +	if (mask == IIO_CHAN_INFO_RAW && chan->address == AXP288_GP_ADC_H)
> +		ret = regmap_write(info->regmap, AXP288_ADC_TS_PIN_CTRL,
> +			AXP288_ADC_TS_PIN_ON);
> +
> +	mutex_unlock(&indio_dev->mlock);
> +
> +	return ret;
> +}
> +
> +static int axp288_adc_enable(struct regmap *regmap, bool enable)
> +{
> +	unsigned int pin_on, adc_en;
> +
> +	if (enable) {
> +		pin_on = AXP288_ADC_TS_PIN_ON;
> +		adc_en = AXP288_ADC_EN_MASK;
> +	} else {
> +		pin_on = ~AXP288_ADC_TS_PIN_ON;
> +		adc_en = ~AXP288_ADC_EN_MASK;
> +	}
> +	if (regmap_write(regmap, AXP288_ADC_TS_PIN_CTRL, pin_on))
> +		return -EIO;
> +
> +	return regmap_write(regmap, AXP20X_ADC_EN1, ~AXP288_ADC_EN_MASK);
So, what's the deal about the variable adc_en?
> +}
> +
> +static const struct iio_info axp288_adc_iio_info = {
> +	.read_raw = &axp288_adc_read_raw,
> +	.driver_module = THIS_MODULE,
> +};
> +
> +static int axp288_adc_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +	struct axp288_adc_info *info;
> +	struct iio_dev *indio_dev;
> +	struct axp20x_dev *axp20x = dev_get_drvdata(pdev->dev.parent);
> +
> +	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*info));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	info = iio_priv(indio_dev);
> +	info->irq = platform_get_irq(pdev, 0);
> +	if (info->irq < 0) {
> +		dev_err(&pdev->dev, "no irq resource?\n");
> +		return info->irq;
> +	}
> +	platform_set_drvdata(pdev, indio_dev);
> +	info->regmap = axp20x->regmap;
> +	ret = axp288_adc_enable(axp20x->regmap, true);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Unable to enable ADC device\n");
> +		return ret;
> +	}
> +
> +	indio_dev->dev.parent = &pdev->dev;
> +	indio_dev->name = pdev->name;
> +	indio_dev->channels = axp288_adc_channels;
> +	indio_dev->num_channels = ARRAY_SIZE(axp288_adc_channels);
> +	indio_dev->info = &axp288_adc_iio_info;
> +	indio_dev->modes = INDIO_DIRECT_MODE;
> +	ret = iio_map_array_register(indio_dev, axp288_adc_default_maps);
> +	if (ret < 0)
> +		goto err_disable_dev;
> +
> +	ret = iio_device_register(indio_dev);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "unable to register iio device\n");
> +		goto err_array_unregister;
> +	}
> +
> +	return 0;
> +
> +err_array_unregister:
> +	iio_map_array_unregister(indio_dev);
> +err_disable_dev:
> +	ret = axp288_adc_enable(axp20x->regmap, false);
Don't set ret here. We want to return the error code from the function that failed above.
> +
> +	return ret;
> +}
> +
> +static int axp288_adc_remove(struct platform_device *pdev)
> +{
> +	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
> +	struct axp20x_dev *axp20x = dev_get_drvdata(pdev->dev.parent);
> +
> +	if (axp288_adc_enable(axp20x->regmap, false))
> +		dev_err(&pdev->dev, "Unable to disable ADC device\n");
> +	iio_device_unregister(indio_dev);
> +	iio_map_array_unregister(indio_dev);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver axp288_adc_driver = {
> +	.probe = axp288_adc_probe,
> +	.remove = axp288_adc_remove,
> +	.driver = {
> +		.name = "axp288_adc",
> +		.owner = THIS_MODULE,
> +	},
> +};
> +
> +module_platform_driver(axp288_adc_driver);
> +
> +MODULE_AUTHOR("Jacob Pan <jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>");
> +MODULE_DESCRIPTION("X-Powers AXP288 ADC Driver");
> +MODULE_LICENSE("GPL");
> 
