From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv4 3/5] pinctrl: mvebu: pinctrl driver for 98DX3236 SoC
Date: Fri, 20 Jan 2017 00:19:13 +0100
Message-ID: <42aa88b1-4807-245b-6107-0f1db28679b8@gmail.com>
References: <20170113091222.7132-1-chris.packham@alliedtelesis.co.nz>
 <20170113091222.7132-4-chris.packham@alliedtelesis.co.nz>
 <2fca7ac2-9a88-19b1-28c5-5192b9c4a2bc@gmail.com>
 <9996b6a215f944e1a47fa6239d8de21f@svr-chch-ex1.atlnz.lc>
 <66c205acea6046978bf17e6d8fc1959f@svr-chch-ex1.atlnz.lc>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <66c205acea6046978bf17e6d8fc1959f-5g7mGxlPNYb6GjIOKuZY+ItlCAj8ZROq@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Packham <Chris.Packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Kalyan Kinthada <Kalyan.Kinthada-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 19.01.2017 22:12, Chris Packham wrote:
> On 14/01/17 20:50, Chris Packham wrote:
>> On 13/01/17 22:54, Sebastian Hesselbarth wrote:
>>> On 13.01.2017 10:12, Chris Packham wrote:
>>>> From: Kalyan Kinthada <kalyan.kinthada-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
>>>>
>>>> This pinctrl driver supports the 98DX3236, 98DX3336 and 98DX4251 SoCs
>>>> from Marvell.
>>>>
>>>> Signed-off-by: Kalyan Kinthada <kalyan.kinthada-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
>>>> Signed-off-by: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
>>>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>>> Acked-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>> ---
>>>>
>>>> Notes:
>>>>     Changes in v2:
>>>>     - include sdio support for the 98DX4251
>>>>     Changes in v3:
>>>>     - None
>>>>     Changes in v4:
>>>>     - Correct some discrepencies between binding and driver.
>>>
>>> Well, unfortunately I still see differences between the "gpio" in
>>> the binding and "gpo" in the driver.
>>>
>>> Please go back to that list I sent you yesterday and fix them all.
>>>
>>
>> I think you may have missed my initial reply [1]. Or I have missed your
>> response to it. Long story short "gpo" is intentional because some of
>> those pins can't be used as inputs. But if you still want me to change
>> it I will.
>>
>> [1] - https://lkml.org/lkml/2017/1/12/117
>>
> 
> Did you get a chance to consider this. Do you still want me to change 
> gpo -> gpio given the information above?

Chris,

sorry if I wasn't clear enough. I don't want you to change every gpo
into gpio. All I was referring to is the _difference_ between driver
implementation and device tree binding - and soley resolve that.

So, for the gpo's I see that the binding doc still says "gpio" for the
available functions where the driver expects "gpo".

e.g. the binding has this:

mpp6          6        gpio, sd0(clk), dev(a2)

if you change it to

mpp6          6        gpo, sd0(clk), dev(a2)

both binding and driver are the same, right?

I do understand that the hardware is gp-output only and you correctly
reflected that in the pinctrl driver - but the binding doc does not
reflect that for those mpps in the list.

Did I make it clearer now or am I still missing the point?

Sebastian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
