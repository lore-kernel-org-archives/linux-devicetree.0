From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH v1 0/3] device property: Support MAC address in VPD
Date: Wed, 15 Aug 2018 16:16:01 -0600
Message-ID: <20180815221601.GB24830@rob-hp-laptop>
References: <20180814223758.117433-1-briannorris@chromium.org>
 <a240b3f9-d41b-30d7-ef11-5dcd1a981c0f@gmail.com>
 <20180815002204.GA258561@ban.mtv.corp.google.com>
 <bb1b2b7d-2c47-a6b3-7618-063351f379b2@gmail.com>
 <20180815014436.GA17200@ban.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180815014436.GA17200@ban.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Guenter Roeck <linux@roeck-us.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>, Stephen Boyd <swboyd@chromium.org>, Brian Norris <briannorris@chromium.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 14, 2018 at 06:44:36PM -0700, Brian Norris wrote:
> Hi,

I should have read the rest of this thread first...

> 
> On Tue, Aug 14, 2018 at 05:52:49PM -0700, Florian Fainelli wrote:
> > On 08/14/2018 05:22 PM, Brian Norris wrote:
> > >  * in any of the above (and in any other case of lack of clarity), one
> > >    can make slightly different choices when, e.g., submitting a device
> > >    tree upstream vs. a downstream tree. While we may try our hardest to
> > >    document and stick to documented bindings, I personally can't
> > >    guarantee that one of these choices will be made differently during
> > >    review, possibly breaking any firmware that made assumptions based on
> > >    those choices. So I might end up with a firmware that satisfies
> > >    documented bindings and works with a downstream device tree, but
> > >    doesn't work with a device tree that gets submitted upstream.
> > 
> > Sure, this is kind of a self inflicted problem but agreed this does exist.
> 
> You can say "self-inflicted", but of all the things that need to go
> upstream, the DTS files themselves are the least integral. I mean, why
> else do we ever pretend to have anything close to an ABI for device
> tree bindings?

That sounds like an inadequately documented binding.

> 
> > >> Also, aliases in DT are meant to provide some stability.
> > > 
> > > How, specifically? I don't see any relevant binding description for
> > > aliases under Documentation/devicetree/bindings/net/.
> > 
> > Indeed they are not, likewise, we should probably update devicetree-spec
> > to come up with standard names that of_alias_get_id() already consumes.
> 
> A quick grep shows we already have divergence: both "eth" and "ethernet"
> are in use.

Uggg, it would be nice to clean that up. 

There's several aliases I'd like to get rid of (some platforms went a 
little crazy with them) and I'd like to start requiring alias names to 
be documented. I created an issue for the spec. Patches welcomeTM. :)

> But anyway, would the idea be that you just put 'ethernet{0,1,...}' and
> 'wifi{0,1,...}' aliases in the /chosen node, then require boot firmware
> to insert any {ethernet,wifi}_mac{0,1,...} into the paths represented by
> the corresponding aliases?

In the /aliases node, but yes.

