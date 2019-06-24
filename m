From: Sandeep Patil <sspatil@android.com>
Subject: Re: [RESEND PATCH v1 0/5] Solve postboot supplier cleanup and
 optimize probe ordering
Date: Mon, 24 Jun 2019 15:37:07 -0700
Message-ID: <20190624223707.GH203031@google.com>
References: <20190604003218.241354-1-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190604003218.241354-1-saravanak@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Saravana Kannan <saravanak@google.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Frank Rowand <frowand.list@gmail.com>, David Collins <collinsd@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@android.com
List-Id: devicetree@vger.kernel.org

(Responding to the first email in the series to summarize the current
situation and choices we have.)

On Mon, Jun 03, 2019 at 05:32:13PM -0700, 'Saravana Kannan' via kernel-team wrote:
> Add a generic "depends-on" property that allows specifying mandatory
> functional dependencies between devices. Add device-links after the
> devices are created (but before they are probed) by looking at this
> "depends-on" property.
> 
> This property is used instead of existing DT properties that specify
> phandles of other devices (Eg: clocks, pinctrl, regulators, etc). This
> is because not all resources referred to by existing DT properties are
> mandatory functional dependencies. Some devices/drivers might be able
> to operate with reduced functionality when some of the resources
> aren't available. For example, a device could operate in polling mode
> if no IRQ is available, a device could skip doing power management if
> clock or voltage control isn't available and they are left on, etc.
> 
> So, adding mandatory functional dependency links between devices by
> looking at referred phandles in DT properties won't work as it would
> prevent probing devices that could be probed. By having an explicit
> depends-on property, we can handle these cases correctly.
> 
> Having functional dependencies explicitly called out in DT and
> automatically added before the devices are probed, provides the
> following benefits:
> 
> - Optimizes device probe order and avoids the useless work of
>   attempting probes of devices that will not probe successfully
>   (because their suppliers aren't present or haven't probed yet).
> 
>   For example, in a commonly available mobile SoC, registering just
>   one consumer device's driver at an initcall level earlier than the
>   supplier device's driver causes 11 failed probe attempts before the
>   consumer device probes successfully. This was with a kernel with all
>   the drivers statically compiled in. This problem gets a lot worse if
>   all the drivers are loaded as modules without direct symbol
>   dependencies.
> 
> - Supplier devices like clock providers, regulators providers, etc
>   need to keep the resources they provide active and at a particular
>   state(s) during boot up even if their current set of consumers don't
>   request the resource to be active. This is because the rest of the
>   consumers might not have probed yet and turning off the resource
>   before all the consumers have probed could lead to a hang or
>   undesired user experience.
> 
>   Some frameworks (Eg: regulator) handle this today by turning off
>   "unused" resources at late_initcall_sync and hoping all the devices
>   have probed by then. This is not a valid assumption for systems with
>   loadable modules. Other frameworks (Eg: clock) just don't handle
>   this due to the lack of a clear signal for when they can turn off
>   resources. This leads to downstream hacks to handle cases like this
>   that can easily be solved in the upstream kernel.
> 
>   By linking devices before they are probed, we give suppliers a clear
>   count of the number of dependent consumers. Once all of the
>   consumers are active, the suppliers can turn off the unused
>   resources without making assumptions about the number of consumers.
> 
> By default we just add device-links to track "driver presence" (probe
> succeeded) of the supplier device. If any other functionality provided
> by device-links are needed, it is left to the consumer/supplier
> devices to change the link when they probe.
>  

We are trying to make sure that all (most) drivers in an Aarch64 system can
be kernel modules for Android, like any other desktop system for
example. There are a number of problems we need to fix before that happens
ofcourse.

That patch series does the following -

1. Resolve the consumer<->supplier relationship in order for subsystems to
turn off resources to save power is #1 on our list. This is because it will
define how driver and DT writers define and write their code for Android
devices.

2. Resolve cyclic dependency between devices nodes as a side-effect.  That
will make sure Android systems do not suffer from deferred probing and we
have a generic way of serialize driver probes. (This can also be mitigated
somewhat by module dependencies outside of the kernel.)

Subsystems like regulator, interconnect can immediately benefit from #1 and
it makes the module/driver loading possible for Android systems without
regressing power horribly.

After thinking about Rob's suggestion to loop though dependencies, I think it
doesn't work because we don't know what to do when there are cycles. Drivers
sometimes need to have access to phandles in order to retrieve resources from
that phandle. We can't assume that is an implied "probe dependency". Saravana
had several such examples already and it is a _real world_ scenario.

I think the current binding are insufficient to describe the runtime hardware
dependencies. IOW, the current bindinds were probably intended to be that, but
drivers use them to get phandles for other nodes too and are not *strict*
dependencies. Either way, for Android systems to realize this goal of having
driver modules load on demand, we have to have something that does what this
patch series does.

I am also sensitive to the fact that adding a new binding in "depends-on"
will mean all Android devices will start *depending on* that DT binding (no
pun intended) without any upstream support. We want to avoid that as much
as possible.

I guess we are happy to hear better ways of doing this that work, but in the
absence of that, we are going to have to carry the series for Android and
that makes me sad :(

Suggestions, thoughts, for what Android should do here...?

Thanks
- ssp
