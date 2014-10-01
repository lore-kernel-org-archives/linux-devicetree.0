From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3] clocksource: arch_timer: Allow the device tree to
 specify the physical timer
Date: Wed, 1 Oct 2014 08:21:49 -0700
Message-ID: <CAD=FV=WaNGeaXbYcHHBBYosX_0bpZVGCiqi=iuCXamcN3VEEpQ@mail.gmail.com>
References: <1410454801-14231-1-git-send-email-dianders@chromium.org>
	<20140926100025.GC4476@leverpostej>
	<CAPz6YkWZWgm--6EJxoV1s3zqTNpAF6+CBOrRc5qxdm5=hFzj1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPz6YkWZWgm--6EJxoV1s3zqTNpAF6+CBOrRc5qxdm5=hFzj1w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>, Christopher Covington <cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Nathan Lynch <Nathan_Lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Sep 29, 2014 at 10:30 AM, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> On Fri, Sep 26, 2014 at 3:00 AM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
>> On Thu, Sep 11, 2014 at 06:00:01PM +0100, Doug Anderson wrote:
>>> +** Optional properties:
>>> +
>>> +- arm,use-physical-timer : Don't ever use the virtual timer, just use the
>>> +  physical one.  Only supported for ARM (not ARM64).
>>
>> I'm still not keen on telling the kernel what to do rather than
>> describing the actual state of affairs and having the kernel decide what
>> to do. Perhaps what we actually need is:
>>
>> - cntvoff-not-fw-configured: Firmware does not configure CNTVOFF, which
>>   may reset to (different) arbitrary values on each CPU.
>>
>> This also doesn't describe that CNTHCTL.PL1PC(T)EN must both be 1. While
>> that is the reset state, it still feels dodbgy to me to rely on that.
>>
>> Mark.
>
> Mark, I'm happy to repost it with that name for Doug.
>
> I think it's fair to describe this state in the binding, and if a
> firmware were to put this property into the device-tree for and
> CNTHCTL.PL1P(T)CEN also have configured to 0, then the kernel can
> merely consider that to be a broken usage of this property.   We
> certainly can't protect against all of the possible invalid states
> caused and probably shouldn't try.  If we implement something like
> Christopher's suggestion for transitioning from secure svc to NS hyp
> mode then the kernel can simply ignore this property at that point.

I've already talked in person to Sonny about this, but just to post on
the list too...  I think Mark Rutland's suggestion is a good one and
I'm more than happy for Sonny to repost that way for me.  Thanks!  :)

-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
