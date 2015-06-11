From: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 05/22] doc: dt-binding: usb: add otg related
 properties
Date: Thu, 11 Jun 2015 17:52:15 +0300
Message-ID: <20150611175215.6e04d92e@rockdesk>
References: <CAL_JsqJ3hHOGevwqcBNFN2LrTP7Bm_k9SDuTNKBbpq5W-eLmdw@mail.gmail.com>
	<20150609011806.GA7976@shlinux1.ap.freescale.net>
	<CAL_JsqKg_NYtLGg9RUQOpKscwHEskHO4_Szo_nM3BnrDdhg3fg@mail.gmail.com>
	<20150609182931.1eda4111@rockdesk>
	<CAL_JsqJ+q5hs26FaLXG1LVb0asE-UZ5hXar2FeVAJN=S8=CG3w@mail.gmail.com>
	<20150610103737.3cc7c10d@rockdesk>
	<20150610134735.GB7678@shlinux2>
	<20150611101853.643a9334@rockdesk>
	<20150611082010.GA16101@shlinux2>
	<20150611153703.55dff608@rockdesk>
	<20150611141121.GC16101@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150611141121.GC16101@shlinux2>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Li Jun-B47624 <Jun.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Chen Peter-B29397 <Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Macpaul Lin <macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Thu, 11 Jun 2015 22:11:22 +0800
Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:

