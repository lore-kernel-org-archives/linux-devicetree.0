From: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 08/15] irqchip: bcm7120-l2: Eliminate bad IRQ check
Date: Thu, 30 Oct 2014 12:24:02 -0700
Message-ID: <CAJiQ=7BekWsmcDfQ-oKXAza_pEXHNFCQAisvo2m+D7Km2t_meQ@mail.gmail.com>
References: <1414635488-14137-1-git-send-email-cernekee@gmail.com>
 <1414635488-14137-9-git-send-email-cernekee@gmail.com> <54521C65.8060603@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54521C65.8060603-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Paul Mundt <lethal-M7jkjyW5wf5g9hUCZPvPmw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Bizon <mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Linux MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 30, 2014 at 4:09 AM, Sergei Shtylyov wrote:
>> diff --git a/drivers/irqchip/irq-bcm7120-l2.c
>> b/drivers/irqchip/irq-bcm7120-l2.c
>> index b9f4fb8..49d8f3d 100644
>> --- a/drivers/irqchip/irq-bcm7120-l2.c
>> +++ b/drivers/irqchip/irq-bcm7120-l2.c
>
> [...]
>>
>> @@ -51,19 +49,12 @@ static void bcm7120_l2_intc_irq_handle(unsigned int
>> irq, struct irq_desc *desc)
>>         chained_irq_enter(chip, desc);
>>
>>         status = __raw_readl(b->base + IRQSTAT);
>> -
>> -       if (status == 0) {
>> -               do_bad_IRQ(irq, desc);
>> -               goto out;
>> -       }
>> -
>>         do {
>
>
>    I think this needs to now become:
>
>         while (status) {
>
>>                 irq = ffs(status) - 1;
>>                 status &= ~(1 << irq);
>
>
>    In case 'status' is 0, 'irq' will be equal to -1. How does the shift by
> negative value work?
>
>>                 generic_handle_irq(irq_find_mapping(b->domain, irq));
>>         } while (status);

That's a good point.  We need to check for 0 somehow.

This code gets replaced in patch 13/15 anyway, but I'll fix it in the
next round.

Thanks!
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
