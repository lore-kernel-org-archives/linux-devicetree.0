From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH V6 02/12] clk: sprd: Add common infrastructure
Date: Wed, 6 Dec 2017 22:50:12 -0800
Message-ID: <20171207065012.GW4283@codeaurora.org>
References: <20171127100115.20655-1-chunyan.zhang@spreadtrum.com>
 <20171127100115.20655-3-chunyan.zhang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171127100115.20655-3-chunyan.zhang@spreadtrum.com>
Sender: linux-clk-owner@vger.kernel.org
To: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Xiaolong Zhang <xiaolong.zhang@spreadtrum.com>, Ben Li <ben.li@spreadtrum.com>, Orson Zhai <orson.zhai@spreadtrum.com>, Chunyan Zhang <zhang.lyra@gmail.com>
List-Id: devicetree@vger.kernel.org

On 11/27, Chunyan Zhang wrote:
> +
> +	sprd_clk_set_regmap(desc, regmap);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(sprd_clk_regmap_init);
> +
> +int sprd_clk_probe(struct device *dev, struct clk_hw_onecell_data *clkhw)
> +{
> +	int i, ret = 0;

ret shouldn't need to be initialized here.

> +	struct clk_hw *hw;
> +
> +	for (i = 0; i < clkhw->num; i++) {
> +
> +		hw = clkhw->hws[i];
> +
> +		if (!hw)
> +			continue;
> +
> +		ret = devm_clk_hw_register(dev, hw);
> +		if (ret) {
> +			dev_err(dev, "Couldn't register clock %d - %s\n",
> +				i, hw->init->name);
> +			return ret;
> +		}
> +	}
> +
> +	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
> +				     clkhw);

You can use devm_ now for this.

> +	if (ret)
> +		dev_err(dev, "Failed to add clock provider.\n");

Please remove the full stop on error messages.

> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(sprd_clk_probe);
> +
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/clk/sprd/common.h b/drivers/clk/sprd/common.h
> new file mode 100644
> index 0000000..8cd774e
> --- /dev/null
> +++ b/drivers/clk/sprd/common.h
> @@ -0,0 +1,52 @@
> +/*
> + * Spreadtrum clock infrastructure
> + *
> + * Copyright (C) 2017 Spreadtrum, Inc.
> + * Author: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0
> + */
> +
> +#ifndef _SPRD_CLK_COMMON_H_
> +#define _SPRD_CLK_COMMON_H_
> +
> +#include <linux/clk-provider.h>
> +#include <linux/of_platform.h>
> +#include <linux/regmap.h>
> +
> +#include "../clk_common.h"
> +
> +struct device_node;
> +
> +struct sprd_clk_common {
> +	struct regmap	*regmap;
> +	u32		reg;
> +	struct clk_hw	hw;
> +};
> +
> +struct sprd_clk_desc {
> +	struct sprd_clk_common		**clk_clks;
> +	unsigned long			num_clk_clks;
> +	struct clk_hw_onecell_data      *hw_clks;
> +};
> +
> +#define sprd_regmap_read(map, reg, val)				\
> +({								\
> +	(map) ? regmap_read((map), (reg), (val)) : (-EINVAL);	\

Do we sometimes not have a map? This seems overly cautious.

> +})
> +
> +#define sprd_regmap_write(map, reg, val)			\
> +({								\

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
