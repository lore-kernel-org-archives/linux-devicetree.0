From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH v3 1/1] USB: core: let USB device know device node
Date: Sat, 16 Jan 2016 11:40:32 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.1601161115050.11338-100000@netrider.rowland.org>
References: <5216704.YbueADHOOR@wuerfel>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5216704.YbueADHOOR@wuerfel>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, 16 Jan 2016, Arnd Bergmann wrote:

> > This leaves the question of whether OF will always use the same node to
> > represent the host controller and the root hub.  In other words, if a
> > motherboard has a fixed device plugged into a fixed root-hub port, will
> > the DT description make that device a child of the host controller?  
> > Or will there be a node in between (to represent the root hub)?
> 
> Good question. I'm sure the answer is somewhere in this document
> 
> http://www.firmware.org/1275/bindings/usb/usb-1_0.ps
> 
> but unfortunately I don't understand USB addressing well enough
> to answer this. I think the key sentence is the definition of the
> "reg" property:
> 
> | prop-encoded-array: one integer, encoded as with encode-int.
> | The "reg" property for a device node shall consist of the number of the
> | USB hub port or the USB host controller port to which this USB device
> | is attached. As specified in [2] section 11.11.2.1, port numbers range
> | from 1 to 255.
> 
> Does the root hub have a port number relative to the host controller,
> or is it identical to the host controller from the addressing
> perspective?

The root hub does not have a port number relative to the host
controller.  In a sense, the root hub is _part_ of the host controller;
it represents the controller's connection to the USB bus (whereas the
logical device we commonly associate with the host controller
represents the controller's connection to the upstream PCI/whatever
bus).

You can also ask whether port numbers relative to the root hub are
the same as the port numbers relative to the controller.  Under normal
circumstances they are the same.  However, it is possible that they
will be different for USB-3 host controllers (!).

This is because USB-3 uses two buses per controller: the legacy
Low-Speed/Full-Speed/High-Speed bus compatible with USB-1.1 and USB-2
devices, and the new SuperSpeed bus compatible with USB-3 devices.  
Even though there's only the one controller, each bus has its own root
hub and the ports for each root hub are numbered starting from 1.  
Thus, for example, an xHCI controller with 6 LS/FS/HS ports and 3 SS
ports would have a USB-2 root hub with ports 1-6 and a USB-3 root hub
with ports 1-3.  However, xHCI treats the controller as a single entity
and numbers all the ports sequentially; thus the controller would have
ports 1-9.  (Even though the three SS ports would be the same physical
objects as three of the LS/FS/HS ports -- USB-3 ports literally contain
two independent sets of signal wires.)

This isn't merely a convention in the specifications; the hardware
actually uses both numbering schemes (although I don't know about USB-3
controllers other than xHCI; they might be different).  Untangling this
mess might be difficult.  I don't know how existing DT files handle it.

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
