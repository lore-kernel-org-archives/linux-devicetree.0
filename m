From: xuyiping <xuyiping@hisilicon.com>
Subject: Re: [PATCH V2 3/3] reset: hi6220: Reset driver for hisilicon hi6220
 SoC
Date: Sat, 12 Sep 2015 14:06:19 +0800
Message-ID: <55F3C0DB.5070800@hisilicon.com>
References: <1441959518-178696-1-git-send-email-puck.chen@hisilicon.com>
 <1441959518-178696-3-git-send-email-puck.chen@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1441959518-178696-3-git-send-email-puck.chen@hisilicon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen Feng <puck.chen@hisilicon.com>, p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, xuwei5@hisilicon.com, haojian.zhuang@linaro.org, zhangfei.gao@foxmail.com
Cc: bintian.wang@huawei.com, devicetree@vger.kernel.org, dan.zhao@hisilicon.com, suzhuangluan@hisilicon.com, w.f@huawei.com
List-Id: devicetree@vger.kernel.org



On 2015/9/11 16:18, Chen Feng wrote:
> Add reset driver for hi6220-hikey board,this driver supply deassert
> of IP. on hi6220 SoC.
>
> Signed-off-by: Chen Feng <puck.chen@hisilicon.com>
> ---
>   drivers/reset/Kconfig                  |   1 +
>   drivers/reset/Makefile                 |   1 +
>   drivers/reset/hisilicon/Kconfig        |   5 ++
>   drivers/reset/hisilicon/Makefile       |   1 +
>   drivers/reset/hisilicon/hi6220_reset.c | 118 +++++++++++++++++++++++++++++++++
>   5 files changed, 126 insertions(+)
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
> index 0000000..097133d
> --- /dev/null
> +++ b/drivers/reset/hisilicon/hi6220_reset.c
> @@ -0,0 +1,118 @@
> +/*
> + * Hisilicon Hi6220 reset controller driver
> + *
> + * Copyright (c) 2015 Hisilicon Limited.
> + *
> + * Author: Feng Chen <puck.chen@hisilicon.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/init.h>
> +#include <linux/bitops.h>
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/reset-controller.h>
> +#include <linux/reset.h>
> +#include <linux/sizes.h>
> +#include <linux/slab.h>
> +
> +#define ASSET_OFFSET            0x300
> +#define DEASSET_OFFSET          0x304
> +
> +struct hi6220_reset_data {
> +	spinlock_t			reset_lock; /*device spin-lock*/
> +	void __iomem			*src_base;
> +	void __iomem			*asset_base;
> +	void __iomem			*deasset_base;
> +	struct reset_controller_dev	rc_dev;
> +};
> +
> +static int hi6220_reset_assert(struct reset_controller_dev *rc_dev,
> +			       unsigned long idx)
> +{
> +	struct hi6220_reset_data *data = container_of(rc_dev,
> +			struct hi6220_reset_data,
> +			rc_dev);
> +
> +	unsigned long flags;
> +	int bank = idx >> 8;
> +	int offset = idx & 0xff;
> +
> +	spin_lock_irqsave(&data->reset_lock, flags);

	the spin_lock looks useless.

	it is not a "read and write" register.

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
> +	struct hi6220_reset_data *data = container_of(rc_dev,
> +			struct hi6220_reset_data,
> +			rc_dev);
> +
> +	unsigned long flags;
> +	int bank = idx >> 8;
> +	int offset = idx & 0xff;
	
	no need to check the idx scope ?
	
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
> +static int __init hi6220_reset_init(void)
> +{
> +	int ret;
> +	struct device_node *np;
> +	struct hi6220_reset_data *data;
> +
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	np = of_find_compatible_node(NULL, NULL, "hisilicon,hi6220_reset_ctl");
> +	if (!np) {
> +		ret = -ENXIO;
> +		goto err_alloc;
> +	}
> +	spin_lock_init(&data->reset_lock);
> +	data->src_base = of_iomap(np, 0);
> +	if (!data->src_base) {
> +		ret = -ENOMEM;
> +		goto err_alloc;
> +	}
> +
> +	data->asset_base = data->src_base + ASSET_OFFSET;
> +	data->deasset_base = data->src_base + DEASSET_OFFSET;
> +	data->rc_dev.owner = THIS_MODULE;
> +	data->rc_dev.nr_resets = SZ_4K;
> +	data->rc_dev.ops = &hi6220_reset_ops;
> +	data->rc_dev.of_node = np;
> +
> +	if (IS_ENABLED(CONFIG_RESET_CONTROLLER))
> +		reset_controller_register(&data->rc_dev);
> +
> +	return 0;
> +
> +err_alloc:
	
	

> +	kfree(data);
> +	return ret;
> +}
> +
> +postcore_initcall(hi6220_reset_init);
>
