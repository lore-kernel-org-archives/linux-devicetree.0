From: Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2 05/22] doc: dt-binding: usb: add otg related properties
Date: Wed, 10 Jun 2015 19:20:52 +0800
Message-ID: <20150610112050.GA11109@shlinux2>
References: <1433775737-9816-1-git-send-email-jun.li@freescale.com>
 <1433775737-9816-6-git-send-email-jun.li@freescale.com>
 <CAL_JsqJ3hHOGevwqcBNFN2LrTP7Bm_k9SDuTNKBbpq5W-eLmdw@mail.gmail.com>
 <20150609011806.GA7976@shlinux1.ap.freescale.net>
 <CAL_JsqKg_NYtLGg9RUQOpKscwHEskHO4_Szo_nM3BnrDdhg3fg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKg_NYtLGg9RUQOpKscwHEskHO4_Szo_nM3BnrDdhg3fg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Li Jun-B47624 <Jun.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Chen Peter-B29397 <Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 09, 2015 at 09:26:20PM +0800, Rob Herring wrote:
> On Mon, Jun 8, 2015 at 8:18 PM, Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > On Mon, Jun 08, 2015 at 11:06:49AM -0500, Rob Herring wrote:
> >> On Mon, Jun 8, 2015 at 10:02 AM, Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> >> > Add otg version, srp, hnp and adp support for usb OTG port, then those OTG
> >> > features don't have to be decided by usb gadget drivers.
> >> >
> >> > Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> >> > ---
> >> >  Documentation/devicetree/bindings/usb/generic.txt | 10 ++++++++++
> >> >  1 file changed, 10 insertions(+)
> >> >
> >> > diff --git a/Documentation/devicetree/bindings/usb/generic.txt b/Documentation/devicetree/bindings/usb/generic.txt
> >> > index 477d5bb..7386f4a 100644
> >> > --- a/Documentation/devicetree/bindings/usb/generic.txt
> >> > +++ b/Documentation/devicetree/bindings/usb/generic.txt
> >> > @@ -11,6 +11,12 @@ Optional properties:
> >> >                         "peripheral" and "otg". In case this attribute isn't
> >> >                         passed via DT, USB DRD controllers should default to
> >> >                         OTG.
> >> > + - otg-rev: tells usb driver the release number of the OTG and EH supplement
> >> > +                       with which the device and its descriptors are compliant,
> >> > +                       in binary-coded decimal (i.e. 2.0 is 0200H).
> >>
> >> I would assume OTG 2.0 is somehow backwards compatible? Is this a h/w
> >> dependency or a driver feature?
> >>
> > Not fully compatible, OTG 2.0 extend the usb_otg_descriptor by adding a new
> > member bcdOTG to identify the OTG version, this descriptor needs to be sent
> > to OTG host with correct size and content, so we have to know which release
> > version the OTG device is compliant with, either by menuconfig config or pass
> > via DT.
> 
> So you have to change the version depending on the host you are
> connected to? That really seems strange that plugging in a OTG 2.0
> device to an OTG 1.3 host would not work and doesn't make for a good
> user experience.
> 
Depending on the OTG device itself with which release version it's compliant
, then OTG 2.0 host can differentiate them and talk to it with right version
protocol.
Maybe most of OTG 2.0 devices design does not consider to be compatible
with OTG 1.3 host, chipidea udc driver has fixed this issue with below patch:
http://www.spinics.net/lists/stable-commits/msg43003.html

> >> > + - srp-support: tells OTG controllers we want to enable SRP.
> >> > + - hnp-support: tells OTG controllers we want to enable HNP.
> >> > + - adp-support: tells OTG controllers we want to enable ADP.
> >>
> >> I've recently run into a problem[1] and found that I have to disable
> >> OTG in the kernel to get my device to work. Having to turn-off OTG
> >> seems like the wrong solution, and shifting the problem to DT seems
> >> wrong too. Why is this not a user configurable option (within whatever
> >> h/w constraints there are)?
> > The problem of below link, seems your device is claiming it's a HNP capable
> > OTG device, but connecting to a non-OTG port of your Host, assume your Host
> > does have a OTG port, your Host issue a A_ALT_HNP_SUPPORT request to your
> > OTG device to remind it can use another port with HNP, but the request failed
> > (maybe STALL by your device, this request is defined in OTG 1.3 but obsolete
> > in OTG 2.0), so your Host just stopped enumeration of your device, this is not
> > reasonable because current OTG code is some out of data.
> 
> Do PCs have OTG ports typically? My expectation is that if I plug in
> an OTG device as a B device to any host port, that it will work as a
> device no matter what the host OTG capabilities are. If I have to
> change the kernel config or DT, that is a problem.

Unfortunately current host code for OTG is some out of data and has not been
updated for OTG 2.0, so cannot work well with OTG 2.0 device, but this can be
another OTG topic. For now if your PC has no OTG port, you have to disable
CONFIG_USB_OTG, otherwise it will assume you have a OTG port on your machine.

> 
> > I am trying to make those OTG feaures to be configurable options, you mean
> > by sys?
> 
> Yes.
> 
This kind of feature may not be able to enable/disable at runtime.
E.g. ADP and SRP need OTG devices do pre-defined sequence when power up.

> >> What are the valid combinations? When do we want these enabled or not?
> >> Wouldn't default enabled be better?
> >
> > We want to enable all those support in kernel driver, but some platform or
> > hardware may not want to enable any or some of them, so those hardware
> > can disable it by not pass the property in dt, the 3 sub features of OTG are
> > not mandatory for so called OTG device, normally we at least enable HNP, and
> > SRP and ADP are optional.
> 
> Please answer my questions in the doc.
> 
> >>
> >> We already have dr_mode property. How is it related to these?
> >
> > dr_mode is to tell the device it will work at OTG mode(there is another simple
> > dual role mode which is commom used but not HNP), srp/hnp/adp can further specify
> > which protocol the OTG device will support.
> 
> By simple DR, you mean ID pin detect, right. So please define how you
> support just ID pin detect vs. other levels of capability. Does only
> dr_mode = otg mean ID pin detect? That may be a problem for existing
> DTs if you disable other OTG functions because they have not been
> added to the DT, then that is a problem.
I do not disable any OTG functions if those new properties has not been
added to DTs, they will work as before without any change. If some platform
has some real OTG features and want to utilize those properties, can set the
existing otg flag(e.g. gadget->is_otg, which is only needed for real OTG) by
srp/hnp/adp property, not just hard coded in its controller driver, then it
can use dr_mode = otg for ID pin detect, and above new properties for other
levels.

> 
> I'm feeling less convinced that this belongs in DT at all. Please
> convince me otherwise.
> 
> Rob

Li Jun
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
