From: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v4 04/23] usb: add usb_otg_caps to usb_gadget structure.
Date: Wed, 17 Jun 2015 11:53:10 +0300
Message-ID: <20150617115310.39d2b5b4@rockdesk>
References: <1434519835-27745-1-git-send-email-jun.li@freescale.com>
	<1434519835-27745-5-git-send-email-jun.li@freescale.com>
	<20150617112936.6fa8105a@rockdesk>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150617112936.6fa8105a@rockdesk>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Wed, 17 Jun 2015 11:29:36 +0300
Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org> wrote:

> 
> On Wed, 17 Jun 2015 13:43:36 +0800
> Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> 
> > From: Macpaul Lin <macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > 
> > Add usb_otg_caps pointer to usb_gadget structure to indicate its
> > otg capabilities.
> > 
> > Signed-off-by: Macpaul Lin <macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> >  include/linux/usb/gadget.h | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
> > index 4f3dfb7..6b39087 100644
> > --- a/include/linux/usb/gadget.h
> > +++ b/include/linux/usb/gadget.h
> > @@ -511,6 +511,7 @@ struct usb_gadget_ops {
> >   * @dev: Driver model state for this abstract device.
> >   * @out_epnum: last used out ep number
> >   * @in_epnum: last used in ep number
> > + * @otg_caps: OTG capabilities of this gadget.
> >   * @sg_supported: true if we can handle scatter-gather
> >   * @is_otg: True if the USB device port uses a Mini-AB jack, so that the
> >   *	gadget driver must provide a USB OTG descriptor.
> > @@ -559,6 +560,7 @@ struct usb_gadget {
> >  	struct device			dev;
> >  	unsigned			out_epnum;
> >  	unsigned			in_epnum;
> > +	struct usb_otg_caps		*otg_caps;
> 
> Why does this need to be a pointer?

I got it. So that we can check if it is a legacy controller driver.
> 
> >  
> >  	unsigned			sg_supported:1;
> >  	unsigned			is_otg:1;

So,

Reviewed-by: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>

cheers,
-roger
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
