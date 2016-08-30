From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC] drm: implement generic firmware eviction
Date: Tue, 30 Aug 2016 18:01:26 -0500
Message-ID: <CAL_JsqJuyPW-kPBbiaq2hRyMN0CBY5UXiUOxHR7GYkjDQodAfA@mail.gmail.com>
References: <20160826000056.12806-1-dh.herrmann@gmail.com> <CAL_Jsq+1MeicZmr+7Q4K6FLnTfD4jBBAQR1KPHMSLfNNUe4ENw@mail.gmail.com>
 <CANq1E4Shy1+rQsshWxeFRhFvuAg1sB3ffnVT7hoMZSjZAR=yuQ@mail.gmail.com>
 <CAL_JsqKOOExaBcQfzxYyPE-h9qd4E8T+9GOKQGvXpuNSaObxoA@mail.gmail.com> <CANq1E4Twr6Uy2QnowV_WP8yz9QymkchnFS1GwFf_FBRcYF6oOQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CANq1E4Twr6Uy2QnowV_WP8yz9QymkchnFS1GwFf_FBRcYF6oOQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 30, 2016 at 4:12 PM, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi
>
> On Tue, Aug 30, 2016 at 10:58 PM, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> On Tue, Aug 30, 2016 at 2:30 PM, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> Sure, all those functions are not meant to be called in parallel by
>>> multiple tasks. They are rather meant to have a single holder which
>>> preferably is the one instantiating and destroying the
>>> node/device/foobar. But the framebuffer eviction code somehow needs to
>>> trigger the removal, and thus needs some hook, that can be called in
>>> parallel by any driver that is loaded.
>>>
>>> I can make sure the simple-framebuffer eviction code is locked
>>> properly. That'll work, for now. But if someone ends up providing
>>> simple-framebuffer devices via overlays or any other dynamic
>>> mechanism, they will race the removal.
>>
>> No doubt someone will come up with some usecase wanting to do that,
>> but IMO that is not a supported usecase and should not be.
>> simple-framebuffer is for providing a firmware setup framebuffer.
>
> Sure. Any sensible simple-framebuffer use would follow what we have
> now. But it feels wrong to me that if some node is added that just
> happens to have "simple-framebuffer" as name, suddenly things will go
> wrong. I mean, yeah, DT is not a userspace API, but I still would like
> the code to catch misuses rather than fail. It is an API after all. Or
> is that being overly pedantic?

The kernel could blow up in all sorts of interesting ways if random
nodes were created. IMO, it is not the kernel's job to be a DT
validator. If it is, it is doing a horrible job. And don't get me
wrong, we do need something to do that. That is all orthogonal to
dynamic devices and the issues there.

>>> And it will be completely
>>> non-obvious to them. I really don't want to be responsible to have
>>> submitted that code. If anyone cares for proper device hand-over on
>>> ARM, please come up with an idea to fix it. Otherwise, I will just
>>> limit the simpledrm code to x86.
>>>
>>> IOW the device handover code somehow needs to know who was responsible
>>> for the instantiation of the simple-framebuffer device, so it can tell
>>> them to remove it again. On x86 there is only one place where those
>>> can be instantiated. But on OF-based systems, it can be dynamically
>>> instantiated in many places right now.
>>
>> What do you mean by all over the place? It is only in simplefb_init
>> ATM. I haven't looked at what simpledrm is doing, but we can move the
>> device creation to of_platform_default_populate_init if we need a
>> single spot.
>
> Currently I see at least 3 paths that might add such nodes:
>
>  - of_platform_populate()

If we assume the node is only under chosen, then that would require a
call to of_platform_populate with /chosen as the root which shouldn't
happen. More generally the assumption is of_platform_populate is only
called once from for the root node and only on sub-trees by the driver
of sub-tree's root device.

>  - of_node_attach() (via the notifier)

A node getting attached would be harmless. Nothing really would happen
until a handler calls of_platform_populate. So this is the same as the
1st case.

>  - simplefb_init()

Actually, I'd prefer to move it out of there and into the core. I
don't think drivers should look at /chosen and only the core and arch
code should. Of course, the only enforcing of that is policy. For
overlays though, there's been some discussion on limiting where
overlays can be applied.

> Should I just ignore anything but simplefb_init()? I understand that
> it's the only one used by normal code-paths, but isn't it kinda ugly
> to silently introduce race conditions if a node just happens to be
> introduced via one of the other methods? Or are errors in the DT not
> meant to be caught?

In general there's no limit to how wrong a DT could be. I could write
a DT that causes every DT enabled driver in the kernel to probe (that
would be an interesting test case). The kernel is limited in knowing
what is correct, and the whole point of DT is to move that information
out of the kernel.  This is case is just one compatible string out of
thousands and location in the tree is just one thing to check.

This is a major reason why there is not yet a userspace interface for
applying DT overlays as who knows what random crap could be in the DT.
We're nervous about what could happen from frying h/w to creating
security holes. Evidently the ACPI folks were not so nervous and added
an interface.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
