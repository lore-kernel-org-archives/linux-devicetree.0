From: Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v5 08/23] usb: chipidea: set usb gadeget's otg
 capabilities
Date: Thu, 18 Jun 2015 21:10:05 +0800
Message-ID: <20150618131004.GE15280@shlinux2>
References: <1434541230-15090-1-git-send-email-jun.li@freescale.com>
 <1434541230-15090-9-git-send-email-jun.li@freescale.com>
 <20150618103935.cfbd94c8c37c5c3298c55272@ti.com>
 <20150618082029.GB15280@shlinux2>
 <20150618150627.d7e81ca1d6bdf7dba94c4eff@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150618150627.d7e81ca1d6bdf7dba94c4eff-l0cyMroinI0@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Cc: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 18, 2015 at 03:06:27PM +0300, Roger Quadros wrote:
> On Thu, 18 Jun 2015 16:20:30 +0800
> Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> 
> > On Thu, Jun 18, 2015 at 10:39:35AM +0300, Roger Quadros wrote:
> > > Typo in subject
> > > gadeget's -> gadget's
> > > 
> > > On Wed, 17 Jun 2015 19:40:15 +0800
> > > Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > > 
> > > > Set gadget's otg capabilities according to controller's capability and otg
> > > > properties in device tree.
> > > > 
> > > > Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > > ---
> > > >  drivers/usb/chipidea/core.c  | 8 ++++++++
> > > >  drivers/usb/chipidea/udc.c   | 7 ++++++-
> > > >  include/linux/usb/chipidea.h | 1 +
> > > >  3 files changed, 15 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> > > > index 74fea4f..2abecbc 100644
> > > > --- a/drivers/usb/chipidea/core.c
> > > > +++ b/drivers/usb/chipidea/core.c
> > > > @@ -588,6 +588,14 @@ static int ci_get_platdata(struct device *dev,
> > > >  				of_usb_host_tpl_support(dev->of_node);
> > > >  	}
> > > >  
> > > > +	if (platdata->dr_mode == USB_DR_MODE_OTG) {
> > > > +		/* We can support HNP and SRP */
> > > > +		platdata->ci_otg_caps.hnp_support = true;
> > > > +		platdata->ci_otg_caps.srp_support = true;
> > > > +		/* Update otg capabilities by DT properties */
> > > > +		of_usb_set_otg_caps(dev->of_node, &platdata->ci_otg_caps);
> > > 
> > > we're not tackling the legacy platform case.
> > > i.e. when otg-rev is not present in DT.
> > > 
> > Legacy platforms with chipidea controller can use otg HNP and SRP
> > without any otg properties passed, so I keep hnp and srp to be true.
> 
> I was thinking that controller should set whatever it supports regardless of
> legacy platforms.
> e.g. if chipidea controller supports ADP then it should set it to true here
> before calling of_usb_update_otg_caps().
> 
Now chipidea only support HNP and SRP, that's the best capability.

> And it should also set the best OTG version it supports and not leave it to 0.
> 
Best version is 2.0 for chipidea.
But I cannot find the real case to use the best version(as initial setting) by
controller in the end, anyway for a OTG device, the otg-rev should be passed
and the dt value should be used.
 
> of_usb_update_otg_caps() should then take the decision based on
> controller otg_caps and DT otg flags as to what must be done.
>
The decision some how depends on controller drivers. Can not be fixed.
 
> > 
> > > one way could be that of_usb_set_otg_caps sets otg-rev to 0 if
> > > it is not present in DT.
> > > 
> > otg-rev should be 0 as initial value if it's not present in DT, isn't it?
> 
> That's because you didn't set the otg-rev that chipidea controller supports.
> 
> This will break for example if DT passes otg-rev 3.0 and controller supports
> only otg-rev 2.0 but we didn't bother to check :)
> 
okay, another crazy dt user, I see the usage of initial setting of otg-rev
here, we can use it to decide the final version if a wrong value is passed.

> Let's do whatever common functionality we can in of_usb_update_otg_caps()
> rather than depending on controller drivers and inviting more errors.
> 
The only question is: if none of 4 flags passed, we should set what kind of
otg capability in of_usb_update_otg_caps?
there are 2 kind legacy platforms, one is some really can support HNP.
the other one is it cannot support any real OTG.

Li Jun
> cheers,
> -roger
> 
> > 
> > > > +	}
> > > > +
> > > >  	if (of_usb_get_maximum_speed(dev->of_node) == USB_SPEED_FULL)
> > > >  		platdata->flags |= CI_HDRC_FORCE_FULLSPEED;
> > > >  
> > > > diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> > > > index 764f668..858bd21 100644
> > > > --- a/drivers/usb/chipidea/udc.c
> > > > +++ b/drivers/usb/chipidea/udc.c
> > > > @@ -1827,6 +1827,7 @@ static irqreturn_t udc_irq(struct ci_hdrc *ci)
> > > >  static int udc_start(struct ci_hdrc *ci)
> > > >  {
> > > >  	struct device *dev = ci->dev;
> > > > +	struct usb_otg_caps *otg_caps = &ci->platdata->ci_otg_caps;
> > > >  	int retval = 0;
> > > >  
> > > >  	spin_lock_init(&ci->lock);
> > > > @@ -1834,8 +1835,12 @@ static int udc_start(struct ci_hdrc *ci)
> > > >  	ci->gadget.ops          = &usb_gadget_ops;
> > > >  	ci->gadget.speed        = USB_SPEED_UNKNOWN;
> > > >  	ci->gadget.max_speed    = USB_SPEED_HIGH;
> > > > -	ci->gadget.is_otg       = ci->is_otg ? 1 : 0;
> > > >  	ci->gadget.name         = ci->platdata->name;
> > > > +	ci->gadget.otg_caps	= otg_caps;
> > > > +
> > > > +	if (otg_caps->otg_rev && (otg_caps->hnp_support ||
> > > > +		otg_caps->srp_support || otg_caps->adp_support))
> > > > +		ci->gadget.is_otg = 1;
> > > >  
> > > >  	INIT_LIST_HEAD(&ci->gadget.ep_list);
> > > >  
> > > > diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
> > > > index ab94f78..e10cefc 100644
> > > > --- a/include/linux/usb/chipidea.h
> > > > +++ b/include/linux/usb/chipidea.h
> > > > @@ -34,6 +34,7 @@ struct ci_hdrc_platform_data {
> > > >  #define CI_HDRC_CONTROLLER_STOPPED_EVENT	1
> > > >  	void	(*notify_event) (struct ci_hdrc *ci, unsigned event);
> > > >  	struct regulator	*reg_vbus;
> > > > +	struct usb_otg_caps	ci_otg_caps;
> > > >  	bool			tpl_support;
> > > >  };
> > > >  
> > > > -- 
> > > > 1.9.1
> > > > 
> > > 
> > > cheers,
> > > -roger
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
