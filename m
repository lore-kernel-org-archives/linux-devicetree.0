From: Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2 05/22] doc: dt-binding: usb: add otg related
 properties
Date: Tue, 9 Jun 2015 09:18:49 +0800
Message-ID: <20150609011806.GA7976@shlinux1.ap.freescale.net>
References: <1433775737-9816-1-git-send-email-jun.li@freescale.com>
 <1433775737-9816-6-git-send-email-jun.li@freescale.com>
 <CAL_JsqJ3hHOGevwqcBNFN2LrTP7Bm_k9SDuTNKBbpq5W-eLmdw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJ3hHOGevwqcBNFN2LrTP7Bm_k9SDuTNKBbpq5W-eLmdw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 08, 2015 at 11:06:49AM -0500, Rob Herring wrote:
> On Mon, Jun 8, 2015 at 10:02 AM, Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > Add otg version, srp, hnp and adp support for usb OTG port, then those OTG
> > features don't have to be decided by usb gadget drivers.
> >
> > Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/usb/generic.txt | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/generic.txt b/Documentation/devicetree/bindings/usb/generic.txt
> > index 477d5bb..7386f4a 100644
> > --- a/Documentation/devicetree/bindings/usb/generic.txt
> > +++ b/Documentation/devicetree/bindings/usb/generic.txt
> > @@ -11,6 +11,12 @@ Optional properties:
> >                         "peripheral" and "otg". In case this attribute isn't
> >                         passed via DT, USB DRD controllers should default to
> >                         OTG.
> > + - otg-rev: tells usb driver the release number of the OTG and EH supplement
> > +                       with which the device and its descriptors are compliant,
> > +                       in binary-coded decimal (i.e. 2.0 is 0200H).
> 
> I would assume OTG 2.0 is somehow backwards compatible? Is this a h/w
> dependency or a driver feature?
> 
Not fully compatible, OTG 2.0 extend the usb_otg_descriptor by adding a new
member bcdOTG to identify the OTG version, this descriptor needs to be sent
to OTG host with correct size and content, so we have to know which release
version the OTG device is compliant with, either by menuconfig config or pass
via DT.

> > + - srp-support: tells OTG controllers we want to enable SRP.
> > + - hnp-support: tells OTG controllers we want to enable HNP.
> > + - adp-support: tells OTG controllers we want to enable ADP.
> 
> I've recently run into a problem[1] and found that I have to disable
> OTG in the kernel to get my device to work. Having to turn-off OTG
> seems like the wrong solution, and shifting the problem to DT seems
> wrong too. Why is this not a user configurable option (within whatever
> h/w constraints there are)?
The problem of below link, seems your device is claiming it's a HNP capable
OTG device, but connecting to a non-OTG port of your Host, assume your Host
does have a OTG port, your Host issue a A_ALT_HNP_SUPPORT request to your
OTG device to remind it can use another port with HNP, but the request failed
(maybe STALL by your device, this request is defined in OTG 1.3 but obsolete
in OTG 2.0), so your Host just stopped enumeration of your device, this is not
reasonable because current OTG code is some out of data.

I am trying to make those OTG feaures to be configurable options, you mean
by sys?

> 
> What are the valid combinations? When do we want these enabled or not?
> Wouldn't default enabled be better?

We want to enable all those support in kernel driver, but some platform or
hardware may not want to enable any or some of them, so those hardware
can disable it by not pass the property in dt, the 3 sub features of OTG are
not mandatory for so called OTG device, normally we at least enable HNP, and
SRP and ADP are optional.

> 
> We already have dr_mode property. How is it related to these?

dr_mode is to tell the device it will work at OTG mode(there is another simple
dual role mode which is commom used but not HNP), srp/hnp/adp can further specify
which protocol the OTG device will support.
> 
> Rob
> 
> [1] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1047527
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
