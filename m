From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: shmobile: Add CA7 arch_timer initialization for
 secondary CPUs
Date: Tue, 4 Jul 2017 20:20:45 +0200
Message-ID: <CAMuHMdXFAZ2Gvgk7oJhkQo7ygCKE_MPqtypccwqj9NTW30q57A@mail.gmail.com>
References: <1499187733-1430-1-git-send-email-geert+renesas@glider.be>
 <1499187733-1430-2-git-send-email-geert+renesas@glider.be> <2f7ef764-c511-9598-c136-13966f810c95@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2f7ef764-c511-9598-c136-13966f810c95-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Marc,

On Tue, Jul 4, 2017 at 7:32 PM, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org> wrote:
> On 04/07/17 18:02, Geert Uytterhoeven wrote:
>> On Cortex-A7, the arch timer CNTVOFF register is uninitialized.
>> Hence when enabling SMP on r8a7794, the kernel log is spammed with:
>>
>>     WARNING: Underflow in clocksource 'arch_sys_counter' observed, time update ignored.
>>            Please report this, consider using a different clocksource, if possible.
>>            Your kernel is probably still fine.
>>
>> To fix this, wrap the standard secondary_startup routine inside a
>> routine which initializes CNTVOFF when running on a Cortex-A7.
>> As the only possibilities are Cortex-A7 or Cortex-A15, checking the low
>> nibble of the Primary Part Number is sufficient.
>>
>> The initialization is identical to what is already done for the boot CPU
>> since commit 9ce3fa6816c2fb59 ("ARM: shmobile: rcar-gen2: Add CA7
>> arch_timer initialization for r8a7794").
>
> Humfff... Pretty horrible. Comments below.

I know.  I suppose this should be done by the firmware/boot loader?
But we have to live with firmware/boot loaders in the wild...

>> --- /dev/null
>> +++ b/arch/arm/mach-shmobile/headsmp-apmu.S
>> @@ -0,0 +1,38 @@
>> +/*
>> + * SMP support for APMU based systems
>> + *
>> + * Copyright (C) 2014  Renesas Electronics Corporation
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + */
>> +
>> +#include <linux/linkage.h>
>> +
>> +ENTRY(shmobile_boot_apmu)
>> +     mrc     p15, 0, r0, c0, c0, 0           /* Get Main ID */
>> +     ubfx    r1, r0, #4, #4                  /* r1=Lo 4bit of Primary Part */
>> +     cmp     r1, #0x7                        /* 0x7 = CA7, 0xf = CA15 */
>> +     bne     1f
>
> Why don't you deal with the A15 parts as well? And TBH, you'd be better
> off checking ID_PFR1 for both Generic Timers and Virtualization Extensions.

Do we have to deal with the A15 parts here?
We're not having issues with the A15 parts, so that's why I left it out.

I'm trying to understand what's different between A15 and A7, and why A7
needs this code, while A15 apparently doesn't.
I'm not seeing any obvious differences in the U-Boot sources handling
e.g. r8a7791/koelsch (dual A15) vs. r8a7794/alt (dual A7).

> off checking ID_PFR1 for both Generic Timers and Virtualization Extensions.

Thank, I'll have a look at that...

>> +     /*
>> +      * CA7 setup
>> +      * CNTVOFF has to be initialized either from non-secure Hypervisor
>> +      * mode or secure Monitor mode with SCR.NS==1. If TrustZone is enabled
>> +      * then it should be handled by the secure code
>> +      */
>> +     cps     0x16
>
> It'd be worth adding a MONITOR_MODE macro instead of this raw value.

>> +     cps     0x13
>
> and use SVC_MODE here.

Thanks, I'll have a look at those, too.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
