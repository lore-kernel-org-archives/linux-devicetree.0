From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v1 0/5] Solve postboot supplier cleanup and optimize probe ordering
Date: Fri, 24 May 2019 08:04:41 -0500
Message-ID: <CAL_JsqKiXEKECMZpZR3j+uRqnsec5f0vN301tagT687HRhu6Nw@mail.gmail.com>
References: <20190524010117.225219-1-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190524010117.225219-1-saravanak@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Saravana Kannan <saravanak@google.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Android Kernel Team <kernel-team@android.com>
List-Id: devicetree@vger.kernel.org

On Thu, May 23, 2019 at 8:01 PM Saravana Kannan <saravanak@google.com> wrote:
>
> Add a generic "depends-on" property that allows specifying mandatory
> functional dependencies between devices. Add device-links after the
> devices are created (but before they are probed) by looking at this
> "depends-on" property.

The DT already has dependency information. A node with 'clocks'
property has its dependency right there. We should use that. We don't
need to duplicate the information.

> This property is used instead of existing DT properties that specify
> phandles of other devices (Eg: clocks, pinctrl, regulators, etc). This
> is because not all resources referred to by existing DT properties are
> mandatory functional dependencies. Some devices/drivers might be able
> to operate with reduced functionality when some of the resources
> aren't available. For example, a device could operate in polling mode
> if no IRQ is available, a device could skip doing power management if
> clock or voltage control isn't available and they are left on, etc.

Yeah, but none of these examples are typically what you'd want to
happen. These cases are a property of the OS, not the DT. For example,
until recently, If you added pinctrl bindings to your DT, the kernel
would no longer boot because it would be looking for pinctrl driver.
That's wrong because the DT should not be coupled to the OS like that.
Adding this property will cause the same problem.

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

Do you have data on how much time is spent. Past 'smarter probing'
attempts have not shown a significant difference.

> - Supplier devices like clock providers, regulators providers, etc
>   need to keep the resources they provide active and at a particular
>   state(s) during boot up even if their current set of consumers don't
>   request the resource to be active. This is because the rest of the
>   consumers might not have probed yet and turning off the resource
>   before all the consumers have probed could lead to a hang or
>   undesired user experience.

We already know generally what devices are dependencies because you
just listed them. Why don't we make the kernel smarter by
instantiating these core devices/drivers first instead of relying on
initcall and link order.

>   Some frameworks (Eg: regulator) handle this today by turning off
>   "unused" resources at late_initcall_sync and hoping all the devices
>   have probed by then. This is not a valid assumption for systems with
>   loadable modules. Other frameworks (Eg: clock) just don't handle
>   this due to the lack of a clear signal for when they can turn off
>   resources. This leads to downstream hacks to handle cases like this
>   that can easily be solved in the upstream kernel.

IMO, we should get rid of this auto disabling.

Rob
