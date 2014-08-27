From: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Subject: Re: [PATCH v6 4/5] clk: RK808: Add clkout driver for RK808
Date: Wed, 27 Aug 2014 12:22:01 +0100
Message-ID: <53FDBF59.1050001@codethink.co.uk>
References: <1409062589-12157-1-git-send-email-zyw@rock-chips.com> <CAD=FV=WS=FaJdDVomCo2FxnsoRxDAHNNK-VX75JLzBYHHGS8AA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=WS=FaJdDVomCo2FxnsoRxDAHNNK-VX75JLzBYHHGS8AA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lin Huang <hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Eddie Cai <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, zhangqing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, xxx <xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Sonny Rao <sonnyrao@c>
List-Id: devicetree@vger.kernel.org

On 26/08/14 19:02, Doug Anderson wrote:
> Chris,
> 
> On Tue, Aug 26, 2014 at 7:16 AM, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
>> Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>
>> ---
>>
>> Changes in v6:
>> Adviced by doug
>> - use correct argument call of_clk_add_provider in probe
>>
>> Changes in v5:
>> Adviced by doug
>> - add some error checking in probe
>> - move "rockchip,rk808.h" into the patch about dt-bindings
>>
>> Changes in v4:
>> Adviced by doug
>> - add "clock-output-names" propertiey
>> - add a header file "rockchip,rk808.h"
>>
>> Changes in v3:
>> - fix compile err
>>
>> Changes in v2:
>> Adviced by javier.martinez
>> - separated from rtc-rk808.
>>
>>  drivers/clk/Kconfig     |    9 +++
>>  drivers/clk/Makefile    |    1 +
>>  drivers/clk/clk-rk808.c |  163 +++++++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 173 insertions(+)
>>  create mode 100644 drivers/clk/clk-rk808.c
>>
>> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
>> index cfd3af7..84e0590 100644
>> --- a/drivers/clk/Kconfig
>> +++ b/drivers/clk/Kconfig
>> @@ -38,6 +38,15 @@ config COMMON_CLK_MAX77686
>>         ---help---
>>           This driver supports Maxim 77686 crystal oscillator clock.
>>
>> +config COMMON_CLK_RK808
>> +       tristate "Clock driver for RK808"
>> +       depends on MFD_RK808
>> +       ---help---
>> +         This driver supports RK808 crystal oscillator clock. These
>> +         multi-function devices have two fixed-rate oscillators,
>> +         clocked at 32KHz each. Clkout1 is always on, Clkout2 can off
>> +         by control register.
>> +
>>  config COMMON_CLK_SI5351
>>         tristate "Clock driver for SiLabs 5351A/B/C"
>>         depends on I2C
>> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
>> index f537a0b..99f53d5 100644
>> --- a/drivers/clk/Makefile
>> +++ b/drivers/clk/Makefile
>> @@ -28,6 +28,7 @@ obj-$(CONFIG_ARCH_NOMADIK)            += clk-nomadik.o
>>  obj-$(CONFIG_ARCH_NSPIRE)              += clk-nspire.o
>>  obj-$(CONFIG_COMMON_CLK_PALMAS)                += clk-palmas.o
>>  obj-$(CONFIG_CLK_PPC_CORENET)          += clk-ppc-corenet.o
>> +obj-$(CONFIG_COMMON_CLK_RK808)         += clk-rk808.o
>>  obj-$(CONFIG_COMMON_CLK_S2MPS11)       += clk-s2mps11.o
>>  obj-$(CONFIG_COMMON_CLK_SI5351)                += clk-si5351.o
>>  obj-$(CONFIG_COMMON_CLK_SI570)         += clk-si570.o
>> diff --git a/drivers/clk/clk-rk808.c b/drivers/clk/clk-rk808.c
>> new file mode 100644
>> index 0000000..21f8b54
>> --- /dev/null
>> +++ b/drivers/clk/clk-rk808.c
>> @@ -0,0 +1,163 @@
>> +/*
>> + * Clkout driver for Rockchip RK808
>> + *
>> + * Copyright (c) 2014, Fuzhou Rockchip Electronics Co., Ltd
>> + *
>> + * Author: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> 
> I probably would have removed "Author" here (like in other patches)
> since it's below in MODULE_AUTHOR.  ...but I'm not a huge stickler for
> it.
> 
> 
> 
>> + *
>> + * This program is free software; you can redistribute it and/or modify it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope it will be useful, but WITHOUT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>> + * more details.
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/module.h>
>> +#include <linux/slab.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/mfd/rk808.h>
>> +#include <linux/i2c.h>
>> +
>> +struct rk808_clkout {
>> +       struct rk808 *rk808;
>> +       struct clk_onecell_data clk_data;
>> +       struct clk_hw           clkout1_hw;
>> +       struct clk_hw           clkout2_hw;
>> +};
>> +
>> +static unsigned long rk808_clkout_recalc_rate(struct clk_hw *hw,
>> +                                             unsigned long parent_rate)
>> +{
>> +       return 32768;
>> +}
>> +

Given one of these is a fixed, ungatable clock then surely it would
be easier to use a separate fixed clock node for that and then just
have a none for the gated clock?


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
