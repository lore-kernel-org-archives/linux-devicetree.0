From: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 1/2] USB: core: let USB device know device node
Date: Sat, 9 Jan 2016 16:56:53 +0800
Message-ID: <20160109085653.GB27759@shlinux2>
References: <1452231864-11171-1-git-send-email-peter.chen@freescale.com>
 <1452231864-11171-2-git-send-email-peter.chen@freescale.com>
 <11330516.E3pzCBVn95@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <11330516.E3pzCBVn95@wuerfel>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 08, 2016 at 09:22:22AM +0100, Arnd Bergmann wrote:
> On Friday 08 January 2016 13:44:23 Peter Chen wrote:
> > +struct device_node *usb_of_find_node(struct device_node *parent, int portnum)
> > +{
> > +       struct device_node *node;
> > +       u32 port;
> > +
> > +       for_each_child_of_node(parent, node) {
> > +               if (!of_property_read_u32(node, "reg", &port)) {
> > +                       if (port == portnum)
> > +                               return node;
> > +               }
> > +       }
> > +
> > +       return NULL;
> > +}
> > +EXPORT_SYMBOL_GPL(usb_of_find_node);
> 
> The implementation looks good to me, but I find the function name slightly
> confusing. We use "*find_node" or similar names in other subsystems to
> scan the entire tree, when this one just looks at the immediate children
> of the device.
> 
> Maybe something like "usb_of_get_child_node()" instead?
> 

Ok, thanks. 

-- 

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
