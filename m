From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v3 07/12] clk: mediatek: add clk support for MT6797
Date: Thu, 6 Apr 2017 13:08:52 -0700
Message-ID: <20170406200852.GQ7065@codeaurora.org>
References: <1489937193-2953-1-git-send-email-mars.cheng@mediatek.com>
 <1489937193-2953-8-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1489937193-2953-8-git-send-email-mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, CC Hwang <cc.hwang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Loda Chou <loda.chou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Miles Chen <miles.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jades Shih <jades.shih-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, My Chuang <my.chuang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kevin-CW Chen <kevin-cw.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/19, Mars Cheng wrote:
> From: Kevin-CW Chen <kevin-cw.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> Add MT6797 clock support, include topckgen, apmixedsys, infracfg
> and subsystem clocks
> 
> Signed-off-by: Kevin-CW Chen <kevin-cw.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Tested-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Acked-by: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

Looks fine to me except for the one comment below. Did you want
me to merge it into clk tree?

> diff --git a/drivers/clk/mediatek/clk-mt6797.c b/drivers/clk/mediatek/clk-mt6797.c
> new file mode 100644
> index 0000000..7ebb7f1
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt6797.c
> @@ -0,0 +1,716 @@
> +/*
> + * Copyright (c) 2016 MediaTek Inc.
> + * Author: Kevin Chen <kevin-cw.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
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

Is this include used? Please include clk-provider if the file is
a clk driver. Same comment applies to other files in this patch.

> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +
> +#include "clk-mtk.h"
> +#include "clk-gate.h"
> +
> +#include <dt-bindings/clock/mt6797-clk.h>
> +
> +/*
> + * For some clocks, we don't care what their actual rates are. And these
> + * clocks may change their rate on different products or different scenarios.
> + * So we model these clocks' rate as 0, to denote it's not an actual rate.
> + */
> +
> +static DEFINE_SPINLOCK(mt6797_clk_lock);
> +
> +static const struct mtk_fixed_factor top_fixed_divs[] = {
> +	FACTOR(CLK_TOP_SYSPLL_CK, "syspll_ck", "mainpll", 1, 1),
> +	FACTOR(CLK_TOP_SYSPLL_D2, "syspll_d2", "mainpll", 1, 2),
> +	FACTOR(CLK_TOP_SYSPLL1_D2, "syspll1_d2", "syspll_d2", 1, 2),
[...]
> +	clk_init = of_device_get_match_data(&pdev->dev);
> +	if (!clk_init)
> +		return -EINVAL;
> +
> +	r = clk_init(pdev);
> +	if (r)
> +		dev_err(&pdev->dev,
> +			"could not register clock provider: %s: %d\n",
> +			pdev->name, r);
> +
> +	return r;
> +}
> +
> +static struct platform_driver clk_mt6797_drv = {
> +	.probe = clk_mt6797_probe,
> +	.driver = {
> +		.name = "clk-mt6797",
> +		.owner = THIS_MODULE,

This can be removed, platform_driver_register() does it already.

> +		.of_match_table = of_match_clk_mt6797,
> +	},
> +};
> +
> +static int __init clk_mt6797_init(void)
> +{
> +	return platform_driver_register(&clk_mt6797_drv);
> +}
> +
> +arch_initcall(clk_mt6797_init);
> diff --git a/include/dt-bindings/clock/mt6797-clk.h b/include/dt-bindings/clock/mt6797-clk.h
> new file mode 100644
> index 0000000..e48aa47
> --- /dev/null
> +++ b/include/dt-bindings/clock/mt6797-clk.h
> @@ -0,0 +1,281 @@

I think arm-soc folks don't want us merging whole drivers into
the DT branch anymore, so please split off the dt-bindings header
into a different patch that we can apply directly. Then we can
layer the driver on top and just send off the header to arm-soc
via a stable clk branch.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
