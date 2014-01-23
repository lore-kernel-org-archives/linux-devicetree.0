From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 7/8] ARM: brcmstb: gic: add compatible string for
 Broadcom Brahma15
Date: Thu, 23 Jan 2014 10:26:36 -0800
Message-ID: <CAGVrzcauDKeNM-Tqxt67Km6r6sjqvwe9_ki_GLc9_ZiXOauN8Q@mail.gmail.com>
References: <1390361452-3124-1-git-send-email-marc.ceeeee@gmail.com>
 <1390361452-3124-8-git-send-email-marc.ceeeee@gmail.com> <CAGVrzcbPyaSe0aEHt157kz=quvsrBCPOUriCVG27fJfasa45jg@mail.gmail.com>
 <52E074ED.5000906@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52E074ED.5000906-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc C <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Marc,

2014/1/22 Marc C <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> Hi Florian,
>
>> Do not we also need to update drivers/irqchip/irq-gic.c to look for
>> this compatible property? Alternatively should the example DTS contain
>> the following:
>>
>> compatible = "brcm,brahma-b15-gic", "arm,cortex-a15-gic"?
>
> Patch #8 [1] of this series has the "compatible" string set exactly that way. I was
> following the pattern seen in the other reference DTS files, where "arm,cortex-a15-gic" is
> used as the fall-back.

Ah, I missed that, thanks! How about the CPU compatible property?
AFAIK it is only used by arch/arm/kernel/topology.c, I am not sure if
we have the exact same number to use as the "vanilla" Cortex-A15 here,
or if we should have another number match against "brcm,brahma-b15".
What do you think?

>
> Thanks,
> Marc C
>
> [1] https://lkml.org/lkml/2014/1/21/649
>
> On 01/22/2014 02:40 PM, Florian Fainelli wrote:
>> Hi Marc,
>>
>> 2014/1/21 Marc Carino <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
>>> Document the Broadcom Brahma B15 GIC implementation as compatible
>>> with the ARM GIC standard.
>>>
>>> Signed-off-by: Marc Carino <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> Acked-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> Do not we also need to update drivers/irqchip/irq-gic.c to look for
>> this compatible property? Alternatively should the example DTS contain
>> the following:
>>
>> compatible = "brcm,brahma-b15-gic", "arm,cortex-a15-gic"?
>>
>>> ---
>>>  Documentation/devicetree/bindings/arm/gic.txt |    1 +
>>>  1 files changed, 1 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/gic.txt b/Documentation/devicetree/bindings/arm/gic.txt
>>> index 3dfb0c0..d7409fd 100644
>>> --- a/Documentation/devicetree/bindings/arm/gic.txt
>>> +++ b/Documentation/devicetree/bindings/arm/gic.txt
>>> @@ -15,6 +15,7 @@ Main node required properties:
>>>         "arm,cortex-a9-gic"
>>>         "arm,cortex-a7-gic"
>>>         "arm,arm11mp-gic"
>>> +       "brcm,brahma-b15-gic"
>>>  - interrupt-controller : Identifies the node as an interrupt controller
>>>  - #interrupt-cells : Specifies the number of cells needed to encode an
>>>    interrupt source.  The type shall be a <u32> and the value shall be 3.
>>> --
>>> 1.7.1
>>>
>>
>>
>>
>
>
>



-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
