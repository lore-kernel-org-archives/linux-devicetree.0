From: Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v5 08/23] usb: chipidea: set usb gadeget's otg
 capabilities
Date: Wed, 24 Jun 2015 11:34:23 +0800
Message-ID: <20150624033421.GA29386@shlinux2>
References: <1434541230-15090-1-git-send-email-jun.li@freescale.com>
 <1434541230-15090-9-git-send-email-jun.li@freescale.com>
 <20150624030442.GB3475@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150624030442.GB3475@shlinux2>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 24, 2015 at 11:04:43AM +0800, Peter Chen wrote:
> On Wed, Jun 17, 2015 at 07:40:15PM +0800, Li Jun wrote:
> > Set gadget's otg capabilities according to controller's capability and otg
> > properties in device tree.
> > 
> > Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> >  drivers/usb/chipidea/core.c  | 8 ++++++++
> >  drivers/usb/chipidea/udc.c   | 7 ++++++-
> >  include/linux/usb/chipidea.h | 1 +
> >  3 files changed, 15 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> > index 74fea4f..2abecbc 100644
> > --- a/drivers/usb/chipidea/core.c
> > +++ b/drivers/usb/chipidea/core.c
> > @@ -588,6 +588,14 @@ static int ci_get_platdata(struct device *dev,
> >  				of_usb_host_tpl_support(dev->of_node);
> >  	}
> >  
> > +	if (platdata->dr_mode == USB_DR_MODE_OTG) {
> > +		/* We can support HNP and SRP */
> > +		platdata->ci_otg_caps.hnp_support = true;
> > +		platdata->ci_otg_caps.srp_support = true;
> > +		/* Update otg capabilities by DT properties */
> > +		of_usb_set_otg_caps(dev->of_node, &platdata->ci_otg_caps);
> > +	}
> > +
> 
> For current dual-role supported platforms (through ID pin), their dts has nothing
> with otg capabilities, what will happen if we set .hnp_support as true?
> 
No impact for them, those platforms will continue work as before(i.e.
otg descriptor with HNP&SRP enabled if CONFIG_USB_OTG is selected,
no otg fsm if CONFIG_USB_OTG_FSM is not selected).

> For non-dt platform (eg i686), how it changes otg capabilities through
> their platform data?
> 
Directly override platdata->ci_otg_caps in its platform driver after
ci_hdrc_add_device().

> Peter
> >  	if (of_usb_get_maximum_speed(dev->of_node) == USB_SPEED_FULL)
> >  		platdata->flags |= CI_HDRC_FORCE_FULLSPEED;
> >  
> > diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> > index 764f668..858bd21 100644
> > --- a/drivers/usb/chipidea/udc.c
> > +++ b/drivers/usb/chipidea/udc.c
> > @@ -1827,6 +1827,7 @@ static irqreturn_t udc_irq(struct ci_hdrc *ci)
> >  static int udc_start(struct ci_hdrc *ci)
> >  {
> >  	struct device *dev = ci->dev;
> > +	struct usb_otg_caps *otg_caps = &ci->platdata->ci_otg_caps;
> >  	int retval = 0;
> >  
> >  	spin_lock_init(&ci->lock);
> > @@ -1834,8 +1835,12 @@ static int udc_start(struct ci_hdrc *ci)
> >  	ci->gadget.ops          = &usb_gadget_ops;
> >  	ci->gadget.speed        = USB_SPEED_UNKNOWN;
> >  	ci->gadget.max_speed    = USB_SPEED_HIGH;
> > -	ci->gadget.is_otg       = ci->is_otg ? 1 : 0;
> >  	ci->gadget.name         = ci->platdata->name;
> > +	ci->gadget.otg_caps	= otg_caps;
> > +
> > +	if (otg_caps->otg_rev && (otg_caps->hnp_support ||
> > +		otg_caps->srp_support || otg_caps->adp_support))
> > +		ci->gadget.is_otg = 1;
> >  
> >  	INIT_LIST_HEAD(&ci->gadget.ep_list);
> >  
> > diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
> > index ab94f78..e10cefc 100644
> > --- a/include/linux/usb/chipidea.h
> > +++ b/include/linux/usb/chipidea.h
> > @@ -34,6 +34,7 @@ struct ci_hdrc_platform_data {
> >  #define CI_HDRC_CONTROLLER_STOPPED_EVENT	1
> >  	void	(*notify_event) (struct ci_hdrc *ci, unsigned event);
> >  	struct regulator	*reg_vbus;
> > +	struct usb_otg_caps	ci_otg_caps;
> >  	bool			tpl_support;
> >  };
> >  
> > -- 
> > 1.9.1
> > 
> 
> -- 
> 
> Best Regards,
> Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
