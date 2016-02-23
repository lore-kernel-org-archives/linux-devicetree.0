From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v9 2/6] clk: hisilicon: add CRG driver for hi3519 soc
Date: Tue, 23 Feb 2016 10:14:38 +0100
Message-ID: <1456218878.3387.9.camel@pengutronix.de>
References: <1456127280-23275-1-git-send-email-xuejiancheng@huawei.com>
	 <1456127280-23275-3-git-send-email-xuejiancheng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456127280-23275-3-git-send-email-xuejiancheng@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiancheng Xue <xuejiancheng@huawei.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, khilman@linaro.org, arnd@arndb.de, olof@lixom.net, xuwei5@hisilicon.com, haojian.zhuang@linaro.org, zhangfei.gao@linaro.org, bintian.wang@huawei.com, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, yanhaifeng@hisilicon.com, yanghongwei@hisilicon.com, suwenping@hisilicon.com, raojun@hisilicon.com, ml.yang@hisilicon.com, gaofei@hisilicon.com, zhangzhenxing@hisilicon.com, xuejiancheng@hisilicon.com, lidongpo@hisilicon.com
List-Id: devicetree@vger.kernel.org

Hi,

Am Montag, den 22.02.2016, 15:47 +0800 schrieb Jiancheng Xue:
> The CRG(Clock and Reset Generator) block provides clock
> and reset signals for other modules in hi3519 soc.
> 
> Signed-off-by: Jiancheng Xue <xuejiancheng@huawei.com>
> Acked-by: Rob Herring <robh@kernel.org>
[...]
> diff --git a/drivers/clk/hisilicon/reset.c b/drivers/clk/hisilicon/reset.c
> new file mode 100644
> index 0000000..50e00e7
> --- /dev/null
> +++ b/drivers/clk/hisilicon/reset.c
> @@ -0,0 +1,124 @@
> +/*
> + * Hisilicon Reset Controller Driver
> + *
> + * Copyright (c) 2015-2016 HiSilicon Technologies Co., Ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program. If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <linux/io.h>
> +#include <linux/of_address.h>
> +#include <linux/reset-controller.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +
> +#define	HISI_RESET_BIT_MASK	0x1f
> +#define	HISI_RESET_OFFSET_SHIFT	8
> +#define	HISI_RESET_OFFSET_MASK	0xffff00
> +
> +struct hisi_reset_controller {
> +	spinlock_t	lock;
> +	void __iomem	*membase;
> +	struct reset_controller_dev	rcdev;
> +};
> +
> +
> +#define to_hisi_reset_controller(rcdev)  \
> +	container_of(rcdev, struct hisi_reset_controller, rcdev)
> +
> +static int hisi_reset_of_xlate(struct reset_controller_dev *rcdev,
> +			const struct of_phandle_args *reset_spec)
> +{
> +	u32 offset;
> +	u8 bit;
> +
> +	if (WARN_ON(reset_spec->args_count != rcdev->of_reset_n_cells))
> +		return -EINVAL;

This check now has been moved to the core in e677774f5026 ("reset: Move
DT cell size check to the core"). It is not necessary anymore to check
this in the .of_xlate callback.

> +	offset = (reset_spec->args[0] << HISI_RESET_OFFSET_SHIFT)
> +		& HISI_RESET_OFFSET_MASK;
> +	bit = reset_spec->args[1] & HISI_RESET_BIT_MASK;
> +	return (offset | bit);
> +}
> +
> +static int hisi_reset_assert(struct reset_controller_dev *rcdev,
> +			      unsigned long id)
> +{
> +	struct hisi_reset_controller *rstc = to_hisi_reset_controller(rcdev);
> +	unsigned long flags;
> +	u32 offset, reg;
> +	u8 bit;
> +
> +	offset = (id & HISI_RESET_OFFSET_MASK) >> HISI_RESET_OFFSET_SHIFT;
> +	bit = id & HISI_RESET_BIT_MASK;
> +
> +	spin_lock_irqsave(&rstc->lock, flags);
> +
> +	reg = readl(rstc->membase + offset);
> +	writel(reg | BIT(bit), rstc->membase + offset);
> +
> +	spin_unlock_irqrestore(&rstc->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int hisi_reset_deassert(struct reset_controller_dev *rcdev,
> +				unsigned long id)
> +{
> +	struct hisi_reset_controller *rstc = to_hisi_reset_controller(rcdev);
> +	unsigned long flags;
> +	u32 offset, reg;
> +	u8 bit;
> +
> +	offset = (id & HISI_RESET_OFFSET_MASK) >> HISI_RESET_OFFSET_SHIFT;
> +	bit = id & HISI_RESET_BIT_MASK;
> +
> +	spin_lock_irqsave(&rstc->lock, flags);
> +
> +	reg = readl(rstc->membase + offset);
> +	writel(reg & ~BIT(bit), rstc->membase + offset);
> +
> +	spin_unlock_irqrestore(&rstc->lock, flags);
> +
> +	return 0;
> +}
> +
> +static struct reset_control_ops hisi_reset_ops = {
> +	.assert		= hisi_reset_assert,
> +	.deassert	= hisi_reset_deassert,
> +};

These can be made const after commit 203d4f347d86 ("reset: Make
reset_control_ops const") is merged. Since this is to be merged through
the clock tree, both change could be made later.

For the reset driver part,
Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
