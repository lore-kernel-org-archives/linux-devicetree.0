From: Peter Robinson <pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: dts: bcm2837-rpi-3-b: add GPIO expander
Date: Thu, 4 Jan 2018 03:06:47 +0000
Message-ID: <CALeDE9M2-WXz-zp-7Sx0VbrG7aa16box9oOtRKONXsnokrZEUw@mail.gmail.com>
References: <cover.1514898134.git.baruch@tkos.co.il> <a29df633ee568e150c150debde66c0783a57c70a.1514898134.git.baruch@tkos.co.il>
 <1524381852.182115.1514919793281@email.1und1.de> <804535329.243555.1515010649018@email.1und1.de>
 <3993684b-5b99-6c38-6247-999f7564762b@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3993684b-5b99-6c38-6247-999f7564762b-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Cc: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

>>> Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> hat am 2. Januar 2018 um 20:03
>>> geschrieben:
>>>
>>>
>>> Hi Baruch,
>>>
>>>> Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org> hat am 2. Januar 2018 um 14:19
>>>> geschrieben:
>>>
>>>
>>>> +               expgpio: expgpio {
>>>> +                       compatible = "brcm,bcm2835-expgpio";
>>>> +                       gpio-controller;
>>>> +                       #gpio-cells = <2>;
>>>> +                       firmware = <&firmware>;
>>>
>>>
>>> Please add the gpio-line-names from Eric's patch [1].
>>>
>>> Thanks
>>> Stefan
>>>
>>> [1] - https://patchwork.kernel.org/patch/9339857/
>>>
>>
>> sorry i missed the fact that the same GPIO expander is on the CM3. So
>> please move the exgpio node to bcm2837.dtsi and only define the
>> gpio-line-names in this file.
>
>
> The GPIO expander is not a part of the BCM2837 SoC, and not all
> BCM2837-based Pis have a GPIO expander - see the Pi 2+.

There's two ways that's generally handled upstream, either just
duplicate across the two .dts files or to put it in a separate .dtsi
and include it in the relevant .dts files, see arch/arm/boot/dts/axp*
as relevant examples.

Peter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