> On Thu, Jun 11, 2015 at 03:37:03PM +0300, Roger Quadros wrote:
> > 
> > On Thu, 11 Jun 2015 16:20:13 +0800
> > Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > 
> > > On Thu, Jun 11, 2015 at 10:18:53AM +0300, Roger Quadros wrote:
> > > > 
> > > > On Wed, 10 Jun 2015 21:47:51 +0800
> > > > Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > > > 
> > > > > On Wed, Jun 10, 2015 at 03:37:37PM +0800, Roger Quadros wrote:
> > > > > > On Tue, 9 Jun 2015 11:33:11 -0500
> > > > > > Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > > > > > 
> > > > > > > On Tue, Jun 9, 2015 at 10:29 AM, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org> wrote:
> > > > > > > > Rob,
> > > > > > > >
> > > > > > > > On Tue, 9 Jun 2015 08:26:20 -0500
> > > > > > > > Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > > > > > > >
> > > > > > > >> On Mon, Jun 8, 2015 at 8:18 PM, Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > > > > > > >> > On Mon, Jun 08, 2015 at 11:06:49AM -0500, Rob Herring wrote:
> > > > > > > >> >> On Mon, Jun 8, 2015 at 10:02 AM, Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > > > > > > >> >> > Add otg version, srp, hnp and adp support for usb OTG port, then those OTG
> > > > > > > >> >> > features don't have to be decided by usb gadget drivers.
> > > > > > > >> >> >
> > > > > > > >> >> > Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > > > > > >> >> > ---
> > > > > > > >> >> >  Documentation/devicetree/bindings/usb/generic.txt | 10 ++++++++++
> > > > > > > >> >> >  1 file changed, 10 insertions(+)
> > > > > > > >> >> >
> > > > > > > >> >> > diff --git a/Documentation/devicetree/bindings/usb/generic.txt b/Documentation/devicetree/bindings/usb/generic.txt
> > > > > > > >> >> > index 477d5bb..7386f4a 100644
> > > > > > > >> >> > --- a/Documentation/devicetree/bindings/usb/generic.txt
> > > > > > > >> >> > +++ b/Documentation/devicetree/bindings/usb/generic.txt
> > > > > > > >> >> > @@ -11,6 +11,12 @@ Optional properties:
> > > > > > > >> >> >                         "peripheral" and "otg". In case this attribute isn't
> > > > > > > >> >> >                         passed via DT, USB DRD controllers should default to
> > > > > > > >> >> >                         OTG.
> > > > > > > >> >> > + - otg-rev: tells usb driver the release number of the OTG and EH supplement
> > > > > > > >> >> > +                       with which the device and its descriptors are compliant,
> > > > > > > >> >> > +                       in binary-coded decimal (i.e. 2.0 is 0200H).
> > > > > > > >> >>
> > > > > > > >> >> I would assume OTG 2.0 is somehow backwards compatible? Is this a h/w
> > > > > > > >> >> dependency or a driver feature?
> > > > > > > >> >>
> > > > > > > >> > Not fully compatible, OTG 2.0 extend the usb_otg_descriptor by adding a new
> > > > > > > >> > member bcdOTG to identify the OTG version, this descriptor needs to be sent
> > > > > > > >> > to OTG host with correct size and content, so we have to know which release
> > > > > > > >> > version the OTG device is compliant with, either by menuconfig config or pass
> > > > > > > >> > via DT.
> > > > > > > >>
> > > > > > > >> So you have to change the version depending on the host you are
> > > > > > > >> connected to? That really seems strange that plugging in a OTG 2.0
> > > > > > > >> device to an OTG 1.3 host would not work and doesn't make for a good
> > > > > > > >> user experience.
> > > > > > > >
> > > > > > > > No. The OTG version in the OTG descriptor for any device is usually fixed for the
> > > > > > > > lifetime of the product.
> > > > > > > >
> > > > > > > > Let's assume it is 2.0.
> > > > > > > >
> > > > > > > > If you plug this to OTG 1.0 host, it won't be an issue as OTG 1.0 host doesn't
> > > > > > > > read the BCD version.
> > > > > > > 
> > > > > > > That makes sense, but there was some discussion about the size mattering.
> > > > > > > 
> > > > > > > So is there a reason not to always report 2.0 with any kernel that has
> > > > > > > 2.0 support?
> > > > > > 
> > > > > > A 2.0 host would still need to know if the attached OTG device is 1.0 or 2.0
> > > > > > so we don't want to force existing 1.0 devices to 2.0.
> > > > > > 
> > > > > > > 
> > > > > > > >>
> > > > > > > >> >> > + - srp-support: tells OTG controllers we want to enable SRP.
> > > > > > > >> >> > + - hnp-support: tells OTG controllers we want to enable HNP.
> > > > > > > >> >> > + - adp-support: tells OTG controllers we want to enable ADP.
> > > > > > > >> >>
> > > > > > > >> >> I've recently run into a problem[1] and found that I have to disable
> > > > > > > >> >> OTG in the kernel to get my device to work. Having to turn-off OTG
> > > > > > > >> >> seems like the wrong solution, and shifting the problem to DT seems
> > > > > > > >> >> wrong too. Why is this not a user configurable option (within whatever
> > > > > > > >> >> h/w constraints there are)?
> > > > > > > >> > The problem of below link, seems your device is claiming it's a HNP capable
> > > > > > > >> > OTG device, but connecting to a non-OTG port of your Host, assume your Host
> > > > > > > >> > does have a OTG port, your Host issue a A_ALT_HNP_SUPPORT request to your
> > > > > > > >> > OTG device to remind it can use another port with HNP, but the request failed
> > > > > > > >> > (maybe STALL by your device, this request is defined in OTG 1.3 but obsolete
> > > > > > > >> > in OTG 2.0), so your Host just stopped enumeration of your device, this is not
> > > > > > > >> > reasonable because current OTG code is some out of data.
> > > > > > > >>
> > > > > > > >> Do PCs have OTG ports typically? My expectation is that if I plug in
> > > > > > > >> an OTG device as a B device to any host port, that it will work as a
> > > > > > > >> device no matter what the host OTG capabilities are. If I have to
> > > > > > > >> change the kernel config or DT, that is a problem.
> > > > > > > >
> > > > > > > > AFAIK PCs don't have OTG ports.
> > > > > > > >
> > > > > > > > If you plug in OTG device to a non-otg host port it will work as normal B-device.
> > > > > > > > The host doesn't request for OTG descriptors and doesn't care what OTG features it
> > > > > > > > supports or not.
> > > > > > > 
> > > > > > > That is what I would expect. My testing and the bug report show otherwise.
> > > > > > 
> > > > > > what kernel and platform are you on?
> > > > > > 
> > > > > > > 
> > > > > > > >> > I am trying to make those OTG feaures to be configurable options, you mean
> > > > > > > >> > by sys?
> > > > > > > >>
> > > > > > > >> Yes.
> > > > > > > >
> > > > > > > > why do you need OTG features to be sysfs configurable other than for debugging?
> > > > > > > 
> > > > > > > I don't know. Buggy host perhaps? Why do you need them in DT?
> > > > > > 
> > > > > > I'll explain why we need in DT below.
> > > > > > 
> > > > > > > 
> > > > > > > If they are truly debugging, then they would belong in debugfs rather
> > > > > > > than sysfs.
> > > > > > 
> > > > > > agreed.
> > > > > > > 
> > > > > > > >> >> What are the valid combinations? When do we want these enabled or not?
> > > > > > > >> >> Wouldn't default enabled be better?
> > > > > > > >> >
> > > > > > > >> > We want to enable all those support in kernel driver, but some platform or
> > > > > > > >> > hardware may not want to enable any or some of them, so those hardware
> > > > > > > >> > can disable it by not pass the property in dt, the 3 sub features of OTG are
> > > > > > > >> > not mandatory for so called OTG device, normally we at least enable HNP, and
> > > > > > > >> > SRP and ADP are optional.
> > > > > > > >>
> > > > > > > >> Please answer my questions in the doc.
> > > > > > > >>
> > > > > > > >> >>
> > > > > > > >> >> We already have dr_mode property. How is it related to these?
> > > > > > > >
> > > > > > > > dr_mode states what mode the controller will operate in.
> > > > > > > >
> > > > > > > > for dr_mode == "host" we don't care about these otg flags.
> > > > > > > >
> > > > > > > > for dr_mode == "peripheral" or dr_mode == "otg"
> > > > > > > > we care about these OTG flags to create our OTG descriptor on the fly.
> > > > > > > 
> > > > > > > Then how do I specify my device is peripheral only even though I have
> > > > > > > a DR controller?
> > > > > > 
> > > > > > by specifying dr_mode = "peripheral" in the DT.
> > > > > > 
> > > > > > > 
> > > > > > > How is ID pin detect supposed to be supported? Do we need dr_mode = "idpin"?
> > > > > > 
> > > > > > ID pin is not used in single role mode. It will be used only when dr_mode = "otg".
> > > > > > 
> > > > > > > 
> > > > > > > >> > dr_mode is to tell the device it will work at OTG mode(there is another simple
> > > > > > > >> > dual role mode which is commom used but not HNP), srp/hnp/adp can further specify
> > > > > > > >> > which protocol the OTG device will support.
> > > > > > > >>
> > > > > > > >> By simple DR, you mean ID pin detect, right. So please define how you
> > > > > > > >> support just ID pin detect vs. other levels of capability. Does only
> > > > > > > >> dr_mode = otg mean ID pin detect? That may be a problem for existing
> > > > > > > >> DTs if you disable other OTG functions because they have not been
> > > > > > > >> added to the DT, then that is a problem.
> > > > > > > >>
> > > > > > > >> I'm feeling less convinced that this belongs in DT at all. Please
> > > > > > > >> convince me otherwise.
> > > > > > > >
> > > > > > > > Yes not specifying anything in DT should work and default to the
> > > > > > > > best OTG version and features supported by the OTG controller.
> > > > > > > 
> > > > > > > Right, hence why I suggested disable flags, not enable flags.
> > > > > > 
> > > > > > I second that. They must be disable flags.
> > > > > > 
> > > > > 
> > > > > Disable flags may not work with current situation of gadget driver:
> > > > > Currently each gadget class driver hard coded the OTG attributes
> > > > > to be HNP | SRP, independent of controller driver.
> > > > 
> > > > That is wrong in the first place. Gadget drivers shouldn't decide
> > > > the OTG attributes. Platform code/DT should.
> > > > 
> > > 
> > > I totally agree the current code is wrong.
> > > 
> > > > If gadget drivers define OTG flags then they cannot be used on
> > > > different platforms with different OTG needs.
> > > > 
> > > Agree too.
> > > 
> > > But some platforms may already work with current "wrong" way, I do not want
> > > to break them.
> > > 
> > > > > 
> > > > > E.g. some platform with OTG enabled: gadget->is_otg = 1
> > > > > HNP and SRP are enabled by gadget driver, ADP = 0, this OTG port
> > > > > can really support HNP and SRP, but not ADP. 
> > > > 
> > > > What if the platform on which the gadget driver is used doesn't want
> > > > SRP enabled?
> > > 
> > > As far as I know, there is no controller driver to override this setting,
> > > maybe it still keeps SRP enabled even it does not support it in fact. 
> > > 
> > > > 
> > > > > if use disable flag, this platform has to add adp-disable property
> > > > > otherwise it will report ADP support to the host.
> > > > 
> > > > This issue won't happen if gadget driver doesn't define any OTG attributes.
> > > > 
> > > But some existing platform already rely on gadget driver to define OTG
> > > attributes, Can I break those already working platforms? I think it's hard
> > > to figure out all this kind of platforms and then correct every one with
> > > new approach.
> > > 
> > > Who define this attributes doesn't matter, key is this attributes should
> > > base on correct input.
> > > 
> > > So my principle is to not break any existing platforms, and introduce new
> > > approach, old platforms can work without any change.
> > 
> > But we don't know which platforms use what so we need to define a sane
> > default configuration for all gadgets. I don't think we can have a gadget
> > specific configuration.
> > 
> Yes, we don't know, what I can do is to keep all unchanged for those platforms
> if those new properties doesn't appear at all. (i.e. SRP and HNP still enabled
> in its otg descriptor anyway like current gadget driver does)
> 
> > If anyone complains we need to ask them to set the right DT flags for their
> > platform. I don't see any other way.
> > 
> 
> My current way is to achieve this goal.
> 
> > > 
> > > > > 
> > > > > But with enable flags, I can check all those 3 properties,
> > > > 
> > > > I don't see why you can't do that with disable flags. Note that there are 2 things.
> > > > 1) disable flags from DT
> > > > 2) support flags from controller. This information is already known to the
> > > > controller.
> > > > 
> > > > Based on these 2 you can decide what OTG features you want to set/clear.
> > > > And you can't combine the 2 by just defining enable flags in DT.
> > > > 
> > > 
> > > Yes, I have the same understanding. So:
> > > 1) In controller driver:
> > > if (controller_can_support_srp(controller)) {
> 
> This check only can be done in each controller driver.
> 
> > > 	if (srp_enabled_in_dt(of))
> > > 		gadget->srp_support = 1;
> > 
> > Existing platforms don't have feature_enabled_in_dt so this will fail for all.
> 
> Above code is for how "new" platform set new flags if it want to utilize those new
> properties, existing platform doesn't need any code change. This is not common code
> shared by all controller drivers, like gadget->is_otg, it should be set by specific
> controller driver.
> 
> > So need to have
> > 	if (srp_not_disabled_in_dt(of))
> >  		gadget->srp_support = 1;
> 
> Maybe you think it's common code called by every platform.
> I am putting it in my chipidea driver.
> 
> > 
> > > }
> > > 2) In gadget driver:
> > > if (gadget->srp_support)
> > > 	attribute |= SRP;
> > 
> > Agreed.
> > 
> 
> You may take a look my 9/22 patch to see how existing platform is handled:
> 
> 	if (gadget->adp_support || gadget->hnp_support ||
> 					gadget->srp_support) {
> 		/* means th
> 		if (gadget->adp_support)
> 			otg_desc->bmAttributes |= USB_OTG_ADP;
> 		if (gadget->hnp_support)
> 		otg_desc->bmAttributes |= USB_OTG_HNP;
> 		if (gadget->srp_support)
> 			otg_desc->bmAttributes |= USB_OTG_SRP;
> 	} else {
> 		otg_desc->bmAttributes = USB_OTG_SRP | USB_OTG_HNP;
> 	}
> 
> This is common code will be called by every platform.

So you are using  gadget->xyz_support flags to determine if it is a legacy
platform and that's why we have a problem with having disable flags in DT.

This also has a side effect of SRP and HNP being enabled for any platform
even if enable-srp/enable-hnp is not set in DT.
This will be more of a bug than supporting legacy users.

Instead we could have ADP disabled by default for all cases
and expect enable-adp in DT to get it enabled. SRP/HNP could still
be disable flags.

Then your above code reduces to

		if (gadget->adp_support)
 			otg_desc->bmAttributes |= USB_OTG_ADP;
 		if (gadget->hnp_support)
 			otg_desc->bmAttributes |= USB_OTG_HNP;
 		if (gadget->srp_support)
 			otg_desc->bmAttributes |= USB_OTG_SRP;

cheers,
-roger

> 
> Those existing platforms do not use those new flags of gadget, so all are 0,
> then otg_desc->bmAttributes = USB_OTG_SRP | USB_OTG_HNP. This is current
> "wrong" way.
> 
> If any platform want to use any new flags, then He must fully understand
> those flags and change accordingly, set gadget->xxx_support in its controller
> driver either by dt, or by other way(hard code...what ever).
> 
> 
> > > 
> > > > > 1)If none of them are passed, but gadget->is_otg == 1, I suppose it's
> > > > > legacy platform, still set HNP and SRP as current gadget driver does,
> > > > > works as before;
> > > > > 2)If any one of them appear, I will set all those features by dt property.
> > > > > 3)If some platform already based on those properties, wants to disable
> > > > > all 3 OTG features, also not pass any one of them like 1), it will not
> > > > > be a OTG device at all, set gadget->is_otg = 0 in its controller driver,
> > > > > then no need set and report any OTG features, this can meet ID pin detect
> > > > > case.
> > > > 
> > > > With enable flags you don't get what you set.
> > > > e.g. in DT, we might set enable-adp.
> > > > but if controller doesn't support adp, you don't have ADP working.
> > > > So this is misleading.
> > > > 
> > > 
> > > Why someone might do that? If someone adds some property which is not supported
> > > by its controller, of cos this feature cannot work.
> > 
> > OK.
> > 
> > > 
> > > If some platform utilize those new properties, both enable and disable flags
> > > can work, but for those existing platforms with HNP/SRP support, they have
> > > no any new flags in its DT, I need make it work as before.
> > 
> > Right, existing platforms need to work as is without DT changes. So features
> > have to be enabled by default. That's another reason why we need disable-flags
> > and not enable-flags in DT.
> 
> You are right if current code enables all 3 features by default,
> Unfortunately only SRP and HNP are enabled, ADP is disabled,  
> 
> The key point here is, if none of new properties is added, are there 2 cases
> which we cannot differentiate one from the other? 
> 
> By disable flags, if none passed in dt, there are 2 cases:
> 1) Legacy platforms(some may only support HNP and SRP, but no ADP).
> 2) New platform, it can really support all 3 features. 
> I cannot differentiate 1) from 2), to correct set 1), I have to add
> "adp-disable" for a legacy platform.
> 
> By enable flags, if none passed in dt, there are 2 cases:
> 1) Legacy platforms
> 2) New platform, it cannot support any features, so it's not a OTG device
>    at all. Then the gadget->is_otg is 0, no any OTG related report needed.
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
