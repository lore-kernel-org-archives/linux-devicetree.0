From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: Overlay manager
Date: Thu, 8 Sep 2016 21:27:55 -0500
Message-ID: <CAL_JsqKgGFPKZR8fJ-CRQubNjWH0q_V9B9SsXoHncT9dMGdF1w@mail.gmail.com>
References: <001a113447d4718cb9053c04f991@google.com> <57D1D344.8010306@gmail.com>
 <CAH7ZN-w2U9g4m9hDdD1kY52HLzv+TSbuNVRbmzmE3WMH0wC8Tw@mail.gmail.com>
 <CAL_JsqKe99WLoeOrRz76mUx-QruhDU+4kqCAepgZa0LhSYbgDg@mail.gmail.com> <CALAqxLVPdZxMy+W0VEJqX+L9CCy4cBsc0s48BwepSA8-ApUhtQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALAqxLVPdZxMy+W0VEJqX+L9CCy4cBsc0s48BwepSA8-ApUhtQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Dmitry Shmidt <dimitrysh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "<linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 8, 2016 at 7:39 PM, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Thu, Sep 8, 2016 at 5:33 PM, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> On Thu, Sep 8, 2016 at 4:15 PM, Dmitry Shmidt <dimitrysh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrote:
>>> On Thu, Sep 8, 2016 at 2:08 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>> What problem(s) are you trying to solve with this?
>>>
>>> Currently the Linux kernel doesn't provide a way for boot time
>>> selection of different possible board configurations, when the board
>>> peripherals are specified via Device Tree.
>>
>> Well, the kernel does provide a way. For different h/w you give it a
>> different h/w description (i.e. dtb). The issue is having multiple
>> dtbs for mostly similar h/w is a PIA.
>
> Agreed.
>
>> Also, it can be argued this should remain a bootloader problem. For
>> the LCD case, the bootloader is going to need that information to
>> support a splash screen. libfdt is learning how to apply overlays on
>> flat trees.
>
> I can imagine in many cases like devboards with various attached
> shields/mezzanines the bootloader doesn't (and likely can't) have this
> ability.

Yes. That's the main reason overlays exist. There's a big blocker for
a major subset of this case that is needing to define a connector
binding. 96board mezzanine boards for example should have 1 overlay
independent of the base board and that means we need some indirection
for things like what i2c controller goes to I2C0 bus on the low speed
connector. All that is being worked on (slowly).

>>>> What is the use case?
>>>
>>> It is usually useful for development board when you can use
>>> different peripherals. For example you want to use special
>>> LCD panel. Using it will go on account of other stuff like GPIOs,
>>> so you don't want it all the time. And it is not convenient to
>>> apply new patches and to recompile the kernel. And this code
>>> allows to choose LCD panel configuration from command line.
>>
>> If you can figure out how to change the command line, then you can
>> just change the dtb. At least for how Android boot works, those aren't
>> really changed separately.
>
> Ehh.. that's not so simple. The dtb is often appended to the kernel on
> Android devices. Changing the boot arguments is much simpler to do.

How? You typically make a new bootimage assembling the kernel/dtb,
ramdisk and kernel command-line. If things were done differently such
that the dtb is part of the bootloader (how it is supposed to be
done), then I would buy the argument that we can't update the dtb and
need to either have a way to add and/or select overlays. But Android
folks like to update *everything*, so I don't buy that here.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
