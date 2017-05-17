From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v2 6/6] pintrl: meson: add support for GPIO interrupts
Date: Wed, 17 May 2017 22:36:04 +0200
Message-ID: <3dccae17-f811-bc26-e125-7ff3f0bffa7d@gmail.com>
References: <36164ed8-aa59-2a77-b7fc-9adce03a2fc1@gmail.com>
 <dc23b800-fe69-8143-6367-d3cd801cd6db@gmail.com>
 <5e6d39fa-8f40-8233-6480-cb8306a4427a@baylibre.com>
 <64a10dd2-a969-0251-b92f-3a1c40533373@gmail.com>
 <4954c4b6-3cb7-3f2e-49dd-9a92359ae6e3@baylibre.com>
 <fbaf536e-3416-3c4a-4902-05b56783f9c2@gmail.com>
 <1494976589.2728.6.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1494976589.2728.6.camel@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>
Cc: Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am 17.05.2017 um 01:16 schrieb Jerome Brunet:
> On Tue, 2017-05-16 at 20:31 +0200, Heiner Kallweit wrote:
>> Am 16.05.2017 um 09:54 schrieb Neil Armstrong:
>>> Hi Heiner,
>>>
>>> On 05/15/2017 09:00 PM, Heiner Kallweit wrote:
>>>> Am 15.05.2017 um 10:05 schrieb Neil Armstrong:
>>>>> On 05/12/2017 09:14 PM, Heiner Kallweit wrote:
>>>>>> Add support for GPIO interrupts on Amlogic Meson SoC's.
>>>>>>
>>>>>> There's a limit of 8 parent interupts which can be used in total.
>>>>>> Note that IRQ_TYPE_EDGE_BOTH interrupts reserve two parent IRQ's,
>>>>>> one for each edge.
>>>>>>
>>>>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>>>>> ---
>>>>>> v2:
>>>>>> - make the GPIO IRQ controller a separate driver
>>>>>> - several smaller improvements
>>>>>> ---
>>>>>>  drivers/pinctrl/Kconfig                   |   1 +
>>>>>>  drivers/pinctrl/meson/Makefile            |   2 +-
>>>>>>  drivers/pinctrl/meson/pinctrl-meson-irq.c | 367
>>>>>> ++++++++++++++++++++++++++++++
>>>>>
>>>>> Hi Heiner,
>>>>>
>>>>> This code has nothing to do with GPIOs on pinmux handling here, what we
>>>>> figured with Jerome
>>>>> is that this must be an independent IRQ Controller in drivers/irqchip.
>>>>>
>>>>
>>>> I'm not convinced and would like to hear more opinions on that. I see it
>>>> like this:
>>>> The driver implements an irqchip, right. But it's not an interrupt
>>>> controller.
>>>> Due to using GPIOLIB_IRQCHIP the gpio controller now has an own irq domain
>>>> (one for ao
>>>> and one for periphs GPIO domain). Therefore the gpio-controller now also
>>>> acts as
>>>> interrupt-controller. And both gpio (and interrupt) controllers just use
>>>> the irqchip
>>>> exposed by the new driver.
>>>> Last but not least the irqchip can be used with GPIOs only.
>>>
>>> In fact it's an interrupt controller since it can mask/unmask and control a
>>> singal that
>>> can wake up an interrupt for the ARM Core.
>>>
>>> Please look at the STM32 EXTI code, the design is quite similar except they
>>> don't have a
>>> dynamic management of links, but fixed ones.
>>> They have a proper independant IRQCHIP driver and a link from the pinctrl
>>> driver, and this
>>> should be the right design.
>>> They have a flaw since they do the mapping from the gpio_to_irq, and Linus
>>> won't allow
>>> this anymore.
>>>
>>
>> At first I involve Rob as he also provided feedback regarding the DT part.
>>
>> I had a look at the STM32 EXTI code and it looks very similar to Jerome's
>> version.
>> Actually I'd assume that the first Meson driver attempt was modeled after
>> STM32 EXTI.
> Well, no. EXTI has been merged when I already submitted the RFC for this driver,
> but that's not the point I suppose.
> 
>>
>> As you just mentioned there are at least two issues:
>> 1. The mapping can be requested via gpio_to_irq but it doesn't have to. A
>> driver could
> Maybe you missed it in our previous discussion with Linus but, no you can't
> create mapping in gpio_to_irq. This callback is fast and creating mappings might
> sleep because of the irq_domain mutex
> 
> https://patchwork.ozlabs.org/patch/684208/
> 
My comment was misunderstandable. What I meant was that a driver doesn't have to
use gpio_to_irq to request an interrupt, this can also be done via DT.

