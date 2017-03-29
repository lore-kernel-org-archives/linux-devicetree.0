From: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] extcon: usb-gpio: Add level trigger support
Date: Wed, 29 Mar 2017 14:08:12 +0800
Message-ID: <CAMz4kuLi0rP7UP93hGZoO2WKTDTA08LQ3jYgL14qoaudV6rW+g@mail.gmail.com>
References: <CGME20170320080127epcas1p120786738dd2e3cd371bf6410d5f2b3a6@epcas1p1.samsung.com>
 <0db99bd509c94ea8a80f633022d15235a99391a9.1489995966.git.baolin.wang@linaro.org>
 <58D4FE1D.9040404@samsung.com> <CAMz4kuJrUtC6HL0Lbuqsoa2cMB9-2zuHMii1v7Y_-jCyKiL8qQ@mail.gmail.com>
 <CAL_JsqLOHP5fVcJDf+aMWFmPSHiBnHHfcPm4xu1CZJjWo9GtdQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLOHP5fVcJDf+aMWFmPSHiBnHHfcPm4xu1CZJjWo9GtdQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linaro Kernel Mailman List <linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 24 March 2017 at 20:41, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Fri, Mar 24, 2017 at 6:56 AM, Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wro=
te:
>> Hi,
>>
>> On 24 March 2017 at 19:08, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>>> Hi,
>>>
>>> On 2017=EB=85=84 03=EC=9B=94 20=EC=9D=BC 16:59, Baolin Wang wrote:
>>>> Now extcon-usb-gpio only supports for GPIO egdge trigger, but VBUS/ID
>>>> gpios' detection can be triggered by the level trigger on some platfor=
ms.
>>>> Thus intoduce one property 'extcon-gpio,level-trigger' to identify thi=
s
>>>> situation.
>>>>
>>>> Signed-off-by: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>> ---
>>>>  .../devicetree/bindings/extcon/extcon-usb-gpio.txt |    3 +++
>>>>  1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.=
txt b/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
>>>> index dfc14f7..191504b 100644
>>>> --- a/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
>>>> +++ b/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
>>>> @@ -9,6 +9,9 @@ Required properties:
>>>>  Either one of id-gpio or vbus-gpio must be present. Both can be prese=
nt as well.
>>>>  - id-gpio: gpio for USB ID pin. See gpio binding.
>>>>  - vbus-gpio: gpio for USB VBUS pin.
>>>> +- extcon-gpio,level-trigger: Boolean, set this gpio's interrupt flag =
to
>>>
>>> It is 'extcon-usb-gpio' instead of 'extcon-gpio'.
>>
>> Sure.
>
> "extcon-gpio" is not a vendor, so don't make it a vendor prefix.

OK.

>
>>>> +level trigger. If not specified defaults to false, gpio's interrupt f=
lag
>>>> +defaults to edge trigger.
>>>
>>> I understand why you need the new flag.
>>> But, I'm not sure it is right way to add the new flag for interrupt fla=
g.
>>>
>>> IMHO, I think that we need to find the more proper way to get the inter=
rupt flag
>>> or maybe, we may need to implement the new helper api to get the interr=
upt
>>> flag for gpio pin when we use the gpio as the interrupt source,
>>
>> Yes, I agree with you. We already have helper functions to get
>> interrupt flag from device tree, but we can not get the irq number of
>> GPIO to configure in device tree, then I introduce one new flag to
>> indicate the trigger type. But I like to change the patch if there are
>> any good suggestion. Thanks.
>
> The extcon binding needs an overhaul in general. I'm not going to take
> extensions to a broken binding. What's needed is a USB connector
> binding like we have for HDMI and other video connectors. And for
> USB-C, those need to be combined.

I am not sure I understand your points correctly, could you elaborate
on how to modify for extcon? Thanks.

--=20
Baolin.wang
Best Regards
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
