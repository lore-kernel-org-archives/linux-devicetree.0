From: Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v3 05/22] doc: dt-binding: usb: add otg related properties
Date: Tue, 16 Jun 2015 16:32:27 +0800
Message-ID: <20150616083225.GD10574@shlinux2>
References: <1434437532-23678-1-git-send-email-jun.li@freescale.com>
 <1434437532-23678-6-git-send-email-jun.li@freescale.com>
 <20150616112115.7a85966d@rockdesk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150616112115.7a85966d@rockdesk>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Cc: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 16, 2015 at 11:21:15AM +0300, Roger Quadros wrote:
> 
> On Tue, 16 Jun 2015 14:51:55 +0800
> Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> 
> > Add otg version, srp, hnp and adp support for usb OTG port, then those OTG
> > features don't have to be decided by usb gadget drivers.
> > 
> > Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/usb/generic.txt | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/generic.txt b/Documentation/devicetree/bindings/usb/generic.txt
> > index 477d5bb..eb7308e 100644
> > --- a/Documentation/devicetree/bindings/usb/generic.txt
> > +++ b/Documentation/devicetree/bindings/usb/generic.txt
> > @@ -11,6 +11,20 @@ Optional properties:
> >  			"peripheral" and "otg". In case this attribute isn't
> >  			passed via DT, USB DRD controllers should default to
> >  			OTG.
> > + - otg-rev: tells usb driver the release number of the OTG and EH supplement
> > +			with which the device and its descriptors are compliant,
> > +			in binary-coded decimal (i.e. 2.0 is 0200H). This
> > +			property is used if any real OTG features(HNP/SRP/ADP)
> > +			is enabled, also if ADP is enabled, otg-rev should be
> > +			0x0200 or above.
> 
> How about saying "if ADP is required, otg-rev should be 0x0200 or above"
> 
okay.

> > + - hnp-disable: tells OTG controllers we want to disable OTG HNP, normally HNP
> > +			is the basic function of real OTG except you want it
> > +			to be a srp-capable only B device.
> > + - srp-disable: tells OTG controllers we want to disable OTG SRP, SRP is
> > +			optional for OTG device.
> > + - adp-disable: tells OTG controllers we want to disable OTG ADP, ADP is
> > +			optional for OTG device, if not passed, otg-rev should
> > +			be set to be 0x0200 or above.
> 
> Why should we place this constraint on DT? Isn't is better
> to handle it automatically in the USB code?
> 
You are right, this can be done in USB code, I will remove this constraint
from it.

> Not specifying the disable flag doesn't mean that it has to be enabled.
> It means that enable it if it can be. i.e. supported by OTG rev and controller.
> 
Exactly.

> >  
> >  This is an attribute to a USB controller such as:
> >  
> > @@ -21,4 +35,8 @@ dwc3@4a030000 {
> >  	usb-phy = <&usb2_phy>, <&usb3,phy>;
> >  	maximum-speed = "super-speed";
> >  	dr_mode = "otg";
> > +	otg-rev = <0x0200>;
> > +	hnp-disable;
> > +	srp-disable;
> > +	adp-disable;
> >  };
> 
> How about a more real world example? We don't want hnp/srp disabled.
> 
My fault, actually it's a wrong example, I will update with a typical
setting as you pointed.

Li Jun
> cheers,
> -roger
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
