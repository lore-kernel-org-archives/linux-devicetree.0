From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 03/12] irqchip: gic: define register_routable_domain_ops
 conditional
Date: Wed, 03 Dec 2014 19:04:29 +0000
Message-ID: <547F5EBD.6040705@arm.com>
References: <1417565531-4507-1-git-send-email-stefan@agner.ch> <1417565531-4507-4-git-send-email-stefan@agner.ch> <5174649.NxPq80uDz8@wuerfel> <alpine.DEB.2.11.1412031303000.16275@nanos> <8eccedc781df2636a132dae449cbe774@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8eccedc781df2636a132dae449cbe774-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sricharan R <r.sricharan-l0cyMroinI0@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Stefan,

On 03/12/14 17:28, Stefan Agner wrote:
> On 2014-12-03 14:04, Thomas Gleixner wrote:
>> On Wed, 3 Dec 2014, Arnd Bergmann wrote:
>>
>>> On Wednesday 03 December 2014 01:12:02 Stefan Agner wrote:
>>>> The inline function register_routable_domain_ops is only usable if
>>>> CONFIG_ARM_GIC is set. Make it depend on this configuration. This
>>>> also allows other SoC interrupt controller to provide such a
>>>> function.
>>>>
>>>> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
>>>
>>> I don't think this is a good idea: either the interface is meant
>>> to be generic and should work with any interrupt controller, or
>>> it is specific to one irqchip and another irqchip should provide
>>> a different interface that has a nonconflicting name.
>>>
>>> I suppose you want the latter here, given that the declaration
>>> is part of the gic specific header file.
>>
>> That routable_domain stuff should have never been invented. In
>> hindsight we should have done the stacked irq domains back then
>> already, but in hindsight ...
> 
> I must admit that my first implementation even used arch_extn (through

I'm glad I didn't see that! ;-)

> the mask/unmask stuff). Then I saw the routable domain stuff, which
> looked more like a fit. But when I realized that only GIC has support
> for that, I soon realized that this might either need a proper
> framework... my hackish NVIC extension probably won't be acceptable...
> 
> Stack-able IRQ domain sounds like exactly what I was looking for...

Like Thomas said, we should have had that ages ago. It solves so many
problems in one go it's mind-boggling. On the down side, we end-up
refactoring *a lot* of the existing code...

>>
>> If you look at the crossbar scheme what we have now:
>>
>>    GIC domain
>> |--------------|
>> |              |---------- private
>> | non routable |---------- peripheral
>> |              |---------- peripheral
>> |              |
>> |--------------|
>> |              |---------- peripheral
>> |   routable   |---------- peripheral
>> |    |         |---------- peripheral
>> |--------------|
>>      |               |----------------|
>>      |-------------->| crossbar magic |
>>                      |----------------|
>>
>> which is not how the hardware looks. The hardware actually looks like
>> this:
>>
>>    GIC domain
>> |--------------|
>> |              |---------- private
>> | non routable |---------- peripheral
>> |              |---------- peripheral
>> |              |
>> |--------------|           |--------------|
>> |              |           |              |---------- peripheral
>> |   routable   |-----------| crossbar     |---------- peripheral
>> |              |           | domain       |---------- peripheral
>> |--------------|           |--------------|
>>
>> So it is completely obvious that the peripheral interrupts which need
>> to be routed through the crossbar belong to a different domain. We
>> really should convert crossbar to that scheme and get rid of the
>> routable domain stuff completely.
>>
>> With vybrid thats not different according to the diagram in the
>> reference manual.
>>
>>   GIC domain
>> |--------------|
>> |              |---------- private
>> | non routable |---------- peripheral
>> |              |---------- peripheral
>> |              |
>> |--------------|           |--------------|
>> |              |           |              |
>> |   routable   |-----------|  IRQ router  |
>> |              |           |  domain      |
>> |              |           |              |
>> |--------------|           |--------------|
>>                            | Shared state |---------- CPU to CPU 
>>   NVIC domain              | and hardware |---------- peripheral
>> |--------------|           |              |---------- peripheral
>> |              |           |--------------|
>> |              |           |              |
>> |   routable   |-----------|  IRQ router  |
>> |              |           |  domain      |
>> |              |           |              |
>> |--------------|           |--------------|
>> |              |
>> |              |---------- private
>> | non routable |---------- peripheral
>> |              |---------- peripheral
>> |--------------|
>>
>> The routable domain stuff is just an adhoc redirector which must be
>> tied to a particular base irq chip implementation (i.e. GIC). With
>> stacked irq domains there is no dependency on the underlying irq
>> chip. No ifdeffery, nothing. So you can use the same router domain
>> implementation for both the A5 and the M4 side.
>>
>> On the A5 side the router domain has the gic domain as parent and on
>> the M4 side the nvic domain.
>>
>> The shared interrupts are allocated through the router domain which
>> decides whether the interrupt can be assigned to a particular core or
>> not. If it can be assigned it allocates the corresponding interrupt in
>> the parent domain, sets up the routing and everything just works.
> 
> What do you mean by the shared state in the drawing above? Currently, I
> check whether a interrupt is already used by the other core by reading
> the register (do this configuration register reflect the "shared state"
> in your drawing?).

I think that is basically it. It should only be the register that
decides on the actual routing. BTW, how do you arbitrate between
concurrent accesses to this register? Or is only the A5 allowed to
change it?

> 
>>
>> See:
>> http://git.kernel.org/cgit/linux/kernel/git/tip/tip.git/log/?h=irq/irqdomain-arm
>>
> 
> Thanks for the link. So my work would involve to support domain
> hierarchy for NVIC (proper irq_domain_ops, introduce arm,routable-irqs
> property, anything else?) and then make use of the hierarchy code in my
> MSCM driver like for instance the mtk-sysirq driver...?

I don't think we need the arm,routable-irq property at all, and I'm
looking at refactoring the crossbar thingy to remove most of its
entanglement with the GIC.

All you need to know is the range of interrupts you're allowed to
request through the "routable" domain. The inner-most irqchip shouldn't
even know about it (after all, they are just wires coming in). It should
be the duty of the outer-most irqchip (the "router") to generate the
correct request to the GIC/NVIC. So all the knowledge should be at the
router level.

The mtk-sysrq code is indeed a good example of what you can do.

> What is the state of the IRQ domain hierarchy, when will it go upstream?

Scheduled for 3.19, if everything goes according to plan. Don't think we
can go back anyway... ;-)

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
