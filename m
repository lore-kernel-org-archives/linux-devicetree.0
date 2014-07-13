From: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH v3 1/2] iio: adc: add driver for Rockchip saradc
Date: Sun, 13 Jul 2014 14:09:48 +0200
Message-ID: <53C2770C.3050701@gmx.de>
References: <2959154.xc8BQActsn@diego> <2482306.yDb91TH59G@diego> <2263220.rhyqmTfAiL@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2263220.rhyqmTfAiL@diego>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, =?UTF-8?B?ImVkZGllKOiUoeaeqyki?= <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Heiko St=C3=BCbner schrieb:
> The ADC is a 3-channel signal-ended 10-bit Successive Approximation
> Register (SAR) A/D Converter. It uses the supply and ground as its re=
ference
> and converts the analog input signal into 10-bit binary digital codes=
=2E
Is there a datasheet available anywhere, or just under some NDA? I've g=
ot some comments in line, which might be answered by reading the datash=
eet.
> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> ---
>  changes since v2:
> - address more comments from Peter Meerwald
>   mainly the missing info_mask_shared_by_type element
>  changes since v1:
> - address comments from Peter Meerwald
>
> drivers/iio/adc/Kconfig           |  10 ++
>  drivers/iio/adc/Makefile          |   1 +
>  drivers/iio/adc/rockchip_saradc.c | 314 ++++++++++++++++++++++++++++=
++++++++++
>  3 files changed, 325 insertions(+)
>  create mode 100644 drivers/iio/adc/rockchip_saradc.c
>
> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index a80d236..5d36bdb 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -187,6 +187,16 @@ config NAU7802
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called nau7802.
> =20
> +config ROCKCHIP_SARADC
> +	tristate "Rockchip SARADC driver"
> +	depends on ARCH_ROCKCHIP || (OF && COMPILE_TEST)
> +	help
> +	  Say yes here to build support for the SARADC found in SoCs from
> +	  Rockchip.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called rockchip_saradc.
> +
>  config TI_ADC081C
>  	tristate "Texas Instruments ADC081C021/027"
>  	depends on I2C
> diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
> index 9d60f2d..8e2932d 100644
> --- a/drivers/iio/adc/Makefile
> +++ b/drivers/iio/adc/Makefile
> @@ -20,6 +20,7 @@ obj-$(CONFIG_MCP320X) +=3D mcp320x.o
>  obj-$(CONFIG_MCP3422) +=3D mcp3422.o
>  obj-$(CONFIG_MEN_Z188_ADC) +=3D men_z188_adc.o
>  obj-$(CONFIG_NAU7802) +=3D nau7802.o
> +obj-$(CONFIG_ROCKCHIP_SARADC) +=3D rockchip_saradc.o
>  obj-$(CONFIG_TI_ADC081C) +=3D ti-adc081c.o
>  obj-$(CONFIG_TI_AM335X_ADC) +=3D ti_am335x_adc.o
>  obj-$(CONFIG_TWL4030_MADC) +=3D twl4030-madc.o
> diff --git a/drivers/iio/adc/rockchip_saradc.c b/drivers/iio/adc/rock=
chip_saradc.c
> new file mode 100644
> index 0000000..8fc5867
> --- /dev/null
> +++ b/drivers/iio/adc/rockchip_saradc.c
> @@ -0,0 +1,314 @@
> +/*
> + * Rockchip Successive Approximation Register (SAR) A/D Converter
> + * Copyright (C) 2014 ROCKCHIP, Inc.
Does this mean, that you are working for Rockchip?
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/clk.h>
> +#include <linux/completion.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/iio/iio.h>
> +
> +#define SARADC_DATA			0x00
> +#define SARADC_DATA_MASK		0x3ff
> +
> +#define SARADC_STAS			0x04
> +#define SARADC_STAS_BUSY		BIT(0)
> +
> +#define SARADC_CTRL			0x08
> +#define SARADC_CTRL_IRQ_STATUS		BIT(6)
> +#define SARADC_CTRL_IRQ_ENABLE		BIT(5)
> +#define SARADC_CTRL_POWER_CTRL		BIT(3)
> +#define SARADC_CTRL_CHN_MASK		0x7
> +
> +#define SARADC_DLY_PU_SOC		0x0c
> +#define SARADC_DLY_PU_SOC_MASK		0x3f
> +
> +#define SARADC_BITS			10
> +#define SARADC_TIMEOUT			msecs_to_jiffies(100)
> +
> +struct rockchip_saradc {
> +	void __iomem		*regs;
> +	struct clk		*pclk;
> +	struct clk		*clk;
> +	struct completion	completion;
> +	struct regulator	*vref;
> +	int			vref_mv;
> +	u16			last_val;
> +};
> +
> +static int rockchip_saradc_read_raw(struct iio_dev *indio_dev,
> +				    struct iio_chan_spec const *chan,
> +				    int *val, int *val2, long mask)
> +{
> +	struct rockchip_saradc *info =3D iio_priv(indio_dev);
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		mutex_lock(&indio_dev->mlock);
> +
> +		/* Select the channel to be used and trigger conversion */
> +		writel_relaxed(0x08, info->regs + SARADC_DLY_PU_SOC);
This could need a bit more explanation. Maybe represent the magic value=
 of 0x8 with a more self explaining definition.
