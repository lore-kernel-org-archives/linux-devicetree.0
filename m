From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: recommended action for bootloaders regarding modifying
 device-tree nodes
Date: Fri, 31 Jan 2014 11:07:59 -0500
Message-ID: <20140131160759.GI29184@titan.lakedaemon.net>
References: <CAJ+vNU366GiY4k_rnh1Jf0kra+PU99w4tDdM2sNioUAJCiZqOA@mail.gmail.com>
 <20140130204558.GC29184@titan.lakedaemon.net>
 <CAJ+vNU2zis+1DUCzmegUFw+Z6XATBEPJ+yqMsttp4ENcckHUYA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAJ+vNU2zis+1DUCzmegUFw+Z6XATBEPJ+yqMsttp4ENcckHUYA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 30, 2014 at 08:39:00PM -0800, Tim Harvey wrote:
> On Thu, Jan 30, 2014 at 12:45 PM, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> wrote:
> > Hi Tim,
> >
> > On Thu, Jan 30, 2014 at 01:11:18AM -0800, Tim Harvey wrote:
> >> My approach has been to define a per-baseboard device-tree in Linux
> >> for a 'fully loaded' board, then remove nodes which the EEPROM claims
> >> are not present in the bootloader before it passes the DTB to the
> >> kernel.  I do this by defining aliases in the device-tree for the
> >> peripherals that are 'optional' so that the bootloader itself does not
> >> need to know the details about how the device is connected.
> >
> > This is more of a process question:  Is there any information captured
> > in your EEPROM that can't be represented in the dtb?  iow, at the point
> > when you write the EEPROM, why not write the dtb to it as configured?
> >
> > You could have pre-configured dtsi fragments for each config option, and
> > then dynamically create the board dts from the order.
> >
> > I only ask because it would solve the problem below.  However, there's a
> > lot more to changing a manufacturing process than meets the eye. :)
> >
> 
> our eeprom config section is only 40 bytes.  It contains a SKU string,
> mac addrs, and some bitwise fields for the various optional components
> that we can subload.

Ok.

> >> Is it more appropriate for the bootloader to 'remove' nodes for
> >> devices that are not physically present or should I be setting their
> >> status property to 'disabled' instead?  I'm not clear if either option
> >> really has any pros or cons.
> >
> > That depends on how you have it structured.  Is it a valid dtb?
> > Meaning, do you have four nodes all at the same register address?
> > Perhaps you could provide an example dts?
> 
> yes its a valid dtb - it is just the superset of everything the
> baseboard (ie schematic design) can support.
> 
> A good example is a custom SKU of a baseboard with ethernet subloaded.
>  If the EEPROM says there is no ethernet mac or phy, I would want to
> remove or disable the ethernet node from the devicetree.
> 
> Another example would be a node for 'gpio-pps' (GPIO based
> pulse-per-second) support.  A baseboard design that has a GPS with its
> PPS signal tied to a GPIO would define this in the device-tree, but if
> the EEPROM says the GPS isn't loaded, I would want to remove or
> disable the gps-pps node.

I think JasonG's approach is the way to go (inserting nops).  But it's a
matter of preference as long as the output is a valid dtb.

on a side note:  Do you still have to tie your dtb to a version of the
kernel?

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
