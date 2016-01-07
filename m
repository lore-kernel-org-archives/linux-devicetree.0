From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 0/3] USB: add generic onboard USB HUB driver
Date: Thu, 7 Jan 2016 08:18:02 -0600
Message-ID: <CAL_Jsq+rqv1NBSUToX5BsbnBp_goUWhdczU7ETSxOrJ5D4D1rw@mail.gmail.com>
References: <CAL411-rK6qfkbQsSjvXH5VPAQAm4tMyD6fVTEgFQrpLHNGMXeA@mail.gmail.com>
 <Pine.LNX.4.44L0.1512181030590.1682-100000@iolanthe.rowland.org>
 <CAL411-qKE=12VZAN9=tUWPqkC5BfSgpQb9aNgCU6rmPLasXNHQ@mail.gmail.com>
 <CAL_Jsq+P8SBmWzNURrmNgz8soCn4QPOPid4SXF0a3TYL_SH27A@mail.gmail.com> <20160106032027.GA23726@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160106032027.GA23726@shlinux2>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, patryk-6+2coLtxvIyvnle+31E0rA@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 5, 2016 at 9:20 PM, Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, Jan 05, 2016 at 08:36:31AM -0600, Rob Herring wrote:
>> > 2. There are MFD USB devices, which includes several interfaces under
>> > USB device,
>> > like i2c, gpios, etc. Due to lack of device tree support, USB
>> > class/device driver doesn't know
>> > which kinds of interfaces are needed for this board.
>>
>> Are you talking about a device hard wired on the same board or
>> something like GPIOs on FTDI chip which could be hot-plugged in any
>> host (including non-DT based)?
>
> I talked about the case that the device hard wired on the board.
> Hot-plug device's bus topology is unknown, we can't describe it
> statically at dts.

Correct, upstream (the USB side) can't be described, but it is the
downstream side we care about describing.

>> For the hotplug case, we will need a way to associate a DT overlay
>> with the USB device and there may not even be a base DT to map the
>> overlay into. In this case, the USB device's driver will need to load
>> the overlay and trigger enumerating the child devices. Anyway, this is
>> a separate issue from your problem.
>>
>
> Since both you and Alan agree with my problem should be fixed at
> bootloader, I give the kernel solution up.

Surprising, no one ever seems to agree with that solution... There
will be people with this problem and unable to update their
bootloader.

> The another thing I open to discuss is how to let USB devices know its
> device node, the user reported issue that they can't handle interfaces
> below in USB device since that.

The driver for the USB device would need to load a DT overlay and from
that it should be able to get its node and child nodes. The hard part
is figuring out where to put the sub tree defined in the overlay as
either there is no base DT (think x86) or there is but we don't want
to describe the whole USB bus topology in DT (in theory we could
populate USB nodes dynamically as USB devices are discovered).

Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
