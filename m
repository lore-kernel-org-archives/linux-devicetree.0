From: xuyiping <xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: Re: [PATCH V3 3/3] reset: hi6220: Reset driver for hisilicon hi6220
 SoC
Date: Tue, 15 Sep 2015 15:10:51 +0800
Message-ID: <55F7C47B.3090305@hisilicon.com>
References: <1442289504-183550-1-git-send-email-puck.chen@hisilicon.com>
 <1442289504-183550-3-git-send-email-puck.chen@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442289504-183550-3-git-send-email-puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, zhangfei.gao-H32Fclmsjq1BDgjK7y7TUQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, suzhuangluan-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, w.f-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 2015/9/15 11:58, Chen Feng wrote:
> Add reset driver for hi6220-hikey board,this driver supply deassert
> of IP. on hi6220 SoC.
>
> Signed-off-by: Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
> ---
>   drivers/reset/Kconfig                  |   1 +
>   drivers/reset/Makefile                 |   1 +
>   drivers/reset/hisilicon/Kconfig        |   5 ++
>   drivers/reset/hisilicon/Makefile       |   1 +
>   drivers/reset/hisilicon/hi6220_reset.c | 121 +++++++++++++++++++++++++++++++++
>   5 files changed, 129 insertions(+)
>   create mode 100644 drivers/reset/hisilicon/Kconfig
>   create mode 100644 drivers/reset/hisilicon/Makefile
>   create mode 100644 drivers/reset/hisilicon/hi6220_reset.c
>
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 0615f50..df37212 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -13,3 +13,4 @@ menuconfig RESET_CONTROLLER
>   	  If unsure, say no.
>
>   source "drivers/reset/sti/Kconfig"
> +source "drivers/reset/hisilicon/Kconfig"
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 157d421..331d7b2 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -3,3 +3,4 @@ obj-$(CONFIG_ARCH_SOCFPGA) += reset-socfpga.o
>   obj-$(CONFIG_ARCH_BERLIN) += reset-berlin.o
>   obj-$(CONFIG_ARCH_SUNXI) += reset-sunxi.o
>   obj-$(CONFIG_ARCH_STI) += sti/
> +obj-$(CONFIG_ARCH_HISI) += hisilicon/
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
> +#define DEASSET_OFFSET          0x304
> +
> +#define to_reset_data(x) container_of(x, struct hi6220_reset_data, rc_dev)
> +
> +struct hi6220_reset_data {
> +	spinlock_t			reset_lock; /*device spin-lock*/

	it looks useless

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
> +
> +	writel(BIT(offset), data->asset_base + (bank * 0x10));
> +
> +	spin_unlock_irqrestore(&data->reset_lock, flags);
> +
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
	
	use the max index of the reset bit

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
> +	{ },
> +};
> +
> +static struct platform_driver hi6220_reset_driver = {
> +	.probe = hi6220_reset_probe,
> +	.driver = {
> +		.name = "reset-hi6220",
> +		.owner = THIS_MODULE,
> +		.of_match_table = hi6220_reset_match,
> +	},
> +};
> +
> +static int __init hi6220_reset_init(void)
> +{
> +	return platform_driver_register(&hi6220_reset_driver);
> +}
> +
> +postcore_initcall(hi6220_reset_init);
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
