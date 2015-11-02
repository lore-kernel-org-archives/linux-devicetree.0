From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v5 1/5] Documentation: tps65912: Add DT bindings for the
 TPS65912 PMIC
Date: Mon, 2 Nov 2015 09:15:28 -0600
Message-ID: <56377E10.3010208@ti.com>
References: <1446161922-8755-1-git-send-email-afd@ti.com>
 <1446161922-8755-2-git-send-email-afd@ti.com> <20151030171006.GZ4058@x1>
 <5633B078.7080209@ti.com> <20151030190622.GN4058@x1>
 <5633C31E.5030408@ti.com> <20151102091721.GU4058@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151102091721.GU4058@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/02/2015 03:17 AM, Lee Jones wrote:
> On Fri, 30 Oct 2015, Andrew F. Davis wrote:
>
>> On 10/30/2015 02:06 PM, Lee Jones wrote:
>>> On Fri, 30 Oct 2015, Andrew F. Davis wrote:
>>>
>>>> On 10/30/2015 12:10 PM, Lee Jones wrote:
>>>>> On Thu, 29 Oct 2015, Andrew F. Davis wrote:
>>>>>
>>>>>> The TPS65912 PMIC contains several regulators and a GPIO controller.
>>>>>> Add bindings for the TPS65912 PMIC.
>>>>>>
>>>>>> Signed-off-by: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
>>>>>> ---
>>>>>>   .../devicetree/bindings/gpio/gpio-tps65912.txt     | 16 +++++++
>>>>>
>>>>> Why have you dropped Linus' Review-by?
>>>>>
>>>>
>>>> Strange, I thought I made a change to this. Well this brings up a question,
>>>> how much change can we have before we are supposed to drop Reviewed/Acked-by?
>>>
>>> Common sense call I'm afraid. ;)
>>>
>>> [...]
>>>
>>>>>> +     the second cell is used to specify flags.
>>>>>> +     See include/dt-bindings/gpio/gpio.h for possible values.
>>>>>
>>>>> This is a Linuxisum and shouldn't really live in here.
>>>>>
>>>>> I think it would be better to document them in ../gpio/gpio.txt and
>>>>> reference that instead.
>>>>>
>>>>
>>>> Looks like that is already in ../gpio/gpio.txt:57
>>>
>>> There is a mention of GPIO_ACTIVE_HIGH, as it's used in an example.
>>> However GPIO_ACTIVE_LOW is missing.  I think both could do with
>>> documenting properly, then you can refer to them from here.
>>>
>>
>> I mean the lines above the example, they say to use the macros
>> defined in include/dt-bindings/gpio/gpio.h whenever possible,
>> that's really all I would say.
>
> Let's at least attempt to stick to the rules.
>
> Please adapt your formatting to <dt-bindings/gpio/gpio.h> in order to
> eradicate any Linuxiness.
>

Works for me, although I pushed v6 a couple days ago with a different
fix, maybe that will work too?

>>> [...]
>>>
>>>>>> +Required properties:
>>>>>> + - compatible : Should be "ti,tps65912".
>>>>>> + - reg : Slave address or chip select number (I2C / SPI).
>>>>>> + - interrupt-parent : The parent interrupt controller.
>>>>>> + - interrupts : The interrupt line the device is connected to.
>>>>>> + - interrupt-controller : Marks the device node as an interrupt controller.
>>>>>> + - #interrupt-cells: The number of cells to describe an IRQ, this should be 2.
>>>>>> +     The first cell is the IRQ number.
>>>>>> +     The second cell is the flags, encoded as the trigger masks from
>>>>>> +     ../interrupt-controller/interrupts.txt
>>>>>
>>>>> Nit: We *normally* treat these as bullet-points and not place
>>>>> full-stops on them:
>>>>>
>>>>> $ git grep "compatible" -- Documentation/devicetree/bindings/ | grep -v "\.$" | wc -l
>>>>> 5227
>>>>> $ git grep "compatible.*\.$" -- Documentation/devicetree/bindings/ | wc -l
>>>>> 486
>>>>>
>>>>
>>>> What about for multi-sentence descriptions, we need the middle full-stops, then to not
>>>> have one on the end seems kinda odd looking.
>>>
>>> That's the way I usually do it -- doesn't look too bad. ;)
>>>
>>> [...]
>>>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
