From: Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v6] usb: common: add API to set usb otg capabilities by
 device tree
Date: Thu, 18 Jun 2015 15:55:28 +0800
Message-ID: <20150618075527.GA15280@shlinux2>
References: <1434590302-18066-1-git-send-email-jun.li@freescale.com>
 <20150618103650.7c3d1b8ceb134388b0d8b093@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150618103650.7c3d1b8ceb134388b0d8b093-l0cyMroinI0@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Cc: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 18, 2015 at 10:36:50AM +0300, Roger Quadros wrote:
> Lin,
> 
> You can use --in-reply-to "message id of v5 of this path" so that it appears together
> with the other patches in peoples mailboxes.
> 
okay, I will try that next time, thanks.

Li Jun
> On Thu, 18 Jun 2015 09:18:22 +0800
> Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> 
> > Change for v6:
> > UPdate otg caps by disable flags even if otg_rev is not passed, this is
> > needed in case user wants to disable whole OTG(or just want to ID pin
> > detect).
> > 
> > Check property of usb hardware to get otg version and if SRP, HNP and ADP
> > are disabled.
> > 
> > Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> >  drivers/usb/common/common.c | 27 +++++++++++++++++++++++++++
> >  include/linux/usb/of.h      |  7 +++++++
> >  2 files changed, 34 insertions(+)
> > 
> > diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
> > index b530fd4..12f5d28 100644
> > --- a/drivers/usb/common/common.c
> > +++ b/drivers/usb/common/common.c
> > @@ -154,6 +154,33 @@ bool of_usb_host_tpl_support(struct device_node *np)
> >  	return false;
> >  }
> >  EXPORT_SYMBOL_GPL(of_usb_host_tpl_support);
> > +
> > +/**
> > + * of_usb_get_set_caps - to set usb otg capabilities according to
> 
> get or set?
> how about update instead?
> 
Should be set, update? okay.

Li Jun
> > + * the passed properties in DT.
> > + * @np: Pointer to the given device_node
> > + * @otg_caps: Pointer to the target usb_otg_caps to be set
> > + *
> > + * The function gets and sets the otg capabilities
> > + */
> > +void of_usb_set_otg_caps(struct device_node *np, struct usb_otg_caps *otg_caps)
> > +{
> > +	u32 otg_rev;
> > +
> > +	if (!otg_caps)
> > +		return;
> > +
> > +	if (!of_property_read_u32(np, "otg-rev", &otg_rev))
> > +		otg_caps->otg_rev = otg_rev;
> 
> should we check if otg_rev is in correct format?
> anything non BCD and greater than 0x9999 is invalid.
> 
Then that's not so simple, every number should be checked,
if ((otg_caps->otg_rev % 10) > 9) ||
	((otg_caps->otg_rev >> 4) % 10) > 9) ||
	((otg_caps->otg_rev >> 8) % 10) > 9) ||
	((otg_caps->otg_rev >> 12) % 10) > 9))
	return error;
We really need this kind of format check? seems no this check
for bcdUSB.
	
> Also if otg-rev is not passed then we need to treat it as legacy
> platform right? How is this taken care of?
> 
> > +	if (of_find_property(np, "hnp-disable", NULL))
> > +		otg_caps->hnp_support = false;
> > +	if (of_find_property(np, "srp-disable", NULL))
> > +		otg_caps->srp_support = false;
> > +	if (of_find_property(np, "adp-disable", NULL))
> > +		otg_caps->adp_support = false;
> 
> Don't we expect it to do basic sanity checks?
> e.g. if otg_rev < 0x200 then adp_support can't be true?
> 
Okay, it's better we add a sanity check here.

> > +}
> > +EXPORT_SYMBOL_GPL(of_usb_set_otg_caps);
> > +
> >  #endif
> >  
> >  MODULE_LICENSE("GPL");
> > diff --git a/include/linux/usb/of.h b/include/linux/usb/of.h
> > index cfe0528..6339799 100644
> > --- a/include/linux/usb/of.h
> > +++ b/include/linux/usb/of.h
> > @@ -15,6 +15,8 @@
> >  enum usb_dr_mode of_usb_get_dr_mode(struct device_node *np);
> >  enum usb_device_speed of_usb_get_maximum_speed(struct device_node *np);
> >  bool of_usb_host_tpl_support(struct device_node *np);
> > +void of_usb_set_otg_caps(struct device_node *np,
> > +			struct usb_otg_caps *otg_caps);
> >  #else
> >  static inline enum usb_dr_mode of_usb_get_dr_mode(struct device_node *np)
> >  {
> > @@ -30,6 +32,11 @@ static inline bool of_usb_host_tpl_support(struct device_node *np)
> >  {
> >  	return false;
> >  }
> > +static inline void of_usb_set_otg_caps(struct device_node *np,
> > +				struct usb_otg_caps *otg_caps)
> > +{
> > +
> > +}
> >  #endif
> >  
> >  #if IS_ENABLED(CONFIG_OF) && IS_ENABLED(CONFIG_USB_SUPPORT)
> > -- 
> > 1.9.1
> > 
> 
> cheers,
> -roger
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
