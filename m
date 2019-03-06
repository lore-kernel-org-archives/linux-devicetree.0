Return-Path: <SRS0=U7Cm=RJ=gmail.com=marek.vasut@kernel.org>
Subject: Re: [PATCH V2] regulator: gpio: Reword the binding document
References: <20190304194023.10926-1-marek.vasut@gmail.com>
 <E1h16yh-0000OM-5J@stardust.g4.wien.funkfeuer.at>
 <834f8576-73a4-be0f-e322-91601bed5388@gmail.com>
 <E1h1Ce9-0000JA-Rs@stardust.g4.wien.funkfeuer.at>
 <4d1cd905-c322-78e5-cb9c-dadba01b0324@gmail.com>
 <E1h1Hjl-0000Nv-Ri@stardust.g4.wien.funkfeuer.at>
 <89743562-bb2a-de3f-a57b-331f43bf8982@gmail.com>
 <E1h1Rk2-0000NG-Jp@stardust.g4.wien.funkfeuer.at>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <96fe2cd4-c680-31c9-98f2-31a400e6c44b@gmail.com>
Date: Wed, 6 Mar 2019 22:56:35 +0100
MIME-Version: 1.0
In-Reply-To: <E1h1Rk2-0000NG-Jp@stardust.g4.wien.funkfeuer.at>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Harald Geyer <harald@ccbib.org>
Cc: devicetree@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 3/6/19 9:17 AM, Harald Geyer wrote:
> Marek Vasut writes:
>> On 3/5/19 10:36 PM, Harald Geyer wrote:
>>> Marek Vasut writes:
>>>> On 3/5/19 5:10 PM, Harald Geyer wrote:
>>>>> Marek Vasut writes:
>>>>>> On 3/5/19 11:07 AM, Harald Geyer wrote:
>>>>>>> marek.vasut@gmail.com writes:
>>>>>>>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>>>>>>
>>>>>>>> Reword the binding document to make it clear how the propeties work
>>>>>>>> and which properties affect which other properties.
>>>>>>>>
>>>>>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>>>>>> Cc: Harald Geyer <harald@ccbib.org>
>>>>>>>> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>>>>>>> Cc: Linus Walleij <linus.walleij@linaro.org>
>>>>>>>> Cc: Mark Brown <broonie@kernel.org>
>>>>>>>> Cc: Rob Herring <robh@kernel.org>
>>>>>>>> Cc: linux-renesas-soc@vger.kernel.org
>>>>>>>> To: devicetree@vger.kernel.org
>>>>>>>> ---
>>>>>>>> V2: - Make "gpios" a mandatory property
>>>>>>>>     - Reword "gpio-states" property description
>>>>>>>>     - Change "enable-gpio" to "enable-gpios" to match modern DT rules
>>>>>>>> Note: The recent gpio-regulator rework caused breakage. While the
>>>>>>>>       changes in the gpio-regulator code were according to the DT
>>>>>>>>       binding document, they stopped working with older DTs. Make
>>>>>>>>       the binding document clearer to prevent such breakage in the
>>>>>>>>       future.
>>>>>>>
>>>>>>> Thanks for the update. I think it addresses all my concerns except for
>>>>>>> one:
>>>>>>>
>>>>>>>> +- gpios-states	: State of GPIO pins in "gpios" array that is set until
>>>>>>>> +			  changed by the first consumer. 0: LOW, 1: HIGH.
>>>>>>>> +			  Default is LOW if nothing else is specified.
>>>>>>>
>>>>>>> I still believe this not true: There is no guarantee that the regulator
>>>>>>> core won't change the state of GPIO pins before the first consumer comes
>>>>>>> up.
>>>>>>
>>>>>> Why would it do that ?
>>>>>
>>>>> Because the regulator core doesn't know about this driver specific
>>>>> property at all. And without any constraints placed by consumers, the
>>>>> core is free to choose any state whatsoever at any point in time.
>>>>
>>>> But git grep seems to disagree, see drivers/regulator/gpio-regulator.c:
>>>>                     ret = of_property_read_u32_index(np, "gpios-states", i,
>>>>
>>>> The core sets the pins to such a value until the consumer takes over.
>>>
>>> I think we have a misunderstanding of terminology. When I write "regulator
>>> core", I mean the driver independent regulator code. The line you quote
>>> above is part of the gpio-regulator driver and thus not part of what
>>> I call the "regulator core".
>>>
>>> AFAICS the data from the property is only stored in a driver specific
>>> data structure (and not used at all outside of probe) but never passed
>>> to what I call the regulator core.
>>>
>>> Why do you believe there is a guarantee that the value set during
>>> probeing is preserved until a consumer takes over?
>>
>> It is the only sensible behavior and the behavior I see people expect
>> from this property. I presume it solidified in this sort of semi-defined
>> state, so we're stuck with assuming it behaves this way to maintain
>> compatibility.
> 
> Maybe the behaviour you want would be more sensible, but AFAIK it just
> isn't true in general (it might work that way by chance in many cases).
> If people expect this behaviour, it is a misunderstanding of the old wording.
> I'd prefer we don't have to add a quirk to the regulator subsystem to
> cater for a misunderstanding.
> 
> I think, if you really want to go forward with making this behaviour
> officially maintained, then we should first add the code to linux and
> only then add the promise to the binding document. This isn't the scope
> of this patch, so I guess we would need to keep the ambiguous wording as
> it is for now. I believe it is more important for a binding document
> to be correct than to be sensible.
> 
> However I don't think we actually need to go to such extremes: In linux
> we currently have (arm/boot/dts and arm64/boot/dts) 38 uses of this
> property in 29 DTs. All the examples, that I studied in some detail,
> seem to either don't need this property at all or have a usecase that is
> supported by my proposed wording. I don't expect any problems if we just
> document the status quo clearly.

In that case, provide a suggestion how to document this property better?

-- 
Best regards,
Marek Vasut
