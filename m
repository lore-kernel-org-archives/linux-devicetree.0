From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2] irqchip: uniphier-aidet: add UniPhier AIDET irqchip
 driver
Date: Mon, 21 Aug 2017 12:53:00 +0100
Message-ID: <44a166ec-019e-8f84-5469-b095eb4d26fe@arm.com>
References: <1503309663-2742-1-git-send-email-yamada.masahiro@socionext.com>
 <e3b865f5-a779-f176-67ef-9ffac25019d4@arm.com>
 <CAK7LNAS_bTsweGB-WqbSoh8myTET9KW-7oN0FLZTmAf_K317aw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK7LNAS_bTsweGB-WqbSoh8myTET9KW-7oN0FLZTmAf_K317aw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-GB
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Masami Hiramatsu <mhiramat-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 21/08/17 11:54, Masahiro Yamada wrote:

>>> +     /* parent is GIC */
>>> +     parent_fwspec.fwnode = domain->parent->fwnode;
>>> +     parent_fwspec.param_count = 3;
>>> +     parent_fwspec.param[0] = 0;             /* SPI */
>>> +     parent_fwspec.param[1] = hwirq;
>>> +     parent_fwspec.param[2] = IRQ_TYPE_LEVEL_HIGH;   /* properly set later */
>>
>> Why defer it to later? You already have the right information in "type",
>> so you might as well provide it immediately.
> 
> 
> Because .irq_set_type() will set it up
> before the IRQ is really in use.
> 
> 
> If we look gic_irq_domain_alloc() implementation,
> it does not care "type".
> 
> gic_set_type() will manipulate hardware registers.

But that's out of the scope of this driver. Whatever the GIC driver does
(or doesn't), you should pass it the right information.

> Having said that, it shouldn't hurt to set type here.
Exactly.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
