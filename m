From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 5/9] ARM: mediatek: enable gpt6 on boot up to make arch
 timer working
Date: Wed, 20 May 2015 10:43:36 +0200
Message-ID: <CABuKBeKgWc8YJeacr1VeVaOQ1hzpqdTskarDJk6W2AdfWqQ9nw@mail.gmail.com>
References: <1431763110-443-1-git-send-email-yingjoe.chen@mediatek.com>
	<1431763110-443-6-git-send-email-yingjoe.chen@mediatek.com>
	<555B9438.9020404@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <555B9438.9020404-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marc Carino <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2015-05-19 21:51 GMT+02:00 Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>:
> On 05/16/15 00:58, Yingjoe Chen wrote:
>> diff --git a/arch/arm/mach-mediatek/mediatek.c b/arch/arm/mach-mediatek/mediatek.c
>> index a954900..6b38d67 100644
>> --- a/arch/arm/mach-mediatek/mediatek.c
>> +++ b/arch/arm/mach-mediatek/mediatek.c
>> @@ -16,6 +16,34 @@
>>   */
>>  #include <linux/init.h>
>>  #include <asm/mach/arch.h>
>> +#include <linux/of.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/clocksource.h>
>> +
>> +
>> +#define GPT6_CON_MT65xx 0x10008060
>> +#define GPT_ENABLE      0x31
>> +
>> +static void __init mediatek_timer_init(void)
>> +{
>> +     void __iomem *gpt_base = 0;
>
>  = NULL ?
>
>> +
>> +     if (of_machine_is_compatible("mediatek,mt6589") ||
>> +         of_machine_is_compatible("mediatek,mt8135") ||
>> +         of_machine_is_compatible("mediatek,mt8127")) {
>> +             /* turn on GPT6 which ungates arch timer clocks */
>> +             gpt_base = ioremap(GPT6_CON_MT65xx, 0x04);
>> +     }
>> +
>> +     /* enabel clock and set to free-run */
>
> s/enabel/enable/
>
>> +     if (gpt_base) {
>> +             writel(GPT_ENABLE, gpt_base);
>> +             iounmap(gpt_base);
>> +     }
>> +
>
> Why not join the two conditions together?

The initial patch supposed that on different SoCs GPT6_CON register
would be mapped on different addresses, but that seems not the case.
So yes, we can join the two conditions together.

Yingjoe, can you add the changes in the next series or do you want me to do it?

Thanks,
Matthias

-- 
motzblog.wordpress.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
