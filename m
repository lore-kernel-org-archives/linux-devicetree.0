From: Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2 05/22] doc: dt-binding: usb: add otg related properties
Date: Thu, 11 Jun 2015 16:38:52 +0800
Message-ID: <20150611083851.GB16101@shlinux2>
References: <1433775737-9816-1-git-send-email-jun.li@freescale.com>
 <1433775737-9816-6-git-send-email-jun.li@freescale.com>
 <CAL_JsqJ3hHOGevwqcBNFN2LrTP7Bm_k9SDuTNKBbpq5W-eLmdw@mail.gmail.com>
 <20150609011806.GA7976@shlinux1.ap.freescale.net>
 <CAL_JsqKg_NYtLGg9RUQOpKscwHEskHO4_Szo_nM3BnrDdhg3fg@mail.gmail.com>
 <20150609182931.1eda4111@rockdesk> <20150610120623.GA7678@shlinux2>
 <20150611103035.08967a37@rockdesk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150611103035.08967a37@rockdesk>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Li Jun-B47624 <Jun.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Chen Peter-B29397 <Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 11, 2015 at 10:30:35AM +0300, Roger Quadros wrote:
> 
> On Wed, 10 Jun 2015 20:06:25 +0800
> Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> 
> > On Tue, Jun 09, 2015 at 11:29:31PM +0800, Roger Quadros wrote:
> > > Rob,
> > > 
> > > On Tue, 9 Jun 2015 08:26:20 -0500
> > > Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > > 
> > > > On Mon, Jun 8, 2015 at 8:18 PM, Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > > > > On Mon, Jun 08, 2015 at 11:06:49AM -0500, Rob Herring wrote:
> > > > >> On Mon, Jun 8, 2015 at 10:02 AM, Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > > > >> > Add otg version, srp, hnp and adp support for usb OTG port, then those OTG
> > > > >> > features don't have to be decided by usb gadget drivers.
> > > > >> >
> > > > >> > Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > > >> > ---
> > > > >> >  Documentation/devicetree/bindings/usb/generic.txt | 10 ++++++++++
> > > > >> >  1 file changed, 10 insertions(+)
> > > > >> >
> > > > >> > diff --git a/Documentation/devicetree/bindings/usb/generic.txt b/Documentation/devicetree/bindings/usb/generic.txt
> > > > >> > index 477d5bb..7386f4a 100644
> > > > >> > --- a/Documentation/devicetree/bindings/usb/generic.txt
> > > > >> > +++ b/Documentation/devicetree/bindings/usb/generic.txt
> > > > >> > @@ -11,6 +11,12 @@ Optional properties:
> > > > >> >                         "peripheral" and "otg". In case this attribute isn't
> > > > >> >                         passed via DT, USB DRD controllers should default to
> > > > >> >                         OTG.
> > > > >> > + - otg-rev: tells usb driver the release number of the OTG and EH supplement
> > > > >> > +                       with which the device and its descriptors are compliant,
> > > > >> > +                       in binary-coded decimal (i.e. 2.0 is 0200H).
> > > > >>
> > > > >> I would assume OTG 2.0 is somehow backwards compatible? Is this a h/w
> > > > >> dependency or a driver feature?
> > > > >>
> > > > > Not fully compatible, OTG 2.0 extend the usb_otg_descriptor by adding a new
> > > > > member bcdOTG to identify the OTG version, this descriptor needs to be sent
> > > > > to OTG host with correct size and content, so we have to know which release
> > > > > version the OTG device is compliant with, either by menuconfig config or pass
> > > > > via DT.
> > > > 
> > > > So you have to change the version depending on the host you are
> > > > connected to? That really seems strange that plugging in a OTG 2.0
> > > > device to an OTG 1.3 host would not work and doesn't make for a good
> > > > user experience.
> > > 
> > > No. The OTG version in the OTG descriptor for any device is usually fixed for the
> > > lifetime of the product.
> > > 
> > > Let's assume it is 2.0.
> > > 
> > > If you plug this to OTG 1.0 host, it won't be an issue as OTG 1.0 host doesn't
> > > read the BCD version.
> > > 
> > But OTG 1.0 host will send a 1.x specific OTG request for the 2.0 device.
> > 
> > > > 
> > > > >> > + - srp-support: tells OTG controllers we want to enable SRP.
> > > > >> > + - hnp-support: tells OTG controllers we want to enable HNP.
> > > > >> > + - adp-support: tells OTG controllers we want to enable ADP.
> > > > >>
> > > > >> I've recently run into a problem[1] and found that I have to disable
> > > > >> OTG in the kernel to get my device to work. Having to turn-off OTG
> > > > >> seems like the wrong solution, and shifting the problem to DT seems
> > > > >> wrong too. Why is this not a user configurable option (within whatever
> > > > >> h/w constraints there are)?
> > > > > The problem of below link, seems your device is claiming it's a HNP capable
> > > > > OTG device, but connecting to a non-OTG port of your Host, assume your Host
> > > > > does have a OTG port, your Host issue a A_ALT_HNP_SUPPORT request to your
> > > > > OTG device to remind it can use another port with HNP, but the request failed
> > > > > (maybe STALL by your device, this request is defined in OTG 1.3 but obsolete
> > > > > in OTG 2.0), so your Host just stopped enumeration of your device, this is not
> > > > > reasonable because current OTG code is some out of data.
> > > > 
> > > > Do PCs have OTG ports typically? My expectation is that if I plug in
> > > > an OTG device as a B device to any host port, that it will work as a
> > > > device no matter what the host OTG capabilities are. If I have to
> > > > change the kernel config or DT, that is a problem.
> > > 
> > > AFAIK PCs don't have OTG ports.
> > > 
> > > If you plug in OTG device to a non-otg host port it will work as normal B-device.
> > > The host doesn't request for OTG descriptors and doesn't care what OTG features it
> > > supports or not.
> > > 
> > This is not true in OTG 1.x and our current code, the host still request for
> > OTG descriptor and check if HNP is supported by it if CONFIG_USB_OTG is enabled
> > for the host.
> 
> Looks like the current USB host/hub code assumes that if CONFIG_USB_OTG is set
> it is an OTG port even if it really isn't. This is wrong and the root of the problem.
> 

