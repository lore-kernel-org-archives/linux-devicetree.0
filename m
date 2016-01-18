From: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/1] USB: core: let USB device know device node
Date: Mon, 18 Jan 2016 15:44:20 +0800
Message-ID: <20160118074420.GE8150@shlinux2>
References: <22377526.4ksCBpoDgG@wuerfel>
 <Pine.LNX.4.44L0.1601151006330.1533-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1601151006330.1533-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 15, 2016 at 10:11:06AM -0500, Alan Stern wrote:
> On Fri, 15 Jan 2016, Arnd Bergmann wrote:
> 
> > On Friday 15 January 2016 17:17:27 Peter Chen wrote:
> > > Although most of USB devices are hot-plug's, there are still some devices
> > > are hard wired on the board, eg, for HSIC and SSIC interface USB devices.
> > > If these kinds of USB devices are multiple functions, and they can supply
> > > other interfaces like i2c, gpios for other devices, we may need to
> > > describe these at device tree.
> > > 
> > > In this commit, it uses "reg" in dts as port number to match the port
> > > number decided by USB core, if they are the same, then the device node
> > > is for the device we are creating for USB core.
> > > 
> > > Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > 
> > Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> > 
> > 
> > Just one last question:
> > 
> > >  	dev->active_duration = -jiffies;
> > >  #endif
> > > -	if (root_hub)	/* Root hub always ok [and always wired] */
> > > +	if (root_hub) {	/* Root hub always ok [and always wired] */
> > >  		dev->authorized = 1;
> > > -	else {
> > > +		dev->of_node = bus->controller->of_node;
> > 
> > 
> > You are adding the of_node of the controller to the root hub, which I
> > guess means that we now have two 'struct device' instances with the
> > same of_node. They have different bus_types, so I think that is ok,
> > but I wonder if it would be better to leave out the of_node for the
> > root hub to avoid the confusion. Can you think of a case where we
> > actually want to add properties for the root hub that we can't do
> > more easily in the host controller?
> 
> There may not be any such cases, but there's still a good reason for
> setting the root hub's of_node pointer: to initialize the recursion
> along the USB device tree.
> 
> This leaves the question of whether OF will always use the same node to
> represent the host controller and the root hub.  In other words, if a
> motherboard has a fixed device plugged into a fixed root-hub port, will
> the DT description make that device a child of the host controller?  
> Or will there be a node in between (to represent the root hub)?
> 

I don't think we need to have such node, even root hub needs something
from device tree, it can get them from controller's node.

-- 

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
