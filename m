From: Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v1 0/5] Solve postboot supplier cleanup and optimize probe ordering
Date: Fri, 24 May 2019 19:17:30 -0700
Message-ID: <CAGETcx9MS+B3M2uoeZrpBmnCDGNHk480=eu3iyvdixM5-+OiXg@mail.gmail.com>
References: <20190524010117.225219-1-saravanak@google.com> <20190524055217.GC31664@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190524055217.GC31664@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Android Kernel Team <kernel-team@android.com>
List-Id: devicetree@vger.kernel.org

On Thu, May 23, 2019 at 10:52 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, May 23, 2019 at 06:01:11PM -0700, Saravana Kannan wrote:
> > Add a generic "depends-on" property that allows specifying mandatory
> > functional dependencies between devices. Add device-links after the
> > devices are created (but before they are probed) by looking at this
> > "depends-on" property.
> >
> > This property is used instead of existing DT properties that specify
> > phandles of other devices (Eg: clocks, pinctrl, regulators, etc). This
> > is because not all resources referred to by existing DT properties are
> > mandatory functional dependencies. Some devices/drivers might be able
> > to operate with reduced functionality when some of the resources
> > aren't available. For example, a device could operate in polling mode
> > if no IRQ is available, a device could skip doing power management if
> > clock or voltage control isn't available and they are left on, etc.
> >
> > So, adding mandatory functional dependency links between devices by
> > looking at referred phandles in DT properties won't work as it would
> > prevent probing devices that could be probed. By having an explicit
> > depends-on property, we can handle these cases correctly.
> >
> > Having functional dependencies explicitly called out in DT and
> > automatically added before the devices are probed, provides the
> > following benefits:
> >
> > - Optimizes device probe order and avoids the useless work of
> >   attempting probes of devices that will not probe successfully
> >   (because their suppliers aren't present or haven't probed yet).
> >
> >   For example, in a commonly available mobile SoC, registering just
> >   one consumer device's driver at an initcall level earlier than the
> >   supplier device's driver causes 11 failed probe attempts before the
> >   consumer device probes successfully. This was with a kernel with all
> >   the drivers statically compiled in. This problem gets a lot worse if
> >   all the drivers are loaded as modules without direct symbol
> >   dependencies.
> >
> > - Supplier devices like clock providers, regulators providers, etc
> >   need to keep the resources they provide active and at a particular
> >   state(s) during boot up even if their current set of consumers don't
> >   request the resource to be active. This is because the rest of the
> >   consumers might not have probed yet and turning off the resource
> >   before all the consumers have probed could lead to a hang or
> >   undesired user experience.
> >
> >   Some frameworks (Eg: regulator) handle this today by turning off
> >   "unused" resources at late_initcall_sync and hoping all the devices
> >   have probed by then. This is not a valid assumption for systems with
> >   loadable modules. Other frameworks (Eg: clock) just don't handle
> >   this due to the lack of a clear signal for when they can turn off
> >   resources. This leads to downstream hacks to handle cases like this
> >   that can easily be solved in the upstream kernel.
> >
> >   By linking devices before they are probed, we give suppliers a clear
> >   count of the number of dependent consumers. Once all of the
> >   consumers are active, the suppliers can turn off the unused
> >   resources without making assumptions about the number of consumers.
> >
> > By default we just add device-links to track "driver presence" (probe
> > succeeded) of the supplier device. If any other functionality provided
> > by device-links are needed, it is left to the consumer/supplier
> > devices to change the link when they probe.
>
> Somewhere in this wall of text you need to say:
>         MAKES DEVICES BOOT FASTER!
> right?  :)

I'm sure it will, but I can't easily test and measure this number
because I don't have a device with 100s of devices (common in mobile
SoCs) where I can load all the drivers as modules and are supported
upstream. And the current ones I have mostly workaround this in their
downstream tree by manually ordering with initcalls and link order.
But I see the avoidance of useless probes that'll fail as more of a
free side benefit and not the main goal of this patch series. Getting
modules to actually work and crash the system while booting is the
main goal.

> So in short, this solves the issue of deferred probing with systems with
> loads of modules for platform devices and device tree, in that now you
> have a chance to probe devices in the correct order saving loads of busy
> loops.

Yes, definitely saves loads of busy work.

> A good thing, I like this, very nice work, all of these are:
>         Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks!

> but odds are I'll take this through my tree, so I'll add my s-o-b then.
> But only after the DT people agree on the new entry.

Yup! Trying to do that. :)

-Saravana
