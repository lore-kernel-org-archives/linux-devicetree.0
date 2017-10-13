From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/2] mfd: Add Spreadtrum SC27xx series PMICs driver
Date: Fri, 13 Oct 2017 10:26:57 +0100
Message-ID: <20171013092657.7zeddqbkpoh73ou4@dell>
References: <73965e7fb34d6a96529589cdf48e54e95ed666b8.1507723345.git.baolin.wang@spreadtrum.com>
 <9c80fb5606b7d9dbaf4873aed8a72c6bea0b9910.1507723345.git.baolin.wang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9c80fb5606b7d9dbaf4873aed8a72c6bea0b9910.1507723345.git.baolin.wang@spreadtrum.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@spreadtrum.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org, baolin.wang@linaro.org
List-Id: devicetree@vger.kernel.org

On Wed, 11 Oct 2017, Baolin Wang wrote:

> This patch adds support for Spreadtrum SC27xx series PMIC MFD core, and It
> provides communication through the SPI interfaces. The SC27xx series PMICs
> contains the following 6 major components:
> - DCDCs
> - LDOs
> - Battery management system
> - Audio codec
> - User interface function, such as indicator, flash LED
> - IC level function, such as power on/off, type-c
> 
> Signed-off-by: Baolin Wang <baolin.wang@spreadtrum.com>
> ---
>  drivers/mfd/Kconfig           |   10 ++
>  drivers/mfd/Makefile          |    1 +
>  drivers/mfd/sprd-sc27xx-spi.c |  273 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 284 insertions(+)
>  create mode 100644 drivers/mfd/sprd-sc27xx-spi.c
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index fc5e4fe..4753cd5 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1057,6 +1057,16 @@ config MFD_SMSC
>          To compile this driver as a module, choose M here: the
>          module will be called smsc.
>  
> +config MFD_SC27XX_PMIC
> +	tristate "Spreadtrum SC27xx PMICs"
> +	depends on ARCH_SPRD || COMPILE_TEST
> +	depends on SPI_MASTER
> +	select MFD_CORE
> +	select REGMAP_SPI
> +	select REGMAP_IRQ
> +	help
> +	  This enables support for the Spreadtrum SC27xx PMICs.
> +
>  config ABX500_CORE
>  	bool "ST-Ericsson ABX500 Mixed Signal Circuit register functions"
>  	default y if ARCH_U300 || ARCH_U8500 || COMPILE_TEST
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index c3d0a1b..a377e0f 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -226,3 +226,4 @@ obj-$(CONFIG_MFD_SUN4I_GPADC)	+= sun4i-gpadc.o
>  obj-$(CONFIG_MFD_STM32_LPTIMER)	+= stm32-lptimer.o
>  obj-$(CONFIG_MFD_STM32_TIMERS) 	+= stm32-timers.o
>  obj-$(CONFIG_MFD_MXS_LRADC)     += mxs-lradc.o
> +obj-$(CONFIG_MFD_SC27XX_PMIC)	+= sprd-sc27xx-spi.o
> diff --git a/drivers/mfd/sprd-sc27xx-spi.c b/drivers/mfd/sprd-sc27xx-spi.c
> new file mode 100644
> index 0000000..2b3f2bc
> --- /dev/null
> +++ b/drivers/mfd/sprd-sc27xx-spi.c
> @@ -0,0 +1,273 @@
> +/*
> + * Copyright (C) 2017 Spreadtrum Communications Inc.
> + *
> + * This software is licensed under the terms of the GNU General Public
> + * License version 2, as published by the Free Software Foundation, and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mfd/core.h>
> +#include <linux/of_device.h>
> +#include <linux/spi/spi.h>
> +#include <linux/regmap.h>

Alphabetical.

> +#define SPRD_PMIC_INT_MASK_STATUS	0x0
> +#define SPRD_PMIC_INT_RAW_STATU		0x4
> +#define SPRD_PMIC_INT_EN		0x8
> +
> +struct sprd_pmic {
> +	struct regmap *regmap;
> +	struct device *dev;
> +	struct regmap_irq *irqs;
> +	struct regmap_irq_chip irq_chip;
> +	struct regmap_irq_chip_data *irq_data;
> +	int irq;
> +};
> +
> +struct sprd_pmic_data {
> +	u32 irq_base;
> +	u32 num_irqs;
> +};
> +
> +static const struct sprd_pmic_data sc2731_data = {
> +	.irq_base = 0x140,
> +	.num_irqs = 16,
> +};
> +
> +static const struct mfd_cell sprd_pmic_devs[] = {
> +	{
> +		.name = "sc27xx-wdt",
> +		.of_compatible = "sprd,sc27xx-wdt",
> +	},
> +	{

Nit: You can save a few lines here by using the format:

> +	}, {

> +		.name = "sc27xx-rtc",
> +		.of_compatible = "sprd,sc27xx-rtc",
> +	},
> +	{
> +		.name = "sc27xx-charger",
> +		.of_compatible = "sprd,sc27xx-charger",
> +	},
> +	{
> +		.name = "sc27xx-chg-timer",
> +		.of_compatible = "sprd,sc27xx-chg-timer",
> +	},
> +	{
> +		.name = "sc27xx-fast-chg",
> +		.of_compatible = "sprd,sc27xx-fast-chg",
> +	},
> +	{
> +		.name = "sc27xx-chg-wdt",
> +		.of_compatible = "sprd,sc27xx-chg-wdt",
> +	},
> +	{
> +		.name = "sc27xx-typec",
> +		.of_compatible = "sprd,sc27xx-typec",
> +	},
> +	{
> +		.name = "sc27xx-flash",
> +		.of_compatible = "sprd,sc27xx-flash",
> +	},
> +	{
> +		.name = "sc27xx-eic",
> +		.of_compatible = "sprd,sc27xx-eic",
> +	},
> +	{
> +		.name = "sc27xx-efuse",
> +		.of_compatible = "sprd,sc27xx-efuse",
> +	},
> +	{
> +		.name = "sc27xx-thermal",
> +		.of_compatible = "sprd,sc27xx-thermal",
> +	},
> +	{
> +		.name = "sc27xx-adc",
> +		.of_compatible = "sprd,sc27xx-adc",
> +	},
> +	{
> +		.name = "sc27xx-audio-codec",
> +		.of_compatible = "sprd,sc27xx-audio-codec",
> +	},
> +	{
> +		.name = "sc27xx-regulator",
> +		.of_compatible = "sprd,sc27xx-regulator",
> +	},
> +	{
> +		.name = "sc27xx-vibrator",
> +		.of_compatible = "sprd,sc27xx-vibrator",
> +	},
> +	{
> +		.name = "sc27xx-keypad-led",
> +		.of_compatible = "sprd,sc27xx-keypad-led",
> +	},
> +	{
> +		.name = "sc27xx-bltc",
> +		.of_compatible = "sprd,sc27xx-bltc",
> +	},
> +	{
> +		.name = "sc27xx-fgu",
> +		.of_compatible = "sprd,sc27xx-fgu",
> +	},
> +	{
> +		.name = "sc27xx-7sreset",
> +		.of_compatible = "sprd,sc27xx-7sreset",
> +	},
> +	{
> +		.name = "sc27xx-poweroff",
> +		.of_compatible = "sprd,sc27xx-poweroff",
> +	},
> +};
> +
> +static int sprd_pmic_spi_write(void *context, const void *data, size_t count)
> +{
> +	struct device *dev = context;
> +	struct spi_device *spi = to_spi_device(dev);
> +
> +	return spi_write(spi, data, count);
> +}
> +
> +static int sprd_pmic_spi_read(void *context,
> +			      const void *reg, size_t reg_size,
> +			      void *val, size_t val_size)
> +{
> +	struct device *dev = context;
> +	struct spi_device *spi = to_spi_device(dev);
> +	u32 rx_buf[2] = { 0 };
> +	int ret;
> +
> +	rx_buf[0] = *(u32 *)reg;
> +	ret = spi_read(spi, rx_buf, 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	memcpy(val, rx_buf, val_size);

This looks like you're asking for trouble.

What if val_size > sizeof(rx_buf)?

You should probably check for that.

> +	return 0;
> +}
> +
> +static struct regmap_bus sprd_pmic_regmap = {
> +	.write = sprd_pmic_spi_write,
> +	.read = sprd_pmic_spi_read,
> +	.reg_format_endian_default = REGMAP_ENDIAN_NATIVE,
> +	.val_format_endian_default = REGMAP_ENDIAN_NATIVE,
> +};
> +
> +static const struct regmap_config sprd_pmic_config = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.max_register = 0xffff,
> +};
> +
> +static int sprd_pmic_probe(struct spi_device *spi)
> +{
> +	struct sprd_pmic *sprd_pmic;
> +	const struct sprd_pmic_data *data;
> +	int ret, i;
> +
> +	data = of_device_get_match_data(&spi->dev);
> +	if (!data) {
> +		dev_err(&spi->dev, "No matching driver data found\n");
> +		return -EINVAL;
> +	}
> +
> +	sprd_pmic = devm_kzalloc(&spi->dev, sizeof(*sprd_pmic), GFP_KERNEL);
> +	if (!sprd_pmic)
> +		return -ENOMEM;
> +
> +	sprd_pmic->regmap = devm_regmap_init(&spi->dev, &sprd_pmic_regmap,
> +					     &spi->dev, &sprd_pmic_config);
> +	if (IS_ERR(sprd_pmic->regmap)) {
> +		ret = PTR_ERR(sprd_pmic->regmap);
> +		dev_err(&spi->dev, "Failed to allocate register map %d\n", ret);
> +		return ret;
> +	}
> +
> +	spi_set_drvdata(spi, sprd_pmic);
> +	sprd_pmic->dev = &spi->dev;
> +	sprd_pmic->irq = spi->irq;
> +
> +	sprd_pmic->irq_chip.name = dev_name(&spi->dev);
> +	sprd_pmic->irq_chip.status_base =
> +		data->irq_base + SPRD_PMIC_INT_MASK_STATUS;
> +	sprd_pmic->irq_chip.mask_base = data->irq_base + SPRD_PMIC_INT_EN;
> +	sprd_pmic->irq_chip.ack_base = 0;
> +	sprd_pmic->irq_chip.num_regs = 1;
> +	sprd_pmic->irq_chip.num_irqs = data->num_irqs;
> +	sprd_pmic->irq_chip.mask_invert = true;
> +
> +	sprd_pmic->irqs = devm_kzalloc(&spi->dev, sizeof(struct regmap_irq) *
> +				       data->num_irqs, GFP_KERNEL);
> +	if (!sprd_pmic->irqs)
> +		return -ENOMEM;
> +
> +	sprd_pmic->irq_chip.irqs = sprd_pmic->irqs;
> +	for (i = 0; i < data->num_irqs; i++) {
> +		sprd_pmic->irqs[i].reg_offset = i / data->num_irqs;
> +		sprd_pmic->irqs[i].mask = BIT(i % data->num_irqs);
> +	}

Why don't you do this live, instead of pre-calculating?

> +	ret = devm_regmap_add_irq_chip(&spi->dev, sprd_pmic->regmap,
> +				       sprd_pmic->irq,
> +				       IRQF_ONESHOT | IRQF_NO_SUSPEND, 0,
> +				       &sprd_pmic->irq_chip,
> +				       &sprd_pmic->irq_data);
> +	if (ret) {
> +		dev_err(&spi->dev, "Failed to add PMIC irq chip %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mfd_add_devices(&spi->dev, PLATFORM_DEVID_AUTO, sprd_pmic_devs,
> +			      ARRAY_SIZE(sprd_pmic_devs), NULL, 0,
> +			      regmap_irq_get_domain(sprd_pmic->irq_data));
> +	if (ret) {
> +		dev_err(&spi->dev, "Failed to register device %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int sprd_pmic_remove(struct spi_device *spi)
> +{
> +	mfd_remove_devices(&spi->dev);

'\n' here please.

> +	return 0;
> +}
> +
> +static const struct of_device_id sprd_pmic_match[] = {
> +	{ .compatible = "sprd,sc2731", .data = &sc2731_data },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, sprd_pmic_match);
> +
> +static struct spi_driver sprd_pmic_driver = {
> +	.driver = {
> +		   .name = "sc27xx-pmic",
> +		   .bus = &spi_bus_type,
> +		   .of_match_table = sprd_pmic_match,

Odd tabbing here.  Should be 8 chars.

> +	},
> +	.probe = sprd_pmic_probe,
> +	.remove = sprd_pmic_remove,
> +};
> +
> +static int __init sprd_pmic_init(void)
> +{
> +	return spi_register_driver(&sprd_pmic_driver);
> +}
> +subsys_initcall(sprd_pmic_init);
> +
> +static void __exit sprd_pmic_exit(void)
> +{
> +	spi_unregister_driver(&sprd_pmic_driver);
> +}
> +module_exit(sprd_pmic_exit);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("SPI support for SC27xx PMICs");
> +MODULE_AUTHOR("Baolin Wang <baolin.wang@spreadtrum.com>");

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
