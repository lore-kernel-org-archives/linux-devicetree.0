From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 4/4] RTC: rk808: add RTC driver for RK808 PMIC RTC
Date: Wed, 20 Aug 2014 00:28:42 +0200
Message-ID: <1517709.ClbTUIzhrF@phil>
References: <1408240979-29555-1-git-send-email-zyw@rock-chips.com> <53F2431F.3090802@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53F2431F.3090802-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Javier,

Am Montag, 18. August 2014, 20:17:03 schrieb Javier Martinez Canillas:
> adding Mike Turquette to cc since this is also a clock driver.
> 
> Hello Chris,
> 
> Overall it looks good to me, I've just a comment about the driver structure.
> On 08/17/2014 04:02 AM, Chris Zhong wrote:
> > RK808 PMIC is a MFD with RTC as one of the device. Adding RTC driver
> > for supporting RTC device present inside RK808 PMIC.
> > 
> > Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> > ---
> > 
> >  drivers/rtc/Kconfig     |   11 +
> >  drivers/rtc/Makefile    |    1 +
> >  drivers/rtc/rtc-rk808.c |  564
> >  +++++++++++++++++++++++++++++++++++++++++++++++ 3 files changed, 576
> >  insertions(+)
> >  create mode 100644 drivers/rtc/rtc-rk808.c
> > 
> > diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> > index a168e96..48f61b2 100644
> > --- a/drivers/rtc/Kconfig
> > +++ b/drivers/rtc/Kconfig
> > @@ -288,6 +288,17 @@ config RTC_DRV_MAX77686
> > 
> >  	  This driver can also be built as a module. If so, the module
> >  	  will be called rtc-max77686.
> > 
> > +config RTC_DRV_RK808
> > +	tristate "Rockchip RK808 RTC"
> > +	depends on MFD_RK808
> > +	help
> > +	  If you say yes here you will get support for the
> > +	  RTC of Rk808 PMIC.
> > +
> > +	  This driver can also be built as a module. If so, the module
> > +	  will be called rtc-rk808.
> > +
> > +
> > 
> >  config RTC_DRV_RS5C372
> >  
> >  	tristate "Ricoh R2025S/D, RS5C372A/B, RV5C386, RV5C387A"
> >  	help
> > 
> > diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> > index 56f061c..91fe4647 100644
> > --- a/drivers/rtc/Makefile
> > +++ b/drivers/rtc/Makefile
> > @@ -109,6 +109,7 @@ obj-$(CONFIG_RTC_DRV_PUV3)	+= rtc-puv3.o
> > 
> >  obj-$(CONFIG_RTC_DRV_PXA)	+= rtc-pxa.o
> >  obj-$(CONFIG_RTC_DRV_R9701)	+= rtc-r9701.o
> >  obj-$(CONFIG_RTC_DRV_RC5T583)	+= rtc-rc5t583.o
> > 
> > +obj-$(CONFIG_RTC_DRV_RK808)	+= rtc-rk808.o
> > 
> >  obj-$(CONFIG_RTC_DRV_RP5C01)	+= rtc-rp5c01.o
> >  obj-$(CONFIG_RTC_DRV_RS5C313)	+= rtc-rs5c313.o
> >  obj-$(CONFIG_RTC_DRV_RS5C348)	+= rtc-rs5c348.o
> > 
> > diff --git a/drivers/rtc/rtc-rk808.c b/drivers/rtc/rtc-rk808.c
> > new file mode 100644
> > index 0000000..0abb919
> > --- /dev/null
> > +++ b/drivers/rtc/rtc-rk808.c
> > @@ -0,0 +1,564 @@
> > +/*
> > + * RTC driver for Rockchip RK808
> > + *
> > + * Copyright (c) 2014, Fuzhou Rockchip Electronics Co., Ltd
> > + *
> > + * Author: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> > + * Author: Zhang Qing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > it
> > + * under the terms and conditions of the GNU General Public License,
> > + * version 2, as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope it will be useful, but WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
> > for + * more details.
> > + *
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/kernel.h>
> > +#include <linux/time.h>
> > +#include <linux/rtc.h>
> > +#include <linux/slab.h>
> > +#include <linux/bcd.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/ioctl.h>
> > +#include <linux/completion.h>
> > +#include <linux/mfd/rk808.h>
> > +#include <linux/delay.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/miscdevice.h>
> > +#include <linux/i2c.h>
> > +#include <linux/irqdomain.h>
> > +#include <linux/clk-provider.h>
> > +
> > +/* RTC_CTRL_REG bitfields */
> > +#define BIT_RTC_CTRL_REG_STOP_RTC_M		0x01
> > +#define BIT_RTC_CTRL_REG_ROUND_30S_M		0x02
> > +#define BIT_RTC_CTRL_REG_AUTO_COMP_M		0x04
> > +#define BIT_RTC_CTRL_REG_MODE_12_24_M		0x08
> > +#define BIT_RTC_CTRL_REG_TEST_MODE_M		0x10
> > +#define BIT_RTC_CTRL_REG_SET_32_COUNTER_M	0x20
> > +#define BIT_RTC_CTRL_REG_GET_TIME_M		0x40
> > +#define BIT_RTC_CTRL_REG_RTC_V_OPT_M		0x80
> > +
> > +/* RTC_STATUS_REG bitfields */
> > +#define BIT_RTC_STATUS_REG_RUN_M		0x02
> > +#define BIT_RTC_STATUS_REG_1S_EVENT_M		0x04
> > +#define BIT_RTC_STATUS_REG_1M_EVENT_M		0x08
> > +#define BIT_RTC_STATUS_REG_1H_EVENT_M		0x10
> > +#define BIT_RTC_STATUS_REG_1D_EVENT_M		0x20
> > +#define BIT_RTC_STATUS_REG_ALARM_M		0x40
> > +#define BIT_RTC_STATUS_REG_POWER_UP_M		0x80
> > +
> > +/* RTC_INTERRUPTS_REG bitfields */
> > +#define BIT_RTC_INTERRUPTS_REG_EVERY_M		0x03
> > +#define BIT_RTC_INTERRUPTS_REG_IT_TIMER_M	0x04
> > +#define BIT_RTC_INTERRUPTS_REG_IT_ALARM_M	0x08
> > +
> > +/* DEVCTRL bitfields */
> > +#define BIT_RTC_PWDN				0x40
> > +
> > +/* REG_SECONDS_REG through REG_YEARS_REG is how many registers? */
> > +#define ALL_TIME_REGS				7
> > +#define ALL_ALM_REGS				6
> > +
> > +#define RTC_SET_TIME_RETRIES	5
> > +#define RTC_GET_TIME_RETRIES	5
> > +
> > +struct rk808_rtc {
> > +	struct rk808 *rk808;
> > +	struct rtc_device *rtc;
> > +	unsigned int alarm_enabled:1;
> > +#ifdef CONFIG_COMMON_CLK
> > +	struct clk_onecell_data clk_data;
> > +	struct clk_hw		clkout1_hw;
> > +	struct clk_hw		clkout2_hw;
> > +#endif
> 
> As I mentioned on a previous review I really think these clocks should be
> managed on a separate clock driver. It's not uncommon for PMIC chips to
> have a bunch of regulators, a RTC and some clock ouputs and usually each
> of these components have their own driver.
> 
> You are already adding a mult-function device driver for this PMIC so is
> just a matter of adding another mfd cell for the clock driver.
> 
> I know that drivers/rtc/rtc-hym8563.c does the same thing and manage both
> a RTC and a clock output but in this case it appears that chip is a plain
> RTC chip with a clock. So I guess in that case it was not worth the
> complexity of adding three drivers (mfd, rtc and clock) for just a simple
> RTC? Arguably even that chip should be seen as a multi-function device
> though but I'll let Mike to judge that. What I really think is that there
> is a reason why we have both drivers/rtc and drivers/clk so we should try
> to keep the needed support in the right place to avoid adding unnecessary
> cross subsystem maintenance burden.

Mike said in the past, that he doesn't require everything that provides a 
clock to be sitting in drivers/clk. This (and the minimal size of the clkout 
of hy8563) let me to decide to put the clkout into the rtc.

For the rk808, I guess it should either be a separate mfd-cell or part of the 
core mfd driver - but not the rtc cell.


Heiko

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
