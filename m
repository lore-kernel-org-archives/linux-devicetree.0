From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH v2 2/2] USB: doc: Binding document for ehci-platform
 driver
Date: Wed, 24 Oct 2012 15:41:20 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1210241531300.1282-100000@iolanthe.rowland.org>
References: <50882EED.9020200@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50882EED.9020200-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Sebastian Andrzej Siewior <sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 24 Oct 2012, Stephen Warren wrote:

> > What's the reason for listing the generic value if drivers can't key
> > off it?  Does it contain any information that's not already present in 
> > the specific values?
> 
> This may or may not be a mistake.
> 
> The idea is that usb-ehci is included in the device node's compatible
> list iff the HW is 100% compatible with a "usb-ehci" HW device, and

But there is no such thing as a "usb-ehci" HW device.  That's part of 
the reason this whole discussion got started.

> hence a pure usb-ehci driver can handle the hardware without any
> additional knowledge. (That's true in general for any compatible value).

To as great an extent as is reasonable, ehci-platform is supposed to 
be that "pure usb-ehci driver".

> It's quite possible that this often gets translated to the subtly
> different "the HW is an EHCI controller, so it gets
> compatible="usb-ehci"" when writing .dts files.
> 
> So yes we probably should remove compatible="usb-ehci" from any device
> node for HW which really isn't a pure EHCI device. That would presumably
> require looking at the existing custom drivers and/or HW specs to
> determine what, if anything, is different about the HW.

Of course, removing it from the board files in the new kernel won't
have any effect on old board files embedded in firmware.  Those old 
firmwares then might not work with newer kernels.

> Related, at least on Tegra, the PHY handling is IIRC pretty tightly
> coupled into the EHCI driver. We probably should have separate nodes
> for, and drivers for, the PHYs instead. I don't know if that would
> remove all the non-standard attributes of the Tegra EHCI HW and hence
> allow Tegra's EHCI to be handled by the generic driver. From memory,
> there are certainly some HW workarounds in the Tegra EHCI driver that
> would need to be ported though.

In fact, ehci-tegra is probably the _most_ non-standard of the EHCI 
drivers.

> > It sounds like the ehci-platform driver should simply list all the
> > specific HW device types (or base HW device types) that it handles, and
> > it shouldn't include "usb-ehci" in the list.  As more DT board files
> > are created or as ehci-platform becomes capable to taking over from
> > other drivers, its device list would grow.
> 
> That's certainly a reasonable way to go too. I think the only downside
> with that approach is that every new device needs a kernel update to add
> it to the table, whereas using a generic compatible="usb-ehci" wouldn't,
> assuming no quirks were required for the new device.

New devices could list an older device they are upwardly compatible 
with.  Then no kernel update would be needed.  Now, I agree that a 
generic entry would be more logical, but there's no generic "standard" 
hardware for it to describe.

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
