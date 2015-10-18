From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] DT: nvmem: Add NXP LPC18xx EEPROM memory binding documentation
Date: Sun, 18 Oct 2015 23:23:54 +0200
Message-ID: <CAGhQ9VzbUz2+n__Y5W=HJ5FAV2Z5pMKgi-Ut662+0n2XuFR0PA@mail.gmail.com>
References: <1445004426-6271-1-git-send-email-ariel@vanguardiasur.com.ar>
	<1445004426-6271-3-git-send-email-ariel@vanguardiasur.com.ar>
	<CAAEAJfAAUWd9y8EBfV0irbRF_7EjxD1ycdPcNGScbs6oPxp4JQ@mail.gmail.com>
	<CAGhQ9VzaqiUm0=vpBYKpppsTsLuhxmAKayi5N4FTXmG5dtiAhw@mail.gmail.com>
	<562145C5.8070507@vanguardiasur.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <562145C5.8070507-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Cc: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 16 October 2015 at 20:45, Ariel D'Alessandro
<ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org> wrote:
> Ezequiel, Joachim, all,
>
> El 16/10/15 a las 14:09, Joachim Eastwood escribi=C3=B3:
>> On 16 October 2015 at 17:41, Ezequiel Garcia
>> <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org> wrote:
>>> +DT bindings maintainers
>>>
>>> As per the documentation in
>>> Documentation/devicetree/bindings/submitting-patches.txt
>>> this binding should be patch 1/2.
>
> I see. I'll modify that.
>
>>>
>>> On 16 October 2015 at 11:07, Ariel D'Alessandro
>>> <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org> wrote:
>>>> Add the devicetree binding document for NXP LPC18xx EEPROM memory.
>>>>
>>>> Signed-off-by: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
>>>> ---
>>>>  .../devicetree/bindings/nvmem/lpc18xx_eeprom.txt   | 26 +++++++++=
+++++++++++++
>>>>  1 file changed, 26 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/nvmem/lpc18x=
x_eeprom.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/nvmem/lpc18xx_eepro=
m.txt b/Documentation/devicetree/bindings/nvmem/lpc18xx_eeprom.txt
>>>> new file mode 100644
>>>> index 0000000..372ff8c
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/nvmem/lpc18xx_eeprom.txt
>>>> @@ -0,0 +1,26 @@
>>>> +* NXP LPC18xx EEPROM memory NVMEM driver
>>>> +
>>>> +Required properties:
>>>> +  - compatible: Should be "nxp,lpc1850-eeprom"
>>>
>>> Correct me if I'm wrong, but I believe not all LPC18xx/43xx devices
>>> have an EEPROM.
>>>
>>> Isn't it restricted to LPC18x7/LPC43x7 devices?
>>
>> The EEPROM can only be found on Flash devices. Flashless devices
>> doesn't have the EEPROM.
>
> Yes, you're right. LPC1850 is wrong, sorry.
> The UM10430 (LPC18xx User Manual) says that LPC18(5|3|2|1)(7|5|3|2)
> parts have flash and that the LPC185x/3x parts with flash also includ=
e
> the 16 kB EEPROM. I'll add this info in a new set of patches v2.
>
>>
>>
>>> Should the compatible be nxp,lpc1857-eeprom to avoid confusion?
>>
>> Yes, please. The EEPROM doesn't exist on LPC1850 so please use the
>> compatibility string from Ezequiel.
>
> OK. I'll fix this. Is there any reason for using lpc1857 instead of a
> different available one?

The lpc1850 was once chosen since it was the device that was
applicable to most peripherals and it is the flashless "top model". So
for peripherals found only on devices with flash use the top model
there; lpc1857. That's the only half good reason I can give.

Note that I have also started to use lpc1857 on the mtd driver for the
internal flash that I am working on.


regards,
Joachim Eastwood
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
