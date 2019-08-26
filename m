From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/2] hwmon: Add Synaptics AS370 PVT sensor driver
Date: Mon, 26 Aug 2019 06:44:34 -0700
Message-ID: <35b05950-4a72-9e00-50ab-ecd0a7e759a4@roeck-us.net>
References: <20190826174942.2b28ff05@xhacker.debian>
 <20190826175029.433632f6@xhacker.debian>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190826175029.433632f6@xhacker.debian>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>, Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 8/26/19 3:01 AM, Jisheng Zhang wrote:
> Add a new driver for Synaptics AS370 PVT sensors. Currently, only
> temperature is supported.
> 
> Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
> ---
>   drivers/hwmon/Kconfig       |  10 +++
>   drivers/hwmon/Makefile      |   1 +
>   drivers/hwmon/as370-hwmon.c | 158 ++++++++++++++++++++++++++++++++++++
>   3 files changed, 169 insertions(+)
>   create mode 100644 drivers/hwmon/as370-hwmon.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 650dd71f9724..d31610933faa 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -246,6 +246,16 @@ config SENSORS_ADT7475
>   	  This driver can also be built as a module. If so, the module
>   	  will be called adt7475.
>   
> +config SENSORS_AS370
> +	tristate "Synaptics AS370 SoC hardware monitoring driver"

I think this needs "depends on HAS_IOMEM".

> +	help
> +	  If you say yes here you get support for the PVT sensors of
> +	  the Synaptics AS370 SoC
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called as370-hwmon.
> +
> +
>   config SENSORS_ASC7621
>   	tristate "Andigilog aSC7621"
>   	depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 8db472ea04f0..252e8a4c9781 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -48,6 +48,7 @@ obj-$(CONFIG_SENSORS_ADT7475)	+= adt7475.o
>   obj-$(CONFIG_SENSORS_APPLESMC)	+= applesmc.o
>   obj-$(CONFIG_SENSORS_ARM_SCMI)	+= scmi-hwmon.o
>   obj-$(CONFIG_SENSORS_ARM_SCPI)	+= scpi-hwmon.o
> +obj-$(CONFIG_SENSORS_AS370)	+= as370-hwmon.o
>   obj-$(CONFIG_SENSORS_ASC7621)	+= asc7621.o
>   obj-$(CONFIG_SENSORS_ASPEED)	+= aspeed-pwm-tacho.o
>   obj-$(CONFIG_SENSORS_ATXP1)	+= atxp1.o
> diff --git a/drivers/hwmon/as370-hwmon.c b/drivers/hwmon/as370-hwmon.c
> new file mode 100644
> index 000000000000..98dfba45e1b0
> --- /dev/null
> +++ b/drivers/hwmon/as370-hwmon.c
> @@ -0,0 +1,158 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Synaptics AS370 SoC Hardware Monitoring Driver
> + *
> + * Copyright (C) 2018 Synaptics Incorporated
> + * Author: Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/delay.h>

Unnecessary include file.

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
> +#define  BN_MASK	(0xfff << 0)

How about using GENMASK() ?

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
> +	val &= ~V_SEL;
> +	val &= ~NMOS_SEL;
> +	val &= ~PMOS_SEL;

What is the point of this ? We know that val == PD here.

> +	writel_relaxed(val, addr);
> +	val |= EN;
> +	writel_relaxed(val, addr);
> +	val &= ~PD;
> +	writel_relaxed(val, addr);
> +}
> +
> +static int read_pvt(struct as370_hwmon *hwmon)
> +{
> +	return readl_relaxed(hwmon->base + STS) & BN_MASK;
> +}

Please fold into the calling code.

> +
> +static int as370_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> +			    u32 attr, int channel, long *temp)
> +{
> +	int val;
> +	struct as370_hwmon *hwmon = dev_get_drvdata(dev);
> +
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		val = read_pvt(hwmon);
> +		if (val < 0)
> +			return val;

read_pvt() doesn't return a negative error code. This check is unnecessary.

> +		*temp = val * 251802 / 4096 - 85525;

This results in rounding down the reported temperature. It is ok if it is
what you want; otherwise, I would suggest to use DIV_ROUND_CLOSEST().

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
> +							 "as370_hwmon",

The "_hwmon" seems unnecessary. It will show up in "sensors" as part
of the sensor name. Is this really what you want ?

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
> 
