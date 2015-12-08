MIME-Version: 1.0
In-Reply-To: <CAKb7UvgzYMxPxtt8iPars13n4sAJ5Z4Hva1KHO+k4yNumDb+DQ@mail.gmail.com>
References: <1449237604-19064-1-git-send-email-l.stach@pengutronix.de>
	<1449237604-19064-3-git-send-email-l.stach@pengutronix.de>
	<20151204162956.GA14978@rob-hp-laptop>
	<1449247305.8275.104.camel@pengutronix.de>
	<CAL_JsqLcwk=h10zNvt1o=EKJZ58QvMyWnsTCNfkht-055X8Taw@mail.gmail.com>
	<1449251760.8275.116.camel@pengutronix.de>
	<CAL_Jsq+oaJxD3vbDWzn_4ghpqi=RZ1o+8nOcepWYjzcu5Hwpjg@mail.gmail.com>
	<20151204203101.GD8644@n2100.arm.linux.org.uk>
	<CAKb7UviPhoiY-YP2aBHm0BHbeEjSF2wTguQScVXMBve-kZc16Q@mail.gmail.com>
	<20151204220533.GE8644@n2100.arm.linux.org.uk>
	<CAKb7UvgzYMxPxtt8iPars13n4sAJ5Z4Hva1KHO+k4yNumDb+DQ@mail.gmail.com>
Date: Tue, 8 Dec 2015 07:15:17 -0600
Message-ID: <CAL_JsqJtm1LeTZfDTVw7-biKO38Ck+k-XbEGXt7SqA7r6-c2bw@mail.gmail.com>
Subject: Re: [PATCH 02/12] drm/etnaviv: add devicetree bindings
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, patchwork-lst@pengutronix.de, "kernel@pengutronix.de" <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Fri, Dec 4, 2015 at 4:43 PM, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> On Fri, Dec 4, 2015 at 5:05 PM, Russell King - ARM Linux
> <linux@arm.linux.org.uk> wrote:
>> On Fri, Dec 04, 2015 at 03:42:47PM -0500, Ilia Mirkin wrote:
>>> On Fri, Dec 4, 2015 at 3:31 PM, Russell King - ARM Linux
>>> <linux@arm.linux.org.uk> wrote:
>>> > Moreover, DRI3 is not yet available for Gallium, so if we're talking
>>> > about Xorg, then functional DRI2 is a requirement, and that _needs_
>>> > to have a single device for the rendering instances.  Xorg has no way
>>> > to pass multiple render nodes to client over DRI2.
>>>
>>> Just to correct... DRI3 has been available on gallium [at least in the
>>> context of st/mesa] basically since DRI3 was introduced. Not sure what
>>> issue you're fighting with, but it's definitely not a gallium
>>> limitation... could be something related to platform devices.
>>
>> Well, my statement is based on the fact that there's nothing in
>> src/gallium/state-tracker/dri which hints at being DRI3.  Maybe it's
>> implemented differently, I don't know.  I never wanted to hack MESA -
>> I'm supposed to be the ARM kernel maintainer - and I'm still very new
>> to MESA.
>>
>> I think it's a DRI3 limitation.  The issue with the DRI3 design is that:
>>
>> * The client has access to the GPU render nodes only, but not the
>>   corresponding KMS node.
>> * Buffers in DRI3 are allocated from the GPU render nodes.
>> * The Xorg Present protocol is then used to manage the vblank
>>   synchonisation and page flips.
>>
>> Now, the KMS scanout hardware typically does not support any kind of
>> scatter-gather: the buffers it has must be contiguous.  These can be
>> allocated from the KMS DRM device.
>>
>> However, the DRI3 client has no access to the KMS DRM device to allocate
>> linear buffers from, and GPUs typically don't have dumb buffer support.
>> Hence, the client can't pass a suitable buffer to the present layer.
>>
>> Hence, I can see no way for the resource_create() to be able to allocate
>> any kind of scanout capable buffer.
>>
>> That's a separate issue though: you've pointed out that you can select
>> which render node to use: what if we want to use multiple render nodes
>> simultaneously - eg, because we want to use multiple 3D GPU cores
>> together?  How does that work with stuff?
>
> This is a bit like the SLI question -- let's say you have 2 pricey
> desktop GPUs, with a fast interconnect between them, which lets them
> know about each other, how do you make use of that. Solution: unsolved
> :)
>
> In an ideal world, you'd have a single driver that knows how to
> interact with multiple devices and make them do cool things. However
> this a completely untrodden path. (Not to mention the problem of *how*
> to break up a workload across 2 GPUs.)

I agree in your example given the "fast interconnect" as that implies the GPUs are not independent.

>>
>> I think the idea that individual GPU cores should be exposed as
>> separate DRM devices is fundamentally flawed, and adds a hell of a
>> lot of complexity.
>>
>> In any case, I've spent _way_ too much time on etnaviv during November -
>> quite literally almost every day (I worked out that I was producing 4.5
>> patches a day during November for Etnaviv MESA.)  I'm afraid that it's
>> now time that I switch my attention elsewhere, so if this means that
>> Etnaviv is rejected for merging, I'm afraid it'll be a few months before
>> I can get back to it.
>>
>> It would have been nice if these issues had been brought up much earlier,
>> during the RFC posting of the patches.  These are nothing new, and I now
>> feel that this whole thing has been a total waste of time.
>
> The whole multi-gpu thing is a bit of an open question right now. It
> works in theory, but in practice nobody's done it. Maarten tried to
> get nouveau/gk20a + tegra/drm on Jetson TK1 to play nice with, e.g., X
> 2d accel, and it was an exercise in pain. Not sure that he ever
> succeeded.

This is going to be the common case on ARM.

> I think it's unfair to try to make new hardware enablement the time to
> attempt to heap extra work onto those authors unfortunate enough to
> have slightly unorthodox hardware that maps nicely onto some
> desired-but-not-quite-there-yet usage model -- they have enough
> problems.

Agreed. We're far from the original question on bindings. So the current one can work either way as the subsystem node could be ignored. What's exposed to userspace should be independent issue from that.

> The way everything works is one drm node can do everything. PRIME is a
> barely-functional way to offload some things onto a (single) secondary
> GPU. Everything beyond that is purely theoretical.
>
> None of what's being done now prevents some future where these things
> are broken up. No need to force it now.

Userspace expecting a single node
>
>   -ilia
