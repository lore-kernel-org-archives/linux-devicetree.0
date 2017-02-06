From: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH 6/8] Documentation: dt: Add new compatible to STM32
 pinctrl driver bindings
Date: Mon, 6 Feb 2017 12:21:44 +0100
Message-ID: <c1c5ca2b-3fc1-6077-87b3-4c815b7469d0@st.com>
References: <1485533721-9019-1-git-send-email-alexandre.torgue@st.com>
 <1485533721-9019-7-git-send-email-alexandre.torgue@st.com>
 <20170201150609.cbhwon76m6igmhyh@rob-hp-laptop>
 <abee01c1-da4f-97b4-258a-3ab937f620eb@st.com>
 <CACRpkdb=U+UMRqR2GKGwDzk9X_nLv0tf2dZ8LhDGceAD83LKag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdb=U+UMRqR2GKGwDzk9X_nLv0tf2dZ8LhDGceAD83LKag-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 02/06/2017 09:46 AM, Linus Walleij wrote:
> On Wed, Feb 1, 2017 at 4:58 PM, Alexandre Torgue
> <alexandre.torgue-qxv4g6HH51o@public.gmane.org> wrote:
>> On 02/01/2017 04:06 PM, Rob Herring wrote:
>>>
>>> On Fri, Jan 27, 2017 at 05:15:19PM +0100, Alexandre TORGUE wrote:
>>>>
>>>> Add new compatible for stm32f469 MCU.
>>>>
>>>> Signed-off-by: Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
>>>>
>>>> diff --git
>>>> a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
>>>> b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
>>>> index 25d9809..4f0487d 100644
>>>> --- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
>>>> +++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
>>>> @@ -9,7 +9,8 @@ Pin controller node:
>>>>  Required properies:
>>>>   - compatible: value should be one of the following:
>>>>     (a) "st,stm32f429-pinctrl"
>>>> -   (b) "st,stm32f746-pinctrl"
>>>> +   (b) "st,stm32f469-pinctrl"
>>>> +   (c) "st,stm32f746-pinctrl"
>>>
>>>
>>> Drop the a,b,c. Otherwise, you'll be changing a bunch of lines every
>>> time.
>>
>>
>> I completely agree.
>>
>> Linus, Do i need to send a v2 for this patch ?
>
> Nopes, applied the amended v1 patch already with these
> changes, check the result.

Thanks Linus!

>
> Yours,
> Linus Walleij
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