>  I suppose that would reduce the problems with
> (1), but it still doesn't really help with (2).
> 
> In some circles, the gold standard of boot firmware is to be as thin as
> possible, doing only what's needed to get a kernel up and running, and
> this function seems wholly unrelated to the firmware's core
> functionality. I mean, the kernel already knows how to parse VPD, so why
> can't it learn to find the right field?
> 
> > >>>  (2) Other than this device-tree shim requirement, system firmware may
> > >>>      have no reason to understand anything about network devices.
> > >>>
> > >>> So instead, I'm looking for a way to have a device node describe where
> > >>> to find its MAC address, rather than having the device node contain the
> > >>> MAC address directly. Then system firmware doesn't have to manage
> > >>> anything.
> > >>>
> > >>> In particular, I add support for the Google Vital Product Data (VPD)
> > >>> format, used within the Coreboot project. The format is described here:
> > >>>
> > >>> https://chromium.googlesource.com/chromiumos/platform/vpd/+/master/README.md
> > >>>
> > >>> TL;DR: VPD consists of a TLV-like table, with key/value pairs of
> > >>> strings. This is often stored persistently on the boot flash and
> > >>> presented via in-memory Coreboot tables, for the operating system to
> > >>> read.
> > >>>
> > >>> We already have a VPD driver that parses this table and presents it to
> > >>> user space. This series extends that driver to allow in-kernel lookups
> > >>> of MAC address entries.
> > >>
> > >> A possible alternative approach is to have the VPD driver become a NVMEM
> > >> producer to expose the VPD keys, did you look into that and possibly
> > >> found that it was not a good model? The downside to that approach though
> > >> is that you might have to have a phandle for the VPD provider in the
> > >> Device Tree, but AFAICS this should solve your needs?
> > > 
> > > I did notice some NVMEM work. The MTD links you point at shouldn't be
> > > relevant, since this table is already present in RAM. But I suppose I
> > > could shoehorn the memory table into being a fake NVMEM...
> > > 
> > > And then, how would you recommend doing the parameterization I note
> > > here? Is the expectation that I define a new cell for every single type?
> > > Each cell might have a different binary format, so I'd have to describe:
> > > (a) that they contain MAC addresses (so the "reader" knows to translate
> > >     the ASCII strings into equivalent binary representation) and
> > 
> > I see, in your current patch series that knowledge is pushed to both the
> > VPD producer and the specific object lookup function, so this scales better.
> 
> Yeah, one of the advantages is that my API is specialized to exactly one
> data type ;) With the nvmem API, the data format isn't really specified,
> so you gotta hope that either the NVMEM stores MAC addresses as 6 bytes
> of binary data, or else that the NVMEM driver figures out how to do any
> translation for you implicitly.
> 
> If I understand the NVMEM subsystem correctly, that is.
> 
> > > (b) which key matches (it's not just "mac_address=xxxxx"; there may be
> > >     many MAC addresses, with keys "ether_mac0", "ether_mac1",
> > >     "wifi_mac0")
> > 
> > The key to lookup is definitively node specific, it is just unfortunate
> > that there is not a better way to infer which key to lookup for (as
> > opposed to just having to specify it directly) based on the Device Tree
> > topology. By that I mean, if you have a "mac-address-lookup" property
> > associated with Wi-Fi adapter #1 (with numbering starting at 0), then
> > this automatically means looking up for "wifi_mac1", etc.
> 
> Would that really be a virtue, though? Keys can really be anything (in
> VPD, or in any other hypothetical MAC address store), and it seems nice
> to avoid entangling them with device tree specifics too much. And how
> does one figure out what's Device 0 anyway? Based on the FDT layout? I
> don't actually know what order 'dtc' puts my nodes in.
> 
> > > Part (a) especially doesn't really sound like the typical NVMEM, which
> > > seems to pretend it provides raw access to these memory regions.
> > > 
> > > Additionally, VPD is not stored at a fixed address, nor are any
> > > particular entries within it (it uses TLV), so it seems like there are
> > > plenty of other bits of the nvmem.txt documentation I'd have to violate
> > > to get there, such as the definition of 'reg':
> > > 
> > > reg:    specifies the offset in byte within the storage device.
> > > 
> > > And finally, this may be surmountable, but the existing APIs seem very
> > > device tree centric. We use this same format on ACPI systems, and the
> > > current series would theoretically work on both [1]. I'd have to rewrite
> > > the current (OF-only) helpers to get equivalent support...
> > 
> > All fair points, never mind NVMEM, I was just too keen on thinking this
> > would be finally the way to make the consumers and producers of such
> > information into a single API, but your proposal appears valid too.
> 
> I don't want to throw out any notion of unification from the start, but
> I don't immediately see how one would do that reasonably. I'm still open
> to education though, and I'm definitely not wedded to my specific
> proposal.

Seems to me that nvmem needs to be extended to allow providers to 
retrieve and interpret data. Not everything is at some fixed offset and 
size. Something like this is valid dts:

nvmem = <&phandle> "a-string";

But that's pretty uncommon (I can't think of a binding that actually 
uses that). Perhaps the provider has an array of keys defined and the 
consumer just provides the index.

Or we could do '<key>-nvmem = <&phandle>', but parsing that is a bit 
more complicated.

Rob