>>    also request a GPIO IRQ via DT.
>> 2. Missing is the handling of IRQ_TYPE_EDGE_BOTH which requires the allocation
>> of two
>>    parent interrupts.
>>
>> When looking at the drivers under drivers/irqchip basically all of them
>> implement not
>> only an irqchip but also an IRQ domain. Providing an IRQ domain seems to me to
>> be
>> the main criteria whether something should be considered an interrupt
>> controller
>> (please correct me if this understanding is wrong).
>>
>> The STM32 EXTI drivers seems to me to be unnecessarily complex due to not
>> using
>> GPIOLIB_IRQCHIP. This GPIO framework extension can hide a significant part of
>> the
>> GPIO IRQ complexity.
> I can only speculate regarding the design choice of STM EXTI, but I suppose the
> EXTI controller is independent of the pinmux/gpio subsystem HW wise. It's only
> weakly linked to the gpios, in the way that you have (or can create) a "map"
> between the gpio and the irq line number provided.
> 
> That is also the case for the amlogic gpio-irq. I suppose that's why Neil
> suggested to look at EXTI. That's also why I commented that this should be first
> implemented as an independent controller of the gpio subsys  (so in
> drivers/irqchip)
> 
> You may find it more complex, which is arguable, but it is a more accurate
> representation of the HW.
> 
>>
>> Coming back to my version:
>> The new driver just implements an irqchip, no IRQ domain.
>>  This irqchip then is
>> provided to the IRQ domains bound to the respective gpio controllers (for AO
>> and PERIPHS
>> GPIO domain) - thanks to GPIOLIB_IRQCHIP handling of the IRQ domains comes for
>> free.
>>
>> Adding the interrupt-controller property to the gpio-controller nodes is one
>> thing
>> still missing in my patch series. Then a driver can request a GPIO IRQ also
>> via DT, e.g.:
>>
>> interrupt-parent = <&gpio>;
>> interrupts = <GPIOZ_0 IRQ_TYPE_EDGE_BOTH>;
>>
>> interrupt-parent = <&gpio_ao>;
>> interrupts = <GPIOAO_0 IRQ_TYPE_EDGE_BOTH>;
>>
> 
> Which is also possible in the series, where the controller is gpio-irq device
> itself. This is what the HW provide, so it should be possible. It would be nice
> to have your way working as well, which I think is possible (PSB)
> 
>> Advantage of having an IRQ domain per GPIO controller is being able to to use
>> the GPIO
>> defines as is. Or in other words:
>> GPIOAO_0 and GPIOZ_0 both have the value 0. This works here due to having one
>> IRQ domain
>> per GPIO controller (both using the same new irqchip).
>>
> 
> I think you are onto something. As I told you previously, the problem was to
> create the mappings in pinctrl w/o allocating the parent. I struggled with that
> back in November and I had no time to really get back to it since.
> 
> Creating domains in each gpio controller, w/ all the mapping created at startup,
>   stacked to the domain provided by the driver/irqchip would solve the problem.
> 
> We would just have to call find_mapping in gpio_to_irq, which is fine and
> allocate the parent irq in the request_ressource callback.
> 
In request_resource we don't know the irq type yet (and therefore whether we need
one or wo parent interrupts). IMHO we can't get completely rid of allocating
parents in set_type.

>> And all I had to do is implementing one irq_chip and changing one line in the
>> existing
>> pinctrl driver.
>> Whilst I have to admit that e.g. calling request_irq for a parent irq from the
>> irq_set_type
>> callback may be something people find ugly and hacky.
>>
> The fact is that the HW does not directly support IRQ_EDGE_BOTH. Yes, it would
> be nice to find a way to support it anyway. There two possibilities for it:
> * Change the change the edge type depending on the next expected edge: Marc
> already stated that he is firmly against that. It is indeed not very robust
> * Allocate and deallocate additional parent irq to get secondary irq in
> set_type: This indeed looks hacky, I'd like to get the view of irq maintainers
> on this.
> 
Support for IRQ_TYPE_EDGE_BOTH I'd consider a mandatory feature. It's needed
e.g. by the SD card detection (drivers/mmc/slot-gpio.c).

