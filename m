From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH v3 1/1] USB: core: let USB device know device node
Date: Fri, 22 Jan 2016 10:55:01 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.1601221023350.1626-100000@iolanthe.rowland.org>
References: <2404899.20LhULZo7N@wuerfel>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2404899.20LhULZo7N@wuerfel>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 22 Jan 2016, Arnd Bergmann wrote:

> > > 		hub@3 { /* same external  hub, highspeed mode */
> > > 			compatible = "usb2109,0812.591",
> > > 				     "usb2109,0812",
> > > 				     "usb2109,class9.0.1",
> > > 				     "usb2109,class9.0",
> > > 				     "usb2109,class9";
> > > 
> > > 			#address-cells = <1>;
> > > 			#size-cells = <0>;
> > > 			reg = <3>;
> > > 
> > 
> > Why "reg" is 3 here?
> 
> My mistake. It should be hub@1 and reg=<1>;
> 
> I accidentally confused the port number and the device number.

I thought you did it this way because you were numbering the SS
root-hub ports 1-2 and the HS root-hub ports 3-4.

There's something I should have made clear earlier.  This scheme for
putting SS and HS USB-3 root-hub ports in the same number space is part
of the xHCI spec.  It's not AFAIK required (or even mentioned) by the
USB-3 spec, which means other types of USB-3 host controllers might do
it differently.

The scheme which numbers SS and HS ports separately, both starting from
1, is mandated by the USB-3 spec for non-root hubs.  But since that
spec doesn't say much about root hubs, the OS is free to treat them
however it likes.  We have chosen to make root hubs appear as similar
as possible to non-root hubs; however I believe that Windows (for
example) may do things differently.

At any rate, since DT strives to reflect the actual hardware 
properties, you probably should use the xHCI numbering scheme when 
describing the ports of an xHCI root hub.


> > > Is it possible to have a hub in an interface of a multifunction device
> > > or are they always single-configuration single-interface devices?
> > > 
> > 
> > I have not seen such kinds of devices, but it is possible in theory.
> 
> Ok, so if the USB spec allows it, we should probably try to handle it too.

No, the spec does not allow it.  In fact, the spec divides all USB 
devices into two classes: hubs and functions.  A function is anything 
that isn't a hub.  And a hub is never allowed to contain more than one 
configuration and interface.

The spec does allow for multiple functions to be packaged in the same 
physical device.  In this case, the physical device contains a hub 
along with various functions permanently connected to it.

For example, the old Apple USB keyboards are compound devices.  They
contain an internal 3-port hub; one of the ports is permanently wired
to the keyboard controller and the other two are exposed to the user,
allowing a mouse and something else to be attached.

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
