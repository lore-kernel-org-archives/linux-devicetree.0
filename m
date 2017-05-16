From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 6/6] pintrl: meson: add support for GPIO interrupts
Date: Tue, 16 May 2017 09:54:26 +0200
Message-ID: <4954c4b6-3cb7-3f2e-49dd-9a92359ae6e3@baylibre.com>
References: <36164ed8-aa59-2a77-b7fc-9adce03a2fc1@gmail.com>
 <dc23b800-fe69-8143-6367-d3cd801cd6db@gmail.com>
 <5e6d39fa-8f40-8233-6480-cb8306a4427a@baylibre.com>
 <64a10dd2-a969-0251-b92f-3a1c40533373@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <64a10dd2-a969-0251-b92f-3a1c40533373@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Heiner,

On 05/15/2017 09:00 PM, Heiner Kallweit wrote:
> Am 15.05.2017 um 10:05 schrieb Neil Armstrong:
>> On 05/12/2017 09:14 PM, Heiner Kallweit wrote:
>>> Add support for GPIO interrupts on Amlogic Meson SoC's.
>>>
>>> There's a limit of 8 parent interupts which can be used in total.
>>> Note that IRQ_TYPE_EDGE_BOTH interrupts reserve two parent IRQ's,
>>> one for each edge.
>>>
>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>> ---
>>> v2:
>>> - make the GPIO IRQ controller a separate driver
>>> - several smaller improvements
>>> ---
>>>  drivers/pinctrl/Kconfig                   |   1 +
>>>  drivers/pinctrl/meson/Makefile            |   2 +-
>>>  drivers/pinctrl/meson/pinctrl-meson-irq.c | 367 ++++++++++++++++++++++++++++++
>>
>> Hi Heiner,
>>
>> This code has nothing to do with GPIOs on pinmux handling here, what we figured with Jerome
>> is that this must be an independent IRQ Controller in drivers/irqchip.
>>
> I'm not convinced and would like to hear more opinions on that. I see it like this:
> The driver implements an irqchip, right. But it's not an interrupt controller.
> Due to using GPIOLIB_IRQCHIP the gpio controller now has an own irq domain (one for ao
> and one for periphs GPIO domain). Therefore the gpio-controller now also acts as
> interrupt-controller. And both gpio (and interrupt) controllers just use the irqchip
> exposed by the new driver.
> Last but not least the irqchip can be used with GPIOs only.

In fact it's an interrupt controller since it can mask/unmask and control a singal that
can wake up an interrupt for the ARM Core.

Please look at the STM32 EXTI code, the design is quite similar except they don't have a
dynamic management of links, but fixed ones.
They have a proper independant IRQCHIP driver and a link from the pinctrl driver, and this
should be the right design.
They have a flaw since they do the mapping from the gpio_to_irq, and Linus won't allow
this anymore.

> 
> In the irqchip implementation we need the SoC-specific mapping from GPIO number
> to internal GPIO IRQ number. Having to export this from drivers/pinctrl/meson for use
> under drivers/irqchip most likely would also cause objections.

You won't need, this interrupt controller will take the number either from DT either
from a mapping creating from the pinctrl driver. The link will only be through the
irq subsystem.

> 
> So far my impression is that the very specific way GPIO IRQ's are handled on Meson
> doesn't fit perfectly into the current IRQ subsystem. Therefore the discussion
> about Jerome's version didn't result in the IRQ maintainers stating: do it this way ..
> Having said that most likely every possible approach is going to raise some concerns.

It doesn't fit exactly, but the subsystem can certainly be used to achieve it either by
using all it's capacity or by eventually discussing with the maintainers to adapt it.

Jerome has some hints hot to achieve the pinctrl part with everyone "happy".

> 
>> Please move it and make independent, you should be able to request irqs without any links
>> to the pinmux/gpio since physically the GPIO lines input are always connected to this
>> irq controller, and the pinmux has no impact on the interrupt management here.
>> >From the GPIO-IRQ Controller perspective, the GPIOs are only a number and the pinmux code
>> is only here to make the translation to a specific GPIO to a GPIO-IRQ number.
>>
>> For more chance to have it upstreamed in the right way, we should :
>> 1) Collaborate, we can chat over IRC, maybe Slack, E-mail, skype, forums, ...
>> 2) Push an independent IRQ controller that matches the capacity of the HW
>> 3) Push a link from the pinctrl driver to have the to_gpio_irq mapping done in the right way
>>
>> Jerome spent quite a lot of time and had a chat with the IRQ subsystem maintainers to have s
>> clear image of how this should be implemented, and it would be a good point to actually
>> have a chat with them to elaborate find a strong solution.
>>
> I know and I really appreciate Jerome's work and his discussion with the IRQ maintainers.
> My current attempt was inspired by his work.
> However the discussion last year ended w/o result and the topic of GPIO IRQs has been dead
> since then. And I think discussing approaches works best based on a concrete piece of code.
> Therefore I submitted my version as discussion basis. I didn't expect that everybody would
> be totally happy with it and it would go to mainline unchanged.

Sure, thanks for the work,

> 
>> I'm sorry to say that pushing this code without really understanding how and why will lead to
>> nothing expect frustration from everybody.
>>
> I can only speak for myself: I'm not frustrated and I can live with critical review comments.

Great ! Anyway thanks for your work and I hope this will lead to mainline !

> Regards, Heiner
> 
>> Neil

Neil

[...]
