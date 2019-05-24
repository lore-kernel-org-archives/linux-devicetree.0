From: Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v1 0/5] Solve postboot supplier cleanup and optimize probe ordering
Date: Fri, 24 May 2019 14:51:15 -0700
Message-ID: <CAGETcx-KwwjNgAy7BLv4+1=5N_s-UdmfSnTtHP8V5gc7t48W=Q@mail.gmail.com>
References: <20190524010117.225219-1-saravanak@google.com> <CAL_JsqKiXEKECMZpZR3j+uRqnsec5f0vN301tagT687HRhu6Nw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKiXEKECMZpZR3j+uRqnsec5f0vN301tagT687HRhu6Nw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Android Kernel Team <kernel-team@android.com>
List-Id: devicetree@vger.kernel.org

Before I address all the comments, a friendly reminder: Whatever
solution we come up with needs to work on a system with loadable
modules and shouldn't depend on userspace for correctness.

On Fri, May 24, 2019 at 6:04 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Thu, May 23, 2019 at 8:01 PM Saravana Kannan <saravanak@google.com> wrote:
> >
> > Add a generic "depends-on" property that allows specifying mandatory
> > functional dependencies between devices. Add device-links after the
> > devices are created (but before they are probed) by looking at this
> > "depends-on" property.
>
> The DT already has dependency information. A node with 'clocks'
> property has its dependency right there. We should use that. We don't
> need to duplicate the information.

So, are you saying all clock bindings are mandatory for a device for
all possible users of DT + Linux? Do you think if we have a patch that
makes all clock bindings mandatory dependencies, no one would object
to that?

> > This property is used instead of existing DT properties that specify
> > phandles of other devices (Eg: clocks, pinctrl, regulators, etc). This
> > is because not all resources referred to by existing DT properties are
> > mandatory functional dependencies. Some devices/drivers might be able
> > to operate with reduced functionality when some of the resources
> > aren't available. For example, a device could operate in polling mode
> > if no IRQ is available, a device could skip doing power management if
> > clock or voltage control isn't available and they are left on, etc.
>
> Yeah, but none of these examples are typically what you'd want to
> happen. These cases are a property of the OS, not the DT. For example,
> until recently, If you added pinctrl bindings to your DT, the kernel
> would no longer boot because it would be looking for pinctrl driver.
> That's wrong because the DT should not be coupled to the OS like that.
> Adding this property will cause the same problem.

Isn't the a perfect example of the pinctrl being an optional
dependency in that specific case? The kernel still booted if pinctrl
wasn't available?

I don't agree that the dependency is purely a property of the OS. If
there's no clock to clock the hardware core, then the hardware just
can't work. There's no question about that. However, there can be
clock bindings that aren't mandatory for functionality but are needed
just for performance/power control.

Another perfect example are clock providers. Clock providers often get
input clocks from multiple other clock providers and even have cyclic
clock bindings. But only some of them are mandatory for the clock
provider to work. For example, clock provider A has input clocks from
clock providers B and C, but it only needs B to function (provides
root clock to all clocks). Not having C would only affect 4 (out of
100s of clocks) from clock provider A and those 4 are clocks depend on
an input clock from C (basically clock from C going to A to have some
clock gates and dividers added and sent back to C). This isn't even a
made up scenario -- there are SoCs that actually have this.

The OS could still choose to not probe the device unless full
functionality is available or it could assume all clocks are left on
by the bootloader and provide basic functionality. THAT would be the
property of the OS. But that doesn't remove the fact that some of the
resources are absolutely mandatory for the hardware to function. I'm
proposing the depends-on to capture the true hardware dependency --
not what the SW chooses to do with it.

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
>
> Do you have data on how much time is spent. Past 'smarter probing'
> attempts have not shown a significant difference.

"avoids the useless work attempting probes of devices that will not
probe successfully" -- I never claimed to save boot up time. Your
argument about having to save wall clock time is a moot point as a ton
of kernel features that optimize code won't save wall clock time (the
CPU would just run faster to make up for the inefficiency). Those
features just make the kernel less resource hungry and more efficient.
I'd understand your argument if this patch series is insanely complex
-- but that's not the case here.

> > - Supplier devices like clock providers, regulators providers, etc
> >   need to keep the resources they provide active and at a particular
> >   state(s) during boot up even if their current set of consumers don't
> >   request the resource to be active. This is because the rest of the
> >   consumers might not have probed yet and turning off the resource
> >   before all the consumers have probed could lead to a hang or
> >   undesired user experience.
>
> We already know generally what devices are dependencies because you
> just listed them. Why don't we make the kernel smarter by
> instantiating these core devices/drivers first instead of relying on
> initcall and link order.

That's what this patch series is -- it makes the kernel smarter by
just using the data from DT instead of relying on manual tweaking of
initcall and link order.

> >   Some frameworks (Eg: regulator) handle this today by turning off
> >   "unused" resources at late_initcall_sync and hoping all the devices
> >   have probed by then. This is not a valid assumption for systems with
> >   loadable modules. Other frameworks (Eg: clock) just don't handle
> >   this due to the lack of a clear signal for when they can turn off
> >   resources. This leads to downstream hacks to handle cases like this
> >   that can easily be solved in the upstream kernel.
>
> IMO, we should get rid of this auto disabling.

Well, you need to back that opinion with reasoning. IMO we should
disable unused resources so that we don't waste power -- especially on
devices operating on batteries.

Also, I explicitly said "need to keep the resources they provide
active and at a particular state(s) during boot up". So it's not even
about auto disabling. For example, in the case of a voltage regulator
supplying multiple devices, if the first device probes and says it
only need the lowest voltage level, you can't just drop the voltage.
Because the other devices in the same voltage rail haven't probed yet
and you can crash the system if you just drop the voltage. You need to
wait for all the devices to be probed and then you can let the voltage
regulator operate normally. And you can't depend on late_initcall
because it falls apart on systems with modules.


-Saravana
