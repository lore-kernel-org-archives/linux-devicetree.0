From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: uniphier: add ProXstream2 Vodka board support
Date: Wed, 21 Oct 2015 17:49:12 +0900
Message-ID: <CAK7LNAQG-aqu0khSMZYLqd0P_Oz4MPuQccTMb0nYeR5JthnKhA@mail.gmail.com>
References: <1444899934-4754-1-git-send-email-yamada.masahiro@socionext.com>
	<63719761.5kc6F97FjG@wuerfel>
	<CAK7LNATzgOZp542rd-92YXDxux2DrAOH_mkzk8NjimQ3afrCCg@mail.gmail.com>
	<9943173.h49fNtDsEp@wuerfel>
	<CAK7LNARJhpz0AmLDL9j5c20cnv=+7CGiJMgGHhreJEd0rG3zSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK7LNARJhpz0AmLDL9j5c20cnv=+7CGiJMgGHhreJEd0rG3zSw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,


2015-10-16 18:50 GMT+09:00 Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>:
> Hi Arnd,
>
> 2015-10-16 18:18 GMT+09:00 Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>:
>> On Friday 16 October 2015 14:24:30 Masahiro Yamada wrote:
>>>
>>> No, it is not a typo, but intentional.
>>>
>>>
>>> i2c0 - i2c3 are connected to the pads of the SoC package.
>>> On the other hand, i2c-4 - i2c-6 are connected to
>>> internal devices inside the SoC package.
>>>
>>> i2c-4 - i2c-6 are always connected to the same hardware
>>> devices and always used for the same purpose.
>>>
>>>
>>> My expected scenario is:
>>>
>>> [1] i2c0 - i2c3 are connected to the on-board devices
>>>     depending on board variants.
>>>     On some boards, their status is "okay" and
>>>     on some boards, their status is "disabled".
>>>
>>> [2] i2c4 - i2c6 are always used to communicate
>>>     with in-package devices.  The status is always "okay".
>>
>> I think you are getting confused because the data sheet uses
>> the same names as the kernel, but they are really different
>> things.
>>
>> How about boards that have i2c connectors that are labeled
>> differently?
>
>
> I guess it would rarely happen as it is confusing.
>
> The board connectors are generally named
> correspondingly to the hardware block ID in the SoC.
>
>
>
>> We want the aliases to match whatever is written on the
>> board normally, to make it easier for users.
>>
>>> [3] Some user-land applications may want to have access
>>>      through the same character devices,
>>>       /dev/i2c4, /dev/i2c5, /dev/i2c6
>>
>> That user space would however only work on boards with the
>> same SoC, which is not a safe assumption to make.
>
> Right.
>
>> Either
>> it should be specific to just one board which has a known
>> set of buses, or it should be done in a way that works
>> across SoC generations of families.
>>
>> Ideally the devices on the internal buses would have an
>> in-kernel driver that exports a high-level API to avoid this
>> problem. What devices are these?
>
> HDMI transmitter, TV signal demodulator, etc.
>
>
>
>>> If your way is adopted,
>>> the real hardware "i2c4" might be aligned to /dev/i2c1 on some boards,
>>> and /dev/i2c2 on others, etc.
>>
>> Right, I think that is how it should be. You could also make
>> the chip's i2c4 always link to user space /dev/i2c0 if you
>> want to keep those stable, but as I said that is still not
>> a good (software) system design.
>>
>
> Right.  In-kernel drivers can handle it nicely.
>
> Also, we can write a device tree that specifies device connection
> hierarchy like follows.
> The device names will appear under /sys/ directory and user-land
> applications can check them.
>
> &i2c4 {
>         demodulator {
>                  compatible = "...";
>
>         };
> };
>
> &i2c6 {
>          hdmi_tx {
>
>                    compatible = "...";
>          };
> }
>
>
> I understand that I2C bus number assumption is avoidable,
> but I am still not fully convinced.
>
> Matching /dev/i2c* and the real hardware block ID (this is written in
> the SoC spec book)
> makes things clearer, I think.
>


Anyway, this version is unacceptable, right?





-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
