From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v10 0/7] Solve postboot supplier cleanup and optimize
 probe ordering
Date: Thu, 29 Aug 2019 11:43:38 -0500
Message-ID: <CAL_Jsq+2vR75ofq=aKOt1bb1T-JfhiGSR9dnHWQf7VLmgJP4eA@mail.gmail.com>
References: <20190829074603.70424-1-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190829074603.70424-1-saravanak@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Saravana Kannan <saravanak@google.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Len Brown <lenb@kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-acpi@vger.kernel.org, clang-built-linux <clang-built-linux@googlegroups.com>, David Collins <collinsd@codeaurora.org>, Android Kernel Team <kernel-team@android.com>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 29, 2019 at 2:46 AM Saravana Kannan <saravanak@google.com> wrote:
>
> Add device-links to track functional dependencies between devices
> after they are created (but before they are probed) by looking at
> their common DT bindings like clocks, interconnects, etc.
>
> Having functional dependencies automatically added before the devices
> are probed, provides the following benefits:
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
> - Supplier devices like clock providers, interconnect providers, etc
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
> v1 -> v2:
> - Drop patch to speed up of_find_device_by_node()
> - Drop depends-on property and use existing bindings
>
> v2 -> v3:
> - Refactor the code to have driver core initiate the linking of devs
> - Have driver core link consumers to supplier before it's probed
> - Add support for drivers to edit the device links before probing
>
> v3 -> v4:
> - Tested edit_links() on system with cyclic dependency. Works.
> - Added some checks to make sure device link isn't attempted from
>   parent device node to child device node.
> - Added way to pause/resume sync_state callbacks across
>   of_platform_populate().
> - Recursively parse DT node to create device links from parent to
>   suppliers of parent and all child nodes.
>
> v4 -> v5:
> - Fixed copy-pasta bugs with linked list handling
> - Walk up the phandle reference till I find an actual device (needed
>   for regulators to work)
> - Added support for linking devices from regulator DT bindings
> - Tested the whole series again to make sure cyclic dependencies are
>   broken with edit_links() and regulator links are created properly.
>
> v5 -> v6:
> - Split, squashed and reordered some of the patches.
> - Refactored the device linking code to follow the same code pattern for
>   any property.
>
> v6 -> v7:
> - No functional changes.
> - Renamed i to index
> - Added comment to clarify not having to check property name for every
>   index
> - Added "matched" variable to clarify code. No functional change.
> - Added comments to include/linux/device.h for add_links()
>
> v7 -> v8:
> - Rebased on top of linux-next to handle device link changes in [1]
>
> v8 -> v9:
> - Fixed kbuild test bot reported errors (docs and const)
>
> v9->v10:
> - Changes made based on reviews on LKML [2] and discussions at ELC [3]
> - Dropped the edit_links() patch
> - Dropped the patch that skips linking for default bus nodes
> - 1/7: Changed from bus.add_links() to fwnode.ops.add_links()
> - 1/7: Update device link doc
> - 1/7: Lots of comments/fn doc updates
> - 1/7: Renamed device_link_check_waiting_consumers() to
>   device_link_add_missing_supplier_links()
> - 2/7: Moved DT parsing/linking code from of/platform.c to of/property.c

Why? You'll notice that of/property.c doesn't know anything about
platform_device (and struct device):

$ git grep platform_device -- drivers/of/property.c
$

Everything related to platform_device goes in of/platform.c.
Everything related to struct device only goes in of/device.c. I'd be
okay with a new file for this too.

Rob
