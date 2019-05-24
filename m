From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v1 0/5] Solve postboot supplier cleanup and optimize probe
 ordering
Date: Fri, 24 May 2019 10:49:43 -0700
Message-ID: <06b479e2-e8a0-b3e8-567c-7fa0f1c5bdf6@gmail.com>
References: <20190524010117.225219-1-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190524010117.225219-1-saravanak@google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Saravana Kannan <saravanak@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@android.com
List-Id: devicetree@vger.kernel.org

On 5/23/19 6:01 PM, Saravana Kannan wrote:
> Add a generic "depends-on" property that allows specifying mandatory
> functional dependencies between devices. Add device-links after the
> devices are created (but before they are probed) by looking at this
> "depends-on" property.
> 
> This property is used instead of existing DT properties that specify
> phandles of other devices (Eg: clocks, pinctrl, regulators, etc). This
> is because not all resources referred to by existing DT properties are
> mandatory functional dependencies. Some devices/drivers might be able> to operate with reduced functionality when some of the resources
> aren't available. For example, a device could operate in polling mode
> if no IRQ is available, a device could skip doing power management if
> clock or voltage control isn't available and they are left on, etc.
> 
> So, adding mandatory functional dependency links between devices by
> looking at referred phandles in DT properties won't work as it would
> prevent probing devices that could be probed. By having an explicit
> depends-on property, we can handle these cases correctly.

Trying to wrap my brain around the concept, this series seems to be
adding the ability to declare that an apparent dependency (eg an IRQ
specified by a phandle) is _not_ actually a dependency.

The phandle already implies the dependency.  Creating a separate
depends-on property provides a method of ignoring the implied
dependencies.

This is not just hardware description.  It is instead a combination
of hardware functionality and driver functionality.  An example
provided in the second paragraph of the email I am replying to
suggests a device could operate in polling mode if no IRQ is
available.  Using this example, the devicetree does not know
whether the driver requires the IRQ (currently an implied
dependency since the IRQ phandle exists).  My understanding
of this example is that the device node would _not_ have a
depends-on property for the IRQ phandle so the IRQ would be
optional.  But this is an attribute of the driver, not the
hardware.  This is also configuration, declaring whether the
system is willing to accept polling mode instead of interrupt
mode.

Devicetree is not the proper place for driver description or
for configuration.

Another flaw with this method is that existing device trees
will be broken after the kernel is modified, because existing
device trees do not have the depends-on property.  This breaks
the devicetree compatibility rules.


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

By linking devices to suppliers before they are probed, we give suppliers a clear

>   count of the number of dependent consumers. Once all of the
>   consumers are active, the suppliers can turn off the unused
>   resources without making assumptions about the number of consumers.
> 
> By default we just add device-links to track "driver presence" (probe
> succeeded) of the supplier device. If any other functionality provided
> by device-links are needed, it is left to the consumer/supplier
> devices to change the link when they probe.
>  
> 
> Saravana Kannan (5):
>   of/platform: Speed up of_find_device_by_node()
>   driver core: Add device links support for pending links to suppliers
>   dt-bindings: Add depends-on property
>   of/platform: Add functional dependency link from "depends-on" property
>   driver core: Add sync_state driver/bus callback
> 
>  .../devicetree/bindings/depends-on.txt        |  26 +++++
>  drivers/base/core.c                           | 106 ++++++++++++++++++
>  drivers/of/platform.c                         |  75 ++++++++++++-
>  include/linux/device.h                        |  24 ++++
>  include/linux/of.h                            |   3 +
>  5 files changed, 233 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/depends-on.txt
> 

The above issues make this specific implementation not acceptable.

I like the analysis of the problem areas, and I like the concepts of
trying to solve not only probe ordering, but also the problem of
when to turn off resources that will not be needed.  But at the
moment, I don't have a suggestion of a way to implement a solution.

-Frank
