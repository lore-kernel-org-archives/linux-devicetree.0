From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH 04/12] irqchip: nvic: support routable irq domain ops
Date: Wed, 03 Dec 2014 18:32:22 +0100
Message-ID: <2586ebb42daf66877335adaad4b4d3e6@agner.ch>
References: <1417565531-4507-1-git-send-email-stefan@agner.ch>
 <1417565531-4507-5-git-send-email-stefan@agner.ch>
 <4576226.8jDcZiCptE@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4576226.8jDcZiCptE@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2014-12-03 11:49, Arnd Bergmann wrote:
> On Wednesday 03 December 2014 01:12:03 Stefan Agner wrote:
>> +#ifdef CONFIG_ARM_NVIC
>> +extern const struct irq_domain_ops *nvic_routable_irq_domain_ops;
>> +static inline void __init register_routable_domain_ops
>> +                                       (const struct irq_domain_ops *ops)
>> +{
>> +               nvic_routable_irq_domain_ops = ops;
>> +}
>> +#endif /* CONFIG_ARM_NVIC */
>>
> 
> As you mentioned, this conflicts with the gic specific declaration.
> Why not remove the #ifdef here and rename the function to
> nvic_register_routable_domain_ops() ?
> 
> If that doesn't work, I guess we need something more generic
> and move the routable_irq_domain_ops to some common location.
> 

This would move the ifdef to the MSCM driver code. I thought of having a
generic function to call, no matter what base IRQ chip is used.

Anyway, as tglx suggested in patch 3/12, I will try to use the IRQ
domain hierarchy stuff...

--
Stefan


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
