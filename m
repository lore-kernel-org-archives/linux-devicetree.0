From: Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2 05/22] doc: dt-binding: usb: add otg related properties
Date: Fri, 12 Jun 2015 09:42:04 +0800
Message-ID: <20150612014203.GE16101@shlinux2>
References: <CAL_JsqJ3hHOGevwqcBNFN2LrTP7Bm_k9SDuTNKBbpq5W-eLmdw@mail.gmail.com>
 <20150609011806.GA7976@shlinux1.ap.freescale.net>
 <CAL_JsqKg_NYtLGg9RUQOpKscwHEskHO4_Szo_nM3BnrDdhg3fg@mail.gmail.com>
 <20150609182931.1eda4111@rockdesk> <20150610120623.GA7678@shlinux2>
 <20150611103035.08967a37@rockdesk> <20150611083851.GB16101@shlinux2>
 <20150611155102.15b881fd@rockdesk> <20150611142208.GD16101@shlinux2>
 <20150611175557.724a14e5@rockdesk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150611175557.724a14e5@rockdesk>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Li Jun-B47624 <Jun.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Chen Peter-B29397 <Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 11, 2015 at 05:55:57PM +0300, Roger Quadros wrote:
> > > drivers/usb/core/hub.c
> > > 
> > > static int usb_enumerate_device_otg(struct usb_device *udev)
> > > {
> > > 	int err = 0;
> > > 
> > > #ifdef	CONFIG_USB_OTG
> > > 	/*
> > > 	 * OTG-aware devices on OTG-capable root hubs may be able to use SRP,
> > > 	 * to wake us after we've powered off VBUS; and HNP, switching roles
> > > 	 * "host" to "peripheral".  The OTG descriptor helps figure this out.
> > > 	 */
> > > 	if (!udev->bus->is_b_host
> > > 			&& udev->config
> > > 			&& udev->parent == udev->bus->root_hub) {
> > > 		struct usb_otg_descriptor	*desc = NULL;
> > > 		struct usb_bus			*bus = udev->bus;
> > > 
> > > 		/* descriptor may appear anywhere in config */
> > > 		if (__usb_get_extra_descriptor (udev->rawdescriptors[0],
> > > 					le16_to_cpu(udev->config[0].desc.wTotalLength),
> > > 					USB_DT_OTG, (void **) &desc) == 0) {
> > > 			if (desc->bmAttributes & USB_OTG_HNP) {
> > > 				unsigned		port1 = udev->portnum;
> > > 
> > > 				dev_info(&udev->dev,
> > > 					"Dual-Role OTG device on %sHNP port\n",
> > > 					(port1 == bus->otg_port)
> > > 						? "" : "non-");
> > > 
> > > 				/* enable HNP before suspend, it's simpler */
> > > 				if (port1 == bus->otg_port)
> > > 					bus->b_hnp_enable = 1;
> > > 				err = usb_control_msg(udev,
> > > 					usb_sndctrlpipe(udev, 0),
> > > 					USB_REQ_SET_FEATURE, 0,
> > > 					bus->b_hnp_enable
> > > 						? USB_DEVICE_B_HNP_ENABLE
> > > 						: USB_DEVICE_A_ALT_HNP_SUPPORT,
> > > 					0, NULL, 0, USB_CTRL_SET_TIMEOUT);
> > > 
> > > We're sending out this control request even if this host port is not OTG.
> > > Isn't that wrong?
> > 
> > So send USB_DEVICE_A_ALT_HNP_SUPPORT request.
> > This is correct in OTG 1.x, its intention is to remind the user who is
> > connecting the HNP capable OTG device to a non-OTG port, He can change
> > to another port of this machine which is a OTG port(with HNP).
> 
> I didn't understand.
> If CONFIG_USB_OTG is enabled doesn't mean that this USB host port is OTG host.
Yes, only CONFIG_USB_OTG enabled doesn't mean that this USB host port
is a OTG port, there are might multiple usb host ports, but only one
is a OTG port.
> So it should not send any OTG specific request to device. Right?
Non-otg port(in OTG 1.x protocol) + OTG 1.x device, should send,
otherwise, should not send.

So the code you pasted here was right only for OTG 1.x, I assume
OTG 2.0 has not been released when it was designed. But now it's
out of date, it's wrong if you connect a OTG 2.0 device. 

> 
> > 
> > > 
> > > 				if (err < 0) {
> > > 					/* OTG MESSAGE: report errors here,
> > > 					 * customize to match your product.
> > > 					 */
> > > 					dev_info(&udev->dev,
> > > 						"can't set HNP mode: %d\n",
> > > 						err);
> > > 					bus->b_hnp_enable = 0;
> > > 				}
> > > 
> > > Instead it should be moved inside the if (port1 == bus->otg_port) condition.
> > 
> > Nope, as I explained above, this is really too detailed OTG protocol:)
> > > 
> > > 			}
> > > 		}
> > > 	}
> > > #endif
> > > 	return err;
> > > }
> > > 
> 
> cheers,
> -roger
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
