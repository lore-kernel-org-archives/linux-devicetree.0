From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/5] pintrl: meson: document GPIO IRQ DT binding
Date: Mon, 15 May 2017 19:31:26 -0500
Message-ID: <CAL_JsqL_6NpCBLtnRgsyuikGCGdGf9ZEFEUyrreGiyrtHszCxQ@mail.gmail.com>
References: <a4ca587b-d3e8-a22d-4d25-289871d2d095@gmail.com>
 <0d835130-7c6c-751c-af15-c2ab69edcb42@gmail.com> <20170512193806.trt7jbvfyygkqard@rob-hp-laptop>
 <b39f1742-0558-beaa-1e06-eed80d644424@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b39f1742-0558-beaa-1e06-eed80d644424-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 12, 2017 at 4:41 PM, Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Am 12.05.2017 um 21:38 schrieb Rob Herring:
>> On Sun, May 07, 2017 at 06:34:09PM +0200, Heiner Kallweit wrote:
>>> Document the DT binding for GPIO IRQ support on Amlogic Meson SoC's.
>>>
>>> This documentation is intentionally not placed under
>>> interrupt-controllers as GPIO IRQ support on these SoC's acts more
>>> like an interrupt multiplexer.
>>>
>>> Signed-off-by: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> ---
>>>  .../bindings/gpio/amlogic,meson-gpio-interrupt.txt | 30 ++++++++++++++++++++++
>>
>> Seems more like an irqchip?
>>
> It is an irq_chip. Would you therefore prefer a different name or another location
> for this binding documentation?

bindings/interrupt-controller

>
>>>  1 file changed, 30 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/gpio/amlogic,meson-gpio-interrupt.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/gpio/amlogic,meson-gpio-interrupt.txt b/Documentation/devicetree/bindings/gpio/amlogic,meson-gpio-interrupt.txt
>>> new file mode 100644
>>> index 00000000..35a052b8
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/gpio/amlogic,meson-gpio-interrupt.txt
>>> @@ -0,0 +1,30 @@
>>> +Amlogic meson GPIO interrupt controller
>>> +
>>> +Meson SoCs contains an interrupt controller which is able watch the SoC pads
>>> +and generate an interrupt on edges or level. The controller is essentially a
>>> +256 pads to 8 GIC interrupt multiplexer, with a filter block to select edge
>>> +or level and polarity. We don't expose all 256 mux inputs because the
>>> +documentation shows that upper part is not mapped to any pad. The actual number
>>> +of interrupt exposed depends on the SoC.
>>> +
>>> +Required properties:
>>> +
>>> +- compatible : should be "amlogic,meson-gpio-interrupt", "syscon".
>>
>> Why syscon?
>>
> Has been removed already in v2 of the patch.
>
>>> +- reg : Specifies base physical address and size of the registers.
>>> +- interrupts : list of GIC interrupts which can be used with the
>>> +           GPIO IRQ multiplexer
>>
>> What about interrupt-controller property?
>>
> This HW is somewhat special, it's more or less a multiplexer between
> 100+ GPIO's and 8 GIC IRQ's. And we have two GPIO domains, both having
> a "gpio-controller".
> It doesn't seem that the "interrupt-controller" property is right here.
> I'd tend to say it should be added to the "gpio-controller" nodes.

I would say an interrupt controller is anything that controls
routing/delivery of interrupts from source to cpu. This certainly
meets that criteria.

You could even use interrupt-map property to statically assign the
sources to parent interrupts.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
