From: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 03/13] RTC: ds1307: Add DS1341 specific
 power-saving options
Date: Wed, 20 Jul 2016 07:36:55 -0700
Message-ID: <CAHQ1cqEoN7PEQApHBo-FOqumtLJWoURHOPZfrzL=6h2p4S0Fdg@mail.gmail.com>
References: <1465970379-14703-1-git-send-email-andrew.smirnov@gmail.com>
 <1465970379-14703-4-git-send-email-andrew.smirnov@gmail.com>
 <20160619142934.GA8522@rob-hp-laptop> <CAHQ1cqFfFpLmMMr9itinha9rotG7Btr9UmWbO2_0VWxX_HeG1g@mail.gmail.com>
 <20160621204904.GA9779@rob-hp-laptop> <20160621210739.GY5809@piout.net>
 <CAHQ1cqGRqhOAqfJZEixkxAHZ4Y8dd-hD__T1ci0LS28Orphs3Q@mail.gmail.com>
 <20160719224728.GP7132@piout.net> <CAHQ1cqF+Z5sKhtxgFiTGJdaOtkQRtQmXU=DzG0qxnDDwfAMp_g@mail.gmail.com>
 <20160720090220.GQ7132@piout.net>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBDKOBWPM5ABRBCEZX26AKGQEF46M2KI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160720090220.GQ7132-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 20, 2016 at 2:02 AM, Alexandre Belloni
<alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On 19/07/2016 at 16:56:56 -0700, Andrey Smirnov wrote :
>> >> I don't see any value in doing that, could you give me a realistic
>> >> example of a scenario in which a user would want to spend some of
>> >> uptime with RTC oscillator fault detection/glitch filtering disabled
>> >> and then enable it?
>> >>
>> >
>> > Well, the issue is not being dynamic, it is differentiating between
>> > hardware description and user configuration. Configuration must not be in
>> > DT.
>>
>> Why? And I don't mean in a generic sense, but in this particular case.
>> What is gained by not having this bit of configuration, whose only
>> consumer is the driver, in the device tree file?
>>
>
> Because configuration doesn't belong to DT. DT is about hardware
> description, not configuration.

That doesn't really answer my question. You just re-iterating some
maxim without explaining what is the point behind applying it.

>
>
>> > And this choice is definitively not hardware related (as opposed to
>> > the trickle charging that depends on the battery that is used on the
>> > board).
>>
>> There's most certainly plenty of precedents of non hardware-related in
>> device tree, first two that come to mind are "chosen" node and
>> "local-mac-address" property and, granted, those might be
>> exceptions/legacy bindings that are just there to stay, but even if
>> you look at RTC subsystem rtc-cmos.txt, atmel,at91sam-rtc.txt and
>> possibly rtc-st-lpc.txt are providing bindings that are not exactly
>> hardware related.
>>
>> Rtc-cmos.txt is especially noticeable example since it literally does
>> what I am trying to do -- allows the user to specify initial values to
>> certain registers that would be initialized by the driver.
>>
>
> Well, the RTC subsystem has been left unmaintained for a while and it is
> not because we made mistakes in the past that we have to make them
> again.
>
> rtc-st-lpc is only hardware related. The mode it is used in is board
> dependant. And I have a plan to change how the gpbr register is
> allocated for the at91 RTT. I agree that rtc-cmos is an example of what
> not to do.
>
>> > Well, it doesn't leak abstraction as long as all the RTC that are able
>> > to disable the oscillator failure detection use the same ABI.
>>
>> Correct me if I am wrong, but no such, at least semi-standardized, ABI
>> exist as of today, correct? If that is so, then what you are saying is
>> that the abstraction doesn't leak as long as you put it inside of a
>> new abstraction that doesn't leak. I am not arguing that it is
>> impossible to create a new one that would allow to hide hardware
>> differences, I am positive it is, what I am arguing is that to do so
>> is a lot of work for as far as I can see for no gain.
>>
>
> You are correct, that ABI doesn't exist and I'm asking to create it.
> That is how kernel development happens.

OK, I don't think this is going anywhere. I am sure by now you know
very well, that I am not going to agree to that. I'll just drop this
part, gut the patchset to it's bare minimum and re-submit it.

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
