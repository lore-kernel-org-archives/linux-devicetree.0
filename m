From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v6 2/9] irqchip: add Amlogic Meson GPIO irqchip driver
Date: Fri, 09 Jun 2017 16:30:07 -0700
Message-ID: <m2tw3o4u4g.fsf@baylibre.com>
References: <04378047-4194-bb0f-3da3-e1d62345a86b@gmail.com>
        <89d02a38-7386-fcdc-4dce-ea7e531c90b4@gmail.com>
        <1496999266.3552.61.camel@baylibre.com> <m2vao46ewu.fsf@baylibre.com>
        <702e4608-8592-41fe-b79c-fef985c49be7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <702e4608-8592-41fe-b79c-fef985c49be7@gmail.com> (Heiner
        Kallweit's message of "Sat, 10 Jun 2017 00:30:14 +0200")
Sender: linux-gpio-owner@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>
List-Id: devicetree@vger.kernel.org

Heiner Kallweit <hkallweit1@gmail.com> writes:

> Am 09.06.2017 um 23:15 schrieb Kevin Hilman:
>> Jerome Brunet <jbrunet@baylibre.com> writes:
>> 
>>> On Thu, 2017-06-08 at 21:38 +0200, Heiner Kallweit wrote:
>>>> Add a driver supporting the GPIO interrupt controller on certain
>>>> Amlogic meson SoC's.
>>>>
>>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> 
>> [...]
>> 
>>>> +static unsigned int meson_irq_startup(struct irq_data *data)
>>>> +{
>>>> +	irq_chip_unmask_parent(data);
>>>> +	/*
>>>> +	 * An extra bit was added to allow having the same gpio hwirq twice
>>>> +	 * for handling IRQ_TYPE_EDGE_BOTH. Remove this bit to get the
>>>> +	 * gpio hwirq.
>>>> +	 */
>>>> +	meson_irq_set_hwirq(data, data->hwirq >> 1);
>>>
>>> Please keep in mind that any device can use this controller as irq parent.
>>> It has to make sense, even when not serving the gpio driver.
>>>
>>> This hack means that, in DT, we'd have to multiply by 2 the values given under
>>> section "22.3 GPIO interrupts" of the datasheet. This is an example Linux
>>> specific stuff in DT.
>>> It also means that the controller declares a lot more lines that it really has
>>> ... 
>>>
>>> This is all to accommodate your hack around IRQ_TYPE_BOTH and creating the
>>> mapping from the irq_set_type callback of the GPIO driver, which is still think
>>> should be dropped at this point.
>> 
>> +1
>> 
>> Please drop the hack for IRQ_TYPE_BOTH so we can reach agreement on the
>> basic design and functionality.  The gymnastics required to support this
>> hack (due to broken hardware) are getting in the way of getting basic
>> functionality merged.
>> 
> I haven't heard any feedback on the other proposal yet:
> Always reserve two parent irq's in the request_resources callback,
> then set_type is easy. How about this one?

The feedback is the same: let's consider that after getting the basics
reviewed, accepted and merged.

> Having max. 4 gpio irq's should be a fair price for a cleaner design.

Yuck, but better than no support for both _BOTH I guess.

But again, discussion of hacks for the hardware limitation is getting in
the way discussing and merging the basics.  Let's get the basics right
first, then add functionality.  

I understand it can be rather frustrating to give up features and/or
functionality for having something "clean", but unfortunately, that's
how the upstream linux kernel community has always worked.

Most maintainers prefer clean, well-designed and maintainable code that
comes in small, easily reviewable chunks over something that's difficult
to understand with hacks and workarounds.  Even if that means a limited
feature set initially.

Additional functionality (even if hacky) is much easier to review,
discuss and maintain *later* when it's on top of a starting point that
is clean.

Kevin
