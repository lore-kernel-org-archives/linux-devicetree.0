From: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/8] USB: add device-tree support for interfaces
Date: Fri, 17 Nov 2017 17:30:32 +0100
Message-ID: <20171117163032.GB3339@localhost>
References: <20171109170723.10960-1-johan@kernel.org>
 <20171116144321.hlp6em77t56e5nly@rob-hp-laptop>
 <20171116161249.GJ11226@localhost>
 <CAL_JsqKFpa6_0nB5ftgFRvwqMN8aBGymASZY7ZeykN0MD6UWbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKFpa6_0nB5ftgFRvwqMN8aBGymASZY7ZeykN0MD6UWbw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 16, 2017 at 12:33:33PM -0600, Rob Herring wrote:
> On Thu, Nov 16, 2017 at 10:12 AM, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > On Thu, Nov 16, 2017 at 08:43:21AM -0600, Rob Herring wrote:
> >> On Thu, Nov 09, 2017 at 06:07:15PM +0100, Johan Hovold wrote:
> >> > This series adds support for representing USB interfaces in device tree
> >> > by implementing support for "interface nodes" and "combined nodes" from
> >> > the OF specification.
> >> >
> >> > This is needed to be able to describe non-discoverable properties of
> >> > permanently attached USB devices and their interfaces such as any
> >> > i2c-clients connected to a USB-i2c bridge (e.g. the dln2 mfd) or,
> >> > eventually, devices connected to usb-serial converters (to be used with
> >> > serdev).
> >>
> >> In the original OF binding, the firmware dynamically generated the tree
> >> for the active configuration AIUI. That doesn't really fit for the
> >> (mostly) static FDT usage and why we stopped at the device level. So how
> >> do we handle multiple configs? Or can we assume that if say the I2C bus
> >> is used, then there's only one config and interface that can use it?
> >
> > Multiple configuration can be used to implement different sets of
> > functionality. A hypothetical device could have one i2c controller in
> > one configuration and two in another. Most devices will only have one
> > configuration though.
> 
> Right, but ultimately the device has the physical interface (pins) and
> we could have multiple USB interfaces pointing to the single physical
> interface. How do we represent that without duplicating the DT data in
> both interfaces? I guess we can do a phandle to the I2C bus as we do
> sometimes.

Yeah, that could lead to some duplication. Also note that configurations
can have different properties such as maximum power consumption, and
that, again hypothetically, some of those external i2c clients may not
be available in every configuration.

> > A USB interface implements some functionality of the device (and this is
> > what Linux USB drivers bind to). So even for single-configuration
> > devices, you need to be able to say which i2c controller (bus) you are
> > describing.
> 
> Are you saying the mapping of USB interface to physical interface
> cannot be implied by the specific device? Say, we had something like
> this:
> 
> usb-device {
>   i2c-bus@0 {};
>   i2c-bus@1 {};
> };
> 
> Where 0 and 1 are based on the pin out of the device. There's no way
> for the driver to figure out the mapping of USB interfaces to i2c bus?

Not without extra information, no.

> How does the user writing the DT do it?

By verifying the actual device used and encoding it in DT. Remember that
USB typically deals with classes of devices and interfaces. The same USB
(interface) driver can be used for a multitude of devices from various
vendors, who could have ended up wiring those physical connectors
differently. So either this information needs to added to the driver
(e.g. supplement the generic class matching with, say, VID/PID and match
data entries), or it is provided through DT, which seems preferred.

Take for example the generic cdc-acm driver which typically matches on
the interface class and knows nothing about any (other) physical ports.

> > [ And as a simplification, the combined nodes can be used for most cases
> > were we only have one configuration with a single interface. ]
> >
> > Note that a new set of interfaces (in the kernel device model) is
> > created when a new USB device configuration is selected. These new
> > interfaces will be associated with any matching device-tree interface
> > nodes and that these would be distinct from any nodes that matches
> > another configuration.
> >
> > So I don't think there's any problem with dealing with the rare cases of
> > multi-configuration devices.
> 
> Perhaps it is rare enough that we don't worry about the above case.
> 
> I'm not saying we shouldn't follow the OF spec here, but I also think
> our usecases have changed a bit in 20 years so we could want to do
> something different.

Fair enough, but it seems to me that we actually want to describe also
interfaces in DT to avoid encoding interface-node mappings and implement
lookups in every driver.

For completeness, I should also point out that there are USB interfaces
implementing various forms of MFDs. I already mentioned the dln2 driver,
where all cell components would be described as the children of an
interface (or combined node), for example:

	usb-device {	// combined node, since only one interface
		gpio {}:
		i2c {};
		spi {};
	};

So we do not have a one-controller-per-interface mapping here.

For USB serial, there are examples of both 1-1 and 1-many mappings and
my current plan for describing them as follows:

	usb-device2 {	// combined node (single interface)
		serial@0 {};
		serial@1 {};
	};

	usb-device3 {
		interface@0 {
			serial@0 {};
		};
		interface@1 {
			serial@0 {};
		};
	};

And note that in the former case, the driver indeed also needs to be
aware of the physical port mapping (for its interface).

But perhaps I'm getting ahead of myself here.

> The other part of this is how do we make this usecase work on non-DT
> systems or DT systems where the USB topology is not fully described
> because you're just hotplugging the USB device.

Yep, that remains to be determined, but that's not directly related to
this series, which primarly extends and what we currently have (which is
a way of describing permanently attached hubs and devices).

It should be possible to generate and insert device-tree nodes when node
look-up fails during bus enumeration. If we ever get support for loading
overlays from user space, these could then be attached to leaf nodes
(whose drivers would need to be reprobed or at least notified).

But I haven't thought too much about that yet.

Johan
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
