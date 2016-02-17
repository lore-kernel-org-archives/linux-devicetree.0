From: Lars Persson <lars.persson-VrBV9hrLPhE@public.gmane.org>
Subject: Re: [PATCH 2/2] clk: add artpec-6 pll1 clock driver
Date: Wed, 17 Feb 2016 11:30:33 +0100
Message-ID: <56C44BC9.9060802@axis.com>
References: <cover.1455206007.git.larper@axis.com> <6d47cfe5ab7596e91a7fcc5647c5907cc12a4d83.1455206007.git.larper@axis.com> <20160217000220.2278.30045@quark.deferred.io>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160217000220.2278.30045-/Ffx6e7uQFNsG52AEeRyZ2GXanvQGlWp@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Lars Persson <larper-VrBV9hrLPhE@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 02/17/2016 01:02 AM, Michael Turquette wrote:
> Hi Lars,
>
> Quoting Lars Persson (2016-02-11 08:01:04)
>> The PLL1 clock is a fixed-factor clock with factors derived from boot
>> mode pins. This driver is a simple wrapper to register the fixed
>> factor clock according to the pin settings.
>>
>> Signed-off-by: Lars Persson <larper-VrBV9hrLPhE@public.gmane.org>
>> ---
>>   drivers/clk/Makefile      |  1 +
>>   drivers/clk/clk-artpec6.c | 70 +++++++++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 71 insertions(+)
>>   create mode 100644 drivers/clk/clk-artpec6.c
>>
>> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
>> index b038e36..388f0cf 100644
>> --- a/drivers/clk/Makefile
>> +++ b/drivers/clk/Makefile
>> @@ -17,6 +17,7 @@ endif
>>   
>>   # hardware specific clock types
>>   # please keep this section sorted lexicographically by file/directory path name
>> +obj-$(CONFIG_MACH_ARTPEC6)             += clk-artpec6.o
>>   obj-$(CONFIG_MACH_ASM9260)             += clk-asm9260.o
>>   obj-$(CONFIG_COMMON_CLK_AXI_CLKGEN)    += clk-axi-clkgen.o
>>   obj-$(CONFIG_ARCH_AXXIA)               += clk-axm5516.o
>> diff --git a/drivers/clk/clk-artpec6.c b/drivers/clk/clk-artpec6.c
>> new file mode 100644
>> index 0000000..3664c44
>> --- /dev/null
>> +++ b/drivers/clk/clk-artpec6.c
> You mentioned having three drivers. Maybe consider putting this in
> drivers/clk/axis?
Will be fixed in v2.
>
> Continuing my questions from patch #1, should this clock be coupled with
> other artpec6 clocks sharing the same clock controller?
>
>> @@ -0,0 +1,70 @@
>> +/*
>> + * ARTPEC-6 clock initialization
>> + *
>> + * Copyright 2015 Axis Comunications AB.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/clkdev.h>
>> +#include <linux/io.h>
>> +#include <linux/of.h>
>> +#include <linux/of_address.h>
>> +
>> +static void __init of_artpec6_pll1_setup(struct device_node *np)
>> +{
>> +       void __iomem *devstat;
>> +       struct clk *clk;
>> +       const char *clk_name = np->name;
>> +       const char *parent_name;
>> +       u32 pll_mode, pll_m, pll_n;
>> +
>> +       parent_name = of_clk_get_parent_name(np, 0);
>> +
>> +       devstat = of_iomap(np, 0);
>> +       if (devstat == NULL) {
>> +               pr_err("error to ioremap DEVSTAT\n");
>> +               return;
>> +       }
>> +
>> +       /* DEVSTAT register contains PLL settings */
>> +       pll_mode = (readl(devstat) >> 6) & 3;
>> +       iounmap(devstat);
>> +
>> +       /*
>> +        * pll1 settings are designed for different DDR speeds using a fixed
>> +        * 50MHz external clock. However, a different external clock could be
>> +        * used on different boards.
>> +        * CPU clock is half the DDR clock.
>> +        */
>> +       switch (pll_mode) {
>> +       case 0: /* DDR3-2133 mode */
>> +               pll_m = 4;
>> +               pll_n = 85;
>> +               break;
>> +       case 1: /* DDR3-1866 mode */
>> +               pll_m = 6;
>> +               pll_n = 112;
>> +               break;
>> +       case 2: /* DDR3-1600 mode */
>> +               pll_m = 4;
>> +               pll_n = 64;
>> +               break;
>> +       case 3: /* DDR3-1333 mode */
>> +               pll_m = 8;
>> +               pll_n = 106;
>> +               break;
>> +       }
>> +       /* ext_clk is defined in device tree */
>> +       clk = clk_register_fixed_factor(NULL, clk_name, parent_name, 0,
>> +                       pll_n, pll_m);
>> +       if (IS_ERR(clk)) {
>> +               pr_err("%s not registered\n", clk_name);
>> +               return;
>> +       }
>> +       of_clk_add_provider(np, of_clk_src_simple_get, clk);
>> +}
>> +CLK_OF_DECLARE(artpec6_pll1, "axis,artpec6-pll1-clock", of_artpec6_pll1_setup);
> Instead of using CLK_OF_DECLARE can you make this a platform_driver?
Will be fixed in v2.
>
> Best regards,
> Mike
>
>> -- 
>> 2.1.4
>>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
