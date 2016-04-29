From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/9] drivers: irqchip: Add STM32 external interrupts support
Date: Fri, 29 Apr 2016 10:45:14 +0200
Message-ID: <CACRpkdYY-5knOD0NwQjbQwAvhgRc_J5Pa1MWHw-P_7Wt29oEVQ@mail.gmail.com>
References: <1459436979-17275-1-git-send-email-mcoquelin.stm32@gmail.com>
	<1459436979-17275-3-git-send-email-mcoquelin.stm32@gmail.com>
	<CACRpkdaiE1cJM6uq_bQuRS2NJTwniPREBsgwuxEjRjB5yTfc9Q@mail.gmail.com>
	<CALszF6AKS2-SxQKTM-hrVfB2tMZS_21jRx9HtnHVACO1o=1Fgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALszF6AKS2-SxQKTM-hrVfB2tMZS_21jRx9HtnHVACO1o=1Fgw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bruno Herrera <bruherrera-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 19, 2016 at 10:00 AM, Maxime Coquelin
<mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 2016-04-08 11:38 GMT+02:00 Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:

>>         while ((stat = readl_relaxed(vic->base + VIC_IRQ_STATUS))) {
>>                 irq = ffs(stat) - 1;
>>                 handle_domain_irq(vic->domain, irq, regs);
>>                 handled = 1;
>>         }
>>
>>         return handled;
>> }
>
> Indeed, it would be better doing it like this.
> Do you think I could even do this with two nested loops to reduce the
> number of reg accesses?
> It would look like this (just compiled, not tested):
>
> static void stm32_irq_handler(struct irq_desc *desc)
> {
>     struct irq_domain *domain = irq_desc_get_handler_data(desc);
>     struct irq_chip_generic *gc = domain->gc->gc[0];
>     struct irq_chip *chip = irq_desc_get_chip(desc);
>     unsigned long pending;
>     int n;
>
>     chained_irq_enter(chip, desc);
>
>     while ((pending = irq_reg_readl(gc, EXTI_PR))) {
>         for_each_set_bit(n, &pending, BITS_PER_LONG) {
>             generic_handle_irq(irq_find_mapping(domain, n));
>         }
>     }

Looks clever! :)

If it also works, I'm in for it.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
