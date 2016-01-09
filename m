From: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 1/2] USB: core: let USB device know device node
Date: Sat, 9 Jan 2016 17:32:39 +0800
Message-ID: <20160109093239.GE27759@shlinux2>
References: <1452231864-11171-2-git-send-email-peter.chen@freescale.com>
 <Pine.LNX.4.44L0.1601081746080.21467-100000@netrider.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1601081746080.21467-100000-pYrvlCTfrz9XsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 08, 2016 at 05:50:13PM -0500, Alan Stern wrote:
> On Fri, 8 Jan 2016, Peter Chen wrote:
> 
> > Although most of USB devices are hot-plug's, there are still some devices
> > are hard wired on the board, eg, for HSIC and SSIC interface USB devices.
> > If these kinds of USB devices are multiple functions, and they can supply
> > other interfaces like i2c, gpios for other devices, we may need to
> > descirbe these at device tree.
> > 
> > In this commit, it uses "reg" in dts as port number to match the port
> > number decided by USB core, if they are the same, then the device node
> > is for the device we are creating for USB core.
> > 
> > Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> 
> > +#include <linux/module.h>
> > +#include <linux/moduleparam.h>
> 
> Do you need those two #include's?

Will remove

> 
> > +#include <linux/of.h>
> > +
> > +/**
> > + * usb_of_find_node - Find the device node match port number
> > + * @dev: the parent device node
> 
> The parameter is actually named "parent".
> 

Sorry, I copied some code, will change.

> > + * @portnum: the port number which device is connecting 
> > + *
> > + * Find the node from device tree according to its port number.
> > + *
> > + * Return: On success, a pointer to the device node, %NULL on failure.
> > + */
> > +struct device_node *usb_of_find_node(struct device_node *parent, int portnum)
> > +{
> > +	struct device_node *node;
> > +	u32 port;
> > +
> > +	for_each_child_of_node(parent, node) {
> > +		if (!of_property_read_u32(node, "reg", &port)) {
> > +			if (port == portnum)
> > +				return node;
> > +		}
> > +	}
> > +
> > +	return NULL;
> > +}
> > +EXPORT_SYMBOL_GPL(usb_of_find_node);
> > +
> 
> > diff --git a/include/linux/usb.h b/include/linux/usb.h
> > index 89533ba..a3a0b07 100644
> > --- a/include/linux/usb.h
> > +++ b/include/linux/usb.h
> > @@ -21,6 +21,7 @@
> >  #include <linux/sched.h>	/* for current && schedule_timeout */
> >  #include <linux/mutex.h>	/* for struct mutex */
> >  #include <linux/pm_runtime.h>	/* for runtime PM */
> > +#include <linux/of.h>		/* for device tree */
> 
> I think you don't need this line.  You can simply write:
> 
> 	struct device_node;
> 
> just like the two lines below.
> 
> >  struct usb_device;
> >  struct usb_driver;

Yes, you are right.

-- 

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