> +		writel(SARADC_CTRL_POWER_CTRL
> +				| (chan->channel & SARADC_CTRL_CHN_MASK)
> +				| SARADC_CTRL_IRQ_ENABLE,
> +		       info->regs + SARADC_CTRL);
> +
> +		if (!wait_for_completion_timeout(&info->completion,
> +						 SARADC_TIMEOUT)) {
> +			writel_relaxed(0, info->regs + SARADC_CTRL);
> +			mutex_unlock(&indio_dev->mlock);
> +			return -ETIMEDOUT;
> +		}
> +
> +		*val =3D info->last_val;
> +		mutex_unlock(&indio_dev->mlock);
> +		return IIO_VAL_INT;
> +	case IIO_CHAN_INFO_SCALE:
> +		*val =3D info->vref_mv;
> +		*val2 =3D SARADC_BITS;
> +		return IIO_VAL_FRACTIONAL_LOG2;
Are there only fixed voltage regulators used, or are there chances that=
 variable voltage regulators could be used for vref? In the second case=
, it would be better to determine the current regulator voltage here.
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static irqreturn_t rockchip_saradc_isr(int irq, void *dev_id)
> +{
> +	struct rockchip_saradc *info =3D (struct rockchip_saradc *)dev_id;
> +
> +	/* Read value */
> +	info->last_val =3D readl_relaxed(info->regs + SARADC_DATA);
> +	info->last_val &=3D SARADC_DATA_MASK;
> +
> +	/* Clear irq & power down adc */
> +	writel_relaxed(0, info->regs + SARADC_CTRL);
> +
> +	complete(&info->completion);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static const struct iio_info rockchip_saradc_iio_info =3D {
> +	.read_raw =3D rockchip_saradc_read_raw,
> +	.driver_module =3D THIS_MODULE,
> +};
> +
> +#define ADC_CHANNEL(_index, _id) {				\
> +	.type =3D IIO_VOLTAGE,					\
> +	.indexed =3D 1,						\
> +	.channel =3D _index,					\
> +	.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW),		\
> +	.info_mask_shared_by_type =3D BIT(IIO_CHAN_INFO_SCALE),	\
> +	.datasheet_name =3D _id,					\
> +}
> +
> +static const struct iio_chan_spec rockchip_saradc_iio_channels[] =3D=
 {
> +	ADC_CHANNEL(0, "adc0"),
> +	ADC_CHANNEL(1, "adc1"),
> +	ADC_CHANNEL(2, "adc2"),
> +};
> +
> +static int rockchip_saradc_probe(struct platform_device *pdev)
> +{
> +	struct rockchip_saradc *info =3D NULL;
> +	struct device_node *np =3D pdev->dev.of_node;
> +	struct iio_dev *indio_dev =3D NULL;
> +	struct resource	*mem;
> +	int ret =3D -ENODEV;
> +	int irq;
> +	u32 rate;
> +
> +	if (!np)
> +		return ret;
return -ENODEV is usually used, and a bit more obvious. That would also=
 make the initialization of ret obsolete.
> +
> +	indio_dev =3D devm_iio_device_alloc(&pdev->dev, sizeof(*info));
> +	if (!indio_dev) {
> +		dev_err(&pdev->dev, "failed allocating iio device\n");
> +		return -ENOMEM;
> +	}
> +	info =3D iio_priv(indio_dev);
> +
> +	mem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	info->regs =3D devm_request_and_ioremap(&pdev->dev, mem);
> +	if (!info->regs)
> +		return -ENOMEM;
> +
> +	irq =3D platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		dev_err(&pdev->dev, "no irq resource?\n");
> +		return irq;
> +	}
> +
> +	ret =3D devm_request_irq(&pdev->dev, irq, rockchip_saradc_isr,
> +			       0, dev_name(&pdev->dev), info);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "failed requesting irq %d\n", irq);
> +		return ret;
> +	}
> +
> +	init_completion(&info->completion);
> +
> +	info->pclk =3D devm_clk_get(&pdev->dev, "apb_pclk");
> +	if (IS_ERR(info->pclk)) {
> +		dev_err(&pdev->dev, "failed to get pclk\n");
> +		return PTR_ERR(info->pclk);
> +	}
> +
> +	info->clk =3D devm_clk_get(&pdev->dev, "saradc");
> +	if (IS_ERR(info->clk)) {
> +		dev_err(&pdev->dev, "failed to get adc clock\n");
> +		return PTR_ERR(info->clk);
> +	}
> +
> +	info->vref =3D devm_regulator_get(&pdev->dev, "vref");
> +	if (IS_ERR(info->vref)) {
> +		dev_err(&pdev->dev, "failed to get regulator, %ld\n",
> +			PTR_ERR(info->vref));
> +		return PTR_ERR(info->vref);
> +	}
> +
> +	/* use a default of 1MHz for the converter clock */
> +	if (of_property_read_u32(np, "clock-frequency", &rate))
> +		rate =3D 1000000;
> +
> +	ret =3D clk_set_rate(info->clk, rate);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to set adc clk rate, %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D regulator_enable(info->vref);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to enable vref regulator\n");
> +		return ret;
> +	}
> +
> +	ret =3D regulator_get_voltage(info->vref);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "failed to get regulator voltage\n");
> +		goto err_reg_voltage;
> +	}
> +	info->vref_mv =3D ret / 1000;
> +
> +	ret =3D clk_prepare_enable(info->pclk);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to enable pclk\n");
> +		goto err_reg_voltage;
> +	}
> +
> +	ret =3D clk_prepare_enable(info->clk);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to enable converter clock\n");
> +		goto err_pclk;
> +	}
> +
> +	platform_set_drvdata(pdev, indio_dev);
> +
> +	indio_dev->name =3D dev_name(&pdev->dev);
> +	indio_dev->dev.parent =3D &pdev->dev;
> +	indio_dev->dev.of_node =3D pdev->dev.of_node;
> +	indio_dev->info =3D &rockchip_saradc_iio_info;
> +	indio_dev->modes =3D INDIO_DIRECT_MODE;
> +
> +	indio_dev->channels =3D rockchip_saradc_iio_channels;
> +	indio_dev->num_channels =3D ARRAY_SIZE(rockchip_saradc_iio_channels=
);
> +
> +	ret =3D iio_device_register(indio_dev);
> +	if (ret)
> +		goto err_clk;
> +
> +	return 0;
> +
> +err_clk:
> +	clk_disable_unprepare(info->clk);
> +err_pclk:
> +	clk_disable_unprepare(info->pclk);
> +err_reg_voltage:
> +	regulator_disable(info->vref);
> +	return ret;
> +}
> +
> +static int rockchip_saradc_remove(struct platform_device *pdev)
> +{
> +	struct iio_dev *indio_dev =3D platform_get_drvdata(pdev);
> +	struct rockchip_saradc *info =3D iio_priv(indio_dev);
> +
> +	iio_device_unregister(indio_dev);
> +	clk_disable_unprepare(info->clk);
> +	clk_disable_unprepare(info->pclk);
> +	regulator_disable(info->vref);
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int rockchip_saradc_suspend(struct device *dev)
> +{
> +	struct iio_dev *indio_dev =3D dev_get_drvdata(dev);
> +	struct rockchip_saradc *info =3D iio_priv(indio_dev);
> +
> +	clk_disable_unprepare(info->clk);
> +	clk_disable_unprepare(info->pclk);
> +	regulator_disable(info->vref);
> +
> +	return 0;
> +}
> +
> +static int rockchip_saradc_resume(struct device *dev)
> +{
> +	struct iio_dev *indio_dev =3D dev_get_drvdata(dev);
> +	struct rockchip_saradc *info =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	ret =3D regulator_enable(info->vref);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D clk_prepare_enable(info->pclk);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D clk_prepare_enable(info->clk);
> +	if (ret)
> +		return ret;
> +
> +	return ret;
> +}
> +#endif
> +
> +static SIMPLE_DEV_PM_OPS(rockchip_saradc_pm_ops,
> +			 rockchip_saradc_suspend, rockchip_saradc_resume);
> +
> +static const struct of_device_id rockchip_saradc_match[] =3D {
> +	{ .compatible =3D "rockchip,saradc" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, rockchip_saradc_match);
> +
> +static struct platform_driver rockchip_saradc_driver =3D {
> +	.probe		=3D rockchip_saradc_probe,
> +	.remove		=3D rockchip_saradc_remove,
> +	.driver		=3D {
> +		.name	=3D "rockchip-saradc",
> +		.owner	=3D THIS_MODULE,
> +		.of_match_table =3D rockchip_saradc_match,
> +		.pm	=3D &rockchip_saradc_pm_ops,
> +	},
> +};
> +
> +module_platform_driver(rockchip_saradc_driver);