There is another condition to judge if it's a OTG port: the current port
number is equal to the otg port number(bus->otg_port), if not, it will
assume there is another port with OTG, and send a OTG 1.x request to the
connected OTG device.
After OTG 2.0 otg descriptor introduced, I can fix it in host/hub by checking
the OTG version before sending 1.x specific request.

> We need to have is_otg flag + attributes for host port case as well
> just like we have for device case.
> 
We can use bus->otg_port, if there is no otg port, don't make it match any
port number of your available host ports.
 
> cheers,
> -roger
> 
> > 
> > > > 
> > > > > I am trying to make those OTG feaures to be configurable options, you mean
> > > > > by sys?
> > > > 
> > > > Yes.
> > > 
> > > why do you need OTG features to be sysfs configurable other than for debugging?
> > > 
> > > > 
> > > > >> What are the valid combinations? When do we want these enabled or not?
> > > > >> Wouldn't default enabled be better?
> > > > >
> > > > > We want to enable all those support in kernel driver, but some platform or
> > > > > hardware may not want to enable any or some of them, so those hardware
> > > > > can disable it by not pass the property in dt, the 3 sub features of OTG are
> > > > > not mandatory for so called OTG device, normally we at least enable HNP, and
> > > > > SRP and ADP are optional.
> > > > 
> > > > Please answer my questions in the doc.
> > > > 
> > > > >>
> > > > >> We already have dr_mode property. How is it related to these?
> > > 
> > > dr_mode states what mode the controller will operate in.
> > > 
> > > for dr_mode == "host" we don't care about these otg flags.
> > > 
> > > for dr_mode == "peripheral" or dr_mode == "otg"
> > > we care about these OTG flags to create our OTG descriptor on the fly.
> > > 
> > 
> > Yes.
> > 
> > > > >
> > > > > dr_mode is to tell the device it will work at OTG mode(there is another simple
> > > > > dual role mode which is commom used but not HNP), srp/hnp/adp can further specify
> > > > > which protocol the OTG device will support.
> > > > 
> > > > By simple DR, you mean ID pin detect, right. So please define how you
> > > > support just ID pin detect vs. other levels of capability. Does only
> > > > dr_mode = otg mean ID pin detect? That may be a problem for existing
> > > > DTs if you disable other OTG functions because they have not been
> > > > added to the DT, then that is a problem.
> > > > 
> > > > I'm feeling less convinced that this belongs in DT at all. Please
> > > > convince me otherwise.
> > > 
> > > Yes not specifying anything in DT should work and default to the
> > > best OTG version and features supported by the OTG controller.
> > > 
> > > But if the device manufacturer wants to restrict the OTG version
> > > to something less or disable some OTG features then the DT flags come
> > > into play.
> > > 
> > agree.
> > 
> > > cheers,
> > > -roger
> > 
> > Li Jun
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
