From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 5/7] pinctrl: aramda-37xx: Add irqchip support
Date: Wed, 29 Mar 2017 04:18:19 +0200
Message-ID: <CACRpkdYA9xq3TmW-=0+cxdeBcq6v3HAFf3f5E-FAvUpGZqns3g@mail.gmail.com>
References: <cover.26288667a039bc9f8e62dec2fd6342ded4014d12.1490120798.git-series.gregory.clement@free-electrons.com>
 <0e60fccd7913b83ee53d2921ce8f297927e8b6f3.1490120798.git-series.gregory.clement@free-electrons.com>
 <CACRpkdYv6WDWM60dRMaYfEt50M8N-yLYk2TRguNi78aQtt6X9A@mail.gmail.com>
 <87vaqtadry.fsf@free-electrons.com> <CACRpkdY0DzMGiRTWeS23iCY3Vja9dnXJVaMqOnhJRpBLowfYTA@mail.gmail.com>
 <87mvc5a3hh.fsf@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87mvc5a3hh.fsf-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Victor Gu <xigu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Marcin Wojtas <mw-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, Wilson Ding <dingwei-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Hua Jing <jinghua-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Neta Zur Hershkovits <neta-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 28, 2017 at 4:19 PM, Gregory CLEMENT
<gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>  On mar., mars 28 2017, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

>> What you're doing is mocking around with core irqchip semantics.
>> Is ->mask really supposed to be played around with from the outsid
>> like this?
>
> According to the documentation mask is a "precomputed bitmask for
> accessing the chip registers" and it is exactly the way it is used in
> this driver.
>
> Moreover, currently ->mask is only used by the generic irqchip framework
> and not by the core of the irqchip subsystem. So the mask initialization
> is not done from the oustide but at the same level as the generic
> irqchip which is not used here.

OK excellent, sorry for my ignorance. We should rather point to your driver
as a good example of how to do this. Care to add some few lines of comment
as to what is going on for others that need to do the same?

Actually it would even be good to have something in
Documentation/gpio/driver.txt

>> It has irq_create_mapping(gpiochip->irqdomain, offset); that get
>> called for every IRQ, and that will eventually call irq_of_parse_and_map()
>> if the IRQs are defined in the device tree. (IIRC)
>
> When I followed the functions called I never find a call to
> irq_of_parse_and_map(), the closer things related to device tree I found
> was:
> "virq = irq_domain_alloc_descs(-1, 1, hwirq, of_node_to_nid(of_node),
> NULL);"
> http://elixir.free-electrons.com/source/kernel/irq/irqdomain.c?v=4.11-rc4#L507

I don't know if I'm rambling or what. I'm pretty sure it gets called, maybe
even earlier, like when the DT is parsed for the platform. We have so many
drivers not seemingly needing this, but if your driver needs it, all others
may need to be fixed too.

Can you put a print in irq_of_parse_and_map() and see what happens?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
