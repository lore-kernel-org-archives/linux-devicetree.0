From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2] clocksource: arch_timer: Allow the device tree to
 specify the physical timer
Date: Thu, 11 Sep 2014 18:22:47 +0100
Message-ID: <5411DA67.2040402@arm.com>
References: <1410452204-7277-1-git-send-email-dianders@chromium.org> <20140911164710.GW6158@arm.com>	<5411D528.4050605@arm.com> <CAD=FV=XMmizxJFPj0FEhJ7Gk4ZcQaUJDxf_Qq5kGKSvxDFVmzg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=XMmizxJFPj0FEhJ7Gk4ZcQaUJDxf_Qq5kGKSvxDFVmzg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>, Christopher Covington <cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Nathan Lynch <Nathan_Lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/09/14 18:11, Doug Anderson wrote:
> Hi,
> 
> On Thu, Sep 11, 2014 at 10:00 AM, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org> wrote:
>> On 11/09/14 17:47, Will Deacon wrote:
>>> On Thu, Sep 11, 2014 at 05:16:44PM +0100, Doug Anderson wrote:
>>>> Some 32-bit (ARMv7) systems are architected like this:
>>>>
>>>> * The firmware doesn't know and doesn't care about hypervisor mode and
>>>>   we don't want to add the complexity of hypervisor there.
>>>>
>>>> * The firmware isn't involved in SMP bringup or resume.
>>>>
>>>> * The ARCH timer come up with an uninitialized offset between the
>>>>   virtual and physical counters.  Each core gets a different random
>>>>   offset.
>>>>
>>>> On systems like the above, it doesn't make sense to use the virtual
>>>> counter.  There's nobody managing the offset and each time a core goes
>>>> down and comes back up it will get reinitialized to some other random
>>>> value.
>>>
>>> You probably need to rephrase this slightly, as there *is* still a
>>> requirement on the hypervisor/firmware (actually, two!). See below.
>>>
>>>> Let's add a property to the device tree to say that we shouldn't use
>>>> the virtual timer.  Firmware could potentially remove this property
>>>> before passing the device tree to the kernel if it really wants the
>>>> kernel to use a virtual timer.
>>>>
>>>> Note that it's been said that ARM64 (ARMv8) systems the firmware and
>>>> kernel really can't be architected as described above.  That means
>>>> using the physical timer like this really only makes sense for ARMv7
>>>> systems.
>>>
>>> I'd go further: this only makes sense if you're booting in secure SVC
>>> mode.
>>
>> If that's the case, what's the problem? Enter monitor mode, set SCR.NS
>> to one, nuke CNTVOFF, revert, job done.
>>
>> What am I missing?
> 
> Stuff like this was talked about in the thread about Sonny's patch at
> <https://patchwork.kernel.org/patch/4790921/>
> 
> ...in that case we were always talking about HYP mode, though.  I

That's because I always assumed that you'd be running non-secure,
dropped there by some idiotic firmware without any way to go back up.

> don't think anyone has explicitly talked about just switching to
> monitor mode and then leaving ourselves in Secure SVC after we're
> done.  It would be nice (especially for the VDSO guys) if we could
> just init the virtual offset...
> 
> We would need to run this code potentially at processor bringup and
> after suspend/resume, but that seems possible too.

Note that this would be an ARMv7 only thing (you can't do that on ARMv8,
at all).

> Is the transition to monitor mode and back simple?  Where would you
> suggest putting this code?  It would definitely need to be pretty
> early.  We'd also need to be able to detect that we're in Secure SVC
> and not mess up anyone else who happened to boot in Non Secure SVC.

This would have to live in some very early platform-specific code. The
ugly part is that you cannot find out what world you're in (accessing
SCR is going to send you to UNDEF-land if accessed from NS).

If I was suicidal, I'd suggest you could pass a parameter to the command
line, interpreted by the timer code... But I since I'm not, let's
pretend I haven't said anything... ;-)

	M.
-- 
Jazz is not dead. It just smells funny...

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
