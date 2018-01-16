From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: Re: [PATCH v5 11/44] clk: davinci: Add platform information for TI
 DA830 PSC
Date: Tue, 16 Jan 2018 11:16:37 -0600
Message-ID: <4dd36ca7-e41d-58d8-ec8c-787978307943@lechnology.com>
References: <1515377863-20358-1-git-send-email-david@lechnology.com>
 <1515377863-20358-12-git-send-email-david@lechnology.com>
 <91fe16dc-907e-6dbb-c8db-c27561132093@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <91fe16dc-907e-6dbb-c8db-c27561132093-l0cyMroinI0@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Adam Ford <aford173-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/16/2018 07:38 AM, Sekhar Nori wrote:
> On Monday 08 January 2018 07:47 AM, David Lechner wrote:
>> This adds platform-specific declarations for the PSC clocks on TI DA830/
>> OMAP-L137/AM17XX SoCs.
>>
>> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
>> ---
>>   drivers/clk/davinci/Makefile    |  1 +
>>   drivers/clk/davinci/psc-da830.c | 96 +++++++++++++++++++++++++++++++++++++++++
>>   include/linux/clk/davinci.h     |  2 +
>>   3 files changed, 99 insertions(+)
>>   create mode 100644 drivers/clk/davinci/psc-da830.c
>>
>> diff --git a/drivers/clk/davinci/Makefile b/drivers/clk/davinci/Makefile
>> index cd1bf2c..fb14c8c 100644
>> --- a/drivers/clk/davinci/Makefile
>> +++ b/drivers/clk/davinci/Makefile
>> @@ -10,4 +10,5 @@ obj-$(CONFIG_ARCH_DAVINCI_DM644x)	+= pll-dm644x.o
>>   obj-$(CONFIG_ARCH_DAVINCI_DM646x)	+= pll-dm646x.o
>>   
>>   obj-y += psc.o
>> +obj-$(CONFIG_ARCH_DAVINCI_DA830)	+= psc-da830.o
>>   endif
>> diff --git a/drivers/clk/davinci/psc-da830.c b/drivers/clk/davinci/psc-da830.c
>> new file mode 100644
>> index 0000000..193b08f
>> --- /dev/null
>> +++ b/drivers/clk/davinci/psc-da830.c
>> @@ -0,0 +1,96 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * PSC clock descriptions for TI DA830/OMAP-L137/AM17XX
>> + *
>> + * Copyright (C) 2017 David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/clkdev.h>
>> +#include <linux/init.h>
>> +#include <linux/types.h>
>> +
>> +#include "psc.h"
>> +
>> +static const struct davinci_psc_clk_info da830_psc0_info[] __initconst = {
>> +	LPSC(0, 0, tpcc, pll0_sysclk2, LPSC_ALWAYS_ENABLED),
>> +	LPSC(1, 0, tptc0, pll0_sysclk2, LPSC_ALWAYS_ENABLED),
>> +	LPSC(2, 0, tptc1, pll0_sysclk2, LPSC_ALWAYS_ENABLED),
>> +	LPSC(3, 0, aemif, pll0_sysclk3, LPSC_ALWAYS_ENABLED),
>> +	LPSC(4, 0, spi0, pll0_sysclk2, 0),
>> +	LPSC(5, 0, mmcsd, pll0_sysclk2, 0),
>> +	LPSC(6, 0, aintc, pll0_sysclk4, LPSC_ALWAYS_ENABLED),
>> +	LPSC(7, 0, arm_rom, pll0_sysclk2, LPSC_ALWAYS_ENABLED),
>> +	LPSC(8, 0, secu_mgr, pll0_sysclk4, LPSC_ALWAYS_ENABLED),
>> +	LPSC(9, 0, uart0, pll0_sysclk2, 0),
>> +	LPSC(10, 0, scr0_ss, pll0_sysclk2, LPSC_ALWAYS_ENABLED),
>> +	LPSC(11, 0, scr1_ss, pll0_sysclk2, LPSC_ALWAYS_ENABLED),
>> +	LPSC(12, 0, scr2_ss, pll0_sysclk2, LPSC_ALWAYS_ENABLED),
>> +	LPSC(13, 0, dmax, pll0_sysclk2, LPSC_ALWAYS_ENABLED),
> 
> pruss is better (I know the name is coming from existing code).
> 
>> +	LPSC(14, 0, arm, pll0_sysclk6, LPSC_ALWAYS_ENABLED),
> 
> This is LPSC 15 which controls DSP too. But its missing from existing
> code. Not sure why. Probably a note for future. For now okay with
> ignoring it.
> 
>> +	{ }
>> +};
> 
> Tables like these are much easier to parse if columns are spaced using a
> tab.
> 

Tabs make the lines over 80 columns. How about spaces instead?


