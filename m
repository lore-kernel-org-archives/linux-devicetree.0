From: Wan ZongShun <mcuos.com-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/6] irqchip: add irqchip driver for nuc900
Date: Fri, 22 Jul 2016 10:37:10 +0800
Message-ID: <CAKT61h9Ohimoc8FVDvR3KL6PNy3tk_Hxkp+fNdNUjvNoyJuApQ@mail.gmail.com>
References: <1466851042-22239-1-git-send-email-vw@iommu.org>
 <8706947.5rzUDVsB2F@wuerfel> <57806E9F.3020407@iommu.org> <7701071.Nr6sCmDkjL@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7701071.Nr6sCmDkjL@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Wan Zongshun <vw-6ukY98dZOFrYtjvyW6yDsg@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

>
>> but I will remove the Macros related to nuc970 and avoid nuc970
>> interrupt using those Macro.
>>
>> But I still need hack this irqs.h like below, since here NR_IRQS defined
>> and it is need for nuc970 irqchip driver.
>>
>> #if !defined(CONFIG_SOC_NUC900)
>> #define NR_IRQS         (IRQ_ADC+1)
>> #else
>> #define NR_IRQS         62
>> #endif
>
> Have you considered using CONFIG_SPARSE_IRQ? That would avoid the need
> for setting NR_IRQS entirely, but may also require more work elsewhere.

Sure, I will refer to your previous nuc900 series patches for SPARSE
IRQ, now I am waiting for rc1 release, and will send v3 patches.

>
>         Arnd



-- 
---
Vincent Wan(Zongshun)
www.mcuos.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
