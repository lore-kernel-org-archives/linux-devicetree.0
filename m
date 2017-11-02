From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] pinctrl: Add skew-delay pin config and bindings
Date: Thu, 2 Nov 2017 15:32:16 +0100
Message-ID: <CACRpkdZcB9ghYYFSQdTqpuN29DZZeY_AKimQ62-5W7+Mymm1HQ@mail.gmail.com>
References: <20171028133719.27528-1-linus.walleij@linaro.org>
 <20171028133719.27528-2-linus.walleij@linaro.org> <20171101212659.be4phj2wha66x63d@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171101212659.be4phj2wha66x63d@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Janos Laube <janos.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paulius Zaleckas <paulius.zaleckas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 1, 2017 at 10:26 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Sat, Oct 28, 2017 at 03:37:17PM +0200, Linus Walleij wrote:
>> Some pin controllers (such as the Gemini) can control the
>> expected clock skew and output delay on certain pins with a
>> sub-nanosecond granularity. This is typically done by shunting
>> in a number of double inverters in front of or behind the pin.
>> Make it possible to configure this with a generic binding.
>>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt | 4 ++++
>>  drivers/pinctrl/pinconf-generic.c                              | 2 ++
>>  include/linux/pinctrl/pinconf-generic.h                        | 5 +++++
>>  3 files changed, 11 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
>> index 4483cc31e531..ad9bbbba36e9 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
>> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
>> @@ -271,6 +271,10 @@ output-high              - set the pin to output mode with high level
>>  sleep-hardware-state - indicate this is sleep related state which will be programmed
>>                         into the registers for the sleep state.
>>  slew-rate            - set the slew rate
>> +skew-delay           - this affects the expected clock skew on input pins
>> +                       and the delay before latching a value to an output
>> +                       pin. Typically indicates how many double-inverters are
>> +                       used to delay the signal.
>
> Units?

Number of double-inverters I guess, just as it says.

skew-delay = <1>; // number of inverter pairs

Like with other bindings of this type they are custom.

The Gemini datasheet says "every unit represents about 0.2 ns".

So if you set it to 1, that means (as far as I can guess) this
is shunted in:

   |\    |\
--+ >o--+ >o---
   |/    |/

The signal will take ~0.2 ns to propagate through this.
For 2, there will be four inverters etc.

It is dependent of production technology, and I do not know
if everyone is using something like double-inverters.

We could try to define a value in picoseconds instead so I
would need to set this to 200 in that case if you think that is better:

skew-delay = <200>; // picoseconds

I think it would be kludgy since with increasing clock speeds
maybe picoseconds would be too big even. Nanoseconds is
apparently already a to coarse unit.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
