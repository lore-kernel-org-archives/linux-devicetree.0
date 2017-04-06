From: Mars Cheng <mars.cheng@mediatek.com>
Subject: Re: [PATCH v3 07/12] clk: mediatek: add clk support for MT6797
Date: Fri, 7 Apr 2017 07:35:47 +0800
Message-ID: <1491521747.17643.6.camel@mtkswgap22>
References: <1489937193-2953-1-git-send-email-mars.cheng@mediatek.com>
         <1489937193-2953-8-git-send-email-mars.cheng@mediatek.com>
         <20170406200852.GQ7065@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170406200852.GQ7065@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Michael Turquette <mturquette@baylibre.com>, CC Hwang <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Jades Shih <jades.shih@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, My Chuang <my.chuang@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com, linux-clk@vger.kernel.org, Kevin-CW Chen <kevin-cw.chen@mediatek.com>
List-Id: devicetree@vger.kernel.org

Hi Stephen

On Thu, 2017-04-06 at 13:08 -0700, Stephen Boyd wrote:
> On 03/19, Mars Cheng wrote:
> > From: Kevin-CW Chen <kevin-cw.chen@mediatek.com>
> > 
> > Add MT6797 clock support, include topckgen, apmixedsys, infracfg
> > and subsystem clocks
> > 
> > Signed-off-by: Kevin-CW Chen <kevin-cw.chen@mediatek.com>
> > Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> > Tested-by: Matthias Brugger <matthias.bgg@gmail.com>
> 
> Acked-by: Stephen Boyd <sboyd@codeaurora.org>
> 
> Looks fine to me except for the one comment below. Did you want
> me to merge it into clk tree?

To prevent another run, I really like you to merge it.
However, I also want to make the patch set more cleaner.
So I will send v4 later. :-)  

> 
> > diff --git a/drivers/clk/mediatek/clk-mt6797.c b/drivers/clk/mediatek/clk-mt6797.c
> > new file mode 100644
> > index 0000000..7ebb7f1
> > --- /dev/null
> > +++ b/drivers/clk/mediatek/clk-mt6797.c
> > @@ -0,0 +1,716 @@
> > +/*
> > + * Copyright (c) 2016 MediaTek Inc.
> > + * Author: Kevin Chen <kevin-cw.chen@mediatek.com>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#include <linux/clk.h>
> 
> Is this include used? Please include clk-provider if the file is
> a clk driver. Same comment applies to other files in this patch.
> 

Should be removed. Will be done in v4.

> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_device.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include "clk-mtk.h"
> > +#include "clk-gate.h"
> > +
> > +#include <dt-bindings/clock/mt6797-clk.h>
> > +
> > +/*
> > + * For some clocks, we don't care what their actual rates are. And these
> > + * clocks may change their rate on different products or different scenarios.
> > + * So we model these clocks' rate as 0, to denote it's not an actual rate.
> > + */
> > +
> > +static DEFINE_SPINLOCK(mt6797_clk_lock);
> > +
> > +static const struct mtk_fixed_factor top_fixed_divs[] = {
> > +	FACTOR(CLK_TOP_SYSPLL_CK, "syspll_ck", "mainpll", 1, 1),
> > +	FACTOR(CLK_TOP_SYSPLL_D2, "syspll_d2", "mainpll", 1, 2),
> > +	FACTOR(CLK_TOP_SYSPLL1_D2, "syspll1_d2", "syspll_d2", 1, 2),
> [...]
> > +	clk_init = of_device_get_match_data(&pdev->dev);
> > +	if (!clk_init)
> > +		return -EINVAL;
> > +
> > +	r = clk_init(pdev);
> > +	if (r)
> > +		dev_err(&pdev->dev,
> > +			"could not register clock provider: %s: %d\n",
> > +			pdev->name, r);
> > +
> > +	return r;
> > +}
> > +
> > +static struct platform_driver clk_mt6797_drv = {
> > +	.probe = clk_mt6797_probe,
> > +	.driver = {
> > +		.name = "clk-mt6797",
> > +		.owner = THIS_MODULE,
> 
> This can be removed, platform_driver_register() does it already.
> 

got it, will be removed.

> > +		.of_match_table = of_match_clk_mt6797,
> > +	},
> > +};
> > +
> > +static int __init clk_mt6797_init(void)
> > +{
> > +	return platform_driver_register(&clk_mt6797_drv);
> > +}
> > +
> > +arch_initcall(clk_mt6797_init);
> > diff --git a/include/dt-bindings/clock/mt6797-clk.h b/include/dt-bindings/clock/mt6797-clk.h
> > new file mode 100644
> > index 0000000..e48aa47
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/mt6797-clk.h
> > @@ -0,0 +1,281 @@
> 
> I think arm-soc folks don't want us merging whole drivers into
> the DT branch anymore, so please split off the dt-bindings header
> into a different patch that we can apply directly. Then we can
> layer the driver on top and just send off the header to arm-soc
> via a stable clk branch.
> 

Got it. Will be done in v4.

Thanks for your review.

