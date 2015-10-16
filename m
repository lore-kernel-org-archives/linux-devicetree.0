From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] DT: nvmem: Add NXP LPC18xx EEPROM memory binding documentation
Date: Fri, 16 Oct 2015 19:09:23 +0200
Message-ID: <CAGhQ9VzaqiUm0=vpBYKpppsTsLuhxmAKayi5N4FTXmG5dtiAhw@mail.gmail.com>
References: <1445004426-6271-1-git-send-email-ariel@vanguardiasur.com.ar>
	<1445004426-6271-3-git-send-email-ariel@vanguardiasur.com.ar>
	<CAAEAJfAAUWd9y8EBfV0irbRF_7EjxD1ycdPcNGScbs6oPxp4JQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAEAJfAAUWd9y8EBfV0irbRF_7EjxD1ycdPcNGScbs6oPxp4JQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Cc: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 16 October 2015 at 17:41, Ezequiel Garcia
<ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org> wrote:
> +DT bindings maintainers
>
> As per the documentation in
> Documentation/devicetree/bindings/submitting-patches.txt
> this binding should be patch 1/2.
>
> On 16 October 2015 at 11:07, Ariel D'Alessandro
> <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org> wrote:
>> Add the devicetree binding document for NXP LPC18xx EEPROM memory.
>>
>> Signed-off-by: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
>> ---
>>  .../devicetree/bindings/nvmem/lpc18xx_eeprom.txt   | 26 ++++++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/nvmem/lpc18xx_eeprom.txt
>>
>> diff --git a/Documentation/devicetree/bindings/nvmem/lpc18xx_eeprom.txt b/Documentation/devicetree/bindings/nvmem/lpc18xx_eeprom.txt
>> new file mode 100644
>> index 0000000..372ff8c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/nvmem/lpc18xx_eeprom.txt
>> @@ -0,0 +1,26 @@
>> +* NXP LPC18xx EEPROM memory NVMEM driver
>> +
>> +Required properties:
>> +  - compatible: Should be "nxp,lpc1850-eeprom"
>
> Correct me if I'm wrong, but I believe not all LPC18xx/43xx devices
> have an EEPROM.
>
> Isn't it restricted to LPC18x7/LPC43x7 devices?

The EEPROM can only be found on Flash devices. Flashless devices
doesn't have the EEPROM.


> Should the compatible be nxp,lpc1857-eeprom to avoid confusion?

Yes, please. The EEPROM doesn't exist on LPC1850 so please use the
compatibility string from Ezequiel.


regards,
Joachim Eastwood
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
