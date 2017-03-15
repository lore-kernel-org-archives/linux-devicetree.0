From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/2] pinctrl: meson: gxl: add the missing PWM pin
 definitions
Date: Wed, 15 Mar 2017 10:59:06 +0100
Message-ID: <b7430d5f-96a7-2445-1c2a-ccc299bfdda2@baylibre.com>
References: <20170304212318.27076-1-martin.blumenstingl@googlemail.com>
 <20170304212318.27076-2-martin.blumenstingl@googlemail.com>
 <1488811357.2420.18.camel@baylibre.com>
 <CAFBinCDty8v80tLxHJPR+SHv32LX834dPJUruRNqr6angx3OOQ@mail.gmail.com>
 <CACRpkdbGfGUhnAQz=9xeFnD2hF6m_xXacu8mZiwte-OCSDMo9w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbGfGUhnAQz=9xeFnD2hF6m_xXacu8mZiwte-OCSDMo9w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>, Will Deacon <will.deacon@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Carlo Caione <carlo@caione.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

On 03/14/2017 04:42 PM, Linus Walleij wrote:
> On Thu, Mar 9, 2017 at 8:47 PM, Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
>> On Mon, Mar 6, 2017 at 3:42 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:
>>> On Sat, 2017-03-04 at 22:23 +0100, Martin Blumenstingl wrote:
> 
>>>> +     FUNCTION(pwm_f_clk),
>>>> +     FUNCTION(pwm_f_x),
>>>
>>> I wonder if having function named "pwm_f_clk" really makes sense ?
>>> Shouldn't it be just "pwm_f" ? This is real function, isn't it ?
>>> The actual pin used will be provided in the dt. Here, I suppose we
>>> could have this:
>>>
>>> +static const char * const pwm_f_groups[] = {
>>> +       "pwm_f_x", "pwm_f_clk",
>>> +};
>>>
>>> Has far as I can see, on meson arch, the function does not carry much
>>> information anyway, except for prints.
>>>
>>> To be clear, I'm not questioning this change in particular. It looks
>>> good, and follows what has been done in the past on meson. I know we
>>> have been this a lot already, but I'm questioning whether we should
>>> continue to do so ?
>>>
>>> I asking because I also have a lot case like this coming up on audio
>>> for gxl and gxbb, where the same function can use different pins.
>>
>> could you please look into Jerome's question?
>> personally I'm fine with either way, and changing my patch would be
>> quite trivial. but I'd like to know what's "the way to go" before
>> changing anything (and reverting that afterwards again).
> 
> I don't understand the question really.
> 
> I am not an expert on this system, if the people working with it
> cannot tell a function from a group I don't know who can... certainly
> not me.
> 
> What I can say is that pincontrol combines functions and groups to
> states using a mapping. The functions should be something you poke
> into a register, the groups are looser defined but may also be a
> character of the hardware, but more usual a character of the
> intended electronic usecase. Groups contain 1..n pins and can
> be combined with some applicable functions.
> 
> Please re-read Documentation/pinctrl.txt very closely if anything is
> unclear, I really put a lot of hours into getting that right. Especially
> reexamine "Pinmux conventions".

The point pushed by Jerome was purely cosmetic since the groups in the meson
pinctrl driver are purely cosmetic, since only the GPIO group is handled,
other groups are all handled the same.

This is because I pushed all the PWM pins in a separate group, but functionnaly
the internal signal (i.e. PWM F) is the same for multiple pins and should be
a single "PWM F" group instead of multiple ones.

My advice is to leave the PWM groups as is, and push new pins/functions/groups
grouped with the internal signal name if split on multiple pins.

This will be the case for audio, since the I2S pins can be configures on multiple
different pins.

Thanks,
Neil

> 
> Yours,
> Linus Walleij

