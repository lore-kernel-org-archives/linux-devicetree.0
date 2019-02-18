Return-Path: <SRS0=BtNw=QZ=gmail.com=marek.vasut@kernel.org>
Subject: Re: [PATCH] regulator: gpio: Reword the binding document
References: <20190216174859.15738-1-marek.vasut@gmail.com>
 <E1gv6SG-0000Jv-KB@stardust.g4.wien.funkfeuer.at>
 <83550921-b0ec-fa34-b120-2dd159f256d8@gmail.com>
 <E1gvNOx-0000Kc-Dc@stardust.g4.wien.funkfeuer.at>
 <75846117-242c-6861-ace5-dccf88711208@gmail.com>
 <E1gvSbw-0000K8-Hj@stardust.g4.wien.funkfeuer.at>
 <7a993282-9137-caf4-ca0b-b2c01ea9959c@gmail.com>
 <E1gvfnE-0000Il-Jo@stardust.g4.wien.funkfeuer.at>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <e2e9e577-b110-fc9b-c129-26f61e862fb4@gmail.com>
Date: Mon, 18 Feb 2019 19:58:09 +0100
MIME-Version: 1.0
In-Reply-To: <E1gvfnE-0000Il-Jo@stardust.g4.wien.funkfeuer.at>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Harald Geyer <harald@ccbib.org>
Cc: devicetree@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 2/18/19 11:04 AM, Harald Geyer wrote:

[...]

>>>>>>> IIRC the regulator
>>>>>>> core automatically selects the lowest voltage/current compatible with
>>>>>>> all consumers. It seems the only usecase is to specify an initial
>>>>>>> state that is different from all states in the "states" property, before
>>>>>>> the regulator is turned on for the first time. However it also is not
>>>>>>> an off-state, because it won't be set again on turning the regulator off.
>>>>>>
>>>>>> Correct, this is not an off state. If you have a better wording, I am
>>>>>> open to that.
>>>>>
>>>>> I think it should be clearer that this is an array. (Looking at various
>>>>> users I doubt everybody was aware of that, but since we have only instances
>>>>> with one gpio, there is no functional difference between array and bit field.)
>>>>> Also it should be recommended to set this to match whatever the bootloader
>>>>> sets up. Maybe something like:
>>>>>
>>>>> - gpios-states: Array of GPIOs values set during probing the regulator.
>>>>> 		0: LOW, 1: HIGH. If continuous operation during boot is
>>>>> 		desired, this needs to match what the firmware or bootloader
>>>>> 		sets up. By default all GPIOs are set to low during probing.
>>>>
>>>> gpios-states has nothing to do with continuous operation, that's what
>>>> enable-gpios is for, we should not confuse the readers with it.
>>>
>>> I think we have some misunderstanding here, because I don't see how
>>> enable-gpios is relevant. Also maybe I still haven't understood the
>>> usecase, but IMO that indicates, that it should be cleared up in
>>> the document.
>>
>> The enable-gpios property is what turns the regulator ON/OFF , the
>> gpio-states is what selects the output voltage/current . Thus, I think
>> we should not mention "continuous operation" in the description.
> 
> Okay, I see where you are coming from. Yes, gpios-states is only part
> of what is required for continuous operation during boot. Still it seems
> to be the only realistic usecase, we have come up so far. (Also in
> existing DTs it seems to be used mostly with "boot-on" regulators.)

Consider eMMC bus voltage switch, which only selects between 3V3 and 1V8
. It has nothing to do with continuous operation, it just selects one
voltage level or the other.

So what about

gpios-states : Initial state of GPIO pins in "gpios" array, set on
system start and retained until consumer changes the state. 0: LOW, 1:
HIGH. Default is LOW if nothing else is specified.

> Maybe we can word it better then I did above, but I think mentioning
> this helps a lot to make it clearer how an implementation must behave
> if this property is present.
> 
>>>> Also
>>>> note that "probing" is OS specific, so we should use "default" instead.
>>>> What about this:
>>>
>>>> gpios-states		: Array of initial states of GPIO pins in "gpios" array.
>>>> 0: LOW, 1: HIGH. Default is LOW if nothing else is specified.
>>>
>>> "initial" is a bit too unspecific IMO.
>>
>> Well, got any better idea ? It's not "default" either.
> 
> Yes, it's difficult - which is why I cheated above and described what the
> linux implementation does instead of describing it in general terms.
> If the semantics of this property are too unclear to unambiguously
> describe in an implementation indepenent way, then that's a point in
> favor of marking this property deprecated and let whoever actually
> needs it come up with something better.

We still need to support it though, due to older DTs, so we should make
it clear what it does.

>>> I believe this description doesn't define behaviour sufficiently and a
>>> future rewrite (or reimplementation for a different OS) is likely to
>>> interpret it in an incompatible way. I think one could even argue that
>>> completely ignoring this property and just setting up a valid state from
>>> "states" is allowed behaviour. This would likely break existing DTs, where
>>> among other things this regulator is used to set the CPU's voltage.
>>
>> I suspect ignoring this property, when it's present, wouldn't be a good
>> idea. After all, it adds additional information about the behavior of
>> the system upon start up.
> 
> Yes, it wouldn't be good, because it likely causes breakage. No, I don't
> think it adds much additional information, because it is too unclear.
> 
>> btw I am rewording it exactly because there was a recent breakage in the
>> regulator code.
> 
> Yeah, thanks for that. Your patch is an improvement and shouldn't be
> held back because it doesn't address the other problems discussed above.

I am hoping maybe someone who's actually native english speaker can help
out with the fine wording.

-- 
Best regards,
Marek Vasut
