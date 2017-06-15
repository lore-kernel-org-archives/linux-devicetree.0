From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v7 1/9] irqchip: add Amlogic Meson GPIO irqchip driver
Date: Thu, 15 Jun 2017 17:58:54 +0100
Message-ID: <d768717c-b04f-bc55-4ac4-8261a61e95e9@arm.com>
References: <5b352c8d-a426-fa73-58b7-0c935979492b@gmail.com>
 <b33ccc5c-f383-97e7-44e6-d6e1f104e26c@gmail.com>
 <91b20fc4-4969-02a6-cc47-ff711f604342@arm.com>
 <1510ca1c-0a50-283d-42d5-b5710700460f@gmail.com>
 <9129464d-b7b6-a8f6-8671-091fc30e3161@arm.com>
 <c04dce8b-f3b9-e49e-47e8-0b24f3b66974@gmail.com>
 <daddce59-cfe6-a1be-6c04-093dfa146aca@arm.com>
 <92fdf31d-80ea-3b5f-3cfd-cf1f9ed529b9@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <92fdf31d-80ea-3b5f-3cfd-cf1f9ed529b9@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>
List-Id: devicetree@vger.kernel.org

On 15/06/17 17:37, Heiner Kallweit wrote:
> Am 15.06.2017 um 18:04 schrieb Marc Zyngier:
>> On 15/06/17 16:24, Heiner Kallweit wrote:
>>> Am 15.06.2017 um 15:27 schrieb Marc Zyngier:
>>>> On 15/06/17 14:10, Heiner Kallweit wrote:
>>>>> Am 13.06.2017 um 10:31 schrieb Marc Zyngier:
>>>>>> On 10/06/17 22:57, Heiner Kallweit wrote:
>>>>>>> Add a driver supporting the GPIO interrupt controller on certain
>>>>>>> Amlogic meson SoC's.
>>>>>>>
>>>>>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>>>>>> ---
>>>>>>> v5:
>>>>>>> - changed Kconfig entry based on Neil's suggestion
>>>>>>> - added authors
>>>>>>> - extended explanation why 2 * n hwirqs are used
>>>>>>> v6:
>>>>>>> - change DT property parent-interrupts to interrupts
>>>>>>> v7:
>>>>>>> - no changes
>>>>>>> ---
>>>>>>>  drivers/irqchip/Kconfig          |   5 +
>>>>>>>  drivers/irqchip/Makefile         |   1 +
>>>>>>>  drivers/irqchip/irq-meson-gpio.c | 295 +++++++++++++++++++++++++++++++++++++++
>>>>>>>  3 files changed, 301 insertions(+)
>>>>>>>  create mode 100644 drivers/irqchip/irq-meson-gpio.c
>>>>>>>
>>>>>>> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
>>>>>>> index 478f8ace..bdc86e14 100644
>>>>>>> --- a/drivers/irqchip/Kconfig
>>>>>>> +++ b/drivers/irqchip/Kconfig
>>>>>>> @@ -301,3 +301,8 @@ config QCOM_IRQ_COMBINER
>>>>>>>  	help
>>>>>>>  	  Say yes here to add support for the IRQ combiner devices embedded
>>>>>>>  	  in Qualcomm Technologies chips.
>>>>>>> +
>>>>>>> +config MESON_GPIO_INTC
>>>>>>> +	bool
>>>>>>> +	depends on ARCH_MESON
>>>>>>> +	default y
>>>>>>> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
>>>>>>> index b64c59b8..1be482bd 100644
>>>>>>> --- a/drivers/irqchip/Makefile
>>>>>>> +++ b/drivers/irqchip/Makefile
>>>>>>> @@ -76,3 +76,4 @@ obj-$(CONFIG_EZNPS_GIC)			+= irq-eznps.o
>>>>>>>  obj-$(CONFIG_ARCH_ASPEED)		+= irq-aspeed-vic.o
>>>>>>>  obj-$(CONFIG_STM32_EXTI) 		+= irq-stm32-exti.o
>>>>>>>  obj-$(CONFIG_QCOM_IRQ_COMBINER)		+= qcom-irq-combiner.o
>>>>>>> +obj-$(CONFIG_MESON_GPIO_INTC)		+= irq-meson-gpio.o
>>>>>>> diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
>>>>>>> new file mode 100644
>>>>>>> index 00000000..925d00c2
>>>>>>> --- /dev/null
>>>>>>> +++ b/drivers/irqchip/irq-meson-gpio.c
>>>>>>> @@ -0,0 +1,295 @@
>>>>>>> +/*
>>>>>>> + * Amlogic Meson GPIO IRQ chip driver
>>>>>>> + *
>>>>>>> + * Copyright (c) 2015 Endless Mobile, Inc.
>>>>>>> + * Author: Carlo Caione <carlo@endlessm.com>
>>>>>>> + * Copyright (c) 2016 BayLibre, SAS.
>>>>>>> + * Author: Jerome Brunet <jbrunet@baylibre.com>
>>>>>>> + * Copyright (c) 2017 Heiner Kallweit <hkallweit1@gmail.com>
>>>>>>> + *
>>>>>>> + * This program is free software; you can redistribute it and/or
>>>>>>> + * modify it under the terms of the GNU General Public License as
>>>>>>> + * published by the Free Software Foundation, version 2.
>>>>>>> + */
>>>>>>> +
>>>>>>> +#include <linux/device.h>
>>>>>>> +#include <linux/init.h>
>>>>>>> +#include <linux/interrupt.h>
>>>>>>> +#include <linux/irqchip.h>
>>>>>>> +#include <linux/of.h>
>>>>>>> +#include <linux/of_irq.h>
>>>>>>> +#include <linux/of_address.h>
>>>>>>> +#include <linux/regmap.h>
>>>>>>> +
>>>>>>> +#define REG_EDGE_POL		0x00
>>>>>>> +#define REG_PIN_03_SEL		0x04
>>>>>>> +#define REG_PIN_47_SEL		0x08
>>>>>>> +#define REG_FILTER_SEL		0x0c
>>>>>>> +
>>>>>>> +#define REG_EDGE_POL_MASK(x)	(BIT(x) | BIT(16 + (x)))
>>>>>>> +#define REG_EDGE_POL_EDGE(x)	BIT(x)
>>>>>>> +#define REG_EDGE_POL_LOW(x)	BIT(16 + (x))
>>>>>>> +
>>>>>>> +#define MAX_PARENT_IRQ_NUM	8
>>>>>>> +
>>>>>>> +/* maximum number of GPIO IRQs on supported platforms */
>>>>>>> +#define MAX_NUM_GPIO_IRQ	133
>>>>>>
>>>>>> Why aren't these values coming from DT? I bet that a future revision of
>>>>>> the same HW will double these. Or at least, you could match it on the
>>>>>> compatible string.
>>>>>>
>>>>> Alternatively this value can be set to 255. The GPIO source is an 8 bit
>>>>> value with 255 being reserved for "no interrupt source assigned".
>>>>
>>>> Who is reserving it? The HW? Or is that your own defined convention?
>>>>
>>>>> This way we cover all chips based on the same IP.
>>>>
>>>> Why? Where is that 8bit limit coming from?
>>>>
>>> The 8 bit limit is in the HW.
>>>
>>>>> I think what we could gain by introducing an additional DT property
>>>>> (saving a few bytes in the irqdomain mapping table) isn't worth the effort.
>>>>
>>>> It is not about saving or wasting memory. It is about making the driver
>>>> and its binding able to span multiple generation of the HW without too
>>>> much churn. Which is why I'm suggesting that you either define these
>>>> properties in DT *or* match the compatible string to obtain these values.
>>>>
>>>>>>> +
>>>>>>> +/*
>>>>>>> + * In case of IRQ_TYPE_EDGE_BOTH we need two parent interrupts, one for each
>>>>>>> + * edge. That's due to HW constraints.
>>>>>>> + * We use format 2 * GPIO_HWIRQ +(0|1) for the hwirq, so we can have one
>>>>>>> + * GPIO_HWIRQ twice and derive the GPIO_HWIRQ from hwirq by shifting hwirq
>>>>>>> + * one bit to the right.
>>>>>>
>>>>>> Please expand on how you expect this to work, specially when a random
>>>>>> driver expects a single interrupt.
>>>>>>
>>>>> The gpio interrupt controller in this chip doesn't have native support for
>>>>> IRQ_TYPE_EDGE_BOTH. As a workaround we would need to assign the same gpio
>>>>> to two parent interrupts, one for each edge.
>>>>
>>>> No, that's horrible, racy, and impractical. It has been proposed in the
>>>> past (for the same HW), and we're not going there again.
>>>>
>>> IIRC what has been proposed before is to re-program the polarity of edge
>>> detection withing the ISR. This would match your concern that it is racy.
>>>
>>> Here it's about using two parent irq's, one programmed to react on the
>>> rising edge whilst the other is triggered in case of falling edge.
>>> Would you consider this to be racy too?
>>
>> How do you reconcile two interrupts to make look like a single one for a
>> random, pre-existing driver?
>>
>> [...]
>>
>>>>>> So you reject EDGE_BOTH? So what's the deal with the beginning of the patch?
>>>>>>
>>>>> We reject it in the initial version of the patch set as there's no consensus
>>>>> yet on some details of the workaround needed for EDGE_BOTH support.
>>>>
>>>> There is a consensus: The HW doesn't support this feature.
>>>>
>>> Means what? There is no acceptable way to support EDGE_BOTH on this HW?
>>> In this case I could stop here as for me this feature is important.
>>
>> Answer my question above, which I asked in my initial review: How do you
>> make two interrupts appear as one for a driver that wants to get
>> signaled on each edge, using the existing API.
>>
> Please see the pinctrl/gpio part of the patch set.
> 
> The GPIO controller has an own IRQ domain. When requesting an interrupt
> in request_resources if needed two parent irq's are allocated, (was removed
> in the current initial version of the patch set) both calling the same ISR
> via a chained interrupt.
> 
> Works perfectly fine here.

Are you referring to the horror that performs interrupt allocations from
within the irq_set_type callback? No way. That's beyond disgusting. And
potentially broken, as the locks that are being taken were never
designed to nest that way.

	M.
-- 
Jazz is not dead. It just smells funny...
