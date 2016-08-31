From: David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] drm: implement generic firmware eviction
Date: Wed, 31 Aug 2016 08:59:09 +0200
Message-ID: <CANq1E4QMneZt2Uef26Voz-N4BeHkha7niXDMO9GPqJe5zQEDOw@mail.gmail.com>
References: <20160826000056.12806-1-dh.herrmann@gmail.com> <CAL_Jsq+1MeicZmr+7Q4K6FLnTfD4jBBAQR1KPHMSLfNNUe4ENw@mail.gmail.com>
 <CANq1E4Shy1+rQsshWxeFRhFvuAg1sB3ffnVT7hoMZSjZAR=yuQ@mail.gmail.com>
 <CAL_JsqKOOExaBcQfzxYyPE-h9qd4E8T+9GOKQGvXpuNSaObxoA@mail.gmail.com>
 <CANq1E4Twr6Uy2QnowV_WP8yz9QymkchnFS1GwFf_FBRcYF6oOQ@mail.gmail.com> <CAL_JsqJuyPW-kPBbiaq2hRyMN0CBY5UXiUOxHR7GYkjDQodAfA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJuyPW-kPBbiaq2hRyMN0CBY5UXiUOxHR7GYkjDQodAfA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hey Rob!

On Wed, Aug 31, 2016 at 1:01 AM, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Aug 30, 2016 at 4:12 PM, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Currently I see at least 3 paths that might add such nodes:
>>
>>  - of_platform_populate()
>
> If we assume the node is only under chosen, then that would require a
> call to of_platform_populate with /chosen as the root which shouldn't
> happen. More generally the assumption is of_platform_populate is only
> called once from for the root node and only on sub-trees by the driver
> of sub-tree's root device.

I see.

>>  - of_node_attach() (via the notifier)
>
> A node getting attached would be harmless. Nothing really would happen
> until a handler calls of_platform_populate. So this is the same as the
> 1st case.

drivers/of/platform.c has a notifier callback and registers the
platform devices when added. It has a check that the parent is a
populated bus, which I guess is what you refer to?

>>  - simplefb_init()
>
> Actually, I'd prefer to move it out of there and into the core. I
> don't think drivers should look at /chosen and only the core and arch
> code should. Of course, the only enforcing of that is policy. For
> overlays though, there's been some discussion on limiting where
> overlays can be applied.
>
>> Should I just ignore anything but simplefb_init()? I understand that
>> it's the only one used by normal code-paths, but isn't it kinda ugly
>> to silently introduce race conditions if a node just happens to be
>> introduced via one of the other methods? Or are errors in the DT not
>> meant to be caught?
>
> In general there's no limit to how wrong a DT could be. I could write
> a DT that causes every DT enabled driver in the kernel to probe (that
> would be an interesting test case). The kernel is limited in knowing
> what is correct, and the whole point of DT is to move that information
> out of the kernel.  This is case is just one compatible string out of
> thousands and location in the tree is just one thing to check.
>
> This is a major reason why there is not yet a userspace interface for
> applying DT overlays as who knows what random crap could be in the DT.
> We're nervous about what could happen from frying h/w to creating
> security holes. Evidently the ACPI folks were not so nervous and added
> an interface.

I see. Thanks a lot for the clarifications! I will put the
of_platform_device_destroy() right next to the x86 handler, making
sure it is properly locked. I'm not so sure about the of_chosen
instantiation, though. x86 has the instantiation in
arch/x86/kernel/sysfb_simplefb.c, so maybe an equivalent for arm would
be fine?

Thanks
David
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
