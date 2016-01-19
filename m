From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH v3 1/1] USB: core: let USB device know device node
Date: Tue, 19 Jan 2016 10:12:56 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.1601191009190.1727-100000@iolanthe.rowland.org>
References: <4405270.vcz87Q878u@wuerfel>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4405270.vcz87Q878u@wuerfel>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 19 Jan 2016, Arnd Bergmann wrote:

> On Tuesday 19 January 2016 11:08:59 Peter Chen wrote:
> > 
> > I am afraid I have no USB 3.0 PC running Linux.
> > 
> > > > - Which the value of hub->descriptor->bNbrPorts for root hub?
> > > 
> > > In the example above, the legacy root hub would have bNbrPorts set to 6 
> > > and the SS root hub would have bNbrPorts set to 3.
> > > 
> > 
> > Ok, so the maximum physical port number is 6 as well as bNbrports value.
> > The "reg" value at dts should be from 1 to 6. "reg" stands for physical
> > port number for individual physical port, eg if "reg" equals to 1, it
> > stands for the device connects at port 1, no matter the device is HS or
> > SS, it can use the node whose "reg" is 1.
> 
> As I understand it, you could have two devices that are both
> connected to port '1', when one is using HS and the other is using
> SS. This means that we can't use the same 'reg' value for both, and
> we have to define a particular way to disambiguate them.
> 
> As Alan says, there is an established ordering that just sorts the
> ports form 1 to 9 in the example, and that would be the most
> straightforward to use here.

There is even a documented callback (find_raw_port_number) in the
hc_driver structure for converting between the numbering schemes.  I
don't know if all the existing USB-3 host controller drivers implement
that callback, but they should.

> Alternatively, you could use one of the high bits of the 'reg' value
> to indicate which root hub is used. I'm sure that would work as
> well, but be less obvious.

It's probably best to stick with the same numbering that the hardware 
uses.

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
