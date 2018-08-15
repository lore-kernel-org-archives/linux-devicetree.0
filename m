From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [RFC PATCH v1 0/3] device property: Support MAC address in VPD
Date: Tue, 14 Aug 2018 17:52:49 -0700
Message-ID: <bb1b2b7d-2c47-a6b3-7618-063351f379b2@gmail.com>
References: <20180814223758.117433-1-briannorris@chromium.org>
 <a240b3f9-d41b-30d7-ef11-5dcd1a981c0f@gmail.com>
 <20180815002204.GA258561@ban.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180815002204.GA258561@ban.mtv.corp.google.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Guenter Roeck <linux@roeck-us.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>, Stephen Boyd <swboyd@chromium.org>, Brian Norris <briannorris@chromium.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

On 08/14/2018 05:22 PM, Brian Norris wrote:
> + Srinivas, as there are NVMEM questions
> 
> Hi Florian,
> 
> Thanks for the quick reply.
> 
> On Tue, Aug 14, 2018 at 04:00:28PM -0700, Florian Fainelli wrote:
>> On 08/14/2018 03:37 PM, Brian Norris wrote:
>>> Today, we have generic support for 'mac-address' and 'local-mac-address'
>>> properties in both Device Tree nodes and in generic Device Properties,
>>> such that network device drivers can pick up a hardware address from
>>> there, in cases where the MAC address isn't baked into the network card.
>>> This method of MAC address retrieval presumes that either:
>>> (a) there's a unique device tree (or similar) stored on a given device
>>>     or
>>> (b) some other entity (e.g., boot firmware) will modify device nodes
>>>     runtime to place that MAC address into the appropriate device
>>>     properties.
>>>
>>> Option (a) is not feasbile for many systems.
>>>
>>> Option (b) can work, but there are some reasons why one might not want
>>> to do that:
>>>  (1) This requires that system firmware understand the device tree
>>>      structure, sometimes to the point of memorizing path names (e.g.,
>>>      /soc/wifi@xxxxxxxx). At least for Device Tree, these path names are
>>>      not necessarily an ABI, and so this introduces unneeded fragility.
>>
>> The path to a node is something that is well defined and should be
>> stable given that the high level function of the node and its unit
>> address are not supposed to change. Under which circumstances, besides
>> incorrect specification of either of these two things, do they not
>> consist an ABI? Not refuting your statement here, just curious when/how
>> this can happen?
> 
> I can think of a few reasons:
> 
>  * it's not really standardized whether to use a /soc/ node or to
>    just put top-level SoC blocks directly under /. There might be
>    "recommendations", but I certainly have seen it both ways.

That type of stability and standardization, ok

> 
>  * the "high level function name" is not set in stone AFAICT. Or at
>    least, I've never seen a list of documented names. So while on one
>    system I might see 'wlan@', another might use 'wifi@'.

There are some recommended function names defined in devicetree-spec,
not everything is covered since the spec is still lagging a bit behind
as far as recommending names for what a modern SoC/board would embed
(with some definition of "modern").

> 
>  * in any of the above (and in any other case of lack of clarity), one
>    can make slightly different choices when, e.g., submitting a device
>    tree upstream vs. a downstream tree. While we may try our hardest to
>    document and stick to documented bindings, I personally can't
>    guarantee that one of these choices will be made differently during
>    review, possibly breaking any firmware that made assumptions based on
>    those choices. So I might end up with a firmware that satisfies
>    documented bindings and works with a downstream device tree, but
>    doesn't work with a device tree that gets submitted upstream.

Sure, this is kind of a self inflicted problem but agreed this does exist.

> 
>> Also, aliases in DT are meant to provide some stability.
> 
> How, specifically? I don't see any relevant binding description for
> aliases under Documentation/devicetree/bindings/net/.

Indeed they are not, likewise, we should probably update devicetree-spec
to come up with standard names that of_alias_get_id() already consumes.

> 
>>>  (2) Other than this device-tree shim requirement, system firmware may
>>>      have no reason to understand anything about network devices.
>>>
>>> So instead, I'm looking for a way to have a device node describe where
>>> to find its MAC address, rather than having the device node contain the
>>> MAC address directly. Then system firmware doesn't have to manage
>>> anything.
>>>
>>> In particular, I add support for the Google Vital Product Data (VPD)
>>> format, used within the Coreboot project. The format is described here:
>>>
>>> https://chromium.googlesource.com/chromiumos/platform/vpd/+/master/README.md
>>>
>>> TL;DR: VPD consists of a TLV-like table, with key/value pairs of
>>> strings. This is often stored persistently on the boot flash and
>>> presented via in-memory Coreboot tables, for the operating system to
>>> read.
>>>
>>> We already have a VPD driver that parses this table and presents it to
>>> user space. This series extends that driver to allow in-kernel lookups
>>> of MAC address entries.
>>
>> A possible alternative approach is to have the VPD driver become a NVMEM
>> producer to expose the VPD keys, did you look into that and possibly
>> found that it was not a good model? The downside to that approach though
>> is that you might have to have a phandle for the VPD provider in the
>> Device Tree, but AFAICS this should solve your needs?
> 
> I did notice some NVMEM work. The MTD links you point at shouldn't be
> relevant, since this table is already present in RAM. But I suppose I
> could shoehorn the memory table into being a fake NVMEM...
> 
> And then, how would you recommend doing the parameterization I note
> here? Is the expectation that I define a new cell for every single type?
> Each cell might have a different binary format, so I'd have to describe:
> (a) that they contain MAC addresses (so the "reader" knows to translate
>     the ASCII strings into equivalent binary representation) and

I see, in your current patch series that knowledge is pushed to both the
VPD producer and the specific object lookup function, so this scales better.

> (b) which key matches (it's not just "mac_address=xxxxx"; there may be
>     many MAC addresses, with keys "ether_mac0", "ether_mac1",
>     "wifi_mac0")

The key to lookup is definitively node specific, it is just unfortunate
that there is not a better way to infer which key to lookup for (as
opposed to just having to specify it directly) based on the Device Tree
topology. By that I mean, if you have a "mac-address-lookup" property
associated with Wi-Fi adapter #1 (with numbering starting at 0), then
this automatically means looking up for "wifi_mac1", etc.

> Part (a) especially doesn't really sound like the typical NVMEM, which
> seems to pretend it provides raw access to these memory regions.
> 
> Additionally, VPD is not stored at a fixed address, nor are any
> particular entries within it (it uses TLV), so it seems like there are
> plenty of other bits of the nvmem.txt documentation I'd have to violate
> to get there, such as the definition of 'reg':
> 
> reg:    specifies the offset in byte within the storage device.
> 
> And finally, this may be surmountable, but the existing APIs seem very
> device tree centric. We use this same format on ACPI systems, and the
> current series would theoretically work on both [1]. I'd have to rewrite
> the current (OF-only) helpers to get equivalent support...

All fair points, never mind NVMEM, I was just too keen on thinking this
would be finally the way to make the consumers and producers of such
information into a single API, but your proposal appears valid too.

Is ChromeOS' directly inspired from the PCI's spec VPD?

> 
> BTW, it's quite annoying that we have all of these:
> 
> fwnode_get_mac_address()
> device_get_mac_address()
> of_get_mac_address()
> of_get_nvmem_mac_address()
> 
> and only 2 of those share any code! Brilliant!

Sounds like you just found another area to improve on ;)

> 
>> [1]: https://patchwork.ozlabs.org/cover/956062/
>> [2]: https://lkml.org/lkml/2018/3/24/312
> 
> Brian
> 
> [1] Fortunately, I've only needed this on DT so far.
> 


-- 
Florian
