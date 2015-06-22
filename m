From: Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v6] usb: common: add API to set usb otg capabilities by
 device tree
Date: Mon, 22 Jun 2015 18:45:37 +0800
Message-ID: <20150622104535.GA25349@shlinux2>
References: <1434590302-18066-1-git-send-email-jun.li@freescale.com>
 <20150618103650.7c3d1b8ceb134388b0d8b093@ti.com>
 <20150618084747.GD15280@shlinux2>
 <20150618150748.db2217278ae71f01df625ff2@ti.com>
 <20150618133703.GF15280@shlinux2>
 <20150622124122.a3155a04430083b24d775aa4@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150622124122.a3155a04430083b24d775aa4-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Cc: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 22, 2015 at 12:41:22PM +0300, Roger Quadros wrote:
> On Thu, 18 Jun 2015 21:37:04 +0800
> Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> 
> > On Thu, Jun 18, 2015 at 03:07:48PM +0300, Roger Quadros wrote:
> > > On Thu, 18 Jun 2015 16:47:48 +0800
> > > Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > > 
> > > > On Thu, Jun 18, 2015 at 10:36:50AM +0300, Roger Quadros wrote:
> > > > > Lin,
> > > > > 
> > > > > You can use --in-reply-to "message id of v5 of this path" so that it appears together
> > > > > with the other patches in peoples mailboxes.
> > > > > 
> > > > > > + * the passed properties in DT.
> > > > > > + * @np: Pointer to the given device_node
> > > > > > + * @otg_caps: Pointer to the target usb_otg_caps to be set
> > > > > > + *
> > > > > > + * The function gets and sets the otg capabilities
> > > > > > + */
> > > > > > +void of_usb_set_otg_caps(struct device_node *np, struct usb_otg_caps *otg_caps)
> > > > > > +{
> > > > > > +	u32 otg_rev;
> > > > > > +
> > > > > > +	if (!otg_caps)
> > > > > > +		return;
> > > > > > +
> > > > > > +	if (!of_property_read_u32(np, "otg-rev", &otg_rev))
> > > > > > +		otg_caps->otg_rev = otg_rev;
> > > > > 
> > > > > should we check if otg_rev is in correct format?
> > > > > anything non BCD and greater than 0x9999 is invalid.
> > > > > 
> > > > > Also if otg-rev is not passed then we need to treat it as legacy
> > > > > platform right? How is this taken care of?
> > > > > 
> > > > Missed this comment
> > > > This handling rely on controller driver, cannot decided here.
> > > > There are several cases we need take care:
> > > > 1) otg-rev is not passed, but all 3 disable flags passed, this is
> > > >   valid, means user want to disable whole OTG, so only "otg-rev"
> > > >   not passed, cannot treat as legacy platform.
> > > > 2) Legacy platform means: none of 4 properties is present.
> > > 
> > > Right. Plus controller drivers that are not updated to use these otg_caps
> > > are also legacy.
> > >
> > Did not understand the "Plus" case.
> > Some of 4 properties is present, but its driver dose not use otg_caps?
> 
> yes that is what I meant.
> 
> > 
> > > > 3) Some controller drivers already support OTG HNP/SRP, then change
> > > >   to utilize those new flags, still should support OTG HNP/SRP w/o
> > > >   any dt change, so OTG caps should be enabled for legacy platforms.
> > > 
> > > I didn't understand this point. If a controller driver is not updated
> > > to use otg_caps it is legacy and gadget->otg_caps will be NULL.
> > > 
> > Some of existing chipdea platforms work fine on HNP and SRP , which did
> > not use any new flags and properties, after my patch, those platform should
> > still enable HNP and SRP without any DT change.
> 
> Agreed.
> > 
> > > > 4) Some controller drivers does not support any OTG, after add OTG
> > > >   functions and utilize those new flags, should keep OTG disabled
> > > >   for legacy platforms.
> > > 
> > > If controller drivers don't support OTG. gadget->is_otg and
> > > gadget->otg_caps will not be set by them and they don't have to use
> > > of_usb_set_otg_caps().
> > > 
> > But after my patch, some time later, this driver adds OTG functions on
> > it new platform, it should disable any OTG feature for its legacy
> > platforms (none of properties is passed).
> 
> That can be decided in of_usb_update_otg_caps().
> Controller sets whatever it supports in otg_caps.
> of_usb_updade_otg_caps() checks if it is legacy DT (i.e. no otg-rev) and then
> overrides to legacy otg_caps.
> 
> >  
> > > So I didn't understand why the decision can't be taken here
> > > for non-legacy controller drivers with legacy DT.
> > > They will set gadget->otg_caps and gadget->is_otg.
> > > 
> > > If none of the 4 DT flags are passed then we know it is legacy DT
> > > and we can limit to legacy behaviour.
> > > 
> > legacy behaviour number is 2, not only one legacy behaviour.
> > That's why I leave the otg caps decided by controller drivers.
> 
> I'm only suggesting that it be decided at one place i.e. in 
> of_usb_updade_otg_caps() instead of every controller.
> 
> Do you see any problems with that approach?
> 
The problem is the override policy for legacy platforms. 
For case 3) above, we should enable HNP and SRP,
For case 4) above, after add OTG HNP&SRP support, it should disable HNP and SRP.

How I make one decision in of_usb_updade_otg_caps()
for above 2 cases?(the otg-rev is 0 for both).

Li Jun
> cheers,
> -roger
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