>> +
>> +static const struct davinci_psc_clk_info da830_psc1_info[] __initconst = {
>> +	LPSC(1, 0, usb0, pll0_sysclk2, 0),
>> +	LPSC(2, 0, usb1, pll0_sysclk4, 0),
>> +	LPSC(3, 0, gpio, pll0_sysclk4, 0),
> 
> There is LPSC 4 controlling UHPI. Again, lets ignore for now.
> 
>> +	LPSC(5, 0, emac, pll0_sysclk4, 0),
>> +	LPSC(6, 0, emif3, pll0_sysclk5, LPSC_ALWAYS_ENABLED),
>> +	LPSC(7, 0, mcasp0, pll0_sysclk2, 0),
>> +	LPSC(8, 0, mcasp1, pll0_sysclk2, 0),
>> +	LPSC(9, 0, mcasp2, pll0_sysclk2, 0),
>> +	LPSC(10, 0, spi1, pll0_sysclk2, 0),
>> +	LPSC(11, 0, i2c1, pll0_sysclk4, 0),
>> +	LPSC(12, 0, uart1, pll0_sysclk2, 0),
>> +	LPSC(13, 0, uart2, pll0_sysclk2, 0),
>> +	LPSC(16, 0, lcdc, pll0_sysclk2, 0),
>> +	LPSC(17, 0, pwm, pll0_sysclk2, 0),
>> +	LPSC(20, 0, ecap, pll0_sysclk2, 0),
>> +	LPSC(21, 0, eqep, pll0_sysclk2, 0),
>> +	{ }
>> +};
>> +
>> +void __init da830_psc_clk_init(void __iomem *psc0, void __iomem *psc1)
>> +{
>> +	struct clk_onecell_data *clk_data;
>> +
>> +	clk_data = davinci_psc_register_clocks(psc0, da830_psc0_info, 16);
>> +	if (!clk_data)
>> +		return;
>> +
>> +	clk_register_clkdev(clk_data->clks[4], NULL, "spi_davinci.0");
>> +	clk_register_clkdev(clk_data->clks[5], NULL, "da830-mmc.0");
>> +	clk_register_clkdev(clk_data->clks[9], NULL, "serial8250.0");
>> +	clk_register_clkdev(clk_data->clks[14], "arm", NULL);
>> +
>> +	clk_free_onecell_data(clk_data);
>> +
>> +	clk_data = davinci_psc_register_clocks(psc1, da830_psc1_info, 32);
>> +	if (!clk_data)
>> +		return;
>> +
>> +	clk_register_clkdev(clk_data->clks[1], NULL, "musb-da8xx");
>> +	clk_register_clkdev(clk_data->clks[1], NULL, "cppi41-dmaengine");
>> +	clk_register_clkdev(clk_data->clks[2], NULL, "ohci-da8xx");
>> +	clk_register_clkdev(clk_data->clks[3], "gpio", NULL);
> 
> This is pretty bad (and no fault of yours) - having a con_id but no
> device name. Can you please make a pre-series which passes NULL con_id
> in gpio-davinci.c?

I'll give it a try. This is complicated by the fact that the con_id has
made it's way into the device tree bindings. However, I think we can
safely deprecate clock-names = "gpio" in the device tree bindings since
we can make the driver ignore that property to preserve backwards
compatibility.

> 
>> +	clk_register_clkdev(clk_data->clks[5], NULL, "davinci_emac.1");
>> +	clk_register_clkdev(clk_data->clks[5], "fck", "davinci_mdio.0");
>> +	clk_register_clkdev(clk_data->clks[7], NULL, "davinci-mcasp.0");
>> +	clk_register_clkdev(clk_data->clks[8], NULL, "davinci-mcasp.1");
>> +	clk_register_clkdev(clk_data->clks[9], NULL, "davinci-mcasp.2");
>> +	clk_register_clkdev(clk_data->clks[10], NULL, "spi_davinci.1");
>> +	clk_register_clkdev(clk_data->clks[11], NULL, "i2c_davinci.2");
>> +	clk_register_clkdev(clk_data->clks[12], NULL, "serial8250.1");
>> +	clk_register_clkdev(clk_data->clks[13], NULL, "serial8250.2");
>> +	clk_register_clkdev(clk_data->clks[16], "fck", "da8xx_lcdc.0");
>> +	clk_register_clkdev(clk_data->clks[17], "fck", "ehrpwm.0");
>> +	clk_register_clkdev(clk_data->clks[17], "fck", "ehrpwm.1");
>> +	clk_register_clkdev(clk_data->clks[20], "fck", "ecap.0");
>> +	clk_register_clkdev(clk_data->clks[20], "fck", "ecap.1");
>> +	clk_register_clkdev(clk_data->clks[20], "fck", "ecap.2");
>> +	clk_register_clkdev(clk_data->clks[21], NULL, "eqep.0");
>> +	clk_register_clkdev(clk_data->clks[21], NULL, "eqep.1");
> 
> This is going to be very difficult to audit for mistakes. How do you
> feel about adding the con_id and dev_id to davinci_psc_clk_info[] so
> they can be initialized as part of a single static table? And then here
> you go over the table looking for non-NULL con_id/dev_id to call
> clk_register_clkdev()?
> 
> I am guessing you did not take that route because the DT path does not
> need those. But still, I think that will be much less error prone.

I wasn't really happy with this either, but I haven't come up with
anything better. The reason I think this is good enough is that the
array index is the LPSC number, so it is not actually that hard to
audit. You can use the clock declarations above (or the datasheet/
TRM) to know exactly which clock you are dealing with by matching
the array index. I considered using macros instead of the numbers,
but then lines are over 80 columns and it gets hard to read with
wrapped lines.

Any other solution will be much more verbose and require helper
functions for looping through the clocks. I'm thinking that I would
define a list of con_id, dev_id pairs for each clock, so that would
be 15 extra static arrays here.

I'll think about it a little more, but for now, I would like to push
for just calling this "good enough" and leave it as-is.



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
