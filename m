From: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/1] USB: core: let USB device know device node
Date: Mon, 18 Jan 2016 15:13:09 +0800
Message-ID: <20160118071309.GC8150@shlinux2>
References: <1452877630.6067.97.camel@pengutronix.de>
 <Pine.LNX.4.44L0.1601151220020.1533-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1601151220020.1533-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 15, 2016 at 12:30:41PM -0500, Alan Stern wrote:
> On Fri, 15 Jan 2016, Philipp Zabel wrote:
> 
> > > +- reg: the port number which this device is connecting to.
> > 
> > Should it be noted here that the port number range is 1-255?
> 
> Actually the range is 1 - 31 (defined by USB_MAXCHILDREN set in 
> include/uapi/linux/usb/ch11.h).
> 
> > > @@ -502,11 +503,14 @@ struct usb_device *usb_alloc_dev(struct usb_device *parent,
> > >  	dev->connect_time = jiffies;
> > >  	dev->active_duration = -jiffies;
> > >  #endif
> > > -	if (root_hub)	/* Root hub always ok [and always wired] */
> > > +	if (root_hub) {	/* Root hub always ok [and always wired] */
> > >  		dev->authorized = 1;
> > > -	else {
> > > +		dev->of_node = bus->controller->of_node;
> > 
> > Why can't the root_hub reuse dev->dev.of_node?
> 
> Indeed, there's no need to add an .of_node field to struct usb_device, 
> since the embedded struct device already contains an .of_node field.
> 

No, the usb_device needs the .of_node field.

The devices belong to platform bus contains device node.
The devices (usb device) belong to USB bus which are created
dynamically do not contain device node.

-- 

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
