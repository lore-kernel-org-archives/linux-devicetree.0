From: Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2 09/22] usb: gadget: add usb_otg_descriptor_add
 interface to init usb_otg_descriptor
Date: Wed, 10 Jun 2015 22:02:06 +0800
Message-ID: <20150610140205.GB9443@shlinux2>
References: <1433775737-9816-1-git-send-email-jun.li@freescale.com>
 <1433775737-9816-10-git-send-email-jun.li@freescale.com>
 <20150609162751.54223edc@rockdesk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150609162751.54223edc@rockdesk>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Cc: Li Jun-B47624 <Jun.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, Chen Peter-B29397 <Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 09, 2015 at 09:27:51PM +0800, Roger Quadros wrote:
> On Mon, 8 Jun 2015 23:02:04 +0800
> Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> 
> > Allocate usb_otg_descriptor and initialize it according to gadget otg
> > options, if none of options is not set, keep bmAttributes setting as
> > current gadget drivers, with this new interface, usb_otg_descriptor can
> > include bcdOTG if OTG 2.0 or later, and otg features can be decided by
> > the combination of usb hardware property and driver config.
> > 
> > Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> >  drivers/usb/gadget/config.c | 37 +++++++++++++++++++++++++++++++++++++
> >  include/linux/usb/gadget.h  |  1 +
> >  2 files changed, 38 insertions(+)
> > 
> > diff --git a/drivers/usb/gadget/config.c b/drivers/usb/gadget/config.c
> > index 34e12fc..a86e079 100644
> > --- a/drivers/usb/gadget/config.c
> > +++ b/drivers/usb/gadget/config.c
> > @@ -195,3 +195,40 @@ void usb_free_all_descriptors(struct usb_function *f)
> >  	usb_free_descriptors(f->ss_descriptors);
> >  }
> >  EXPORT_SYMBOL_GPL(usb_free_all_descriptors);
> > +
> > +struct usb_otg_descriptor *usb_otg_descriptor_add(struct usb_gadget *gadget)
> > +{
> > +	struct usb_otg_descriptor *otg_desc;
> > +	unsigned otg_desc_length;
> > +
> > +	if (gadget->otg_rev >= 0x0200)
> > +		otg_desc_length = sizeof(*otg_desc) + sizeof(struct bcdOTG);
> > +	else
> > +		otg_desc_length = sizeof(*otg_desc);
> > +
> > +	otg_desc = (struct usb_otg_descriptor *)kzalloc(otg_desc_length,
> > +								GFP_KERNEL); 
> 
> You are allocating memory here and expecting users will free it.
> I suggest that you pass pointer to otg_desc as function argument and leave it upto
> the caller to allocate/deallocate memory for it.

Agreed, I will update accordingly.

> 
> Most likely users will be a static allocation like they do now and it is a
> lot simpler.
> 
I need allocate different size memory at runtime, that static
allocation should be changed, I will try Alan's suggestion with
2 different structures to make it simpler.

> > +	if (!otg_desc)
> > +		return otg_desc;
> > +
> > +	otg_desc->bLength = otg_desc_length;
> > +	otg_desc->bDescriptorType = USB_DT_OTG;
> > +
> > +	if (gadget->adp_support || gadget->hnp_support ||
> > +					gadget->srp_support) {
> > +		if (gadget->adp_support)
> > +			otg_desc->bmAttributes |= USB_OTG_ADP;
> > +		if (gadget->hnp_support)
> > +			otg_desc->bmAttributes |= USB_OTG_HNP;
> > +		if (gadget->srp_support)
> > +			otg_desc->bmAttributes |= USB_OTG_SRP;
> > +	} else {
> > +		otg_desc->bmAttributes = USB_OTG_SRP | USB_OTG_HNP;
> > +	}
> > +
> > +	if (gadget->otg_rev >= 0x0200)
> > +		otg_desc->otg_rev[0].bcdOTG = cpu_to_le16(gadget->otg_rev);
> > +
> > +	return otg_desc;
> > +}
> > +EXPORT_SYMBOL_GPL(usb_otg_descriptor_add);
> > diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
> > index 2f4f39c..e210466 100644
> > --- a/include/linux/usb/gadget.h
> > +++ b/include/linux/usb/gadget.h
> > @@ -1013,6 +1013,7 @@ int usb_assign_descriptors(struct usb_function *f,
> >  		struct usb_descriptor_header **ss);
> >  void usb_free_all_descriptors(struct usb_function *f);
> >  
> > +struct usb_otg_descriptor *usb_otg_descriptor_add(struct usb_gadget *gadget);
> >  /*-------------------------------------------------------------------------*/
> >  
> >  /* utility to simplify map/unmap of usb_requests to/from DMA */
> 
> cheers,
> -roger
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
