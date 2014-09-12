From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2] clocksource: arch_timer: Allow the device tree to
 specify the physical timer
Date: Thu, 11 Sep 2014 17:01:11 -0700
Message-ID: <CAD=FV=XZVs-Xr72Rah1YwnTqB6Zj=ZwkvsEytctO9sp5dL=eCA@mail.gmail.com>
References: <1410452204-7277-1-git-send-email-dianders@chromium.org>
	<20140911164710.GW6158@arm.com>
	<5411D528.4050605@arm.com>
	<CAD=FV=XMmizxJFPj0FEhJ7Gk4ZcQaUJDxf_Qq5kGKSvxDFVmzg@mail.gmail.com>
	<5411DA67.2040402@arm.com>
	<CAD=FV=UQfo4J3P4wGjOhQZQ5KXKgYAdjPsi1ykKZxQw-FwJz8w@mail.gmail.com>
	<5411DF5D.8060906@arm.com>
	<54123697.4070804@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54123697.4070804-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>, Christopher Covington <cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Nathan Lynch <Nathan_Lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Stephen,

On Thu, Sep 11, 2014 at 4:56 PM, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> On 09/11/14 10:43, Marc Zyngier wrote:
>>>> If I was suicidal, I'd suggest you could pass a parameter to the command
>>>> line, interpreted by the timer code... But I since I'm not, let's
>>>> pretend I haven't said anything... ;-)
>>> I did this in the past (again, see Sonny's thread), but didn't
>>> consider myself knowledgeable to know if that was truly a good test:
>>>
>>>        asm volatile("mrc p15, 0, %0, c1, c1, 0" : "=r" (val));
>>>        pr_info("DOUG: val is %#010x", val);
>>>        val |= (1 << 2);
>>>        asm volatile("mcr p15, 0, %0, c1, c1, 0" : : "r" (val));
>>>        val = 0xffffffff;
>>>        asm volatile("mrc p15, 0, %0, c1, c1, 0" : "=r" (val));
>>>        pr_info("DOUG: val is %#010x", val);
>>>
>>> The idea being that if you can make modifications to the SCR register
>>> (and see your changes take effect) then you must be in secure mode.
>>> In my case the first printout was 0x0 and the second was 0x4.
>> The main issue is when you're *not* in secure mode. It is likely that
>> this will explode badly. This is why I suggested something that is set
>> by the bootloader (after all. it knows which mode it is booted in), and
>> that the timer driver can use when the CPU comes up.
>
> Where does this platform jump to when a CPU comes up? Is it
> rockchip_secondary_startup()? I wonder if that path could have this
> little bit of assembly to poke the cntvoff in monitor mode and then jump
> to secondary_startup()? Before we boot any secondary CPUs we could also
> read the cntvoff for CPU0 in the platform specific layer (where we know
> we're running in secure mode) and then use that value as the "reset"
> value for the secondaries. Or does this platform boot up in secure mode
> some times and non-secure mode other times?

I guess it would depend a whole lot on the bootloader, wouldn't it?

With our current "get out of the way" bootloader, Linux always sees
"Secure SVC".  ...but if someone decided to put a new bootloader on
the system that wanted to do something different (implement security
and boot the kernel in nonsecure HYP or implement a hypervisor and
boot the kernel in nonsecure SVC) then everything would be different.

If someone were to write a bootloader like that (or perhaps if we're
running in a VM?) then I'd imagine that the whole world would be
different.  Somehow this secure bootloader and/or hypervisor would
_have_ to be involved in processor bringup and suspend/resume.  Since
I've never looked at code implementing either of these I'm just making
assumptions, though.

-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
