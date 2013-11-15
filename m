From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: ACPI vs DT at runtime
Date: Fri, 15 Nov 2013 10:42:15 -0800
Message-ID: <CAOesGMg+xCDVS6Frp8hjxxsHyC=vczwkDJLoHcn9bndSjOnWKQ@mail.gmail.com>
References: <CAOesGMjKeRb=fFJM0MabDihbEiCGM4EqW9D5i_6-RFxTnpB4Qw@mail.gmail.com>
	<20131115095717.GC1709@e106331-lin.cambridge.arm.com>
	<20131115175241.GB27174@quad.lixom.net>
	<20131115180832.GR16735@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131115180832.GR16735-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 15, 2013 at 10:08 AM, Russell King - ARM Linux
<linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> On Fri, Nov 15, 2013 at 09:52:41AM -0800, Olof Johansson wrote:
>> If we knew exactly what we wanted, it'd be a different story. _We
>> don't_. We're into year FOUR of the device tree conversion and we're just
>> now reaching a point where we think we know what a good solution looks
>> like. The first two years were easy -- they were the trivial devices we're
>> now talking about on ACPI. After that it got harder. Going through all
>> of that again with ACPI? No. No way. Microsoft gets to do it and while
>> they're busy sorting it out, we'll boot with device tree.
>
> However, there's a very big danger here.  I disagree with the stance
> you're taking.
>
> It seems that under ACPI and DT, we refer to properties by string names.
> That's good, but do we really want to have different string names for the
> same property.
>
> Or worse still, the same hardware property described in two completely
> different ways between ACPI and DT?
>
> If you think Microsoft will come along, look at what we've done for DT,
> and implement something in ACPI which is somehow compatible with that,
> I'd have to ask where you've been for the last 30 years.  That's not
> how Microsoft operates.
>
> Microsoft will instead design something different (whether it's
> intentionally different or not depends on your point of view) but it
> will be designed how they want and not how we'd like it to be.  From
> their point of view, if it's completely different and very difficult
> to convert to device tree, that's a win for them because it means
> they're pushing back on Linux being used in markets they wish to be
> successful.

Main reply at the bottom but on this: I don't know if this is already
happening. Given that APM is asking us how to do clock bindings, I'm
guessing they're not working with Microsoft on ACPI yet. So I have no
idea if there's a complete impedance mismatch between what we're tying
to do, and what they will later require, or not. They might chose to
discard any ACPI implementation that's been written just to Linux, and
have their own set of criteria. We just don't know at this time since
I get the impression we're working on our own right now.

> We have a possibility here to define how we'd like ACPI to look: we
> have the chance to have ACPI properties using the same naming that we
> already have for DT.  What this means is that _if_ we wanted one day
> to have first class support for ACPI (which we may wish to for the
> AML) then we wouldn't have to rewrite all the drivers we've already
> converted.  Yes, we'd have a some churn, but most of that would be
> along the lines of converting the of_* calls to being firmware_*
> calls, taking a generic firmware handle.
>
> Who knows, we may decide in the future that we want to move everything
> over to ACPI rather than using DT, and having things as I mention above
> would make it much easier to convert from DT to ACPI.
>
> I believe that we're only going to regret shutting the door on this
> in the future.  It's not like the kernel doesn't already have native
> support for ACPI.

Yeah, I should have been clearer on that: It still makes much sense to
make sure that we have Linux representation in the UEFI/ACPI standards
committees, and it's my impression that Linaro is providing that --
that's a good initiative and should continue. It is particularly true
once we move off the path of the simple initial stuff and start to
enter corner cases of where things don't fit the standard model (like
we're at with DT now), since we'd need to come up with common
solutions.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
