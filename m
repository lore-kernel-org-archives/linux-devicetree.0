From: Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v4 12/23] usb: gadget: ether: allocate and init otg
 descriptor by otg capabilities
Date: Wed, 17 Jun 2015 17:53:02 +0800
Message-ID: <20150617095301.GC9856@shlinux2>
References: <1434519835-27745-1-git-send-email-jun.li@freescale.com>
 <1434519835-27745-13-git-send-email-jun.li@freescale.com>
 <20150617120304.352c0f40@rockdesk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150617120304.352c0f40@rockdesk>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Cc: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 17, 2015 at 12:03:04PM +0300, Roger Quadros wrote:
> 
> >  
> >  	if (gadget_is_otg(c->cdev->gadget)) {
> > +		if (!otg_desc[0]) {
> > +			struct usb_descriptor_header *usb_desc;
> > +
> > +			usb_desc = usb_otg_descriptor_alloc(c->cdev->gadget);
> > +			if (!usb_desc)
> > +				return -ENOMEM;
> > +			usb_otg_descriptor_init(c->cdev->gadget, usb_desc);
> > +			otg_desc[0] = usb_desc;
> > +			otg_desc[1] = NULL;
> > +		}
> 
> Why can't you do the otg_desc alloc/init in eth_bind()?
> That way you don't have to have this code twice
> in rndis_do_config() and eth_do_config().
> 
> It also matches the free being done in eth_unbind().
> >  

Okay, I will update for all legacy gadget drivers.

Li Jun
> 
> cheers,
> -roger
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
