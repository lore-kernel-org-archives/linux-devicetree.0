Return-Path: <SRS0=C7D/=QX=gmail.com=marek.vasut@kernel.org>
Subject: Re: [PATCH] regulator: gpio: Reword the binding document
References: <20190216174859.15738-1-marek.vasut@gmail.com>
 <E1gv6SG-0000Jv-KB@stardust.g4.wien.funkfeuer.at>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <83550921-b0ec-fa34-b120-2dd159f256d8@gmail.com>
Date: Sat, 16 Feb 2019 22:37:37 +0100
MIME-Version: 1.0
In-Reply-To: <E1gv6SG-0000Jv-KB@stardust.g4.wien.funkfeuer.at>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Harald Geyer <harald@ccbib.org>
Cc: devicetree@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 2/16/19 9:20 PM, Harald Geyer wrote:
> marek.vasut@gmail.com writes:
>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>>
>> Reword the binding document to make it clear how the propeties work
>> and which properties affect which other properties.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>> Cc: Harald Geyer <harald@ccbib.org>
>> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Mark Brown <broonie@kernel.org>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: linux-renesas-soc@vger.kernel.org
>> To: devicetree@vger.kernel.org
>> ---
>> Note: The recent gpio-regulator rework caused breakage. While the
>>       changes in the gpio-regulator code were according to the DT
>>       binding document, they stopped working with older DTs. Make
>>       the binding document clearer to prevent such breakage in the
>>       future.
>> ---
>>  .../bindings/regulator/gpio-regulator.txt     | 23 +++++++++++++------
>>  1 file changed, 16 insertions(+), 7 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/regulator/gpio-regulator.txt b/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
>> index 1f496159e2bb..acca13c1eaf3 100644
>> --- a/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
>> +++ b/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
>> @@ -4,16 +4,25 @@ Required properties:
>>  - compatible		: Must be "regulator-gpio".
>>  - regulator-name	: Defined in regulator.txt as optional, but required
>>  			  here.
>> -- states		: Selection of available voltages and GPIO configs.
>> -                          if there are no states, then use a fixed regulator
>> +- states		: Selection of available voltages/currents provided by
>> +			  this regulator and matching GPIO configurations to
>> +			  achieve them. If there are no states in the "states"
>> +			  array, use a fixed regulator instead.
>>  
>>  Optional properties:
>> -- enable-gpio		: GPIO to use to enable/disable the regulator.
>> -- gpios			: GPIO group used to control voltage.
>> -- gpios-states		: gpios pin's initial states array. 0: LOW, 1: HIGH.
>> -			  defualt is LOW if nothing is specified.
>> +- enable-gpio		: GPIO used to enable/disable the regulator.
>> +			  Warning, the GPIO phandle flags are ignored and the
>> +			  GPIO polarity is controlled solely by the presence
>> +			  of "enable-active-high" DT property. This is due to
>> +			  compatibility with old DTs.
>> +- enable-active-high	: Polarity of "enable-gpio" GPIO is active HIGH.
>> +			  Default is active LOW.
>> +- gpios			: Array of one or more GPIO pins used to select the
> 
> I think this must be a required property.

I'd say I agree, unless there's some obscure ancient edge case, which I
didn't find.

>> +			  regulator voltage/current listed in "states".
>> +- gpios-states		: Initial state of GPIO pins in "gpios" array.
>> +			  0: LOW, 1: HIGH.
>> +			  Default is LOW if nothing else is specified.
> 
> This is not very clear. Maybe add an example below or explain it better.
> 
> I guess we can't change it now anymore anyway, but it's not clear to
> me, why we have this in the first place: A regulator should only be
> active when it has a consumer or is "always-on".

Be careful here, the regulator-gpio may be instantiated such that it
will select between two voltage states, neither of which is 0V/off.
Consider eMMC vccq supply, which alternates between 1V8 and 3V3, but
does not have a third, 0V/off state (unless you pull the plug).

> IIRC the regulator
> core automatically selects the lowest voltage/current compatible with
> all consumers. It seems the only usecase is to specify an initial
> state that is different from all states in the "states" property, before
> the regulator is turned on for the first time. However it also is not
> an off-state, because it won't be set again on turning the regulator off.

Correct, this is not an off state. If you have a better wording, I am
open to that.

>>  - startup-delay-us	: Startup time in microseconds.
> 
> Not relevant for your patch, but I wonder why this is not in the
> generic regulator binding.

Presumably because it's implemented only be the gpio regulator driver,
however it could be moved into the core (?)

>> -- enable-active-high	: Polarity of GPIO is active high (default is low).
>>  - regulator-type	: Specifies what is being regulated, must be either
>>  			  "voltage" or "current", defaults to voltage.
> 
> HTH,
> Harald
> 


-- 
Best regards,
Marek Vasut
