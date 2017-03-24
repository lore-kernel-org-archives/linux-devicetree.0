From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] extcon: usb-gpio: Add level trigger support
Date: Fri, 24 Mar 2017 07:41:09 -0500
Message-ID: <CAL_JsqLOHP5fVcJDf+aMWFmPSHiBnHHfcPm4xu1CZJjWo9GtdQ@mail.gmail.com>
References: <CGME20170320080127epcas1p120786738dd2e3cd371bf6410d5f2b3a6@epcas1p1.samsung.com>
 <0db99bd509c94ea8a80f633022d15235a99391a9.1489995966.git.baolin.wang@linaro.org>
 <58D4FE1D.9040404@samsung.com> <CAMz4kuJrUtC6HL0Lbuqsoa2cMB9-2zuHMii1v7Y_-jCyKiL8qQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMz4kuJrUtC6HL0Lbuqsoa2cMB9-2zuHMii1v7Y_-jCyKiL8qQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linaro Kernel Mailman List <linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 24, 2017 at 6:56 AM, Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Hi,
>
> On 24 March 2017 at 19:08, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>> Hi,
>>
>> On 2017년 03월 20일 16:59, Baolin Wang wrote:
>>> Now extcon-usb-gpio only supports for GPIO egdge trigger, but VBUS/ID
>>> gpios' detection can be triggered by the level trigger on some platforms.
>>> Thus intoduce one property 'extcon-gpio,level-trigger' to identify this
>>> situation.
>>>
>>> Signed-off-by: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> ---
>>>  .../devicetree/bindings/extcon/extcon-usb-gpio.txt |    3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt b/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
>>> index dfc14f7..191504b 100644
>>> --- a/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
>>> +++ b/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
>>> @@ -9,6 +9,9 @@ Required properties:
>>>  Either one of id-gpio or vbus-gpio must be present. Both can be present as well.
>>>  - id-gpio: gpio for USB ID pin. See gpio binding.
>>>  - vbus-gpio: gpio for USB VBUS pin.
>>> +- extcon-gpio,level-trigger: Boolean, set this gpio's interrupt flag to
>>
>> It is 'extcon-usb-gpio' instead of 'extcon-gpio'.
>
> Sure.

"extcon-gpio" is not a vendor, so don't make it a vendor prefix.

>>> +level trigger. If not specified defaults to false, gpio's interrupt flag
>>> +defaults to edge trigger.
>>
>> I understand why you need the new flag.
>> But, I'm not sure it is right way to add the new flag for interrupt flag.
>>
>> IMHO, I think that we need to find the more proper way to get the interrupt flag
>> or maybe, we may need to implement the new helper api to get the interrupt
>> flag for gpio pin when we use the gpio as the interrupt source,
>
> Yes, I agree with you. We already have helper functions to get
> interrupt flag from device tree, but we can not get the irq number of
> GPIO to configure in device tree, then I introduce one new flag to
> indicate the trigger type. But I like to change the patch if there are
> any good suggestion. Thanks.

The extcon binding needs an overhaul in general. I'm not going to take
extensions to a broken binding. What's needed is a USB connector
binding like we have for HDMI and other video connectors. And for
USB-C, those need to be combined.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
