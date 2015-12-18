From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH v2 0/3] USB: add generic onboard USB HUB driver
Date: Fri, 18 Dec 2015 10:38:14 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.1512181030590.1682-100000@iolanthe.rowland.org>
References: <CAL411-rK6qfkbQsSjvXH5VPAQAm4tMyD6fVTEgFQrpLHNGMXeA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL411-rK6qfkbQsSjvXH5VPAQAm4tMyD6fVTEgFQrpLHNGMXeA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, patryk-6+2coLtxvIyvnle+31E0rA@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 18 Dec 2015, Peter Chen wrote:

> On Fri, Dec 18, 2015 at 12:13 AM, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org> wrote:

> > It's not clear (to me, anyway) how this is meant to work.  USB is a
> > completely discoverable bus: There is no way to represent devices
> > statically; they have to be discovered.  But a device can't be
> > discovered unless it is functional, so if an onboard hub (or any other
> > sort of USB device) requires power, clocks, or something similar in
> > order to function, it won't be discovered.  There won't be any device
> > structure to probe, and "forcing driver probe" won't accomplish
> > anything.
> >
> > It seems to me that the only way something like this could be made to
> > work is if the necessary actions are keyed off the host controller (and
> > in particular, _not_ the hub driver), presumably at the time the
> > controller is probed.
> 
> The reason why I put the code at hub driver is the onboard USB device
> may be at 2nd level hub, at hub driver, we can know all devices under
> this level hub.

Maybe.  I'm not convinced.  See below.

> > With anything else, you run the risk that the
> > necessary resources won't get enabled before they are needed.
> >
> 
> Sorry, I can't understand what you mean

Suppose you have a platform driver to manage the device's resources, 
and the platform driver is in loadable module.  Suppose the device can 
be detected even before the resources have been initialized, but it 
can't work correctly.

Then what happens when the platform driver's module doesn't get loaded 
until _after_ the device has been detected and after the device failed 
to initialize?


> +static int hub_of_children_register(struct usb_device *hdev)
> +{
> +     struct device *dev;
> +
> +     if (hdev->parent)
> +             dev = &hdev->dev;
> +     else
> +             dev = bus_to_hcd(hdev->bus)->self.controller;
> +
> +     if (!dev->of_node)
> +             return 0;

Suppose hdev->parent is not NULL (hdev isn't the root hub -- maybe it's
a 2nd-level hub).  Then how did hdev->dev->of_node get set?

> +
> +     return of_platform_populate(dev->of_node, NULL, NULL, dev);
> +} 

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
