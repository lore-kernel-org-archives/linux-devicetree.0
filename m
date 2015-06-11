From: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 05/22] doc: dt-binding: usb: add otg related
 properties
Date: Thu, 11 Jun 2015 17:55:57 +0300
Message-ID: <20150611175557.724a14e5@rockdesk>
References: <1433775737-9816-1-git-send-email-jun.li@freescale.com>
	<1433775737-9816-6-git-send-email-jun.li@freescale.com>
	<CAL_JsqJ3hHOGevwqcBNFN2LrTP7Bm_k9SDuTNKBbpq5W-eLmdw@mail.gmail.com>
	<20150609011806.GA7976@shlinux1.ap.freescale.net>
	<CAL_JsqKg_NYtLGg9RUQOpKscwHEskHO4_Szo_nM3BnrDdhg3fg@mail.gmail.com>
	<20150609182931.1eda4111@rockdesk>
	<20150610120623.GA7678@shlinux2>
	<20150611103035.08967a37@rockdesk>
	<20150611083851.GB16101@shlinux2>
	<20150611155102.15b881fd@rockdesk>
	<20150611142208.GD16101@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150611142208.GD16101@shlinux2>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Li Jun-B47624 <Jun.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Chen Peter-B29397 <Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 11 Jun 2015 22:22:09 +0800
Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:

