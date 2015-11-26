From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: Re: [linux-meson] Re: [PATCH v2 3/5] pinctrl: meson: enable GPIO IRQs
Date: Thu, 26 Nov 2015 17:09:55 +0100
Message-ID: <CAOQ7t2YAseprbT29uQX-aKJcEm-b-Dy=jBW8a+Z2kWDyQskNeA@mail.gmail.com>
References: <1448273816-11290-1-git-send-email-carlo@caione.org>
	<1448273816-11290-4-git-send-email-carlo@caione.org>
	<20151124082801.09139a93@arm.com>
	<CAOQ7t2ZUAefL2xuEzAwoQWi3tpu7N7y6krMv1UUzaBT4BYZv4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOQ7t2ZUAefL2xuEzAwoQWi3tpu7N7y6krMv1UUzaBT4BYZv4A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Daniel Drake <drake-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>, Jerry Cao <jerry.cao-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, Victor Wan <victor.wan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 24, 2015 at 10:04 AM, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Nov 24, 2015 at 9:28 AM, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org> wrote:

>> [...]
>>
>>> +     for (i = 0; i < pc->num_gic_irqs; i++) {
>>> +             struct of_phandle_args oirq;
>>> +
>>> +             of_irq_parse_one(node, i, &oirq);
>>> +             irq_of_phandle_args_to_fwspec(&oirq, &pc->gic_irqs[i]);
>>> +
>>> +             pc->irq_map[i] = IRQ_FREE;
>>> +     }
>>
>> The whole thing feels weird. Why do you need to keep a set of fwspecs?
>
> We only have 8 IRQs on the GIC side that we can use for the GPIOs. The
> set of fwspec is used to track these IRQs.
> At probe time we read from the DTS how many and which IRQs are
> reserved on the GIC for the GPIOs. Every time a GPIO IRQ is installed,
> we use one of these IRQ lines.
>
>> All you need is a range of interrupts that would be conveniently
>> represented by a bitmap (assuming your interrupts space is a mostly
>> contiguous range).
>
> I could do that but it feels to me like we end up hiding from the DTS
> some information that naturally should be in there: a pinctrl device
> that is using 8 interrupt lines of its interrupt controller. IMO this
> is not a special case that requires some special treatment.

Marc,
What's your opinion on this? So I can start cooking v3

Thanks,

-- 
Carlo Caione
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
