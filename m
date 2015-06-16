From: Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v3 07/22] usb: chipidea: set usb gadeget's otg config
Date: Tue, 16 Jun 2015 17:21:50 +0800
Message-ID: <20150616092149.GE10574@shlinux2>
References: <1434437532-23678-1-git-send-email-jun.li@freescale.com>
 <1434437532-23678-8-git-send-email-jun.li@freescale.com>
 <20150616114452.4c15b8e1@rockdesk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150616114452.4c15b8e1@rockdesk>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Cc: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 16, 2015 at 11:44:52AM +0300, Roger Quadros wrote:
> 
> On Tue, 16 Jun 2015 14:51:57 +0800
> Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> 
> > Set gadget's otg features according to controller's capability and usb
> > property in device tree.
> > 
> > Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> >  drivers/usb/chipidea/core.c  | 18 ++++++++++++++++++
> >  drivers/usb/chipidea/udc.c   | 20 +++++++++++++++++++-
> >  include/linux/usb/chipidea.h |  4 ++++
> >  3 files changed, 41 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> > index 74fea4f..45bd44e 100644
> > --- a/drivers/usb/chipidea/core.c
> > +++ b/drivers/usb/chipidea/core.c
> > @@ -588,6 +588,24 @@ static int ci_get_platdata(struct device *dev,
> >  				of_usb_host_tpl_support(dev->of_node);
> >  	}
> >  
> > +	if (platdata->dr_mode == USB_DR_MODE_OTG) {
> > +		if (!platdata->otg_rev) {
> > +			platdata->otg_rev =
> > +				of_usb_get_otg_rev(dev->of_node);
> > +		}
> > +		if (platdata->otg_rev) {
> > +			if (!platdata->srp_support)
> > +				platdata->srp_support =
> > +					!of_usb_otg_srp_disabled(dev->of_node);
> > +			if (!platdata->hnp_support)
> > +				platdata->hnp_support =
> > +					!of_usb_otg_hnp_disabled(dev->of_node);
> > +			if (!platdata->adp_support)
> > +				platdata->adp_support =
> > +					!of_usb_otg_adp_disabled(dev->of_node);
> > +		}
> > +	}
> > +
> 
> Looks like there is some scope of sharing this code among controller drivers
> and also adding sanity check.
> 
> How about adding
>  
> struct usb_otg_caps {
> 	u16 otg_rev;
> 	bool srp_support;
> 	bool hnp_support;
> 	bool adp_support;
> };
> 
I agree there is some sharing code across all controller drivers,
thus usb_otg_caps maybe desirable.

> And below API
> 
> /* sets device otg capabilities based on controller capabilities and device tree flags */
> void of_usb_otg_set_capabilities(sturct device_node *node, struct usb_otg_caps *cntrl_caps, struct usb_otg_caps *device_caps)
I think cntrl_caps is not needed, only device_caps of controller is okay;
If DT is used, then all capabilities are updated by DT, after that,
controller driver can override some of them if it wants to correct
some wrong property in DT(not disable some feature the controller
can not support).
> {
> 	u16 otg_rev = of_usb_get_otg_rev(dev->of_node);
> 
> 	*device_caps = *cntrl_caps;
> 	if (!otg_rev) {	/* legacy platform */
> 		device_caps->adp_support = false;
> 		/* For SRP/HNP respect what controller supports */
> 		return;
> 	}
> 
> 	if (otg_rev < cntrl_caps->otg_rev)
> 		device_caps->otg_rev = cntrl_caps->otg_rev;
Not catch your point, if controller can support a higher version
protocol, even passed a lower setting in DT, we still use higher
version?
> 	if (of_usb_otg_srp_disabled(dev->of_node))
> 		device_caps->srp_support = false;
> 	if (of_usb_otg_hnp_disabled(dev->of_node))
> 		device_caps->hnp_support = false;
> 	if (of_usb_otg_adp_disabled(dev->of_node))
> 		device_caps->adp_support = false;
> 
> 	/* sanity check */
> 	if ((otg_rev < 0x0200) && device_caps->adp_support) {
> 		/* pre otg 2.0 doesn't support ADP */
> 		device_caps->adp_support = false;
> 	}
> 
> 	return;
> }
> 
> >  	if (of_usb_get_maximum_speed(dev->of_node) == USB_SPEED_FULL)
> >  		platdata->flags |= CI_HDRC_FORCE_FULLSPEED;
> >  
> > diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> > index 764f668..5d2c6e8 100644
> > --- a/drivers/usb/chipidea/udc.c
> > +++ b/drivers/usb/chipidea/udc.c
> > @@ -1821,6 +1821,24 @@ static irqreturn_t udc_irq(struct ci_hdrc *ci)
> >  }
> >  
> >  /**
> > + * udc_update_otg_config: update gadget otg config
> > + * * @ci: chipidea controller
> > + */
> > +static void udc_update_otg_config(struct ci_hdrc *ci)
> > +{
> > +	if (!ci->is_otg)
> > +		return;
> > +
> > +	ci->gadget.otg_rev = ci->platdata->otg_rev;
> > +	ci->gadget.srp_support = ci->platdata->srp_support;
> > +	ci->gadget.hnp_support = ci->platdata->hnp_support;
> > +	ci->gadget.adp_support = ci->platdata->adp_support;
> > +	if (ci->gadget.srp_support || ci->gadget.hnp_support ||
> > +					ci->gadget.adp_support)
> > +		ci->gadget.is_otg = 1;
> > +}
> > +
> > +/**
> >   * udc_start: initialize gadget role
> >   * @ci: chipidea controller
> >   */
> > @@ -1834,9 +1852,9 @@ static int udc_start(struct ci_hdrc *ci)
> >  	ci->gadget.ops          = &usb_gadget_ops;
> >  	ci->gadget.speed        = USB_SPEED_UNKNOWN;
> >  	ci->gadget.max_speed    = USB_SPEED_HIGH;
> > -	ci->gadget.is_otg       = ci->is_otg ? 1 : 0;
> >  	ci->gadget.name         = ci->platdata->name;
> >  
> > +	udc_update_otg_config(ci);
> >  	INIT_LIST_HEAD(&ci->gadget.ep_list);
> >  
> >  	/* alloc resources */
> > diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
> > index ab94f78..6765b28 100644
> > --- a/include/linux/usb/chipidea.h
> > +++ b/include/linux/usb/chipidea.h
> > @@ -34,7 +34,11 @@ struct ci_hdrc_platform_data {
> >  #define CI_HDRC_CONTROLLER_STOPPED_EVENT	1
> >  	void	(*notify_event) (struct ci_hdrc *ci, unsigned event);
> >  	struct regulator	*reg_vbus;
> > +	u16			otg_rev;
> >  	bool			tpl_support;
> > +	bool			srp_support;
> > +	bool			hnp_support;
> > +	bool			adp_support;
> 
> this then changes to
> 	struct usb_otg_caps	otg_caps;
> >  };
> >  
> >  /* Default offset of capability registers */
> 
> cheers,
> -roger
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
