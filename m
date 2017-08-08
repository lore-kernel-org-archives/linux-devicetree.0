From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH] irqchip: uniphier-aidet: add UniPhier AIDET irqchip driver
Date: Tue, 8 Aug 2017 10:20:22 +0900
Message-ID: <CAK7LNASiqYJ6iF35P78PNQwa8GNdTWE+GEbmFdJr8-_2J4Mgfw@mail.gmail.com>
References: <1501758910-3488-1-git-send-email-yamada.masahiro@socionext.com>
 <cae2ec7d-5f57-3e4f-7688-5a1523c66b82@arm.com> <CAK7LNAR=t2=6LbmFKUhSD-ttfxVcyOy6Qy=kj7hsFftDFWqmzQ@mail.gmail.com>
 <43777e45-c002-95b8-3b15-d57680f320ec@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <43777e45-c002-95b8-3b15-d57680f320ec-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Masami Hiramatsu <mhiramat-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Marc,


2017-08-07 22:36 GMT+09:00 Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>:
> On 07/08/17 12:59, Masahiro Yamada wrote:
>> Hi Marc,
>>
>> Thanks for your comments.
>>
>>
>> 2017-08-07 19:43 GMT+09:00 Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>:
>>> On 03/08/17 12:15, Masahiro Yamada wrote:
>>>> UniPhier SoCs contain AIDET (ARM Interrupt Detector).  This is intended
>>>> to provide additional features that are not covered by GIC.  The main
>>>> purpose is to provide logic inverter to support low level and falling
>>>> edge trigger type for interrupt lines from on-board devices.
>>>>
>>>> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>


Thanks.  I will send v2 based on your comments.



If possible, could you help me with my GPIO driver?

I implemented a similar IRQ domain hierarchy handling in the driver.

This patch:
http://patchwork.ozlabs.org/patch/797145/


If I am understanding correctly, the IRQ mapping to the parent
must be somehow hard-coded in the .alloc() hook of irq_domain_ops.

I asked a question in the following.
https://lkml.org/lkml/2017/7/6/758


I do not have a solution to get the IRQ info from "interrupts" property,
so I am hard-coding it in the driver.

-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
