From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v9 06/10] clk: mediatek: Add MT2701 clock support
Date: Fri, 12 Aug 2016 17:44:38 -0700
Message-ID: <20160813004438.GC361@codeaurora.org>
References: <1466581229-2342-1-git-send-email-erin.lo@mediatek.com>
 <1466581229-2342-7-git-send-email-erin.lo@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1466581229-2342-7-git-send-email-erin.lo@mediatek.com>
Sender: linux-clk-owner@vger.kernel.org
To: Erin Lo <erin.lo@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Mike Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, John Crispin <blogic@openwrt.org>, Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <kernel@pengutronix.de>, Daniel Kurtz <djkurtz@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, Shunli Wang <shunli.wang@mediatek.com>, James Liao <jamesjj.liao@mediatek.com>
List-Id: devicetree@vger.kernel.org

On 06/22, Erin Lo wrote:
> diff --git a/drivers/clk/mediatek/clk-mt2701-bdp.c b/drivers/clk/mediatek/clk-mt2701-bdp.c
> new file mode 100644
> index 0000000..81f628c
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt2701-bdp.c
> @@ -0,0 +1,140 @@
> +/*
> + * Copyright (c) 2014 MediaTek Inc.
> + * Author: Shunli Wang <shunli.wang@mediatek.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/clk.h>

Is this include used? I would expect clk-provider.h instead.

> +#include <linux/platform_device.h>
> +
> +#include "clk-mtk.h"
> +#include "clk-gate.h"
> +
> +#include <dt-bindings/clock/mt2701-clk.h>
> +
[..]
> +
> +static void mtk_bdpsys_init(struct device_node *node)
> +{
> +	struct clk_onecell_data *clk_data;
> +	int r;
> +
> +	clk_data = mtk_alloc_clk_data(CLK_BDP_NR);
> +
> +	mtk_clk_register_gates(node, bdp_clks, ARRAY_SIZE(bdp_clks),
> +						clk_data);
> +
> +	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);

Is it possible to move to of_clk_add_hw_provider()? It can be
done later if that would mean changing all
mtk_clk_register_gates() users.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
