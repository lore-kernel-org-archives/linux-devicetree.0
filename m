From: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 05/22] doc: dt-binding: usb: add otg related
 properties
Date: Mon, 15 Jun 2015 10:51:03 +0300
Message-ID: <20150615105103.38ad1246@rockdesk>
References: <CAL_JsqJ+q5hs26FaLXG1LVb0asE-UZ5hXar2FeVAJN=S8=CG3w@mail.gmail.com>
	<20150610103737.3cc7c10d@rockdesk>
	<20150610134735.GB7678@shlinux2>
	<20150611101853.643a9334@rockdesk>
	<20150611082010.GA16101@shlinux2>
	<20150611153703.55dff608@rockdesk>
	<20150611141121.GC16101@shlinux2>
	<20150611175215.6e04d92e@rockdesk>
	<20150612030916.GF16101@shlinux2>
	<20150612113102.6aa67d5d@rockdesk>
	<20150615063244.GA20680@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150615063244.GA20680@shlinux2>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Li Jun-B47624 <Jun.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Chen Peter-B29397 <Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Macpaul Lin <macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 15 Jun 2015 14:32:46 +0800
Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:

> On Fri, Jun 12, 2015 at 11:31:02AM +0300, Roger Quadros wrote:
> > 
> > 
> > On Fri, 12 Jun 2015 11:09:17 +0800
> > Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > 
> [...]
> 
> > > Other than those new flags, I have not found other good way to judge
> > > whether some platform is a legacy one.
> > > Directly use dt property? Then above code has to be moved to controller
> > > driver, consequently the usb_otg_descriptor has to be allocated by
> > > controller driver at runtime, and I have to create some new way to pass it
> > > to gadget driver, for those legacy platform, I still need gadget driver to
> > > allocate it...too complicated.
> > 
> > Right. let's not do that.
> > 
> > > 
> > > (You know, there are 2 different otg_desc structures: otg_desc and
> > > otg_20_desc, I need select one and allocate it at runtime)
> > > 
> > > > This also has a side effect of SRP and HNP being enabled for any platform
> > > > even if enable-srp/enable-hnp is not set in DT.
> > > That's the current situation before my patch, not the side effect
> > > brought by me.
> > 
> > Agreed. I was thinking of fixing that side effect but if you want
> > legacy behaviour as well then it looks like it can't be done.
> > 
> > > 
> > > > This will be more of a bug than supporting legacy users.
> > > I have to leave the _existing_ bug there, because I can't know
> > > which platform can really support HNP/SRP, which one cannot.
> > > So I do not fix the _existing_ bug, meanwhile I also do not introduce
> > > a new bug either. If some legacy platform with this bug, want to fix it,
> > > fine, use dt or other way to set gadget->xyz_support correctly
> > > in its controller driver, no more change needed.
> > > 
> > > Any other reason you think enable flags are still not reasonable?
> > 
> > Yes. We can't specify that we don't want all 3 features from DT.
> > It will treat it as legacy and enable HNP/SRP. ;)
> > 
> > This is true for dual-role devices. We set dr_mode = "otg"
> > but disable all 3 features.
> > 
> > > 
> > > > 
> > > > Instead we could have ADP disabled by default for all cases
> > > > and expect enable-adp in DT to get it enabled. SRP/HNP could still
> > > > be disable flags.
> > > > 
> > > Yes, this can work, but seems they look some odd:), some are xxx_disable,
> > > some are xxx_enable.
> > >  
> > > > Then your above code reduces to
> > > > 
> > > > 		if (gadget->adp_support)
> > > >  			otg_desc->bmAttributes |= USB_OTG_ADP;
> > > >  		if (gadget->hnp_support)
> > > >  			otg_desc->bmAttributes |= USB_OTG_HNP;
> > > >  		if (gadget->srp_support)
> > > >  			otg_desc->bmAttributes |= USB_OTG_SRP;
> > > >
> > > Yes if those code is put in controller driver of new platforms.
> > > No if we put it in common routine and called by both new and
> > > legacy platforms.
> > 
> > Agreed. We still need to determine legacy platform if
> > none of the features are set.
> > 
> > How about defining the followong enum for gadget->xyz_support
> > 
> > enum otg_feature {
> > 	OTG_FEATURE_UNDEFINED = 0,
> > 	OTG_FEATURE_ENABLED,
> > 	OTG_FEATURE_DISABLED,
> > };
> > 
> > for legacy platforms this will be UNDEFINED for all so you can detect it
> > and continue legacy behaviour i.e. enable HNP/SRP, disable ADP.
> > 
> > For new platforms at least one of them won't be UNDEFINED so you can
> > enable the feature if ENABLED and disable if UNDEFINED/DISABLED.
> > 
> 
> Then some legacy platform will have problem if it wants to use those
> new properties and flags, the existing DTs cannot work as before, E.g. for
> some controller driver, before my patch, the HNP/SRP are enabled,
> ADP is disabled, after utilize those new properties and flags in its
> controller driver, it becomes a new platform, but the existing DTs
> using this controller driver did not pass any xyz_disable, so
> gadget->xyz_support will be updated to be OTG_FEATURE_ENABLED, and
> the result will be HNP/SRP/ADP all are enabled.

Good point.

I was under the impression that if controller drivers change the platform
is no longer legacy but that is not always the case.

I agree that we are restricted to use enable flags in DT if we want to retain
OTG capability behaviour for legacy platforms.

cheers,
-roger

> 
> In some controller driver:
> if (xyz_disable_property_appear_in_dt())
> 	gadget->xyz_support = OTG_FEATURE_DISABLED;
> else
> 	gadget->xyz_support = OTG_FEATURE_ENABLED;
> The existing/old DT with this controller driver will enable all
> OTG features no matter it support it or not, but it does not want
> ADP.
>  
> Li Jun
> > We can still keep disable flags so that users can disable all 3 OTG features
> > while in OTG mode.
> > 
> > cheers,
> > -roger
> > 
> > > > 
> > > > > 
> > 

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