> On Thu, Jun 11, 2015 at 03:51:02PM +0300, Roger Quadros wrote:
> > 
> > On Thu, 11 Jun 2015 16:38:52 +0800
> > Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > 
> > > On Thu, Jun 11, 2015 at 10:30:35AM +0300, Roger Quadros wrote:
> > > > 
> > > > On Wed, 10 Jun 2015 20:06:25 +0800
> > > > Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > > > 
> > > > > On Tue, Jun 09, 2015 at 11:29:31PM +0800, Roger Quadros wrote:
> > > > > > Rob,
> > > > > > 
> > > > > > On Tue, 9 Jun 2015 08:26:20 -0500
> > > > > > Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > > > > > 
> > > > > > > On Mon, Jun 8, 2015 at 8:18 PM, Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > > > > > > > On Mon, Jun 08, 2015 at 11:06:49AM -0500, Rob Herring wrote:
> > > > > > > >> On Mon, Jun 8, 2015 at 10:02 AM, Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > > > > > > >> > Add otg version, srp, hnp and adp support for usb OTG port, then those OTG
> > > > > > > >> > features don't have to be decided by usb gadget drivers.
> > > > > > > >> >
> > > > > > > >> > Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > > > > > >> > ---
> > > > > > > >> >  Documentation/devicetree/bindings/usb/generic.txt | 10 ++++++++++
> > > > > > > >> >  1 file changed, 10 insertions(+)
> > > > > > > >> >
> > > > > > > >> > diff --git a/Documentation/devicetree/bindings/usb/generic.txt b/Documentation/devicetree/bindings/usb/generic.txt
> > > > > > > >> > index 477d5bb..7386f4a 100644
> > > > > > > >> > --- a/Documentation/devicetree/bindings/usb/generic.txt
> > > > > > > >> > +++ b/Documentation/devicetree/bindings/usb/generic.txt
> > > > > > > >> > @@ -11,6 +11,12 @@ Optional properties:
> > > > > > > >> >                         "peripheral" and "otg". In case this attribute isn't
> > > > > > > >> >                         passed via DT, USB DRD controllers should default to
> > > > > > > >> >                         OTG.
> > > > > > > >> > + - otg-rev: tells usb driver the release number of the OTG and EH supplement
> > > > > > > >> > +                       with which the device and its descriptors are compliant,
> > > > > > > >> > +                       in binary-coded decimal (i.e. 2.0 is 0200H).
> > > > > > > >>
> > > > > > > >> I would assume OTG 2.0 is somehow backwards compatible? Is this a h/w
> > > > > > > >> dependency or a driver feature?
> > > > > > > >>
> > > > > > > > Not fully compatible, OTG 2.0 extend the usb_otg_descriptor by adding a new
> > > > > > > > member bcdOTG to identify the OTG version, this descriptor needs to be sent
> > > > > > > > to OTG host with correct size and content, so we have to know which release
> > > > > > > > version the OTG device is compliant with, either by menuconfig config or pass
> > > > > > > > via DT.
> > > > > > > 
> > > > > > > So you have to change the version depending on the host you are
> > > > > > > connected to? That really seems strange that plugging in a OTG 2.0
> > > > > > > device to an OTG 1.3 host would not work and doesn't make for a good
> > > > > > > user experience.
> > > > > > 
> > > > > > No. The OTG version in the OTG descriptor for any device is usually fixed for the
> > > > > > lifetime of the product.
> > > > > > 
> > > > > > Let's assume it is 2.0.
> > > > > > 
> > > > > > If you plug this to OTG 1.0 host, it won't be an issue as OTG 1.0 host doesn't
> > > > > > read the BCD version.
> > > > > > 
> > > > > But OTG 1.0 host will send a 1.x specific OTG request for the 2.0 device.
> > > > > 
> > > > > > > 
> > > > > > > >> > + - srp-support: tells OTG controllers we want to enable SRP.
> > > > > > > >> > + - hnp-support: tells OTG controllers we want to enable HNP.
> > > > > > > >> > + - adp-support: tells OTG controllers we want to enable ADP.
> > > > > > > >>
> > > > > > > >> I've recently run into a problem[1] and found that I have to disable
> > > > > > > >> OTG in the kernel to get my device to work. Having to turn-off OTG
> > > > > > > >> seems like the wrong solution, and shifting the problem to DT seems
> > > > > > > >> wrong too. Why is this not a user configurable option (within whatever
> > > > > > > >> h/w constraints there are)?
> > > > > > > > The problem of below link, seems your device is claiming it's a HNP capable
> > > > > > > > OTG device, but connecting to a non-OTG port of your Host, assume your Host
> > > > > > > > does have a OTG port, your Host issue a A_ALT_HNP_SUPPORT request to your
> > > > > > > > OTG device to remind it can use another port with HNP, but the request failed
> > > > > > > > (maybe STALL by your device, this request is defined in OTG 1.3 but obsolete
> > > > > > > > in OTG 2.0), so your Host just stopped enumeration of your device, this is not
> > > > > > > > reasonable because current OTG code is some out of data.
> > > > > > > 
> > > > > > > Do PCs have OTG ports typically? My expectation is that if I plug in
> > > > > > > an OTG device as a B device to any host port, that it will work as a
> > > > > > > device no matter what the host OTG capabilities are. If I have to
> > > > > > > change the kernel config or DT, that is a problem.
> > > > > > 
> > > > > > AFAIK PCs don't have OTG ports.
> > > > > > 
> > > > > > If you plug in OTG device to a non-otg host port it will work as normal B-device.
> > > > > > The host doesn't request for OTG descriptors and doesn't care what OTG features it
> > > > > > supports or not.
> > > > > > 
> > > > > This is not true in OTG 1.x and our current code, the host still request for
> > > > > OTG descriptor and check if HNP is supported by it if CONFIG_USB_OTG is enabled
> > > > > for the host.
> > > > 
> > > > Looks like the current USB host/hub code assumes that if CONFIG_USB_OTG is set
> > > > it is an OTG port even if it really isn't. This is wrong and the root of the problem.
> > > > 
> > > 
> > > There is another condition to judge if it's a OTG port: the current port
> > > number is equal to the otg port number(bus->otg_port), if not, it will
> > > assume there is another port with OTG, and send a OTG 1.x request to the
> > > connected OTG device.
> > > After OTG 2.0 otg descriptor introduced, I can fix it in host/hub by checking
> > > the OTG version before sending 1.x specific request.
> > 
> > That is not the issue.
> > 
> > This is the existing code I'm talking about
> > 
> > drivers/usb/core/hub.c
> > 
> > static int usb_enumerate_device_otg(struct usb_device *udev)
> > {
> > 	int err = 0;
> > 
> > #ifdef	CONFIG_USB_OTG
> > 	/*
> > 	 * OTG-aware devices on OTG-capable root hubs may be able to use SRP,
> > 	 * to wake us after we've powered off VBUS; and HNP, switching roles
> > 	 * "host" to "peripheral".  The OTG descriptor helps figure this out.
> > 	 */
> > 	if (!udev->bus->is_b_host
> > 			&& udev->config
> > 			&& udev->parent == udev->bus->root_hub) {
> > 		struct usb_otg_descriptor	*desc = NULL;
> > 		struct usb_bus			*bus = udev->bus;
> > 
> > 		/* descriptor may appear anywhere in config */
> > 		if (__usb_get_extra_descriptor (udev->rawdescriptors[0],
> > 					le16_to_cpu(udev->config[0].desc.wTotalLength),
> > 					USB_DT_OTG, (void **) &desc) == 0) {
> > 			if (desc->bmAttributes & USB_OTG_HNP) {
> > 				unsigned		port1 = udev->portnum;
> > 
> > 				dev_info(&udev->dev,
> > 					"Dual-Role OTG device on %sHNP port\n",
> > 					(port1 == bus->otg_port)
> > 						? "" : "non-");
> > 
> > 				/* enable HNP before suspend, it's simpler */
> > 				if (port1 == bus->otg_port)
> > 					bus->b_hnp_enable = 1;
> > 				err = usb_control_msg(udev,
> > 					usb_sndctrlpipe(udev, 0),
> > 					USB_REQ_SET_FEATURE, 0,
> > 					bus->b_hnp_enable
> > 						? USB_DEVICE_B_HNP_ENABLE
> > 						: USB_DEVICE_A_ALT_HNP_SUPPORT,
> > 					0, NULL, 0, USB_CTRL_SET_TIMEOUT);
> > 
> > We're sending out this control request even if this host port is not OTG.
> > Isn't that wrong?
> 
> So send USB_DEVICE_A_ALT_HNP_SUPPORT request.
> This is correct in OTG 1.x, its intention is to remind the user who is
> connecting the HNP capable OTG device to a non-OTG port, He can change
> to another port of this machine which is a OTG port(with HNP).

I didn't understand.
If CONFIG_USB_OTG is enabled doesn't mean that this USB host port is OTG host.
So it should not send any OTG specific request to device. Right?

> 
> > 
> > 				if (err < 0) {
> > 					/* OTG MESSAGE: report errors here,
> > 					 * customize to match your product.
> > 					 */
> > 					dev_info(&udev->dev,
> > 						"can't set HNP mode: %d\n",
> > 						err);
> > 					bus->b_hnp_enable = 0;
> > 				}
> > 
> > Instead it should be moved inside the if (port1 == bus->otg_port) condition.
> 
> Nope, as I explained above, this is really too detailed OTG protocol:)
> > 
> > 			}
> > 		}
> > 	}
> > #endif
> > 	return err;
> > }
> > 

cheers,
-roger
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
