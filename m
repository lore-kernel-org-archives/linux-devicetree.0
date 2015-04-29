From: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: [RFC 00/12] On-demand device registration
Date: Wed, 29 Apr 2015 08:58:42 +0200
Message-ID: <CAAObsKBQMY8NfzN3bfiDuy=QOsSV281punJGuEUPfMRRBwoA+g@mail.gmail.com>
References: <1429886848-5843-1-git-send-email-tomeu.vizoso@collabora.com>
 <553ACE96.2040804@ahsoftware.de> <CAAObsKAa_yEwcWQTJvAidwnM2h7UAcgwa2dUBtfYRFtWHb7Kng@mail.gmail.com>
 <553FCECB.7040005@ahsoftware.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <553FCECB.7040005-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 28 April 2015 at 20:17, Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org> wrote:
> Am 28.04.2015 um 14:49 schrieb Tomeu Vizoso:
>>
>> On 25 April 2015 at 01:15, Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org> wrote:
>>>
>>> Am 24.04.2015 um 16:47 schrieb Tomeu Vizoso:
>>>>
>>>> Hi,
>>>>
>>>> while reading the thread [0] that Alexander Holler started with his
>>>> series to make probing order deterministic, it occurred to me that it should
>>>> be possible to achieve the same by probing devices as they are referenced by
>>>> other devices.
>>>>
>>>> This basically reuses the information that is already embedded in the
>>>> probe() implementations, saving us from refactoring existing drivers or
>>>> adding information to DTBs.
>>>>
>>>> The main issue I see is that the registration code path in some
>>>> subsystems may not be reentrant, so some refactoring of the locking will be
>>>> needed. In my testing I have found this problem with regulators, as the
>>>> supply of a regulator might end up being registered during the registration
>>>> of the first one.
>>>>
>>>> Something I'm not completely happy with is that I have had to move the
>>>> population of the device tree after all platform drivers have been
>>>> registered. Otherwise I don't see how I could register drivers on demand as
>>>> we don't have yet each driver's compatible strings.
>>>>
>>>> I have done my testing on a Tegra124-based Chromebook, and these patches
>>>> were enough to eliminate all the deferred probes.
>>>
>>>
>>> First you have to solve a problem which is totally unrelated to DT or
>>> ACPI or x86 or ARM:
>>>
>>> I think as long as drivers don't register themself whithout any side
>>> effect, this problem isn't solvable. In order to make an ordered list of
>>> drivers to start, you need to know which drivers are actually available.
>>
>>
>> Yeah, I kind of side-stepped that issue by waiting until all drivers
>> have been registered before registering devices. I think someone
>> suggested doing so in your thread (maybe Grant?).
>
>
> That doesn't work. As said above, several drivers doing a lot more than just
> registering in their initcall. They might even crash if some prerequisits
> aren't given. And several of these prerequisits (init orders) are hardcoded
> by various means.

But aren't those dependencies being taken care currently by the
initcall level the driver is placed in? That remains the same in this
approach.

I have obviously spent less time thinking about all this than you, so
sorry if I'm missing too many points.

Regards,

Tomeu

>> There's lots of things that can be improved regarding driver and
>> device initialization, but we have to start somewhere :)
>
>
> That's what I've tried by marking good drivers as such (and by placing them
> in their own initcall level group).
>
> But as said, good luck. I've tried it already and nobody seemed interested.
> Some people even seem to panic if they see a patch which changes something
> in linux/init/ ;)
>
> Regards,
>
> Alexander Holler
>
>
>>
>> Thanks,
>>
>> Tomeu
>>
>>> And also drivers are registering themself with their initcall, they
>>> might do an awfull lot of stuff besides just registering themself. That
>>> means several drivers already have prerequisites and dependcies for
>>> their initcall. That means you can't just call their initcall to get and
>>> idea of which driver an initcall is even part of.
>>>
>>> That ends up with the fact that you just don't have a list of drivers
>>> you can sort, based on whatever algorithm you might have in mind.
>>>
>>> I've tried to solve that problem with marking drivers which don't have
>>> any prerequisits (and side effects) as "well done".
>>>
>>> The patch which did that was 5/9 in my series, this one:
>>>
>>> https://lkml.org/lkml/2014/5/12/414
>>>
>>> Unfortunately nobody seemed really interested and without one of the few
>>> "big guys" in your pocket, it's absolutely impossible to get such
>>> changes into the kernel.
>>>
>>> Not to speak about all the unavoidable discussions about absolutely
>>> silly things.
>>>
>>> But maybe I'm the problem here. No idea. I wish you more luck than I had
>>> in the past two or three years.
>>>
>>> Regards,
>>>
>>> Alexander Holler
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-kernel"
>>> in
>>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>> Please read the FAQ at  http://www.tux.org/lkml/
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
