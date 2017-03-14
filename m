From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] pinctrl: meson: gxl: add the missing PWM pin definitions
Date: Tue, 14 Mar 2017 16:42:37 +0100
Message-ID: <CACRpkdbGfGUhnAQz=9xeFnD2hF6m_xXacu8mZiwte-OCSDMo9w@mail.gmail.com>
References: <20170304212318.27076-1-martin.blumenstingl@googlemail.com>
 <20170304212318.27076-2-martin.blumenstingl@googlemail.com>
 <1488811357.2420.18.camel@baylibre.com> <CAFBinCDty8v80tLxHJPR+SHv32LX834dPJUruRNqr6angx3OOQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFBinCDty8v80tLxHJPR+SHv32LX834dPJUruRNqr6angx3OOQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 9, 2017 at 8:47 PM, Martin Blumenstingl
<martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> On Mon, Mar 6, 2017 at 3:42 PM, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:
>> On Sat, 2017-03-04 at 22:23 +0100, Martin Blumenstingl wrote:

>>> +     FUNCTION(pwm_f_clk),
>>> +     FUNCTION(pwm_f_x),
>>
>> I wonder if having function named "pwm_f_clk" really makes sense ?
>> Shouldn't it be just "pwm_f" ? This is real function, isn't it ?
>> The actual pin used will be provided in the dt. Here, I suppose we
>> could have this:
>>
>> +static const char * const pwm_f_groups[] = {
>> +       "pwm_f_x", "pwm_f_clk",
>> +};
>>
>> Has far as I can see, on meson arch, the function does not carry much
>> information anyway, except for prints.
>>
>> To be clear, I'm not questioning this change in particular. It looks
>> good, and follows what has been done in the past on meson. I know we
>> have been this a lot already, but I'm questioning whether we should
>> continue to do so ?
>>
>> I asking because I also have a lot case like this coming up on audio
>> for gxl and gxbb, where the same function can use different pins.
>
> could you please look into Jerome's question?
> personally I'm fine with either way, and changing my patch would be
> quite trivial. but I'd like to know what's "the way to go" before
> changing anything (and reverting that afterwards again).

I don't understand the question really.

I am not an expert on this system, if the people working with it
cannot tell a function from a group I don't know who can... certainly
not me.

What I can say is that pincontrol combines functions and groups to
states using a mapping. The functions should be something you poke
into a register, the groups are looser defined but may also be a
character of the hardware, but more usual a character of the
intended electronic usecase. Groups contain 1..n pins and can
be combined with some applicable functions.

Please re-read Documentation/pinctrl.txt very closely if anything is
unclear, I really put a lot of hours into getting that right. Especially
reexamine "Pinmux conventions".

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
