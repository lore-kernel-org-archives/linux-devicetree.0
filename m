Return-Path: <SRS0=hR+C=RI=gmail.com=marek.vasut@kernel.org>
Subject: Re: [PATCH V2] regulator: gpio: Reword the binding document
References: <20190304194023.10926-1-marek.vasut@gmail.com>
 <E1h16yh-0000OM-5J@stardust.g4.wien.funkfeuer.at>
 <834f8576-73a4-be0f-e322-91601bed5388@gmail.com>
 <E1h1Ce9-0000JA-Rs@stardust.g4.wien.funkfeuer.at>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <4d1cd905-c322-78e5-cb9c-dadba01b0324@gmail.com>
Date: Tue, 5 Mar 2019 20:01:41 +0100
MIME-Version: 1.0
In-Reply-To: <E1h1Ce9-0000JA-Rs@stardust.g4.wien.funkfeuer.at>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Harald Geyer <harald@ccbib.org>
Cc: devicetree@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 3/5/19 5:10 PM, Harald Geyer wrote:
> Marek Vasut writes:
>> On 3/5/19 11:07 AM, Harald Geyer wrote:
>>> marek.vasut@gmail.com writes:
>>>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>>
>>>> Reword the binding document to make it clear how the propeties work
>>>> and which properties affect which other properties.
>>>>
>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>> Cc: Harald Geyer <harald@ccbib.org>
>>>> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>>> Cc: Linus Walleij <linus.walleij@linaro.org>
>>>> Cc: Mark Brown <broonie@kernel.org>
>>>> Cc: Rob Herring <robh@kernel.org>
>>>> Cc: linux-renesas-soc@vger.kernel.org
>>>> To: devicetree@vger.kernel.org
>>>> ---
>>>> V2: - Make "gpios" a mandatory property
>>>>     - Reword "gpio-states" property description
>>>>     - Change "enable-gpio" to "enable-gpios" to match modern DT rules
>>>> Note: The recent gpio-regulator rework caused breakage. While the
>>>>       changes in the gpio-regulator code were according to the DT
>>>>       binding document, they stopped working with older DTs. Make
>>>>       the binding document clearer to prevent such breakage in the
>>>>       future.
>>>
>>> Thanks for the update. I think it addresses all my concerns except for
>>> one:
>>>
>>>> +- gpios-states	: State of GPIO pins in "gpios" array that is set until
>>>> +			  changed by the first consumer. 0: LOW, 1: HIGH.
>>>> +			  Default is LOW if nothing else is specified.
>>>
>>> I still believe this not true: There is no guarantee that the regulator
>>> core won't change the state of GPIO pins before the first consumer comes
>>> up.
>>
>> Why would it do that ?
> 
> Because the regulator core doesn't know about this driver specific
> property at all. And without any constraints placed by consumers, the
> core is free to choose any state whatsoever at any point in time.

But git grep seems to disagree, see drivers/regulator/gpio-regulator.c:
                    ret = of_property_read_u32_index(np, "gpios-states", i,

The core sets the pins to such a value until the consumer takes over.

>> That would completely invalidate any remaining
>> useful-ness of this property.
> 
> Yes, I believe this property is mostly useless. That's what I want to
> get across with my wording proposal. The remaining usecase, that I can see,
> is when the GPIOs have been setup by the bootloader and we don't want
> to reset them to low during probing (which some OSes might be capable
> of, but linux currently doesn't). Also a state of all GPIOs low might
> be invalid (not in the "states" property), so we shouldn't set all GPIOs
> to low during probing in that case.

I presume the bootloader might even add this property to DT based on the
state in which it leaves the GPIOs in.

> HTH,
> Harald
> 
>>> I still think my proposal describes the property more acurately:
>>> gpios-states : On operating systems, that don't support reading back gpio
>>>                values in output mode (most notably linux), this array
>>>                provides the state of GPIO pins set when requesting them
>>>                from the gpio controller. Systems, that are capable of
>>>                preserving state when requesting the lines, are free to
>>>                ignore this property. 0: LOW, 1: HIGH. Default is LOW if
>>>                nothing else is specified.
>>>
>>> Since we had this discussion already in the V1 thread and you clearly don't
>>> agree with me, the maintainers will need to decide. You can add 
>>> Reviewed-by: Harald Geyer <harald@ccbib.org>
>>> once Rob and/or Mark have addressed this issue.
>>
>> I think we're just looking at this from two different perspectives and
>> for whatever reason can't reconcile them.
>>
>>> Thanks for your work!
>>> Harald
>>>
>>
>>
>> -- 
>> Best regards,
>> Marek Vasut
> 


-- 
Best regards,
Marek Vasut
