From: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 03/13] RTC: ds1307: Add DS1341 specific
 power-saving options
Date: Tue, 19 Jul 2016 16:56:56 -0700
Message-ID: <CAHQ1cqF+Z5sKhtxgFiTGJdaOtkQRtQmXU=DzG0qxnDDwfAMp_g@mail.gmail.com>
References: <1465970379-14703-1-git-send-email-andrew.smirnov@gmail.com>
 <1465970379-14703-4-git-send-email-andrew.smirnov@gmail.com>
 <20160619142934.GA8522@rob-hp-laptop> <CAHQ1cqFfFpLmMMr9itinha9rotG7Btr9UmWbO2_0VWxX_HeG1g@mail.gmail.com>
 <20160621204904.GA9779@rob-hp-laptop> <20160621210739.GY5809@piout.net>
 <CAHQ1cqGRqhOAqfJZEixkxAHZ4Y8dd-hD__T1ci0LS28Orphs3Q@mail.gmail.com> <20160719224728.GP7132@piout.net>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBDKOBWPM5ABRBSP4XK6AKGQEZFRQATA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160719224728.GP7132-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 19, 2016 at 3:47 PM, Alexandre Belloni
<alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On 21/06/2016 at 19:34:56 -0700, Andrey Smirnov wrote :
>> On Tue, Jun 21, 2016 at 2:07 PM, Alexandre Belloni
>> <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>> > On 21/06/2016 at 15:49:04 -0500, Rob Herring wrote :
>> >> So wouldn't you want to set one mode while running and the lower power
>> >> mode while suspended? I'm trying to understand the frequency of changing
>> >> this. If it is always one setting for a board, then yes it belongs in
>> >> DT. If it is a user decision, then it probably shouldn't be in DT.
>> >>
>> >> Seeing as these are reused, I've probably already had this discussion...
>> >>
>> >
>> > I would agree with Rob here. It may be better to provide a sysfs
>> > interface to configure that particular behavior.
>>
>> I don't see any value in doing that, could you give me a realistic
>> example of a scenario in which a user would want to spend some of
>> uptime with RTC oscillator fault detection/glitch filtering disabled
>> and then enable it?
>>
>
> Well, the issue is not being dynamic, it is differentiating between
> hardware description and user configuration. Configuration must not be in
> DT.

Why? And I don't mean in a generic sense, but in this particular case.
What is gained by not having this bit of configuration, whose only
consumer is the driver, in the device tree file?

> And this choice is definitively not hardware related (as opposed to
> the trickle charging that depends on the battery that is used on the
> board).

There's most certainly plenty of precedents of non hardware-related in
device tree, first two that come to mind are "chosen" node and
"local-mac-address" property and, granted, those might be
exceptions/legacy bindings that are just there to stay, but even if
you look at RTC subsystem rtc-cmos.txt, atmel,at91sam-rtc.txt and
possibly rtc-st-lpc.txt are providing bindings that are not exactly
hardware related.

Rtc-cmos.txt is especially noticeable example since it literally does
what I am trying to do -- allows the user to specify initial values to
certain registers that would be initialized by the driver.

>
>> > This is usually ok because the use case is:
>> >  - the RTC is not configured, time has never been set
>> >  - time is set for the first time
>> >  - the user can set the oscillator mode/detection/...
>>
>> Unfortunately exposing that feature using sysfs gives you a leaky
>> abstraction and your userspace instead of using a generic RTC starts
>> using DS1341 RTC. So to accommodate for that a user would have to:
>>
>> a) Write + integrate a userspace tool to set the mode (which IMHO is
>> decided upon once and doesn't change)
>> b) If a board design is new and there's a chance of moving this chip
>> to a different I2C bus, the code above would have to account for that
>> and not hardcore sysfs path
>> c) If board's BSP is intended to be used in multiple generations of a
>> product, not all of which would use DS1341, it would be necessary to
>> accommodate for that by either more code in the tool or an additional
>> BSP build configuration variant
>>
>
> Well, it doesn't leak abstraction as long as all the RTC that are able
> to disable the oscillator failure detection use the same ABI.

Correct me if I am wrong, but no such, at least semi-standardized, ABI
exist as of today, correct? If that is so, then what you are saying is
that the abstraction doesn't leak as long as you put it inside of a
new abstraction that doesn't leak. I am not arguing that it is
impossible to create a new one that would allow to hide hardware
differences, I am positive it is, what I am arguing is that to do so
is a lot of work for as far as I can see for no gain.

>
>> >  - on subsequent reboots, the mode is kept alongside the time and date
>> >
>>
>> This assumes that your bootloader leaves those mode bits alone.
>>
>
> Well, if that is not the case, the bootloader as to be fixed anyway and
> silently changing the configuration back using DT is probably worse.
>

How so? Consider the following two scenarios with assumption that the
bootloader is broken:

  - Bits set wrong by bootloader, then corrected by kernel, device is
powered off RTC consumes expected amount of current

  - Bits set wrong by bootloader, kernel does nothing, device is
powered off RTC consumes more than anticipated and we drain the power
storage device and loose time.

What do you you think former is worse than latter?

Andrey

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
