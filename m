From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 1/2] hwmon: Add Synaptics AS370 PVT sensor driver
Date: Sat, 31 Aug 2019 08:10:04 -0700
Message-ID: <20190831151004.GA8682@roeck-us.net>
References: <20190827113214.13773d45@xhacker.debian>
 <20190827113259.4fb64a17@xhacker.debian>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190827113259.4fb64a17@xhacker.debian>
Sender: linux-kernel-owner@vger.kernel.org
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 27, 2019 at 03:44:15AM +0000, Jisheng Zhang wrote:
> Add a new driver for Synaptics AS370 PVT sensors. Currently, only
> temperature is supported.
> 
> Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

(pending dt maintainer dreview for the bindings)

> ---
>  drivers/hwmon/Kconfig       |  10 +++
>  drivers/hwmon/Makefile      |   1 +
>  drivers/hwmon/as370-hwmon.c | 147 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 158 insertions(+)
>  create mode 100644 drivers/hwmon/as370-hwmon.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 650dd71f9724..d31610933faa 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -246,6 +246,16 @@ config SENSORS_ADT7475
>  	  This driver can also be built as a module. If so, the module
>  	  will be called adt7475.
>  
> +config SENSORS_AS370
> +	tristate "Synaptics AS370 SoC hardware monitoring driver"
> +	help
> +	  If you say yes here you get support for the PVT sensors of
> +	  the Synaptics AS370 SoC
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called as370-hwmon.
> +
> +
>  config SENSORS_ASC7621
>  	tristate "Andigilog aSC7621"
>  	depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 8db472ea04f0..252e8a4c9781 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -48,6 +48,7 @@ obj-$(CONFIG_SENSORS_ADT7475)	+= adt7475.o
>  obj-$(CONFIG_SENSORS_APPLESMC)	+= applesmc.o
>  obj-$(CONFIG_SENSORS_ARM_SCMI)	+= scmi-hwmon.o
>  obj-$(CONFIG_SENSORS_ARM_SCPI)	+= scpi-hwmon.o
> +obj-$(CONFIG_SENSORS_AS370)	+= as370-hwmon.o
>  obj-$(CONFIG_SENSORS_ASC7621)	+= asc7621.o
>  obj-$(CONFIG_SENSORS_ASPEED)	+= aspeed-pwm-tacho.o
>  obj-$(CONFIG_SENSORS_ATXP1)	+= atxp1.o
> diff --git a/drivers/hwmon/as370-hwmon.c b/drivers/hwmon/as370-hwmon.c
> new file mode 100644
> index 000000000000..554f03b91bfe
> --- /dev/null
> +++ b/drivers/hwmon/as370-hwmon.c
> @@ -0,0 +1,147 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Synaptics AS370 SoC Hardware Monitoring Driver
> + *
> + * Copyright (C) 2018 Synaptics Incorporated
> + * Author: Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/hwmon.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +
> +#define CTRL		0x0
> +#define  PD		BIT(0)
> +#define  EN		BIT(1)
> +#define  T_SEL		BIT(2)
> +#define  V_SEL		BIT(3)
> +#define  NMOS_SEL	BIT(8)
> +#define  PMOS_SEL	BIT(9)
> +#define STS		0x4
> +#define  BN_MASK	GENMASK(11, 0)
> +#define  EOC		BIT(12)
> +
> +struct as370_hwmon {
> +	void __iomem *base;
> +};
> +
> +static void init_pvt(struct as370_hwmon *hwmon)
> +{
> +	u32 val;
> +	void __iomem *addr = hwmon->base + CTRL;
> +
> +	val = PD;
> +	writel_relaxed(val, addr);
> +	val |= T_SEL;
> +	writel_relaxed(val, addr);
> +	val |= EN;
> +	writel_relaxed(val, addr);
> +	val &= ~PD;
> +	writel_relaxed(val, addr);
> +}
> +
> +static int as370_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> +			    u32 attr, int channel, long *temp)
> +{
> +	int val;
> +	struct as370_hwmon *hwmon = dev_get_drvdata(dev);
> +
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		val = readl_relaxed(hwmon->base + STS) & BN_MASK;
> +		*temp = DIV_ROUND_CLOSEST(val * 251802, 4096) - 85525;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static umode_t
> +as370_hwmon_is_visible(const void *data, enum hwmon_sensor_types type,
> +		       u32 attr, int channel)
> +{
> +	if (type != hwmon_temp)
> +		return 0;
> +
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		return 0444;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static const u32 as370_hwmon_temp_config[] = {
> +	HWMON_T_INPUT,
> +	0
> +};
> +
> +static const struct hwmon_channel_info as370_hwmon_temp = {
> +	.type = hwmon_temp,
> +	.config = as370_hwmon_temp_config,
> +};
> +
> +static const struct hwmon_channel_info *as370_hwmon_info[] = {
> +	&as370_hwmon_temp,
> +	NULL
> +};
> +
> +static const struct hwmon_ops as370_hwmon_ops = {
> +	.is_visible = as370_hwmon_is_visible,
> +	.read = as370_hwmon_read,
> +};
> +
> +static const struct hwmon_chip_info as370_chip_info = {
> +	.ops = &as370_hwmon_ops,
> +	.info = as370_hwmon_info,
> +};
> +
> +static int as370_hwmon_probe(struct platform_device *pdev)
> +{
> +	struct resource *res;
> +	struct device *hwmon_dev;
> +	struct as370_hwmon *hwmon;
> +	struct device *dev = &pdev->dev;
> +
> +	hwmon = devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
> +	if (!hwmon)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	hwmon->base = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(hwmon->base))
> +		return PTR_ERR(hwmon->base);
> +
> +	init_pvt(hwmon);
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev,
> +							 "as370",
> +							 hwmon,
> +							 &as370_chip_info,
> +							 NULL);
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static const struct of_device_id as370_hwmon_match[] = {
> +	{ .compatible = "syna,as370-hwmon" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, as370_hwmon_match);
> +
> +static struct platform_driver as370_hwmon_driver = {
> +	.probe = as370_hwmon_probe,
> +	.driver = {
> +		.name = "as370-hwmon",
> +		.of_match_table = as370_hwmon_match,
> +	},
> +};
> +module_platform_driver(as370_hwmon_driver);
> +
> +MODULE_AUTHOR("Jisheng Zhang<jszhang@kernel.org>");
> +MODULE_DESCRIPTION("Synaptics AS370 SoC hardware monitor");
> +MODULE_LICENSE("GPL v2");
