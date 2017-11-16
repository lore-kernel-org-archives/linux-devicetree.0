From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/8] USB: add device-tree support for interfaces
Date: Thu, 16 Nov 2017 12:33:33 -0600
Message-ID: <CAL_JsqKFpa6_0nB5ftgFRvwqMN8aBGymASZY7ZeykN0MD6UWbw@mail.gmail.com>
References: <20171109170723.10960-1-johan@kernel.org> <20171116144321.hlp6em77t56e5nly@rob-hp-laptop>
 <20171116161249.GJ11226@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171116161249.GJ11226@localhost>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 16, 2017 at 10:12 AM, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Thu, Nov 16, 2017 at 08:43:21AM -0600, Rob Herring wrote:
>> On Thu, Nov 09, 2017 at 06:07:15PM +0100, Johan Hovold wrote:
>> > This series adds support for representing USB interfaces in device tree
>> > by implementing support for "interface nodes" and "combined nodes" from
>> > the OF specification.
>> >
>> > This is needed to be able to describe non-discoverable properties of
>> > permanently attached USB devices and their interfaces such as any
>> > i2c-clients connected to a USB-i2c bridge (e.g. the dln2 mfd) or,
>> > eventually, devices connected to usb-serial converters (to be used with
>> > serdev).
>>
>> In the original OF binding, the firmware dynamically generated the tree
>> for the active configuration AIUI. That doesn't really fit for the
>> (mostly) static FDT usage and why we stopped at the device level. So how
>> do we handle multiple configs? Or can we assume that if say the I2C bus
>> is used, then there's only one config and interface that can use it?
>
> Multiple configuration can be used to implement different sets of
> functionality. A hypothetical device could have one i2c controller in
> one configuration and two in another. Most devices will only have one
> configuration though.

Right, but ultimately the device has the physical interface (pins) and
we could have multiple USB interfaces pointing to the single physical
interface. How do we represent that without duplicating the DT data in
both interfaces? I guess we can do a phandle to the I2C bus as we do
sometimes.

> A USB interface implements some functionality of the device (and this is
> what Linux USB drivers bind to). So even for single-configuration
> devices, you need to be able to say which i2c controller (bus) you are
> describing.

Are you saying the mapping of USB interface to physical interface
cannot be implied by the specific device? Say, we had something like
this:

usb-device {
  i2c-bus@0 {};
  i2c-bus@1 {};
};

Where 0 and 1 are based on the pin out of the device. There's no way
for the driver to figure out the mapping of USB interfaces to i2c bus?
How does the user writing the DT do it?

> [ And as a simplification, the combined nodes can be used for most cases
> were we only have one configuration with a single interface. ]
>
> Note that a new set of interfaces (in the kernel device model) is
> created when a new USB device configuration is selected. These new
> interfaces will be associated with any matching device-tree interface
> nodes and that these would be distinct from any nodes that matches
> another configuration.
>
> So I don't think there's any problem with dealing with the rare cases of
> multi-configuration devices.

Perhaps it is rare enough that we don't worry about the above case.

I'm not saying we shouldn't follow the OF spec here, but I also think
our usecases have changed a bit in 20 years so we could want to do
something different.

The other part of this is how do we make this usecase work on non-DT
systems or DT systems where the USB topology is not fully described
because you're just hotplugging the USB device.

Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
