From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v7 0/7] Solve postboot supplier cleanup and optimize probe
 ordering
Date: Tue, 30 Jul 2019 19:22:37 -0700
Message-ID: <89a8db12-422d-5881-3909-56fd48881401@gmail.com>
References: <20190724001100.133423-1-saravanak@google.com>
 <20190725134214.GD11115@kroah.com>
 <99ca3252-55af-8eea-7653-8347b0a1ab03@gmail.com>
 <20190726143225.GA13297@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190726143225.GA13297@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Saravana Kannan <saravanak@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, David Collins <collinsd@codeaurora.org>, kernel-team@android.com
List-Id: devicetree@vger.kernel.org

Hi Greg, Rob,

On 7/26/19 7:32 AM, Greg Kroah-Hartman wrote:
> On Thu, Jul 25, 2019 at 02:04:23PM -0700, Frank Rowand wrote:
>> On 7/25/19 6:42 AM, Greg Kroah-Hartman wrote:
>>> On Tue, Jul 23, 2019 at 05:10:53PM -0700, Saravana Kannan wrote:
>>>> Add device-links to track functional dependencies between devices
>>>> after they are created (but before they are probed) by looking at
>>>> their common DT bindings like clocks, interconnects, etc.
>>>>
>>>> Having functional dependencies automatically added before the devices
>>>> are probed, provides the following benefits:
>>>>
>>>> - Optimizes device probe order and avoids the useless work of
>>>>   attempting probes of devices that will not probe successfully
>>>>   (because their suppliers aren't present or haven't probed yet).
>>>>
>>>>   For example, in a commonly available mobile SoC, registering just
>>>>   one consumer device's driver at an initcall level earlier than the
>>>>   supplier device's driver causes 11 failed probe attempts before the
>>>>   consumer device probes successfully. This was with a kernel with all
>>>>   the drivers statically compiled in. This problem gets a lot worse if
>>>>   all the drivers are loaded as modules without direct symbol
>>>>   dependencies.
>>>>
>>>> - Supplier devices like clock providers, interconnect providers, etc
>>>>   need to keep the resources they provide active and at a particular
>>>>   state(s) during boot up even if their current set of consumers don't
>>>>   request the resource to be active. This is because the rest of the
>>>>   consumers might not have probed yet and turning off the resource
>>>>   before all the consumers have probed could lead to a hang or
>>>>   undesired user experience.
>>>>
>>>>   Some frameworks (Eg: regulator) handle this today by turning off
>>>>   "unused" resources at late_initcall_sync and hoping all the devices
>>>>   have probed by then. This is not a valid assumption for systems with
>>>>   loadable modules. Other frameworks (Eg: clock) just don't handle
>>>>   this due to the lack of a clear signal for when they can turn off
>>>>   resources. This leads to downstream hacks to handle cases like this
>>>>   that can easily be solved in the upstream kernel.
>>>>
>>>>   By linking devices before they are probed, we give suppliers a clear
>>>>   count of the number of dependent consumers. Once all of the
>>>>   consumers are active, the suppliers can turn off the unused
>>>>   resources without making assumptions about the number of consumers.
>>>>
>>>> By default we just add device-links to track "driver presence" (probe
>>>> succeeded) of the supplier device. If any other functionality provided
>>>> by device-links are needed, it is left to the consumer/supplier
>>>> devices to change the link when they probe.
>>>>
>>>> v1 -> v2:
>>>> - Drop patch to speed up of_find_device_by_node()
>>>> - Drop depends-on property and use existing bindings
>>>>
>>>> v2 -> v3:
>>>> - Refactor the code to have driver core initiate the linking of devs
>>>> - Have driver core link consumers to supplier before it's probed
>>>> - Add support for drivers to edit the device links before probing
>>>>
>>>> v3 -> v4:
>>>> - Tested edit_links() on system with cyclic dependency. Works.
>>>> - Added some checks to make sure device link isn't attempted from
>>>>   parent device node to child device node.
>>>> - Added way to pause/resume sync_state callbacks across
>>>>   of_platform_populate().
>>>> - Recursively parse DT node to create device links from parent to
>>>>   suppliers of parent and all child nodes.
>>>>
>>>> v4 -> v5:
>>>> - Fixed copy-pasta bugs with linked list handling
>>>> - Walk up the phandle reference till I find an actual device (needed
>>>>   for regulators to work)
>>>> - Added support for linking devices from regulator DT bindings
>>>> - Tested the whole series again to make sure cyclic dependencies are
>>>>   broken with edit_links() and regulator links are created properly.
>>>>
>>>> v5 -> v6:
>>>> - Split, squashed and reordered some of the patches.
>>>> - Refactored the device linking code to follow the same code pattern for
>>>>   any property.
>>>>
>>>> v6 -> v7:
>>>> - No functional changes.
>>>> - Renamed i to index
>>>> - Added comment to clarify not having to check property name for every
>>>>   index
>>>> - Added "matched" variable to clarify code. No functional change.
>>>> - Added comments to include/linux/device.h for add_links()
>>>>
>>>> I've also not updated this patch series to handle the new patch [1] from
>>>> Rafael. Will do that once this patch series is close to being Acked.
>>>>
>>>> [1] - https://lore.kernel.org/lkml/3121545.4lOhFoIcdQ@kreacher/
>>>
>>>
>>> This looks sane to me.  Anyone have any objections for me queueing this
>>> up for my tree to get into linux-next now?
>>
>> I would like for the series to get into linux-next sooner than later,
>> and spend some time there.  
> 
> Ok, care to give me an ack for it?  :)

Rob opined to me that if you apply the series, it will go into 5.4 unless
reverted.  That is also what I would expect.

I'm going through the series carefully now.  This is currently my highest
priority task.  I don't yet know if my comments will be minor, or whether
I will have larger changes to request.

So I am not ready to ack the series yet.

-Frank

> 
> thanks,
> 
> greg k-h
> 
