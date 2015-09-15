From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH V3 3/3] reset: hi6220: Reset driver for hisilicon hi6220
 SoC
Date: Tue, 15 Sep 2015 11:11:24 +0200
Message-ID: <1442308284.3979.33.camel@pengutronix.de>
References: <1442289504-183550-1-git-send-email-puck.chen@hisilicon.com>
	 <1442289504-183550-3-git-send-email-puck.chen@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442289504-183550-3-git-send-email-puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, zhangfei.gao-H32Fclmsjq1BDgjK7y7TUQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, suzhuangluan-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, w.f-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Am Dienstag, den 15.09.2015, 11:58 +0800 schrieb Chen Feng:
[...]
> diff --git a/drivers/reset/hisilicon/Kconfig b/drivers/reset/hisilicon/Kconfig
> new file mode 100644
> index 0000000..26bf95a
> --- /dev/null
> +++ b/drivers/reset/hisilicon/Kconfig
> @@ -0,0 +1,5 @@
> +config COMMON_RESET_HI6220
> +	tristate "Hi6220 Reset Driver"
> +	depends on (ARCH_HISI && RESET_CONTROLLER)
> +	help
> +	  Build the Hisilicon Hi6220 reset driver.
> diff --git a/drivers/reset/hisilicon/Makefile b/drivers/reset/hisilicon/Makefile
> new file mode 100644
> index 0000000..c932f86
> --- /dev/null
> +++ b/drivers/reset/hisilicon/Makefile
> @@ -0,0 +1 @@
> +obj-$(CONFIG_COMMON_RESET_HI6220) += hi6220_reset.o
> diff --git a/drivers/reset/hisilicon/hi6220_reset.c b/drivers/reset/hisilicon/hi6220_reset.c
> new file mode 100644
> index 0000000..3d3de94
> --- /dev/null
> +++ b/drivers/reset/hisilicon/hi6220_reset.c
> @@ -0,0 +1,121 @@
> +/*
> + * Hisilicon Hi6220 reset controller driver
> + *
> + * Copyright (c) 2015 Hisilicon Limited.
> + *
> + * Author: Feng Chen <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/init.h>
> +#include <linux/bitops.h>
> +#include <linux/of.h>
> +#include <linux/reset-controller.h>
> +#include <linux/reset.h>
> +#include <linux/sizes.h>
> +#include <linux/platform_device.h>
> +
> +#define ASSET_OFFSET            0x300

Typo, missing 'R':

+#define ASSERT_OFFSET            0x300

> +#define DEASSET_OFFSET          0x304

Same here:

+#define DEASSERT_OFFSET          0x304

> +#define to_reset_data(x) container_of(x, struct hi6220_reset_data, rc_dev)
> +
> +struct hi6220_reset_data {
> +	spinlock_t			reset_lock; /*device spin-lock*/
> +	void __iomem			*asset_base;
> +	void __iomem			*deasset_base;
> +	struct reset_controller_dev	rc_dev;
> +};
> +
> +static int hi6220_reset_assert(struct reset_controller_dev *rc_dev,
> +			       unsigned long idx)
> +{
> +	struct hi6220_reset_data *data = to_reset_data(rc_dev);
> +
> +	unsigned long flags;
> +	int bank = idx >> 8;
> +	int offset = idx & 0xff;
> +
> +	spin_lock_irqsave(&data->reset_lock, flags);

Not necessary, the spinlock can be removed.

> +	writel(BIT(offset), data->asset_base + (bank * 0x10));
> +
> +	spin_unlock_irqrestore(&data->reset_lock, flags);
> +	return 0;
> +}
> +
> +static int hi6220_reset_deassert(struct reset_controller_dev *rc_dev,
> +				 unsigned long idx)
> +{
> +	struct hi6220_reset_data *data = to_reset_data(rc_dev);
> +
> +	unsigned long flags;
> +	int bank = idx >> 8;
> +	int offset = idx & 0xff;
> +
> +	spin_lock_irqsave(&data->reset_lock, flags);
> +
> +	writel(BIT(offset), data->deasset_base + (bank * 0x10));
> +
> +	spin_unlock_irqrestore(&data->reset_lock, flags);
> +
> +	return 0;
> +}
> +
> +static struct reset_control_ops hi6220_reset_ops = {
> +	.assert = hi6220_reset_assert,
> +	.deassert = hi6220_reset_deassert,
> +};
> +
> +static int hi6220_reset_probe(struct platform_device *pdev)
> +{
> +	struct hi6220_reset_data *data;
> +	struct resource *res;
> +	void __iomem *src_base;
> +
> +	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	src_base = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(src_base))
> +		return PTR_ERR(src_base);
> +
> +	spin_lock_init(&data->reset_lock);
> +
> +	data->asset_base = src_base + ASSET_OFFSET;
> +	data->deasset_base = src_base + DEASSET_OFFSET;
> +	data->rc_dev.nr_resets = SZ_4K;

The default .of_xlate implementation checks if a given index value from
the device tree is smaller than this value. Just set this to the largest
valid reset index + 1, or implement .of_xlate to check that the index is
a valid bank/offset combination.

> +	data->rc_dev.ops = &hi6220_reset_ops;
> +	data->rc_dev.of_node = pdev->dev.of_node;
> +
> +	reset_controller_register(&data->rc_dev);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id hi6220_reset_match[] = {
> +	{ .compatible = "hisilicon,hi6220_reset_ctl" },

This should be:

+	{ .compatible = "hisilicon,hi6220-reset-ctl" },

> +	{ },
> +};
> +
> +static struct platform_driver hi6220_reset_driver = {
> +	.probe = hi6220_reset_probe,
> +	.driver = {
> +		.name = "reset-hi6220",
> +		.owner = THIS_MODULE,

Drop this line, .owner will be set by __platform_driver_register below.

> +		.of_match_table = hi6220_reset_match,
> +	},
> +};
> +
> +static int __init hi6220_reset_init(void)
> +{
> +	return platform_driver_register(&hi6220_reset_driver);

The platform_driver_register macro expands to
__platform_driver_register(&hi6220_reset_driver, THIS_MODULE);

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
