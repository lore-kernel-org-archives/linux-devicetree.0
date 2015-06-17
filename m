From: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 07/22] usb: chipidea: set usb gadeget's otg config
Date: Wed, 17 Jun 2015 11:21:26 +0300
Message-ID: <20150617112126.6ce99507@rockdesk>
References: <1434437532-23678-1-git-send-email-jun.li@freescale.com>
	<1434437532-23678-8-git-send-email-jun.li@freescale.com>
	<20150616114452.4c15b8e1@rockdesk>
	<20150616092149.GE10574@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150616092149.GE10574@shlinux2>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Tue, 16 Jun 2015 17:21:50 +0800
Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:

> On Tue, Jun 16, 2015 at 11:44:52AM +0300, Roger Quadros wrote:
> > 
> > On Tue, 16 Jun 2015 14:51:57 +0800
> > Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > 
> > > Set gadget's otg features according to controller's capability and usb
> > > property in device tree.
> > > 
> > > Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > ---
> > >  drivers/usb/chipidea/core.c  | 18 ++++++++++++++++++
> > >  drivers/usb/chipidea/udc.c   | 20 +++++++++++++++++++-
> > >  include/linux/usb/chipidea.h |  4 ++++
> > >  3 files changed, 41 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> > > index 74fea4f..45bd44e 100644
> > > --- a/drivers/usb/chipidea/core.c
> > > +++ b/drivers/usb/chipidea/core.c
> > > @@ -588,6 +588,24 @@ static int ci_get_platdata(struct device *dev,
> > >  				of_usb_host_tpl_support(dev->of_node);
> > >  	}
> > >  
> > > +	if (platdata->dr_mode == USB_DR_MODE_OTG) {
> > > +		if (!platdata->otg_rev) {
> > > +			platdata->otg_rev =
> > > +				of_usb_get_otg_rev(dev->of_node);
> > > +		}
> > > +		if (platdata->otg_rev) {
> > > +			if (!platdata->srp_support)
> > > +				platdata->srp_support =
> > > +					!of_usb_otg_srp_disabled(dev->of_node);
> > > +			if (!platdata->hnp_support)
> > > +				platdata->hnp_support =
> > > +					!of_usb_otg_hnp_disabled(dev->of_node);
> > > +			if (!platdata->adp_support)
> > > +				platdata->adp_support =
> > > +					!of_usb_otg_adp_disabled(dev->of_node);
> > > +		}
> > > +	}
> > > +
> > 
> > Looks like there is some scope of sharing this code among controller drivers
> > and also adding sanity check.
> > 
> > How about adding
> >  
> > struct usb_otg_caps {
> > 	u16 otg_rev;
> > 	bool srp_support;
> > 	bool hnp_support;
> > 	bool adp_support;
> > };
> > 
> I agree there is some sharing code across all controller drivers,
> thus usb_otg_caps maybe desirable.
> 
> > And below API
> > 
> > /* sets device otg capabilities based on controller capabilities and device tree flags */
> > void of_usb_otg_set_capabilities(sturct device_node *node, struct usb_otg_caps *cntrl_caps, struct usb_otg_caps *device_caps)
> I think cntrl_caps is not needed, only device_caps of controller is okay;
> If DT is used, then all capabilities are updated by DT, after that,
> controller driver can override some of them if it wants to correct
> some wrong property in DT(not disable some feature the controller
> can not support).

OK.

> > {
> > 	u16 otg_rev = of_usb_get_otg_rev(dev->of_node);
> > 
> > 	*device_caps = *cntrl_caps;
> > 	if (!otg_rev) {	/* legacy platform */
> > 		device_caps->adp_support = false;
> > 		/* For SRP/HNP respect what controller supports */
> > 		return;
> > 	}
> > 
> > 	if (otg_rev < cntrl_caps->otg_rev)
> > 		device_caps->otg_rev = cntrl_caps->otg_rev;
> Not catch your point, if controller can support a higher version
> protocol, even passed a lower setting in DT, we still use higher
> version?

My mistake. Should have been
	if (otg_rev < cntrl_caps->otg_rev)
		device_caps->org_rev = otg_rev;


> > 	if (of_usb_otg_srp_disabled(dev->of_node))
> > 		device_caps->srp_support = false;
> > 	if (of_usb_otg_hnp_disabled(dev->of_node))
> > 		device_caps->hnp_support = false;
> > 	if (of_usb_otg_adp_disabled(dev->of_node))
> > 		device_caps->adp_support = false;
> > 
> > 	/* sanity check */
> > 	if ((otg_rev < 0x0200) && device_caps->adp_support) {
> > 		/* pre otg 2.0 doesn't support ADP */
> > 		device_caps->adp_support = false;
> > 	}
> > 
> > 	return;
> > }

cheers,
-roger
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
