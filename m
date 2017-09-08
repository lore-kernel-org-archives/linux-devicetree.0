From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH v4 2/6] irqdomain: clear trigger type in irq_domain_push_irq()
Date: Sat, 9 Sep 2017 00:09:35 +0900
Message-ID: <CAK7LNARed8aubiOERk_oJSWr_ZFMSdkVuDnZGCgn8Jc2kUA_KA@mail.gmail.com>
References: <1504784522-26841-1-git-send-email-yamada.masahiro@socionext.com>
 <1504784522-26841-3-git-send-email-yamada.masahiro@socionext.com> <a3e38f20-007b-1065-7999-95e2264f2155@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a3e38f20-007b-1065-7999-95e2264f2155-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Masami Hiramatsu <mhiramat-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Marc,


2017-09-07 21:25 GMT+09:00 Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>:
> On 07/09/17 12:41, Masahiro Yamada wrote:
>> Prior to the addition of irq_domain_push_irq(), the hierarchy
>> IRQ domain always allocates IRQs from the outer-most domain.
>> Each irqchip usually calls irq_domain_alloc_irqs_parent(),
>> ascending the topology up to the root irqchip.
>>
>> The brand-new function irq_domain_push_irq() allows us to allocate
>> IRQs for parent domain first, then add a child irq_data to the
>> tail of the chain.
>>
>> For the new use-case, if the parent sets a temporary trigger type,
>> it may differ from the type requested to the outer-most irqchip,
>> then irq_create_fwspec_mapping() warns "type mismatch, failed to map..."
>>
>> Clear the trigger type when a new irq_data is connected to the chain.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
>> ---
>>
>> Changes in v4:
>>   - Newly added
>>
>>
>>  kernel/irq/irqdomain.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
>> index da3e0b6..18d11b9 100644
>> --- a/kernel/irq/irqdomain.c
>> +++ b/kernel/irq/irqdomain.c
>> @@ -1532,6 +1532,9 @@ int irq_domain_push_irq(struct irq_domain *domain, int virq, void *arg)
>>       tail_irq_data->chip = NULL;
>>       tail_irq_data->chip_data = NULL;
>>
>> +     /* clear the trigger type to avoid "type mismatch" error */
>> +     irqd_set_trigger_type(tail_irq_data, IRQ_TYPE_NONE);
>> +
>
> This feels wrong. The initial interrupt hierarchy does have a set
> trigger, because it has been configured already, and switching it to
> NONE is hiding the fact that you're setting it to another, conflicting
> value.
>
> Your new fwspec should have a type that is really compatible with with
> the underlying interrupt, however "temporary". If it is not, you have a
> problem.
>


My motivation is to describe interrupt connection by
DT property, like follows:

interrupts = <48 4>, <49 4>, <50 4>, <51 4>,
        <52 4>, <53 4>, <54 4>, <55 4>,
        <56 4>, <57 4>, <58 4>, <59 4>,
        <60 4>, <61 4>, <62 4>, <63 4>,
        <154 4>, <155 4>, <156 4>, <157 4>,
        <158 4>;


The number of cells is fixed, so I need to
give something as the second parameter.

The "4" may not be a real trigger type,
it is just a temporal value to fill the space.


The device may pass a different trigger type
when it calls gpio_to_irq() && request_irq().
I cannot know the real trigger type until the device is probed.


Having said that, if this is a bad idea,
I will consider a different approach for my GPIO driver.


-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
