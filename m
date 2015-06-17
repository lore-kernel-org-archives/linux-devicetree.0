From: Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v4 07/23] usb: common: add API to get usb otg features
 from device tree
Date: Wed, 17 Jun 2015 17:19:08 +0800
Message-ID: <20150617091906.GB9856@shlinux2>
References: <1434519835-27745-1-git-send-email-jun.li@freescale.com>
 <1434519835-27745-8-git-send-email-jun.li@freescale.com>
 <20150617114545.1bd8b8bd@rockdesk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150617114545.1bd8b8bd@rockdesk>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Cc: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 17, 2015 at 11:45:45AM +0300, Roger Quadros wrote:
> 
> On Wed, 17 Jun 2015 13:43:39 +0800
> Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> 
> > Check property of usb hardware to get otg version and if SRP, HNP and ADP
> > are supported.
> > 
> > Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> >  drivers/usb/common/common.c | 29 +++++++++++++++++++++++++++++
> >  include/linux/usb/of.h      |  7 +++++++
> >  2 files changed, 36 insertions(+)
> > 
> > diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
> > index b530fd4..b846172 100644
> > --- a/drivers/usb/common/common.c
> > +++ b/drivers/usb/common/common.c
> > @@ -154,6 +154,35 @@ bool of_usb_host_tpl_support(struct device_node *np)
> >  	return false;
> >  }
> >  EXPORT_SYMBOL_GPL(of_usb_host_tpl_support);
> > +
> > +/**
> > + * of_usb_get_otg_caps - to get usb otg capabilities according to
> > + * the passed properties in DT.
> > + * @np: Pointer to the given device_node
> > + * @otg_caps: Pointer to the target usb_otg_caps to be set
> > + *
> > + * The function gets and sets the otg capabilities
> > + */
> > +void of_usb_get_otg_caps(struct device_node *np, struct usb_otg_caps *otg_caps)
> > +{
> > +	u32 otg_rev;
> > +
> > +	if (!otg_caps)
> > +		return;
> > +
> > +	if (!of_property_read_u32(np, "otg-rev", &otg_rev)) {
> > +		otg_caps->otg_rev = otg_rev;
> > +		if (!of_find_property(np, "hnp-disable", NULL))
> > +			otg_caps->hnp_support = true;
> > +		if (!of_find_property(np, "srp-disable", NULL))
> > +			otg_caps->hnp_support = true;
> 
> srp_support = true;
> 

My fault.

> > +		if (!of_find_property(np, "adp-disable", NULL) &&
> > +					(otg_caps->otg_rev >= 0x0200))
> > +			otg_caps->hnp_support = true;
> 
> adp_support = true;
> 

My fault.

> > +	}
> 
> I think we are loosing information here.
> The DT disable flags get changed to enable flags (xyz_support)
> and after this we can't really tell if the device tree really
> wanted us to disable the feature or enable it based on
> otg_rev/controller capabilities.
> 
> Why not pass controller caps in otg_caps and then disable the
> flags if requested from DT?
> 	if (of_find_property(np, "foo-disbale", NULL))
> 		otg_caps->foo_support = false;
> 
> The controller can still override anything afterwards
> if it things something is wrong.
> My guess is most controllers won't have to.
> 

After more thinking, I think I can use the normal usage of disable flags
to handle this, I will update, thanks.

Li Jun
> > +}
> > +EXPORT_SYMBOL_GPL(of_usb_get_otg_caps);
> > +
> >  #endif
> >  
> >  MODULE_LICENSE("GPL");
> > diff --git a/include/linux/usb/of.h b/include/linux/usb/of.h
> > index cfe0528..bbf302b9 100644
> > --- a/include/linux/usb/of.h
> > +++ b/include/linux/usb/of.h
> > @@ -15,6 +15,8 @@
> >  enum usb_dr_mode of_usb_get_dr_mode(struct device_node *np);
> >  enum usb_device_speed of_usb_get_maximum_speed(struct device_node *np);
> >  bool of_usb_host_tpl_support(struct device_node *np);
> > +void of_usb_get_otg_caps(struct device_node *np,
> > +			struct usb_otg_caps *otg_caps);
> >  #else
> >  static inline enum usb_dr_mode of_usb_get_dr_mode(struct device_node *np)
> >  {
> > @@ -30,6 +32,11 @@ static inline bool of_usb_host_tpl_support(struct device_node *np)
> >  {
> >  	return false;
> >  }
> > +static inline void of_usb_get_otg_caps(struct device_node *np,
> > +				struct usb_otg_caps *otg_caps)
> > +{
> > +
> > +}
> >  #endif
> >  
> >  #if IS_ENABLED(CONFIG_OF) && IS_ENABLED(CONFIG_USB_SUPPORT)
> 
> cheers,
> -roger
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
