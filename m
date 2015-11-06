From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RESEND v2 3/4] ARM: BCM: Add SMP support for Broadcom
 NSP
Date: Fri, 06 Nov 2015 12:03:49 -0800
Message-ID: <563D07A5.8090305@gmail.com>
References: <1446839371-22601-1-git-send-email-kapilh@broadcom.com> <1446839371-22601-4-git-send-email-kapilh@broadcom.com> <563D060D.6070606@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <563D060D.6070606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/11/15 11:57, Florian Fainelli wrote:
> On 06/11/15 11:49, Kapil Hali wrote:
>> Add SMP support for Broadcom's Northstar Plus SoC
>> cpu enable method. This changes also consolidates
>> iProc family's - BCM NSP and BCM Kona, platform
>> SMP handling in a common file.
>>
>> Northstar Plus SoC is based on ARM Cortex-A9
>> revision r3p0 which requires configuration for ARM
>> Errata 764369 for SMP. This change adds the needed
>> configuration option.
>>
>> Signed-off-by: Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> ---
> 
> Technically, this is not quite a RESEND, using the same git format-patch
> --subject command as before maybe?
> 
> [snip]
> 
>> +#ifndef __BCM_NSP_H
>> +#define __BCM_NSP_H
>> +
>> +extern void nsp_secondary_startup(void);
> 
> This does not appear to be needed anymore since you use the standard
> secondary_boot entry point now.
> 
>> +
>> +#endif /* __BCM_NSP_H */
>> diff --git a/arch/arm/mach-bcm/kona_smp.c b/arch/arm/mach-bcm/platsmp.c
>> similarity index 75%
>> rename from arch/arm/mach-bcm/kona_smp.c
>> rename to arch/arm/mach-bcm/platsmp.c
>> index 66a0465..925402f 100644
>> --- a/arch/arm/mach-bcm/kona_smp.c
>> +++ b/arch/arm/mach-bcm/platsmp.c
>> @@ -1,5 +1,5 @@
>>  /*
>> - * Copyright (C) 2014 Broadcom Corporation
>> + * Copyright (C) 2014-2015 Broadcom Corporation
>>   * Copyright 2014 Linaro Limited
>>   *
>>   * This program is free software; you can redistribute it and/or
>> @@ -12,16 +12,23 @@
>>   * GNU General Public License for more details.
>>   */
>>  
>> -#include <linux/init.h>
>> +#include <linux/cpumask.h>
>> +#include <linux/delay.h>
>>  #include <linux/errno.h>
>> +#include <linux/init.h>
>>  #include <linux/io.h>
>> +#include <linux/jiffies.h>
>>  #include <linux/of.h>
>>  #include <linux/sched.h>
>> +#include <linux/smp.h>
>>  
>> +#include <asm/cacheflush.h>
>>  #include <asm/smp.h>
>>  #include <asm/smp_plat.h>
>>  #include <asm/smp_scu.h>
>>  
>> +#include "bcm_nsp.h"
> 
> Likewise.
> 
>> +
>>  /* Size of mapped Cortex A9 SCU address space */
>>  #define CORTEX_A9_SCU_SIZE	0x58
>>  
>> @@ -75,6 +82,37 @@ static int __init scu_a9_enable(void)
>>  	return 0;
>>  }
>>  
>> +static int nsp_write_lut(void)
>> +{
>> +	void __iomem *sku_rom_lut;
>> +	phys_addr_t secondary_startup_phy;
>> +
>> +	if (!secondary_boot) {
>> +		pr_warn("required secondary boot register not specified\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	sku_rom_lut = ioremap_nocache((phys_addr_t)secondary_boot,
>> +						sizeof(secondary_boot));
> 
> That looks weird to me, are not you intending to get a virtual mapping
> of the SKU ROM LUT base register address here? What would
> sizeof(function) return here?

secondary_boot != secondary_startup, I read it wrong, this is fine.
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