> 
>> Compared to this implementation the STM32 EXTI drivers needs significantly
>> more data
>> structures, e.g. irqchip + irq domain in the irqchip driver, then hierarchical
>> IRQ domain
>> handling + further irqchip and irq domain + irq domain ops in the pinctrl
>> driver.
> 
> Within reasonable limits, having more or less data, code lines does not make a
> driver better or worse. 
> 
>>
>> Last but not least coming back to the initial talk with Rob about where to
>> best place the
>> DT docu for this irqchip implementation:
>> If acceptable I'd prefer to do it like .e.g in
>> bindings/pinctrl/allwinner,sunxi-pinctrl.txt
>> or bindings/pinctrl/atmel,at91-pio4-pinctrl.txt.
>> There the interrupt-controller properties are documented as part of the
>> pinctrl driver and
>> not separately under bindings/interrupt-controller.
>>
>> Maybe this explains a little bit better why I chose this approach.
>>
>> Rgds, Heiner
>>
>>>>
>>>> In the irqchip implementation we need the SoC-specific mapping from GPIO
>>>> number
>>>> to internal GPIO IRQ number. Having to export this from
>>>> drivers/pinctrl/meson for use
>>>> under drivers/irqchip most likely would also cause objections.
>>>
>>> You won't need, this interrupt controller will take the number either from
>>> DT either
>>> from a mapping creating from the pinctrl driver. The link will only be
>>> through the
>>> irq subsystem.
>>>
>>>>
>>>> So far my impression is that the very specific way GPIO IRQ's are handled
>>>> on Meson
>>>> doesn't fit perfectly into the current IRQ subsystem. Therefore the
>>>> discussion
>>>> about Jerome's version didn't result in the IRQ maintainers stating: do it
>>>> this way ..
>>>> Having said that most likely every possible approach is going to raise
>>>> some concerns.
>>>
>>> It doesn't fit exactly, but the subsystem can certainly be used to achieve
>>> it either by
>>> using all it's capacity or by eventually discussing with the maintainers to
>>> adapt it.
>>>
>>> Jerome has some hints hot to achieve the pinctrl part with everyone "happy".
>>>
>>>>
>>>>> Please move it and make independent, you should be able to request irqs
>>>>> without any links
>>>>> to the pinmux/gpio since physically the GPIO lines input are always
>>>>> connected to this
>>>>> irq controller, and the pinmux has no impact on the interrupt management
>>>>> here.
>>>>>> From the GPIO-IRQ Controller perspective, the GPIOs are only a number
>>>>>> and the pinmux code
>>>>>
>>>>> is only here to make the translation to a specific GPIO to a GPIO-IRQ
>>>>> number.
>>>>>
>>>>> For more chance to have it upstreamed in the right way, we should :
>>>>> 1) Collaborate, we can chat over IRC, maybe Slack, E-mail, skype,
>>>>> forums, ...
>>>>> 2) Push an independent IRQ controller that matches the capacity of the
>>>>> HW
>>>>> 3) Push a link from the pinctrl driver to have the to_gpio_irq mapping
>>>>> done in the right way
>>>>>
>>>>> Jerome spent quite a lot of time and had a chat with the IRQ subsystem
>>>>> maintainers to have s
>>>>> clear image of how this should be implemented, and it would be a good
>>>>> point to actually
>>>>> have a chat with them to elaborate find a strong solution.
>>>>>
>>>>
>>>> I know and I really appreciate Jerome's work and his discussion with the
>>>> IRQ maintainers.
>>>> My current attempt was inspired by his work.
>>>> However the discussion last year ended w/o result and the topic of GPIO
>>>> IRQs has been dead
>>>> since then. And I think discussing approaches works best based on a
>>>> concrete piece of code.
>>>> Therefore I submitted my version as discussion basis. I didn't expect that
>>>> everybody would
>>>> be totally happy with it and it would go to mainline unchanged.
>>>
>>> Sure, thanks for the work,
>>>
>>>>
>>>>> I'm sorry to say that pushing this code without really understanding how
>>>>> and why will lead to
>>>>> nothing expect frustration from everybody.
>>>>>
>>>>
>>>> I can only speak for myself: I'm not frustrated and I can live with
>>>> critical review comments.
>>>
>>> Great ! Anyway thanks for your work and I hope this will lead to mainline !
>>>
>>>> Regards, Heiner
>>>>
>>>>> Neil
>>>
>>> Neil
>>>
>>> [...]
>>>
>>
>>
> 

