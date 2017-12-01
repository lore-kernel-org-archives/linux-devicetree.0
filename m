From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v3 2/3] clk: meson-axg: add clock controller drivers
Date: Fri, 1 Dec 2017 08:39:03 -0800
Message-ID: <20171201163903.GF19419@codeaurora.org>
References: <20171128125330.363-1-yixun.lan@amlogic.com>
 <20171128125330.363-3-yixun.lan@amlogic.com>
 <20171129193433.GA19419@codeaurora.org>
 <d2b58c06-93dc-4368-501e-4b8bdc9a4c34@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <d2b58c06-93dc-4368-501e-4b8bdc9a4c34-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Qiufang Dai <qiufang.dai-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/30, Yixun Lan wrote:
> Hi Stephen
> 
> On 11/30/17 03:34, Stephen Boyd wrote:
> > On 11/28, Yixun Lan wrote:
> >> diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
> >> new file mode 100644
> >> index 000000000000..51c5b4062715
> >> --- /dev/null
> >> +++ b/drivers/clk/meson/axg.c
> >> @@ -0,0 +1,948 @@
> >> +/*
> >> + * AmLogic Meson-AXG Clock Controller Driver
> >> + *
> >> + * Copyright (c) 2016 Baylibre SAS.
> >> + * Author: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> >> + *
> >> + * Copyright (c) 2017 Amlogic, inc.
> >> + * Author: Qiufang Dai <qiufang.dai-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
> >> + *
> >> + * SPDX-License-Identifier: GPL-2.0+
> >> + */
> >> +
> >> +#include <linux/clk.h>
> >> +#include <linux/clk-provider.h>
> >> +#include <linux/of_address.h>
> >> +#include <linux/of_device.h>
> >> +#include <linux/platform_device.h>
> >> +#include <linux/init.h>
> >> +
> >> +#include "clkc.h"
> >> +#include "axg.h"
> >> +
> >> +static DEFINE_SPINLOCK(clk_lock);
> > 
> > meson_axg_clk_lock?
> > 
> em... I'd leave it unchanged
> 
> because the spinlock will be used at macro MESON_GATE() [1] which
> defined at drivers/clk/meson/clkc.h, and it assume using the generic
> name 'clk_lock', change name will break the code..
> 
> and besides it's already defined as static, so I see no problem here

The problem is lockdep debugging and ctags/grep on the source
code. clk_lock is very generic when it should be more specific so
we can find this lock later on from a lockdep report with a
simple search of the code.

Maybe make another patch to rename it to meson_clk_lock so the
macro doesn't have to change too much, and we get it slightly
more unique. Looks like v4l2 also has a clk_lock.

> 
> >> +};
> >> +
> >> +static int axg_clkc_probe(struct platform_device *pdev)
> >> +{
> >> +	const struct clkc_data *clkc_data;
> >> +	void __iomem *clk_base;
> >> +	int ret, clkid, i;
> >> +	struct device *dev = &pdev->dev;
> >> +
> >> +	clkc_data = of_device_get_match_data(&pdev->dev);
> >> +	if (!clkc_data)
> >> +		return -EINVAL;
> >> +
> >> +	/*  Generic clocks and PLLs */
> >> +	clk_base = of_iomap(dev->of_node, 0);
> > 
> > Use platform device APIs for ioremapping?
> > 
> I assume you are referring to 'platform_get_resource +
> devm_ioremap_resource' ?
> 
> the idea sounds good to me.

Yes.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
