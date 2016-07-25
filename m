From: Tan Xiaojun <tanxiaojun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH v1 2/2] drivers: soc: Add support for Hisilicon Djtag
 driver
Date: Mon, 25 Jul 2016 09:54:41 +0800
Message-ID: <57957161.1050504@huawei.com>
References: <1469177332-72156-1-git-send-email-tanxiaojun@huawei.com>
 <1469177332-72156-3-git-send-email-tanxiaojun@huawei.com>
 <CAP=VYLpfsMqPZL4J0K2+NMkxG+RHKchDBA+ZGhza9ZfWAa4VnQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAP=VYLpfsMqPZL4J0K2+NMkxG+RHKchDBA+ZGhza9ZfWAa4VnQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Gortmaker <paul.gortmaker-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, amitdanielk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, alex.aring-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, qiang.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2016/7/23 4:37, Paul Gortmaker wrote:
> On Fri, Jul 22, 2016 at 4:48 AM, Tan Xiaojun <tanxiaojun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> wrote:
>> The Hisilicon Djtag is an independent module which connects with some modules
>> in the SoC by Debug Bus. This module can be configured to access the registers
>> of connecting modules (like L3 cache) during real time debugging.
>>
>> This patch add the driver of Hisilicon Djtag.
>>
>> Signed-off-by: Tan Xiaojun <tanxiaojun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/soc/Kconfig                 |    1 +
>>  drivers/soc/Makefile                |    1 +
>>  drivers/soc/hisilicon/Kconfig       |   12 ++
>>  drivers/soc/hisilicon/Makefile      |    1 +
>>  drivers/soc/hisilicon/djtag.c       |  373 +++++++++++++++++++++++++++++++++++
>>  include/linux/soc/hisilicon/djtag.h |   18 ++
>>  6 files changed, 406 insertions(+)
>>  create mode 100644 drivers/soc/hisilicon/Kconfig
>>  create mode 100644 drivers/soc/hisilicon/Makefile
>>  create mode 100644 drivers/soc/hisilicon/djtag.c
>>  create mode 100644 include/linux/soc/hisilicon/djtag.h
>>
>> diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
>> index cb58ef0..f5982ec 100644
>> --- a/drivers/soc/Kconfig
>> +++ b/drivers/soc/Kconfig
>> @@ -3,6 +3,7 @@ menu "SOC (System On Chip) specific Drivers"
>>  source "drivers/soc/bcm/Kconfig"
>>  source "drivers/soc/brcmstb/Kconfig"
>>  source "drivers/soc/fsl/qe/Kconfig"
>> +source "drivers/soc/hisilicon/Kconfig"
>>  source "drivers/soc/mediatek/Kconfig"
>>  source "drivers/soc/qcom/Kconfig"
>>  source "drivers/soc/rockchip/Kconfig"
>> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
>> index 380230f..373449d 100644
>> --- a/drivers/soc/Makefile
>> +++ b/drivers/soc/Makefile
>> @@ -7,6 +7,7 @@ obj-$(CONFIG_SOC_BRCMSTB)       += brcmstb/
>>  obj-$(CONFIG_ARCH_DOVE)                += dove/
>>  obj-$(CONFIG_MACH_DOVE)                += dove/
>>  obj-y                          += fsl/
>> +obj-$(CONFIG_ARCH_HISI)                += hisilicon/
>>  obj-$(CONFIG_ARCH_MEDIATEK)    += mediatek/
>>  obj-$(CONFIG_ARCH_QCOM)                += qcom/
>>  obj-$(CONFIG_ARCH_RENESAS)     += renesas/
>> diff --git a/drivers/soc/hisilicon/Kconfig b/drivers/soc/hisilicon/Kconfig
>> new file mode 100644
>> index 0000000..3644aab
>> --- /dev/null
>> +++ b/drivers/soc/hisilicon/Kconfig
>> @@ -0,0 +1,12 @@
>> +#
>> +# Hisilicon SoC drivers
>> +#
>> +config HISI_DJTAG
>> +       bool "Hisilicon Djtag Support"
>> +       depends on ARCH_HISI || COMPILE_TEST
>> +       help
>> +         Say y here to enable the Hisilicon Djtag support. It is an
>> +         independent module which connects with some modules in the
>> +         SoC by Debug Bus. This module can be configured to access
>> +         the registers of connecting modules during real time
>> +         debugging.
> 
> Choice of word "module" here is probably confusing since it normally
> means a ".ko" when used in Kconfig help.   Maybe instead, use:
> 
> ...independent component...
> 
> ...connects with some other components....
> 
> This driver can be configured to ....
> 
> --hopefully  the above will clarify against such confusion.   Also....
> 

Yes, your suggestion is nice.

>> diff --git a/drivers/soc/hisilicon/Makefile b/drivers/soc/hisilicon/Makefile
>> new file mode 100644
>> index 0000000..35a7b4b
>> --- /dev/null
>> +++ b/drivers/soc/hisilicon/Makefile
>> @@ -0,0 +1 @@
>> +obj-$(CONFIG_HISI_DJTAG)       += djtag.o
>> diff --git a/drivers/soc/hisilicon/djtag.c b/drivers/soc/hisilicon/djtag.c
>> new file mode 100644
>> index 0000000..41e11ed
>> --- /dev/null
>> +++ b/drivers/soc/hisilicon/djtag.c
>> @@ -0,0 +1,373 @@
>> +/*
>> + * Driver for Hisilicon Djtag r/w via System Controller.
>> + *
>> + * Copyright (C) 2016 Hisilicon Ltd.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + */
>> +
>> +#include <linux/bitops.h>
>> +#include <linux/init.h>
>> +#include <linux/list.h>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/module.h>
> 
> ...since you add the driver as a bool Kconfig item, you should
> avoid using module.h and any MODULE_<xyz> tags.  Use the
> builtin registration functions instead.
> 
> Alternatively, if there is a genuine use case for this to really be
> a dynamically loadable .ko module, then convert it to tristate.
> 
> Thanks,
> Paul.
> --

It is depended by hisilicon L3 cache or other components. And some
functions of these components may be called by kernel functions. So
it need to be set "bool". It looks like "mbigen" driver.

Could you give me some examples for the builtin registration functions
what you said? Maybe it is better for me.

Thanks.
Xiaojun.

>> +#include <linux/of.h>
>> +#include <linux/of_address.h>
>> +#include <linux/of_device.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +#include <linux/slab.h>
>> +#include <linux/spinlock.h>
>> +
>> +#include <asm-generic/delay.h>
>> +#include <linux/soc/hisilicon/djtag.h>
> 
> .
> 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
